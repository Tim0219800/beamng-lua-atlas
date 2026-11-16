---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_activity_activityFlow_C
local flowgraph_nodes_activity_activityFlow_C = {}

--- Hook: when the graph becomes 'stopped', triggers stop() and stops the mission (if an activity is running).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:82
---@param newState string new execution state
function flowgraph_nodes_activity_activityFlow_C:changedRunningState(newState) end

--- Editor: shows whether an activity is associated and the end of its id.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:102
function flowgraph_nodes_activity_activityFlow_C:drawMiddle() end

--- Editor: tooltip showing the activity id or the limited compatibility mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:106
function flowgraph_nodes_activity_activityFlow_C:drawTooltip() end

--- Hook: when the graph starts, if an activity exists and is not running, starts it via gameplay_missions_missionManager.start; without an activity, calls start().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:39
function flowgraph_nodes_activity_activityFlow_C:onExecutionStarted() end

--- Hook called when the activity starts; calls start().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:48
function flowgraph_nodes_activity_activityFlow_C:onStartActivity() end

--- Hook called when the activity stops; calls stop().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:95
function flowgraph_nodes_activity_activityFlow_C:onStopActivity() end

--- Per-frame hook; calls update only if the graph has no activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:65
---@param ... any
function flowgraph_nodes_activity_activityFlow_C:onUpdate(...) end

--- Per-frame hook sent by the activity; calls update.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:70
---@param ... any
function flowgraph_nodes_activity_activityFlow_C:onUpdateActivity(...) end

--- Sets the "started" flow to true (update and stopped to false) and triggers the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:33
function flowgraph_nodes_activity_activityFlow_C:start() end

--- Enables the "stopped" flow and triggers the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:75
function flowgraph_nodes_activity_activityFlow_C:stop() end

--- Updates dtReal/dtSim/dtRaw (pins and manager), enables "update" and triggers the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:53
---@param dtReal number real time delta (s)
---@param dtSim number simulation time delta (s)
---@param dtRaw number raw time delta (s)
function flowgraph_nodes_activity_activityFlow_C:update(dtReal, dtSim, dtRaw) end

