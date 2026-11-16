# `flowgraph_nodes_vehicle_alignForCoupling`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/alignForCoupling.lua` · VM: Game Engine (GE) · 127 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/alignForCoupling")` (file under extensions/ but not a regular extension)

Node "Align for Coupling" (color vehicle, link icon, duration + once behavior). Places a trailer behind a tractor vehicle to ease coupling: aligns the trailer's coupling point with the tractor's with the desired rotation, then enables automatic coupling. Inputs: flow, reset, vehId (tractor), trailerId (trailer), rot (number in relative degrees, or quat; hidden), relativeRotationQuat (hidden), ignoreCouple (hidden, true: does not move nor couple). Output: flow, active only when the vehicles are coupled.

## Notes

- With ignoreCouple at true (default value), the trailer is not moved: coupled is set to true immediately and the flow goes out without any alignment.
- If a vehicle has no couplerOffset, the node returns without doing anything on every frame.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Clears done, waitForCouple and coupled. | 33 |
| `C:init()` | Does nothing. | 30 |
| `C:work()` | Handles reset. Once: finds the two vehicles, reads their couplerOffset (modules.vehicle), computes the alignment matrix, then (if ignoreCouple is false) moves the trailer (setTransform), resets its physics and its flexmesh and enables beamstate.activateAutoCoupling() on the tractor. Then waits for the coupling (modules.vehicle:isCoupledTo) and activates flow. | 38 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/alignForCoupling.lua`.*
