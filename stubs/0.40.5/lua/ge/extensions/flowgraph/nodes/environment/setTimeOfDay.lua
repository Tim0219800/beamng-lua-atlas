---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/setTimeOfDay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_environment_setTimeOfDay_C
local flowgraph_nodes_environment_setTimeOfDay_C = {}

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/setTimeOfDay.lua:43
function flowgraph_nodes_environment_setTimeOfDay_C:_executionStarted() end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/setTimeOfDay.lua:46
function flowgraph_nodes_environment_setTimeOfDay_C:_executionStopped() end

--- Sets data.restoreTod = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/setTimeOfDay.lua:23
---@param mgr table Flowgraph manager
function flowgraph_nodes_environment_setTimeOfDay_C:init(mgr) end

--- Configures the time pin (0 to 1 slider, Midday/Evening/Midnight/Morning templates).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/setTimeOfDay.lua:27
function flowgraph_nodes_environment_setTimeOfDay_C:postInit() end

--- Marks todChanged then calls core_environment.setTimeOfDay({time, play, dayLength}).
---Source: lua/ge/extensions/flowgraph/nodes/environment/setTimeOfDay.lua:63
function flowgraph_nodes_environment_setTimeOfDay_C:setTimeOfDay() end

--- In repeat mode, applies the time every frame.
---Source: lua/ge/extensions/flowgraph/nodes/environment/setTimeOfDay.lua:57
function flowgraph_nodes_environment_setTimeOfDay_C:work() end

--- Applies the time once.
---Source: lua/ge/extensions/flowgraph/nodes/environment/setTimeOfDay.lua:53
function flowgraph_nodes_environment_setTimeOfDay_C:workOnce() end

