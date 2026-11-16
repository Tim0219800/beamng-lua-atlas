---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/boost.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_boost_C
local flowgraph_nodes_vehicle_boost_C = {}

--- Resets `loaded = false` to reload `core_booster` at the next start.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/boost.lua:34
function flowgraph_nodes_vehicle_boost_C:_executionStopped() end

--- Constructor; `loaded = false` (the extension is not yet loaded on the vehicle side).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/boost.lua:30
function flowgraph_nodes_vehicle_boost_C:init() end

--- Loads `core_booster` in the vehicle VM the first time, then sends `core_booster.boost({power,0,0}, dtSim)` every frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/boost.lua:38
function flowgraph_nodes_vehicle_boost_C:work() end

