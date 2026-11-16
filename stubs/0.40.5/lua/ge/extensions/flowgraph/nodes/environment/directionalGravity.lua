---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/directionalGravity.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_environment_directionalGravity_C
local flowgraph_nodes_environment_directionalGravity_C = {}

--- Removes the vehicle's planets (obj:setPlanets({})).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/directionalGravity.lua:37
function flowgraph_nodes_environment_directionalGravity_C:_executionStopped() end

--- Editor: debug display (line, force) and surface gravity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/directionalGravity.lua:82
---@param builder table node constructor
---@param style table style
function flowgraph_nodes_environment_directionalGravity_C:drawMiddle(builder, style) end

--- Enables showDebug and creates the planet table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/directionalGravity.lua:31
function flowgraph_nodes_environment_directionalGravity_C:init() end

--- Computes the planet's origin, radius and mass and sends obj:setPlanets to the vehicle. Does nothing if direction or magnitude is nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/directionalGravity.lua:55
function flowgraph_nodes_environment_directionalGravity_C:setDirectionalGravity() end

--- If dynamicMode is 'repeat', reapplies the gravity every frame.
---Source: lua/ge/extensions/flowgraph/nodes/environment/directionalGravity.lua:49
function flowgraph_nodes_environment_directionalGravity_C:work() end

--- Applies the directional gravity once.
---Source: lua/ge/extensions/flowgraph/nodes/environment/directionalGravity.lua:45
function flowgraph_nodes_environment_directionalGravity_C:workOnce() end

