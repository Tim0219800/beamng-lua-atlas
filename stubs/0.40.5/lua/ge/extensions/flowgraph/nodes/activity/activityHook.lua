---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/activity/activityHook.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_activity_activityHook_C
local flowgraph_nodes_activity_activityHook_C = {}

--- Sets data.eventName = 'start' and enables allowCustomInPins and savePins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/activity/activityHook.lua:29
function flowgraph_nodes_activity_activityHook_C:init() end

--- Builds a table {pinName = value} from the input pins (except flow, reset) and calls mgr.modules.mission:missionHook(eventName, data).
---Source: lua/ge/extensions/flowgraph/nodes/activity/activityHook.lua:35
function flowgraph_nodes_activity_activityHook_C:workOnce() end

