---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/countdownLightsController.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_mission_countdownLightsController_C
local flowgraph_nodes_mission_countdownLightsController_C = {}

--- Resets the state (started, starttimer, jumpStarted, timerOn) and the outputs to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/countdownLightsController.lua:40
function flowgraph_nodes_mission_countdownLightsController_C:_executionStarted() end

--- Same initialization.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/countdownLightsController.lua:49
function flowgraph_nodes_mission_countdownLightsController_C:init() end

--- Searches the scene for the countdown light objects (Amberlight1-3, Greenlight, Redlight, left/right).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/countdownLightsController.lua:23
function flowgraph_nodes_mission_countdownLightsController_C:initLights() end

--- On reset: resets the state and hides all lights (initLights). Otherwise advances the timer (dtSim), turns the lights on/off according to proTree, sets started=true at green, detects the false start.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/countdownLightsController.lua:58
function flowgraph_nodes_mission_countdownLightsController_C:work() end

