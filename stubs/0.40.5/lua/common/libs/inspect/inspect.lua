---@meta
-- tim19Atlas stub generated from lua/common/libs/inspect/inspect.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- inspect.lua 3.1.0: third-party library (Enrique García Cota, MIT license) that turns any Lua value into a readable string: sorted tables, indentation, circular references marked by <id>, metatables displayed. The module is callable: inspect(t, options). Handy for debugging.
--- Access: `require("libs/inspect/inspect")`
---@class libs_inspect_inspect
---@field KEY any Key marker used in the path passed to options.process.
---@field METATABLE any Metatable marker used in the path passed to options.process.
local libs_inspect_inspect = {}

--- Returns a textual representation of root. Can also be called directly: inspect(root, options).
---Source: lua/common/libs/inspect/inspect.lua:298
---@param root any Value to display
---@param options table|nil {depth, newline, indent, process}
---@return string  Formatted text
function libs_inspect_inspect.inspect(root, options) end

--- Internal object that accumulates text in a buffer while walking the value.
---@class libs_inspect_inspect_Inspector
local libs_inspect_inspect_Inspector = {}

--- Tells whether the value already has an identifier (table already encountered).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/inspect/inspect.lua:208
---@param v any Value
function libs_inspect_inspect_Inspector:alreadyVisited(v) end

--- Runs f one level deeper (increments then decrements the level).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/inspect/inspect.lua:198
---@param f function Function to run
function libs_inspect_inspect_Inspector:down(f) end

--- Returns the numeric identifier of the value, according to its type, creating it if needed.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/inspect/inspect.lua:212
---@param v any Value
function libs_inspect_inspect_Inspector:getId(v) end

--- Writes a table key: raw identifier or [key] in brackets.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/inspect/inspect.lua:223
---@param k any Key
function libs_inspect_inspect_Inspector:putKey(k) end

--- Writes a table: sequential and non-sequential parts, metatable, depth limit, repeated references.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/inspect/inspect.lua:230
---@param t table Table
function libs_inspect_inspect_Inspector:putTable(t) end

--- Writes a value according to its type (escaped string, number, boolean, table, or <type id>).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/inspect/inspect.lua:281
---@param v any Value
function libs_inspect_inspect_Inspector:putValue(v) end

--- Appends pieces of text to the buffer.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/inspect/inspect.lua:188
---@param ... any
function libs_inspect_inspect_Inspector:puts(...) end

--- Appends a line break followed by the indentation of the current level.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/inspect/inspect.lua:204
function libs_inspect_inspect_Inspector:tabify() end

---@type number
i = nil
return libs_inspect_inspect
