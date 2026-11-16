# `flowgraph_nodes_vehicle_special_customVehicleGetter`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/special/customVehicleGetter.lua` · VM: Game Engine (GE) · 111 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/special/customVehicleGetter")` (file under extensions/ but not a regular extension)

Node "Get Custom Vehicle Value" (`duration`, `once` behavior). Evaluates on the vehicle side a Lua expression (`data.fun`, for example `electrics.values.ignition` or `electrics.values.hazard_enabled`, chosen from a list or custom) and returns the result via `obj:queueGameEngineLua` to `returnValue`. Input pins: `flow`, `reset`, `VehId`; outputs: `flow` (when the value has arrived, with a delay of a few frames), `value` (any), `valBool` (bool: value ~= 0 if number, otherwise nil).

## Notes

- The input pin is named `VehId` (capital) but the code reads `self.pinIn.vehId`: the chosen vehicle is therefore ignored and the player vehicle is used.
- The expression is inserted as is into a Lua command: do not feed it with an untrusted source.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Clears the received value. | 97 |
| `C:drawCustomProperties()` | Dropdown list of predefined functions and text field for a custom function. | 42 |
| `C:getCmd()` | Builds the Lua command sent to the vehicle. | 102 |
| `C:init()` | Constructor; `data.fun` = first function of the list. | 38 |
| `C:returnValue(value)` | Called back by the vehicle VM with the serialized value; deserializes it into `returnedValue`. | 106 |
| `C:work()` | Sends the command to the vehicle once, then exposes `value`/`valBool` upon reception. | 67 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/special/customVehicleGetter.lua`.*
