# `flowgraph_nodes_vehicle_special_customVlua`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/special/customVlua.lua` · VM: Game Engine (GE) · 59 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/special/customVlua")` (file under extensions/ but not a regular extension)

Node "Custom Vehicle Lua" (category `repeat_p_duration`, tags lua/vlua/command/code). Runs Lua code in the vehicle VM with `veh:queueLuaCommand(func)`. Input pins: `vehId` (default: player), `func` (string, code to run). Output: `flow`, `vehId` (hidden).

## Notes

- Executed every frame while the flow is active.
- The code is executed as is: this is arbitrary execution, so no untrusted source.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(data)` | Migration of old projects: moves `data.func` to a hardcoded pin `func`. | 49 |
| `C:drawMiddle(builder, style)` | Empty central display. | 45 |
| `C:work()` | Sends `func` to the vehicle and copies `vehId` to the output. | 31 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/special/customVlua.lua`.*
