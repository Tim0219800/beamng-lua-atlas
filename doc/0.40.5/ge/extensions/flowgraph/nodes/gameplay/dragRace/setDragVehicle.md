# `flowgraph_nodes_gameplay_dragRace_setDragVehicle`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua` · VM: Game Engine (GE) · 136 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Drag Vehicles" (category once_instant). Registers the race vehicles in gameplay_drag_dragBridge.setVehicles. The per-lane input pins (vehId_i, isPlayable_i, dial_i, lane_i) are created dynamically according to the number chosen in the editor (count, saved). Output: flow (pulse).

## Notes

- Lanes without a valid vehId (> 0) are ignored; if the list is empty, the node gives no flow.
- Default values: isPlayable false, dial -1, lane 1.
- When pins are removed, only the links whose sourcePin matches are deleted (the comparison is made on sourcePin although these are input pins).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Empty. | 35 |
| `C:_onDeserialized(res)` | Restores mode and count and recreates the pins. | 130 |
| `C:_onSerialize(res)` | Saves mode and count. | 125 |
| `C:drawCustomProperties()` | Editor: count field and choice of the merge function. | 39 |
| `C:drawMiddle(builder, style)` | Displays the merge mode. | 30 |
| `C:init()` | count = 1, mode = 'first'. | 25 |
| `C:updatePins(old, new)` | Adds or removes the per-lane pins to go from old to new. | 71 |
| `C:workOnce()` | Builds the list {id, isPlayable, dial, lane} and calls dragBridge.setVehicles. | 107 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua`.*
