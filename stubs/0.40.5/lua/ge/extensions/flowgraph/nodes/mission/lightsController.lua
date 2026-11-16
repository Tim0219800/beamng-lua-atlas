---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/lightsController.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_mission_lightsController_C
local flowgraph_nodes_mission_lightsController_C = {}

--- Resets the state and the outputs to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/lightsController.lua:46
function flowgraph_nodes_mission_lightsController_C:_executionStarted() end

--- Same initialization.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/lightsController.lua:54
function flowgraph_nodes_mission_lightsController_C:init() end

--- Searches the scene for the stage and countdown lights.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/lightsController.lua:23
function flowgraph_nodes_mission_lightsController_C:initLights() end

--- On reset: resets the state and hides the lights. Otherwise advances the timer, handles the ambers/green, sets started=true, detects the false start (velocity > 0.5): disqualified=true, ambers and right red on.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/lightsController.lua:62
function flowgraph_nodes_mission_lightsController_C:work() end

