---@meta
-- tim19Atlas stub generated from lua/common/json-ast.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- JSON/SJSON parser that builds a lossless syntax tree (AST): every space, tab, line break, comment (// and /* */), delimiter, string and number (with its precision) becomes a node. A .jbeam file can thus be re-read, have values modified and be written back identically (stringify). Used by the built-in jbeam text editor; besides the AST it produces the native Lua data and the already-processed jbeam table schema.
--- Access: `require("json-ast")`
---@class json_ast
local json_ast = {}

--- Parses a JSON/SJSON/jbeam text and returns the context (AST + Lua data). Returns nil if the text contains several root nodes. Number or unknown-character errors are logged (log E) without stopping.
---Source: lua/common/json-ast.lua:391
---@param str string source text
---@param addAstId boolean|nil adds __astNodeIdx in the native tables
---@return table|nil  context {ast = {nodes}, transient = {luaData, luaDataRaw, hierarchy, root, linesIndexes, nodeIdxToLineNum}}
function json_ast.parse(str, addAstId) end

--- Rebuilds the text from an AST (concatenates stringifyNodes(ast.nodes)).
---Source: lua/common/json-ast.lua:421
---@param ast table ctx.ast (table with a nodes field)
---@return string  text
function json_ast.stringify(ast) end

--- Text of a single node (e.g. '{' for object_begin, '//comment', number formatted with its original precision). Returns nil for an unknown type.
---Source: lua/common/json-ast.lua:294
---@param node table node {type, value, precision}
---@return string|nil  node text
function json_ast.stringifyNode(node) end

--- Concatenates the text of all the nodes in a list (Lua error if a node has an unknown type, because stringifyNode returns nil).
---Source: lua/common/json-ast.lua:345
---@param nodes table[] list of nodes
---@return string  text
function json_ast.stringifyNodes(nodes) end

--- Test tool: reads a file, parses it, compares with json.decode, rebuilds the text and checks that it is identical to the original. Writes diagnostic files in case of a difference. Returns true if the parse -> stringify cycle is lossless.
---Source: lua/common/json-ast.lua:445
---@param filename string file path
---@param writeAST boolean|nil writes <file>.ast.json on success
---@param addASTId boolean|nil adds __astNodeIdx
---@return boolean|nil  true if OK, false/nil otherwise
function json_ast.testFile(filename, writeAST, addASTId) end

--- Test tool: runs testFile on all the *.jbeam files found from the root ('/') and logs the errors (and the OKs if reportOK).
---Source: lua/common/json-ast.lua:503
---@param writeAST boolean|nil write the .ast.json files
---@param reportOK boolean|nil also log the OK files
function json_ast.testFiles(writeAST, reportOK) end

return json_ast
