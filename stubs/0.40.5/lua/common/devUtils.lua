---@meta
-- tim19Atlas stub generated from lua/common/devUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Writes as JSON a snapshot of the global variables, the modules (contents and locals) and the loaded extensions. Functions and userdata are removed, tables flattened (flattenTable).
---Source: lua/common/devUtils.lua:145
---@param filename string Output JSON file (via jsonWriteFile).
function createGlobalSnapshot(filename) end

--- Compiles then runs the string cmd with xpcall, temporarily replacing print to capture output. On a syntax or runtime error, returns a string starting with 'Error: '.
---Source: lua/common/devUtils.lua:10
---@param cmd string Lua code to execute.
---@param source string|nil Chunk name for error messages (default 'executeLuaSandboxed').
---@return any  Execution result (1st value returned by the chunk), or the string 'Error: ...'.
---@return string[]|nil  Lines captured by print; nil on error.
function executeLuaSandboxed(cmd, source) end

--- Returns the local variables (upvalues) used by a module's functions, recursively walking the functions, their upvalues and the metatable. Ignores globals, module fields, the module itself and ___locals.
---Source: lua/common/devUtils.lua:89
---@param moduleTbl table Module table to inspect.
---@return table<string, any>  Upvalue name to value.
function getModuleLocals(moduleTbl) end

--- Walks tbl and detects sub-tables reached through several paths (shared references or cycles).
---Source: lua/common/devUtils.lua:200
---@param tbl table Table to analyze.
---@return integer|nil  Number of tables seen more than once; nil if tbl is not a table.
---@return table<string, string[]>  For each duplicated table (address as text), the list of its paths.
function tableFindRecursion(tbl) end

