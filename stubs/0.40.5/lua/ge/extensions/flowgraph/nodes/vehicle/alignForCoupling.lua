---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/alignForCoupling.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_vehicle_alignForCoupling_C
local flowgraph_nodes_vehicle_alignForCoupling_C = {}

--- Clears done, waitForCouple and coupled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/alignForCoupling.lua:33
function flowgraph_nodes_vehicle_alignForCoupling_C:_executionStarted() end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/alignForCoupling.lua:30
function flowgraph_nodes_vehicle_alignForCoupling_C:init() end

--- Handles reset. Once: finds the two vehicles, reads their couplerOffset (modules.vehicle), computes the alignment matrix, then (if ignoreCouple is false) moves the trailer (setTransform), resets its physics and its flexmesh and enables beamstate.activateAutoCoupling() on the tractor. Then waits for the coupling (modules.vehicle:isCoupledTo) and activates flow.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/alignForCoupling.lua:38
function flowgraph_nodes_vehicle_alignForCoupling_C:work() end

