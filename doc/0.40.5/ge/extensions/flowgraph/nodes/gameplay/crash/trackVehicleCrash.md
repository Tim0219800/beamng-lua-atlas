# `flowgraph_nodes_gameplay_crash_trackVehicleCrash`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/crash/trackVehicleCrash.lua` · VM: Game Engine (GE) · 24 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/crash/trackVehicleCrash")` (file under extensions/ but not a regular extension)

Flowgraph node "Track Vehicle Crash" (category repeat_instant). Adds a vehicle (vehId pin) to crash tracking via gameplay_util_crashDetection.addTrackedVehicleById.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Calls addTrackedVehicleById(vehId) every frame. | 19 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/crash/trackVehicleCrash.lua`.*
