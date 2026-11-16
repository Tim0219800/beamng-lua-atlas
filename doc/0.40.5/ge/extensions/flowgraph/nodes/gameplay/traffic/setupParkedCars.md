# `flowgraph_nodes_gameplay_traffic_setupParkedCars`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setupParkedCars.lua` · VM: Game Engine (GE) · 43 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/setupParkedCars")` (file under extensions/ but not a regular extension)

Flowgraph node "Setup Parking System" (once_instant). Enables the parking spot placement system: gameplay_parking.setState(true), optional sitesData via setSites, then traffic:activateParkedCars(vehicleIds). On reset: deactivateParkedCars and setSites() with no argument.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls onNodeReset(). | 26 |
| `C:init()` | Calls onNodeReset(). | 22 |
| `C:onNodeReset()` | Deactivates the parked cars and resets the parking system's sites. | 30 |
| `C:workOnce()` | Enables parking, applies the sites if provided and activates the parked cars for the id list. | 35 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setupParkedCars.lua`.*
