# `flowgraph_nodes_vehicle_customPartsConfigProvider`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua` · VM: Game Engine (GE) · 250 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/customPartsConfigProvider")` (file under extensions/ but not a regular extension)

Provider node "Custom Parts Config Provider" (category `provider`). Lets you build a custom parts configuration in the editor (`partConfig = {parts, vars}`): loading from a .pc file, copying from the player vehicle (everything, parts only, variables only) then key/value editing. Outputs: `model` (string) and `config` (table of type `vehicleConfig`), usable by "Spawn Vehicle".

## Notes

- `showKVPairs`: when a key is renamed, the variable `old` is never defined (nil), so the table is not updated correctly. On deletion, `self.partConfig.vars[...]` is used even for the `parts` field.
- "Read from File" button: `partConfigFilename` receives `self.configPath` (may be nil) instead of the vehicle path.
- The node writes its outputs every frame (`work`) without any notion of flow.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Called when the project loads; restores the node's settings from `nodeData`. | 235 |
| `C:_onSerialize(res)` | Called when the project is saved; copies the node's settings into the `res` table. | 225 |
| `C:drawCustomProperties()` | ImGui display of the node's properties in the editor panel; returns a string describing the change made, or nil. | 44 |
| `C:drawMiddle(builder, style)` | ImGui display in the center of the node in the flowgraph editor; purely visual. | 214 |
| `C:init()` | Constructor; clears models/configs and creates `partConfig = {parts = {}, vars = {}}`. | 25 |
| `C:showKVPairs(name, field, tpe)` | Displays an editable table of key/value pairs (`field` = 'parts' with string values, or 'vars' with number values), with sorting, adding and deleting. | 122 |
| `C:sortKeys()` | Rebuilds `sortedKeys` (keys of `parts` and `vars` sorted alphabetically). | 197 |
| `C:work()` | Copies `partConfig` and `model` to the output pins `config` and `model`. | 220 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua`.*
