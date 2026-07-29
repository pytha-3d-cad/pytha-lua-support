---@meta

---**The `pyio.*` api functions are useful for persisting settings / values between executions of the plugin<br>
---as well as for accessing and writing files on the local file system.**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio)<br>
pyio = {}

---**Loads a lua table from PYTHA's local storage**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.load_values)
---@param name string Name under which the values have been stored
---@return table|nil A table of values if successful, otherwise `nil`
function pyio.load_values(name) end


---**Saves or stores a lua table to a local storage dedicated to this plugin** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.save_values)
---@param name string Name under which the values will be stored (see remarks)
---@param values table The table containing the values (see remarks)
---@return boolean `true` for success, `false` if the file cannot be opened
function pyio.save_values(name, values) end



---**Parses the fields of a CSV file to tables of strings**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.parse_csv)
---Default field separator is `,`. Quoted fields are supported (RFC4180).
---Encodings UTF-8, UTF-8 with BOM, UTF-16LE with BOM and ASCII are auto-detected.
---Minimum PYTHA version: V26.
---@param file file_handle The file that should be read
---@return string[][] rows A table that, for each row, contains a table of strings
function pyio.parse_csv(file) end



---**Parses a JSON file to a basic Lua data structure**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.parse_json)
---JSON objects become Lua tables with string keys, JSON arrays become tables with integer keys starting at 1.
---Strings, numbers and booleans map directly; `null` becomes `nil`.
---Minimum PYTHA version: V26.
---@param file file_handle The file that should be read
---@return any value The parsed value (typically a table)
function pyio.parse_json(file) end



---**Parses the lines of a text file to a table of strings**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.parse_lines)
---Encodings UTF-8, UTF-8 with BOM, UTF-16LE with BOM and ASCII are auto-detected.
---Windows and Unix line endings (CR+LF and LF) are equally supported.
---Minimum PYTHA version: V26.
---@param file file_handle The file that should be read
---@return string[] lines A table of strings, one per line
function pyio.parse_lines(file) end



---**Parses an XML file to an element tree (lightweight Lua data structure inspired by Python eTree)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.parse_xml)
---The returned `xml_document` has a `root` of type `xml_element`. Comments and processing
---instructions are not preserved. Attribute keys with prefixes use the `{namespace_uri}local_name` form.
---Minimum PYTHA version: V26.
---@param file file_handle The file that should be read
---@return xml_document document The parsed xml document
function pyio.parse_xml(file) end



---**Writes a table of rows to a CSV file**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.write_csv)
---Fields are automatically quoted when they contain commas, quotes or line breaks; quotes are doubled.
---Default encoding is UTF-8.
---Minimum PYTHA version: V26.
---@param path string The file path where the CSV should be written
---@param rows string[][] A table of rows; each row is a table of strings (fields)
---@param encoding? string Optional output encoding: `"utf8"`, `"utf8-bom"`, `"utf16le"`, `"utf16be"`, `"ascii"`
---@return nil
function pyio.write_csv(path, rows, encoding) end



---**Writes a Lua data structure to a JSON file (UTF-8)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.write_json)
---Tables with consecutive integer keys starting at 1 are written as JSON arrays, otherwise as objects.
---Only string keys are written. Unsupported types (functions, userdata) are written as `null`.
---Minimum PYTHA version: V26.
---@param path string The file path where the JSON should be written
---@param value any A Lua value (typically a table) that should be serialized to JSON
---@return nil
function pyio.write_json(path, value) end



---**Writes a table of strings to a text file, one entry per line**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.write_lines)
---A newline is appended after every line. Default encoding is UTF-8.
---Minimum PYTHA version: V26.
---@param path string The file path where the text should be written
---@param lines string[] A table of strings, one entry per line
---@param encoding? string Optional output encoding: `"utf8"`, `"utf8-bom"`, `"utf16le"`, `"utf16be"`, `"ascii"`
---@return nil
function pyio.write_lines(path, lines, encoding) end



---**Writes a Lua table as an XML file (UTF-8, formatted with indentation)**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.write_xml)
---Each element table has `local_name`, `prefix`, `namespace_uri`, optional `_attributes`,
---optional `_namespaces`, and numeric child entries (strings as text nodes, tables as nested elements).
---Minimum PYTHA version: V26.
---@param path string The file path where the XML should be written
---@param element table A Lua table describing the XML element tree
---@return nil
function pyio.write_xml(path, element) end



---**Finds the first XML node inside an XML tree that matches the given location path**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.xml_find)
---The path syntax supports a subset of XPath 1.0: `/`, `//`, `*`, `name`, `pre:name`, `text()`, `@attr`, `[n]`.
---Also callable as `start_element:xml_find(path, namespaces)`.
---Minimum PYTHA version: V26.
---@param start_element xml_document|xml_element The XML node from where to navigate the path
---@param path string Relative path (XPath 1.0 subset)
---@param namespaces? table<string,string> Optional `{prefix = namespace_uri, ...}` table
---@return xml_element|string|nil result Matching node (element or text/attribute string), or `nil` if no match
function pyio.xml_find(start_element, path, namespaces) end



---**Finds all XML nodes inside an XML tree that match the given location path**
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pyio.xml_find_all)
---Uses the same path syntax as `pyio.xml_find`. Returns every match in document order.
---Also callable as `start_element:xml_find_all(path, namespaces)`.
---Minimum PYTHA version: V26.
---@param start_element xml_document|xml_element The XML node from where to navigate the path
---@param path string Relative path (XPath 1.0 subset)
---@param namespaces? table<string,string> Optional `{prefix = namespace_uri, ...}` table
---@return (xml_element|string)[] results Array of matching nodes. Empty if nothing matches
function pyio.xml_find_all(start_element, path, namespaces) end