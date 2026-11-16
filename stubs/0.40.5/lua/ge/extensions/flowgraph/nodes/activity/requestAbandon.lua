---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/activity/requestAbandon.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_activity_requestAbandon_C
local flowgraph_nodes_activity_requestAbandon_C = {}

--- Sets reset back to false after the trigger.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/activity/requestAbandon.lua:43
function flowgraph_nodes_activity_requestAbandon_C:_afterTrigger() end

--- Sets reset back to false when the graph starts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/activity/requestAbandon.lua:34
function flowgraph_nodes_activity_requestAbandon_C:_executionStarted() end

--- Sets reset back to false when the graph stops.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/activity/requestAbandon.lua:29
function flowgraph_nodes_activity_requestAbandon_C:_executionStopped() end

--- Editor: draws the central area of the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/activity/requestAbandon.lua:47
---@param builder table editor node builder
---@param style table editor style
function flowgraph_nodes_activity_requestAbandon_C:drawMiddle(builder, style) end

--- Sets reset to false and data.blocksOnResetGameplay to true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/activity/requestAbandon.lua:24
---@param mgr any
---@param ... any
function flowgraph_nodes_activity_requestAbandon_C:init(mgr, ...) end

--- Hook called when the player requests to abandon; stores the request.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/activity/requestAbandon.lua:39
function flowgraph_nodes_activity_requestAbandon_C:onRequestAbandon() end

--- If an abandon request is pending, enables flow and value (and logs), otherwise sets them to false.
---Source: lua/ge/extensions/flowgraph/nodes/activity/requestAbandon.lua:51
---@param args any
function flowgraph_nodes_activity_requestAbandon_C:work(args) end

