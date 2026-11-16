# `flowgraph_nodes_gameplay_traffic_parkingParams`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/parkingParams.lua` · VM: Game Engine (GE) · 62 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/parkingParams")` (file under extensions/ but not a regular extension)

Flowgraph node "Parking System Parameters" (once_instant). Sets the parking system (gameplay_parking.setParkingVars): precision and neatness (clamped 0-1), radiusCoef, respawnProbability (baseProbability), poolActiveAmount (activeAmount; with data.usePoolInactiveAmount, equals the number of parked cars minus the value), debugLevel (0 to 3). Only non-nil pins are applied.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:init()` | Initializes the node's internal state at creation (called by the flowgraph engine). | 25 |
| `C:workOnce()` | Builds the variables table from the non-nil pins and sends it to gameplay_parking.setParkingVars; sets gameplay_parking.debugLevel. | 30 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/parkingParams.lua`.*
