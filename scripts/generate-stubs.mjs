#!/usr/bin/env node
/**
 * Generate / refresh libs/pytha.lua from the PYTHA wiki markdown.
 *
 * Two modes:
 *   1. Local clone (fast, recommended):
 *        npm run gen:stubs -- --wiki "../pytha-lua-api.wiki"
 *   2. GitHub (clones the wiki to a temp dir first):
 *        npm run gen:stubs -- --clone
 *
 * The script parses each wiki page that looks like an API function
 * (filename pattern `<namespace>.<func>.md`) and emits a `---@meta`
 * stub annotated with @param / @return / wiki link.
 *
 * It is intentionally conservative: it never overwrites manual edits
 * in `libs/pytha.lua` -- instead it writes `libs/pytha.generated.lua`
 * and prints a unified diff against the current file.  Promote a
 * generated stub with:
 *   mv libs/pytha.generated.lua libs/pytha.lua
 *
 * Markdown parsing follows the conventions used by the existing wiki:
 *   - first line of the page = description
 *   - a fenced ```lua block contains the canonical signature
 *   - a "Parameter | Type | Description" table lists arguments
 *   - a "### Return value" section with a "Type | Description" table
 *
 * Pages that do not match this shape are skipped with a warning.
 */

import { readFileSync, writeFileSync, readdirSync, existsSync, mkdtempSync } from 'node:fs';
import { execSync } from 'node:child_process';
import { join, basename, dirname } from 'node:path';
import { tmpdir } from 'node:os';
import { fileURLToPath } from 'node:url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = join(__dirname, '..');
const LIBS = join(ROOT, 'libs', 'pytha.generated.lua');

const WIKI_REPO = 'https://github.com/pytha-3d-cad/pytha-lua-api.wiki.git';
const NAMESPACES = new Set(['pytha', 'pyui', 'pyio', 'pyux', 'pygeo', 'pyplot']);
const GLOBAL_FUNCTIONS = new Set(['pyloc']);

const args = Object.fromEntries(
    process.argv.slice(2).reduce((acc, arg, i, arr) => {
        if (arg.startsWith('--')) {
            const key = arg.slice(2);
            const val = arr[i + 1] && !arr[i + 1].startsWith('--') ? arr[i + 1] : true;
            acc.push([key, val]);
        }
        return acc;
    }, [])
);

function resolveWikiDir() {
    if (args.wiki) return args.wiki;
    if (args.clone) {
        const dir = mkdtempSync(join(tmpdir(), 'pytha-wiki-'));
        console.log(`Cloning wiki to ${dir} ...`);
        execSync(`git clone --depth 1 ${WIKI_REPO} "${dir}"`, { stdio: 'inherit' });
        return dir;
    }
    const guess = join(ROOT, '..', 'pytha-lua-api.wiki');
    if (existsSync(guess)) return guess;
    throw new Error('Pass --wiki <path> or --clone');
}

/** Parse a single wiki .md page. Returns null if unparseable. */
function parsePage(file) {
    const name = basename(file, '.md');
    const [ns, ...rest] = name.split('.');
    const fn = rest.join('.');
    const isNamespace = NAMESPACES.has(ns) && fn;
    const isGlobal = GLOBAL_FUNCTIONS.has(name);
    if (!isNamespace && !isGlobal) return null;

    const md = readFileSync(file, 'utf8');
    const lines = md.split(/\r?\n/);

    const description = lines.find((l) => l.trim().length > 0)?.trim() ?? '';

    const signatureMatch = md.match(/```lua\s*\n([\s\S]*?)\n```/);
    if (!signatureMatch) return null;
    const signature = signatureMatch[1].trim();

    const paramSection = sectionTable(md, /Parameter\s*\|\s*Type\s*\|\s*Description/i);
    const returnSection = sectionTable(md, /(?:Return\s*value|Returns?)/i, /Type\s*\|\s*Description/i);

    return {
        wikiName: name,
        namespace: isGlobal ? null : ns,
        funcName: isGlobal ? name : fn,
        description: stripMd(description),
        signature,
        params: paramSection,
        returns: returnSection,
    };
}

/** Find a table under a heading. Returns [{ name, type, description }]. */
function sectionTable(md, headingRe, tableHeaderRe = /^\s*\S+\s*\|\s*\S+\s*\|/i) {
    const idx = md.search(headingRe);
    if (idx < 0) return [];
    const after = md.slice(idx);
    const lines = after.split(/\r?\n/);
    const startTable = lines.findIndex((l) => tableHeaderRe.test(l));
    if (startTable < 0) return [];
    const rows = [];
    for (let i = startTable + 2; i < lines.length; i++) {
        const l = lines[i];
        if (!l || !l.includes('|')) break;
        const cells = l.split('|').map((c) => c.trim()).filter(Boolean);
        if (cells.length < 2) break;
        const [a, b, c] = cells;
        if (cells.length === 2) {
            rows.push({ name: null, type: stripMd(a), description: stripMd(b) });
        } else {
            rows.push({ name: stripMd(a), type: stripMd(b), description: stripMd(c ?? '') });
        }
    }
    return rows;
}

const TYPE_MAP = {
    'integer': 'integer',
    'number': 'number',
    'string': 'string',
    'boolean': 'boolean',
    'bool': 'boolean',
    'table': 'table',
    'nil': 'nil',
    'function': 'function',
    'literal_string': 'string',
    'element_handle': 'element_handle',
    'dialog_handle': 'dialog_handle',
    'control_handle': 'control_handle',
    'material_handle': 'material_handle',
    'file_handle': 'file_handle',
};

function mapType(raw) {
    if (!raw) return 'any';
    const clean = raw.replace(/`/g, '').trim().toLowerCase();
    if (TYPE_MAP[clean]) return TYPE_MAP[clean];
    if (clean.endsWith('[]')) return mapType(clean.slice(0, -2)) + '[]';
    if (clean.includes(' or ')) {
        return clean.split(/\s+or\s+/).map(mapType).join('|');
    }
    return clean.replace(/[^a-z0-9_|\[\]]/gi, '') || 'any';
}

function stripMd(s) {
    return s.replace(/[`*_]/g, '').trim();
}

function renderStub(p) {
    const fqName = p.namespace ? `${p.namespace}.${p.funcName}` : p.funcName;
    const wikiLink = `https://github.com/pytha-3d-cad/pytha-lua-api/wiki/${p.wikiName}`;
    const argNames = (p.signature.match(/\(([^)]*)\)/)?.[1] ?? '')
        .split(',').map((s) => s.trim()).filter(Boolean);

    const out = [];
    out.push(`---**${p.description.replace(/\n/g, ' ')}**`);
    out.push(`---[View documents](${wikiLink})`);
    for (const arg of argNames) {
        const meta = p.params.find((row) => row.name && row.name.replace(/[`*_]/g, '') === arg);
        const type = meta ? mapType(meta.type) : 'any';
        const desc = meta?.description ?? '';
        const opt = /optional|default/i.test(desc) ? '?' : '';
        out.push(`---@param ${arg}${opt} ${type} ${desc}`.trimEnd());
    }
    if (p.returns.length > 0) {
        const [first] = p.returns;
        out.push(`---@return ${mapType(first.type)} ${first.description ?? ''}`.trimEnd());
    }
    out.push(`function ${fqName}(${argNames.join(', ')}) end`);
    return out.join('\n');
}

function main() {
    const wikiDir = resolveWikiDir();
    const files = readdirSync(wikiDir)
        .filter((f) => f.endsWith('.md'))
        .map((f) => join(wikiDir, f));

    const stubs = [];
    let skipped = 0;
    for (const file of files) {
        try {
            const parsed = parsePage(file);
            if (!parsed) { skipped++; continue; }
            stubs.push(renderStub(parsed));
        } catch (err) {
            console.warn(`skip ${basename(file)}: ${err.message}`);
            skipped++;
        }
    }

    const header = [
        '---@meta',
        '-- AUTOGENERATED by scripts/generate-stubs.mjs -- do not edit by hand.',
        '-- Source: https://github.com/pytha-3d-cad/pytha-lua-api/wiki',
        '',
        'pytha = {}',
        'pyui = {}',
        'pyio = {}',
        'pyux = {}',
        'pygeo = {}',
        'pyplot = {}',
        '',
        '---@class element_handle',
        '---@class dialog_handle',
        '---@class control_handle',
        '---@class material_handle',
        '---@class file_handle',
        '---@class directory_handle',
        '',
    ].join('\n');

    writeFileSync(LIBS, header + '\n\n' + stubs.join('\n\n\n\n') + '\n');
    console.log(`Wrote ${LIBS}: ${stubs.length} stubs, ${skipped} files skipped.`);
    console.log('Review with:  git diff --no-index libs/pytha.lua libs/pytha.generated.lua');
    console.log('Promote with: mv libs/pytha.generated.lua libs/pytha.lua');
}

main();
