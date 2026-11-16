---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/onMissionRunstateChanged.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_career_onMissionRunstateChanged_C
local flowgraph_nodes_career_onMissionRunstateChanged_C = {}

--- Creates the flag table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onMissionRunstateChanged.lua:22
function flowgraph_nodes_career_onMissionRunstateChanged_C:init() end

--- Hook: raises stopped when the new state is 'stopped'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onMissionRunstateChanged.lua:39
---@param newState string new mission state
---@param mission table mission concerned (unused)
function flowgraph_nodes_career_onMissionRunstateChanged_C:onAnyMissionChanged(newState, mission) end

--- Hook: raises started.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onMissionRunstateChanged.lua:35
---@param data any unused
function flowgraph_nodes_career_onMissionRunstateChanged_C:onMissionStartWithFade(data) end

--- Every frame: started to false, applies then clears the flags.
---Source: lua/ge/extensions/flowgraph/nodes/career/onMissionRunstateChanged.lua:27
---@param args any unused
function flowgraph_nodes_career_onMissionRunstateChanged_C:work(args) end

