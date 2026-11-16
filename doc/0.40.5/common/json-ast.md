# `json_ast`

*File: `lua/common/json-ast.lua` · VM: Common (GE + vehicle) · 526 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("json-ast")`

JSON/SJSON parser that builds a lossless syntax tree (AST): every space, tab, line break, comment (// and /* */), delimiter, string and number (with its precision) becomes a node. A .jbeam file can thus be re-read, have values modified and be written back identically (stringify). Used by the built-in jbeam text editor; besides the AST it produces the native Lua data and the already-processed jbeam table schema.

## Example

```lua
local jsonAst = require('json-ast')
local ctx = jsonAst.parse(readFile('vehicles/pickup/pickup.jbeam'))
if ctx then
  local data = ctx.transient.luaData  -- native data (processed jbeam schema)
  local text = jsonAst.stringify(ctx.ast) -- must give back the original text
end
```

## Notes

- A node is a table {type, value, precision?}. Types produced: object_begin, object_end, list_begin, list_end, array_delimiter, key_delimiter, newline, newline_windows, bool, string, string_single, number ({'number', value, decimalCount}, with prefixPlus and addPostfixDot), comment, comment_multiline, space ({'space', n}), tab, literal (fallback when nothing is recognized: logged as an error).
- parse returns a context ctx (or nil if there are several roots) with: ctx.ast.nodes (list of nodes); ctx.transient.hierarchy (container node index -> children indices); ctx.transient.root (root node index); ctx.transient.luaDataRaw (raw native data); ctx.transient.luaData (deep copy after jbeamTableSchema.process on each section and creation of pos = vec3(posX,posY,posZ)); ctx.transient.linesIndexes (index of the first node of each line); ctx.transient.nodeIdxToLineNum. ctx.str and ctx.pos are removed.
- With addAstId true, each native table (list or object) receives an __astNodeIdx field that points to its AST node; each processed section also receives __schemaProcessed = true.
- Single-quoted strings are rewritten with double quotes by stringify, and escaping is not handled: a string containing an escaped quote is not written back identically (the parser does not handle \ sequences).
- The jbeam test also compares with the fast parser (json.decode) and writes *_dump_ast.txt / *.ast.json files in case of a difference: development utility.
- The extracted page did not list findDifferences: it is a local function (not exported).

## Functions

| Function | Description | Line |
|---|---|---|
| `json_ast.parse(str, addAstId)` | Parses a JSON/SJSON/jbeam text and returns the context (AST + Lua data). Returns nil if the text contains several root nodes. Number or unknown-character errors are logged (log E) without stopping. | 391 |
| `json_ast.stringify(ast)` | Rebuilds the text from an AST (concatenates stringifyNodes(ast.nodes)). | 421 |
| `json_ast.stringifyNode(node)` | Text of a single node (e.g. '{' for object_begin, '//comment', number formatted with its original precision). Returns nil for an unknown type. | 294 |
| `json_ast.stringifyNodes(nodes)` | Concatenates the text of all the nodes in a list (Lua error if a node has an unknown type, because stringifyNode returns nil). | 345 |
| `json_ast.testFile(filename, writeAST, addASTId)` | Test tool: reads a file, parses it, compares with json.decode, rebuilds the text and checks that it is identical to the original. Writes diagnostic files in case of a difference. Returns true if the parse -> stringify cycle is lossless. | 445 |
| `json_ast.testFiles(writeAST, reportOK)` | Test tool: runs testFile on all the *.jbeam files found from the root ('/') and logs the errors (and the OKs if reportOK). | 503 |

### Parameter details

#### `json_ast.parse(str, addAstId)`

Parses a JSON/SJSON/jbeam text and returns the context (AST + Lua data). Returns nil if the text contains several root nodes. Number or unknown-character errors are logged (log E) without stopping.

- `str` (*string*) : source text
- `addAstId` (*boolean|nil*) : adds __astNodeIdx in the native tables
- **returns**: table|nil context {ast = {nodes}, transient = {luaData, luaDataRaw, hierarchy, root, linesIndexes, nodeIdxToLineNum}}

#### `json_ast.stringify(ast)`

Rebuilds the text from an AST (concatenates stringifyNodes(ast.nodes)).

- `ast` (*table*) : ctx.ast (table with a nodes field)
- **returns**: string text

#### `json_ast.stringifyNode(node)`

Text of a single node (e.g. '{' for object_begin, '//comment', number formatted with its original precision). Returns nil for an unknown type.

- `node` (*table*) : node {type, value, precision}
- **returns**: string|nil node text

#### `json_ast.stringifyNodes(nodes)`

Concatenates the text of all the nodes in a list (Lua error if a node has an unknown type, because stringifyNode returns nil).

- `nodes` (*table[]*) : list of nodes
- **returns**: string text

#### `json_ast.testFile(filename, writeAST, addASTId)`

Test tool: reads a file, parses it, compares with json.decode, rebuilds the text and checks that it is identical to the original. Writes diagnostic files in case of a difference. Returns true if the parse -> stringify cycle is lossless.

- `filename` (*string*) : file path
- `writeAST` (*boolean|nil*) : writes <file>.ast.json on success
- `addASTId` (*boolean|nil*) : adds __astNodeIdx
- **returns**: boolean|nil true if OK, false/nil otherwise

#### `json_ast.testFiles(writeAST, reportOK)`

Test tool: runs testFile on all the *.jbeam files found from the root ('/') and logs the errors (and the OKs if reportOK).

- `writeAST` (*boolean|nil*) : write the .ast.json files
- `reportOK` (*boolean|nil*) : also log the OK files

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/json-ast.lua`.*
