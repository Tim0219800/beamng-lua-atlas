---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/debug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- MCP tools for debug drawing in the world: persistent spheres, lines and texts, redrawn every frame with debugDrawer until cleared or expired (ttl). Used to flag a position or a problem in the scene. Module loaded by mcp_tools.
--- Access: extension `mcp_tools_debug`: `extensions.load("mcp_tools_debug")`, then the global `mcp_tools_debug`
---@class mcp_tools_debug
---@field schemas table<string, table> Schemas of debug_draw and debug_clear.
mcp_tools_debug = {}

--- Clears a shape by id, or all of them if no id is given.
---Source: lua/ge/extensions/mcp/tools/debug.lua:62
---@param args table|nil {id?: string}
---@return string  Confirmation.
---@return boolean  always false.
function mcp_tools_debug.debug_clear(args) end

--- Adds or replaces a persistent debug shape and returns its id (auto-generated "sN" if not provided).
---Source: lua/ge/extensions/mcp/tools/debug.lua:41
---@param args table {kind?: 'sphere'|'line'|'text', pos?: {x,y,z}, from?: {x,y,z}, to?: {x,y,z}, radius?: number m (default 0.5), label?|text?: string, color?: {r,g,b,a}, ttl?: number s (0/absent = permanent), id?: string}. line requires from+to; sphere/text require pos; text requires a label.
---@return string  Shape id, or error message.
---@return boolean  true on error.
function mcp_tools_debug.debug_draw(args) end

--- Called before each render: removes expired shapes and draws the others (line, text or sphere, with optional label).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/mcp/tools/debug.lua:32
---@param dtReal number Real duration (s), unused.
function mcp_tools_debug.onPreRender(dtReal) end

