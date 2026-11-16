# `flowgraph_nodes_gameplay_traffic_setVehicleData`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setVehicleData.lua` · VM: Game Engine (GE) · 61 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/setVehicleData")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Traffic Vehicle Data" (once_instant). Sets an active traffic vehicle: role (veh:setRole), enableActions (inverse of role.lockAction), enableRespawn, enableTracking, enablePoolCycle (enableAutoPooling), changePaint (useRandomPaint). Only non-nil pins are applied.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:init()` | Initializes the node's internal state at creation (called by the flowgraph engine). | 26 |
| `C:workOnce()` | Applies the non-nil pins to traffic vehicle vehId (if it exists). | 30 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setVehicleData.lua`.*
