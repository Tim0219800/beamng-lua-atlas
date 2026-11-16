---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopChainedMissionSetup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_rally_loop_loopChainedMissionSetup_C
local flowgraph_nodes_gameplay_rally_loop_loopChainedMissionSetup_C = {}

--- Unloads the rally loop extension if it is loaded and no mission execution transfer is signaled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopChainedMissionSetup.lua:21
function flowgraph_nodes_gameplay_rally_loop_loopChainedMissionSetup_C:_executionStopped() end

--- Resets the transfer flag and calls setupForNewMission if gameplay_rallyLoop exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopChainedMissionSetup.lua:33
function flowgraph_nodes_gameplay_rally_loop_loopChainedMissionSetup_C:workOnce() end

