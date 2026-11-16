# `flowgraph_nodes_gameplay_crash_trackMultipleVehiclesCrash`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/crash/trackMultipleVehiclesCrash.lua` · VM: Game Engine (GE) · 26 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/crash/trackMultipleVehiclesCrash")` (file under extensions/ but not a regular extension)

Flowgraph node "Track Multiple Vehicles Crash" (category repeat_instant). Adds several vehicles (vehIds pin, table of ids) to the crash tracking of gameplay_util_crashDetection.

## Notes

- Crashes if vehIds is nil (ipairs on nil).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Calls addTrackedVehicleById for each id in vehIds. | 19 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/crash/trackMultipleVehiclesCrash.lua`.*
