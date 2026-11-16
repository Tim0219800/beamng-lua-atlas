# `flowgraph_nodes_vehicle_special_vehicleAction`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.lua` · VM: Game Engine (GE) · 191 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/special/vehicleAction")` (file under extensions/ but not a regular extension)

Node "Vehicle Action" (`duration` behavior, category `repeat_p_duration`). Calls a vehicle action defined in its `input_actions.json` (or those of `lua/ge/extensions/core/input/actions/vehicle.json` for "allVehicles"). Input pins: `vehId`, `val` (VALUE), `inputFilter` and `angle` (hidden, 0), flows `down`, `change`, `up` to simulate onDown/onChange/onUp. The words VALUE, FILTERTYPE and ANGLE in the command are replaced by the pins.

## Notes

- Only actions with context `vlua` (or without context) are offered.
- No fallback to the player vehicle in `work`.
- `loadActions` sorts with `actions[a].order`: crashes if an action has no `order` field.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Restores model, type, name and action. | 183 |
| `C:_onSerialize(res)` | Saves model, type, name and action. | 176 |
| `C:drawCustomProperties()` | Vehicle selector and list of available actions. | 71 |
| `C:formatCommand(cmd)` | Replaces VALUE, FILTERTYPE and ANGLE in the command with the pin values. | 149 |
| `C:init()` | Constructor; no action selected. | 34 |
| `C:loadActions(key, file)` | Loads and caches the actions of a model (`key`) from `file` (default `vehicles/<key>/input_actions.json`). | 47 |
| `C:work()` | Sends `onDown`, `onChange`, `onUp` of the action to the vehicle according to the active flow pins. | 156 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.lua`.*
