---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/gForce.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_gForce_C
local flowgraph_nodes_vehicle_gForce_C = {}

--- Called by the manager when the flowgraph project execution starts; resets the internal state to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/gForce.lua:33
function flowgraph_nodes_vehicle_gForce_C:_executionStarted() end

--- Called by the manager when the project execution stops; cleans up the internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/gForce.lua:37
function flowgraph_nodes_vehicle_gForce_C:_executionStopped() end

--- Node constructor, called at its creation by the flowgraph editor/manager; initializes the internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/gForce.lua:29
function flowgraph_nodes_vehicle_gForce_C:init() end

--- Empty function _anon(the initialization code is commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/gForce.lua:41
function flowgraph_nodes_vehicle_gForce_C:onNodeReset() end

--- Reads the smoothed accelerations (subscribes to the values on the first call), divides them by gravity and fills the outputs in g.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/gForce.lua:45
function flowgraph_nodes_vehicle_gForce_C:work() end

