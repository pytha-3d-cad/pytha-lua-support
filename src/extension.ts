import * as vscode from 'vscode';
import * as path from 'path';

const PYTHA_GLOBALS = ['pytha', 'pyui', 'pyio', 'pyux', 'pygeo', 'pyplot', 'pyloc'];
const KNOWN_NAMESPACES = new Set(['pytha', 'pyui', 'pyio', 'pyux', 'pygeo', 'pyplot']);
const KNOWN_GLOBAL_FUNCS = new Set(['pyloc']);
const WIKI_ROOT = 'https://github.com/pytha-3d-cad/pytha-lua-api/wiki';

function setIfDifferent<T>(
    config: vscode.WorkspaceConfiguration,
    key: string,
    value: T,
    target: vscode.ConfigurationTarget,
    equals: (a: T, b: T) => boolean = (a, b) => a === b
): Thenable<void> | undefined {
    const current = config.get<T>(key);
    if (current !== undefined && equals(current, value)) {
        return undefined;
    }
    return config.update(key, value, target);
}

const arrayUnion = (a: string[], b: string[]): string[] => {
    const set = new Set(a);
    for (const item of b) {
        set.add(item);
    }
    return Array.from(set);
};

const arrayEquals = (a: string[], b: string[]): boolean =>
    a.length === b.length && a.every((v, i) => v === b[i]);

/**
 * Resolve the wiki page name for the symbol under the cursor.
 * Recognises both `namespace.func` (e.g. `pytha.create_block`) and bare
 * globals (`pyloc`). Returns null when no PYTHA symbol can be identified.
 */
function wikiPageForCursor(document: vscode.TextDocument, position: vscode.Position): string | null {
    const range = document.getWordRangeAtPosition(position, /[A-Za-z_][A-Za-z0-9_]*(?:\.[A-Za-z_][A-Za-z0-9_]*)?/);
    if (!range) {
        return null;
    }
    const word = document.getText(range);
    if (word.includes('.')) {
        const [ns] = word.split('.');
        return KNOWN_NAMESPACES.has(ns) ? word : null;
    }
    if (KNOWN_GLOBAL_FUNCS.has(word)) {
        return word;
    }
    if (KNOWN_NAMESPACES.has(word)) {
        return word;
    }
    return null;
}

async function openWikiHome(): Promise<void> {
    await vscode.env.openExternal(vscode.Uri.parse(WIKI_ROOT));
}

async function openWikiForSymbol(): Promise<void> {
    const editor = vscode.window.activeTextEditor;
    if (!editor) {
        await vscode.window.showInformationMessage('pytha-lua-support: no active editor.');
        return;
    }
    const page = wikiPageForCursor(editor.document, editor.selection.active);
    if (!page) {
        await vscode.window.showInformationMessage(
            'pytha-lua-support: no PYTHA API symbol under the cursor.'
        );
        return;
    }
    await vscode.env.openExternal(vscode.Uri.parse(`${WIKI_ROOT}/${page}`));
}

export async function activate(context: vscode.ExtensionContext): Promise<void> {
    const config = vscode.workspace.getConfiguration('Lua');
    const target = vscode.ConfigurationTarget.Workspace;

    const libraryPath = path.join(context.extensionPath, 'libs');
    const currentLibraries = config.get<string[]>('workspace.library', []);
    const mergedLibraries = arrayUnion(currentLibraries, [libraryPath]);

    const currentGlobals = config.get<string[]>('diagnostics.globals', []);
    const mergedGlobals = arrayUnion(currentGlobals, PYTHA_GLOBALS);

    const updates: Array<Thenable<void> | undefined> = [
        setIfDifferent(config, 'runtime.version', 'Lua 5.3', target),
        setIfDifferent(config, 'runtime.builtin.io', 'disable', target),
        setIfDifferent(config, 'workspace.library', mergedLibraries, target, arrayEquals),
        setIfDifferent(config, 'diagnostics.globals', mergedGlobals, target, arrayEquals),
    ];

    try {
        await Promise.all(updates.filter((u): u is Thenable<void> => u !== undefined));
    } catch (err) {
        vscode.window.showWarningMessage(
            `pytha-lua-support: could not update Lua workspace settings (${(err as Error).message}).`
        );
    }

    context.subscriptions.push(
        vscode.commands.registerCommand('pytha.openWikiHome', openWikiHome),
        vscode.commands.registerCommand('pytha.openWikiForSymbol', openWikiForSymbol),
    );

    registerPylocDiagnostics(context);
    registerDebugAdapter(context);
}

/**
 * Registers the "pytha-lua" debug adapter. Rather than launching a debug adapter
 * executable, it points VS Code at the DAP server that runs inside PYTHA (TCP, on
 * localhost). The server is started on demand by PYTHA itself; this extension only
 * tells VS Code how to reach it for an `attach` session.
 */
function registerDebugAdapter(context: vscode.ExtensionContext): void {
    const factory: vscode.DebugAdapterDescriptorFactory = {
        createDebugAdapterDescriptor(session: vscode.DebugSession): vscode.ProviderResult<vscode.DebugAdapterDescriptor> {
            const cfg = session.configuration as { host?: string; port?: number };
            const settings = vscode.workspace.getConfiguration('pytha-lua');
            // Precedence: explicit value in launch.json > user/workspace setting > built-in default.
            const host = cfg.host ?? settings.get<string>('host') ?? '127.0.0.1';
            const port = cfg.port ?? settings.get<number>('port') ?? 4711;
            return new vscode.DebugAdapterServer(port, host);
        },
    };

    context.subscriptions.push(
        vscode.debug.registerDebugAdapterDescriptorFactory('pytha-lua', factory),
    );
}

/**
 * Warns when `pyloc()` is called with a non-literal argument.
 *
 * The PYTHA translation toolchain extracts translatable strings by scanning
 * source code for `pyloc("literal")` patterns. Variables and concatenations
 * cannot be resolved statically, so they will never appear in the .xlf
 * translation file -- the string will silently never get translated.
 */
function registerPylocDiagnostics(context: vscode.ExtensionContext): void {
    const collection = vscode.languages.createDiagnosticCollection('pytha-pyloc');

    // Matches  pyloc(<arg>)  or  pyloc "literal"  or  pyloc 'literal'  or  pyloc [[literal]]
    const callRe = /\bpyloc\s*(?:\(\s*([\s\S]*?)\s*\)|("(?:\\.|[^"\\])*"|'(?:\\.|[^'\\])*'|\[\[[\s\S]*?\]\]))/g;
    const literalRe = /^(?:"(?:\\.|[^"\\])*"|'(?:\\.|[^'\\])*'|\[\[[\s\S]*\]\])$/;

    const scan = (doc: vscode.TextDocument): void => {
        if (doc.languageId !== 'lua') {
            return;
        }
        const diags: vscode.Diagnostic[] = [];
        const text = doc.getText();
        let m: RegExpExecArray | null;
        callRe.lastIndex = 0;
        while ((m = callRe.exec(text)) !== null) {
            const arg = (m[1] ?? m[2] ?? '').trim();
            if (!arg) {
                continue;
            }
            if (literalRe.test(arg)) {
                continue;
            }
            const start = doc.positionAt(m.index);
            const end = doc.positionAt(m.index + m[0].length);
            const diag = new vscode.Diagnostic(
                new vscode.Range(start, end),
                'pyloc() should be called with a literal string. The translation extractor cannot resolve variables or concatenations, so this string will never appear in the .xlf file.',
                vscode.DiagnosticSeverity.Warning,
            );
            diag.source = 'pytha-lua-support';
            diag.code = 'pyloc-non-literal';
            diags.push(diag);
        }
        collection.set(doc.uri, diags);
    };

    context.subscriptions.push(
        collection,
        vscode.workspace.onDidOpenTextDocument(scan),
        vscode.workspace.onDidChangeTextDocument((e) => scan(e.document)),
        vscode.workspace.onDidCloseTextDocument((doc) => collection.delete(doc.uri)),
    );
    vscode.workspace.textDocuments.forEach(scan);
}

export function deactivate(): void {}
