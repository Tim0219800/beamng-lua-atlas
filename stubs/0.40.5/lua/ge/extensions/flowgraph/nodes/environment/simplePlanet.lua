---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/simplePlanet.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_environment_simplePlanet_C
local flowgraph_nodes_environment_simplePlanet_C = {}

--- Calls onNodeReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/simplePlanet.lua:62
function flowgraph_nodes_environment_simplePlanet_C:_executionStopped() end

--- Initializes self.vehicle to nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/simplePlanet.lua:29
function flowgraph_nodes_environment_simplePlanet_C:init() end

--- If a vehicle was targeted, sends it obj:setPlanets({}) and forgets the reference.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/simplePlanet.lua:33
function flowgraph_nodes_environment_simplePlanet_C:onNodeReset() end

--- Builds the command obj:setPlanets({x,y,z,radius,mass}) and sends it to the targeted vehicle.
---Source: lua/ge/extensions/flowgraph/nodes/environment/simplePlanet.lua:40
function flowgraph_nodes_environment_simplePlanet_C:workOnce() end

