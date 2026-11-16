# `flowgraph_nodes_vehicle_special_customVlua_string`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/special/customVlua_string.lua` · VM: Game Engine (GE) · 55 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/special/customVlua_string")` (file under extensions/ but not a regular extension)

Node "Custom vlua - deprecated" (category `repeat_p_duration`). Old version of "Custom Vehicle Lua": sends the string of the `customLUA` pin to the vehicle `vehId` with `queueLuaCommand`. Obsolete: replaced by "Custom vlua".

## Notes

- The `customLUA` pin is described as "The message that will be displayed. Bug: can not start directly with a number."
- `init` reads `self.pinIn.customLUAString` which does not exist (the pin is named `customLUA`): potential error.
- No fallback to the player vehicle.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Empty central display. | 48 |
| `C:init()` | Constructor; tries to copy `pinIn.customLUAString.value` into `data.func` (nonexistent pin). | 27 |
| `C:work()` | Sends `customLUA` to the vehicle. | 33 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/special/customVlua_string.lua`.*
