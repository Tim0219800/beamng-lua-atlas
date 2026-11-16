---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/activity/activityStop.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_activity_activityStop_C
local flowgraph_nodes_activity_activityStop_C = {}

--- Called after the nodes have triggered: if stopping, stops the graph (setRunning(false)); without an activity, logs the abandoned attempt and stops the screen fade.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/activity/activityStop.lua:27
function flowgraph_nodes_activity_activityStop_C:_afterTrigger() end

--- Sets self.stopping = true when the node is executed.
---Source: lua/ge/extensions/flowgraph/nodes/activity/activityStop.lua:23
function flowgraph_nodes_activity_activityStop_C:work() end

