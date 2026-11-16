---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/setScatterSky.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_environment_setScatterSky_C
local flowgraph_nodes_environment_setScatterSky_C = {}

--- Stores the current brightness and the six gradient files.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/setScatterSky.lua:30
function flowgraph_nodes_environment_setScatterSky_C:_executionStarted() end

--- Restores the stored values if data.restoreScatterSky is true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/setScatterSky.lua:42
function flowgraph_nodes_environment_setScatterSky_C:_executionStopped() end

--- Sets data.restoreScatterSky = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/setScatterSky.lua:26
---@param mgr table Flowgraph manager
function flowgraph_nodes_environment_setScatterSky_C:init(mgr) end

--- Calls the core_environment setters (setSkyBrightness, set*GradientFile) then reapplies the current time.
---Source: lua/ge/extensions/flowgraph/nodes/environment/setScatterSky.lua:65
function flowgraph_nodes_environment_setScatterSky_C:setScatterSkyParameters() end

--- In repeat mode, applies the parameters every frame.
---Source: lua/ge/extensions/flowgraph/nodes/environment/setScatterSky.lua:59
function flowgraph_nodes_environment_setScatterSky_C:work() end

--- Applies the parameters once.
---Source: lua/ge/extensions/flowgraph/nodes/environment/setScatterSky.lua:55
function flowgraph_nodes_environment_setScatterSky_C:workOnce() end

