---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/setBulletTime.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_environment_setBulletTime_C
local flowgraph_nodes_environment_setBulletTime_C = {}

--- Called when the graph stops: resets simTimeAuthority.set(1).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/setBulletTime.lua:21
function flowgraph_nodes_environment_setBulletTime_C:_executionStopped() end

--- Configures the value pin as a float slider from 0 to 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/setBulletTime.lua:25
function flowgraph_nodes_environment_setBulletTime_C:postInit() end

--- If the flow is active: pauses if value == 0, otherwise sets the speed (setInstant if instant, otherwise set) and lifts the pause.
---Source: lua/ge/extensions/flowgraph/nodes/environment/setBulletTime.lua:34
function flowgraph_nodes_environment_setBulletTime_C:work() end

