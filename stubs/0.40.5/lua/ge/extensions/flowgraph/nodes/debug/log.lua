---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/debug/log.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_debug_log_C
local flowgraph_nodes_debug_log_C = {}

--- Converts the value to text (dumps for a table), calls log(type, tag, msg) and mgr:logEvent.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/log.lua:49
function flowgraph_nodes_debug_log_C:createLogEntry() end

--- Editor: displays ('type','tag',...).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/log.lua:58
---@param builder table node constructor
---@param style table style
function flowgraph_nodes_debug_log_C:drawMiddle(builder, style) end

--- Prepares the templates of the logType pin, hides logType and logTag, and sets the default tag "Node #id".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/log.lua:25
function flowgraph_nodes_debug_log_C:postInit() end

--- If dynamicMode is 'repeat', writes a log entry.
---Source: lua/ge/extensions/flowgraph/nodes/debug/log.lua:43
function flowgraph_nodes_debug_log_C:work() end

--- Writes a log entry.
---Source: lua/ge/extensions/flowgraph/nodes/debug/log.lua:39
function flowgraph_nodes_debug_log_C:workOnce() end

