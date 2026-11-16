# `flowgraph_nodes_gameplay_crash_onCrashDetected`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/crash/onCrashDetected.lua` · VM: Game Engine (GE) · 60 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/crash/onCrashDetected")` (file under extensions/ but not a regular extension)

Flowgraph node "On Crash Detected" (category repeat_instant). Emits flow when a tracked vehicle starts or ends a crash (onVehicleCrashStarted/onVehicleCrashEnded hooks of gameplay_util_crashDetection). Outputs: startCrash, endCrash (pulses) and vehId. Simultaneous crashes are queued and output one per frame.

## Notes

- If a start and an end are output in the same frame, vehId is overwritten by the one from the end.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls reset. | 24 |
| `C:init()` | Calls reset. | 20 |
| `C:onVehicleCrashEnded(crashEndData)` | Hook: adds vehId to the crash end queue. | 55 |
| `C:onVehicleCrashStarted(crashStartData)` | Hook: adds vehId to the crash start queue. | 51 |
| `C:reset()` | Empties the crashStartQueue and crashEndQueue queues. | 28 |
| `C:work()` | Pops one crash start and one crash end per frame and fills startCrash, endCrash, vehId. | 33 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/crash/onCrashDetected.lua`.*
