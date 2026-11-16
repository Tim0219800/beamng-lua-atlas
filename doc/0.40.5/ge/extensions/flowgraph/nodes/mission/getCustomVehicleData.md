# `flowgraph_nodes_mission_getCustomVehicleData`

*File: `lua/ge/extensions/flowgraph/nodes/mission/getCustomVehicleData.lua` · VM: Game Engine (GE) · 81 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/mission/getCustomVehicleData")` (file under extensions/ but not a regular extension)

Flowgraph node 'Get Custom Vehicle Data' (once_instant category). Intended to read the dynamic fields of a vehicle (pin vehId) into custom output pins; the current implementation only reads the fields waypoints, routeSpeed and risk.

## Notes

- BUG: in workOnce, the condition tests 'veh.wayponits' (typo) and assigns 'wps', a variable never defined in this function (nil): the waypoints output never receives the list, and convertStringToTable is never called.
- The loop over pinOut that was supposed to copy each dynamic field is empty (only comments).
- If an output pin waypoints, routeSpeed or risk does not exist, indexing nil raises an error.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:convertStringToTable(str)` | Splits a comma-separated string into a table of strings. | 39 |
| `C:init()` | Enables savePins and allowCustomOutPins. | 33 |
| `C:workOnce()` | Looks up the vehicle by id and copies routeSpeed and risk (converted to number) to the output pins of the same name; the waypoints part is broken (see notes). | 56 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/mission/getCustomVehicleData.lua`.*
