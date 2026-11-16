---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_environment_setFogDensity_C
local flowgraph_nodes_environment_setFogDensity_C = {}

--- Stores the current fog density and height.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua:40
function flowgraph_nodes_environment_setFogDensity_C:_executionStarted() end

--- Restores the stored values if data.restoreTod is true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua:46
function flowgraph_nodes_environment_setFogDensity_C:_executionStopped() end

--- Sets data.restoreTod = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua:27
---@param mgr table Flowgraph manager
function flowgraph_nodes_environment_setFogDensity_C:init(mgr) end

--- Configures the density pin as a 0 to 1 slider.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua:31
function flowgraph_nodes_environment_setFogDensity_C:postInit() end

--- Calls core_environment.setFogDensity and setFogAtmosphereHeight with the pin values.
---Source: lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua:64
function flowgraph_nodes_environment_setFogDensity_C:setFogParameters() end

--- In repeat mode, applies the parameters every frame.
---Source: lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua:58
function flowgraph_nodes_environment_setFogDensity_C:work() end

--- Applies the parameters once.
---Source: lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua:54
function flowgraph_nodes_environment_setFogDensity_C:workOnce() end

