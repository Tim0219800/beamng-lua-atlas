# `flowgraph_nodes_vehicle_vehicleConfigProvider`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/vehicleConfigProvider.lua` · VM: Game Engine (GE) · 75 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/vehicleConfigProvider")` (file under extensions/ but not a regular extension)

"Vehicle Config Provider" provider node (`simple` behavior, category `provider`). Lets the user pick a vehicle model and config in the editor (`ui_flowgraph_editor.vehicleSelector`). Outputs: `model`, `config` (config path), `modelName` and `configName` (hidden).

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Restores model, config, path, type and names. | 65 |
| `C:_onSerialize(res)` | Saves model, config, path, type and names. | 56 |
| `C:drawCustomProperties()` | Displays the vehicle selector. | 36 |
| `C:drawMiddle(builder, style)` | Empty central display. | 42 |
| `C:init()` | Constructor; clears the model/config fields. | 26 |
| `C:work()` | Writes the chosen model and config to the outputs. | 49 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/vehicleConfigProvider.lua`.*
