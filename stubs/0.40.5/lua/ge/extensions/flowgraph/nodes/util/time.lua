---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/time.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_time_C
local flowgraph_nodes_util_time_C = {}

--- Empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/time.lua:31
---@param builder table Node constructor.
---@param style table Node style.
function flowgraph_nodes_util_time_C:drawMiddle(builder, style) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/time.lua:22
---@param mgr any
---@param ... any
function flowgraph_nodes_util_time_C:init(mgr, ...) end

--- Writes os.clockhp() to time and mgr.dtReal / mgr.dtSim to the other two outputs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/time.lua:25
function flowgraph_nodes_util_time_C:work() end

