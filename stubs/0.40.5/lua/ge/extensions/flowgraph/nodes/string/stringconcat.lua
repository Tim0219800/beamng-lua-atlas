---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_string_stringconcat_C
local flowgraph_nodes_string_stringconcat_C = {}

--- Empties the input cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:30
function flowgraph_nodes_string_stringconcat_C:_executionStarted() end

--- Keeps exactly one empty pin at the end of the list (creates one or removes the excess).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:85
function flowgraph_nodes_string_stringconcat_C:cleanupPins() end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:119
---@param builder any
---@param style any
function flowgraph_nodes_string_stringconcat_C:drawMiddle(builder, style) end

--- Output at '', empty input cache, savePins = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:23
function flowgraph_nodes_string_stringconcat_C:init() end

--- Hook: when a link is created, cleans up the pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:72
---@param link any created link
function flowgraph_nodes_string_stringconcat_C:onLink(link) end

--- Hook: when a link is deleted, cleans up the pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:77
---@param link any deleted link
function flowgraph_nodes_string_stringconcat_C:onUnlink(link) end

--- Rebuilds the string cache from the input pins and indicates whether it changed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:36
function flowgraph_nodes_string_stringconcat_C:updateCache() end

--- Recomputes the output with table.concat(cache) if the cache changed.
---Source: lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:65
function flowgraph_nodes_string_stringconcat_C:work() end

