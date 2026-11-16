# `flowgraph_nodes_vehicle_onVehicleSwitched`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSwitched.lua` · VM: Game Engine (GE) · 64 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/onVehicleSwitched")` (file under extensions/ but not a regular extension)

Event node "On Vehicle Switched" (category `logic`, tag event). Emits a pulse on `flow` when the player changes vehicle (hook `onVehicleSwitched`). Outputs: `oldID`, `newID` (number) and `player` (hidden).

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | Called by the manager after the node is triggered; resets the event flag to false. | 49 |
| `C:_executionStarted()` | Called by the manager when the flowgraph project execution starts; resets the internal state to zero. | 31 |
| `C:init(mgr, ...)` | Empty constructor. | 27 |
| `C:onVehicleSwitched(oid, nid, player)` | Hook called when the player changes vehicle; `oid` old id, `nid` new id, `player` player id. | 53 |
| `C:work(args)` | If a change was signaled, fills `oldID`, `newID`, `player` and sets `flow` to true for one frame. | 37 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSwitched.lua`.*
