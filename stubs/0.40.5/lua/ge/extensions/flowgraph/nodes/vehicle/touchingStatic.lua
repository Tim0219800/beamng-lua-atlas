---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/touchingStatic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_touchingStatic_C
local flowgraph_nodes_vehicle_touchingStatic_C = {}

--- Creates the 8 points and the working vectors.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/touchingStatic.lua:42
function flowgraph_nodes_vehicle_touchingStatic_C:_executionStarted() end

--- Frees the points and resets the outputs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/touchingStatic.lua:47
function flowgraph_nodes_vehicle_touchingStatic_C:_executionStopped() end

--- Constructor; calls `reset`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/touchingStatic.lua:38
function flowgraph_nodes_vehicle_touchingStatic_C:init() end

--- Render hook: draws the debug spheres if `debugMode` is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/touchingStatic.lua:101
function flowgraph_nodes_vehicle_touchingStatic_C:onPreRender() end

--- Sets all outputs to false and disables the node.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/touchingStatic.lua:52
function flowgraph_nodes_vehicle_touchingStatic_C:reset() end

--- Computes the 8 points, casts the rays and fills the outputs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/touchingStatic.lua:59
function flowgraph_nodes_vehicle_touchingStatic_C:work() end

