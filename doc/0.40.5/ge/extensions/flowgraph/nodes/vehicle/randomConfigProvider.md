# `flowgraph_nodes_vehicle_randomConfigProvider`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.lua` · VM: Game Engine (GE) · 97 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/randomConfigProvider")` (file under extensions/ but not a regular extension)

Provider node "Random Config Provider" (category `once_instant`). Randomly chooses a model and a configuration among the cars (`Type == 'Car'`) with a config having `Top Speed > 10`. Outputs: `model`, `config`, `name` (hidden), `color` (hidden, random paint name of the model or nil).

## Notes

- The options are computed once at first start (`self.options`) from `core_vehicles.getVehicleList()`.
- The description of the `color` pin is copied from `name` ("model name").

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Builds the `options` list of eligible models/configs if it does not exist. | 46 |
| `C:_onDeserialized(nodeData)` | Empty function. | 92 |
| `C:_onSerialize(res)` | Empty function. | 88 |
| `C:drawCustomProperties()` | Draws nothing; returns nil. | 34 |
| `C:drawMiddle(builder, style)` | ImGui display in the center of the node in the flowgraph editor; purely visual. | 41 |
| `C:init()` | Constructor; initializes the model/config fields. | 24 |
| `C:workOnce()` | Draws a random model, config and paint and writes them to the outputs. | 74 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.lua`.*
