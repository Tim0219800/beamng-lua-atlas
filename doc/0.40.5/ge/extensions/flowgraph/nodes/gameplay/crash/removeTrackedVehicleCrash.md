# `flowgraph_nodes_gameplay_crash_removeTrackedVehicleCrash`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/crash/removeTrackedVehicleCrash.lua` · VM: Game Engine (GE) · 23 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/crash/removeTrackedVehicleCrash")` (file under extensions/ but not a regular extension)

Flowgraph node "Remove Tracked Vehicle Crash" (category repeat_instant). Removes a vehicle (vehId pin) from crash tracking via gameplay_util_crashDetection.removeTrackedVehicleById.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Calls removeTrackedVehicleById(vehId) every frame. | 18 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/crash/removeTrackedVehicleCrash.lua`.*
