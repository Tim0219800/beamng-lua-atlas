# `ui_vehicleSelector_vehicleMetadataEditor`

*File: `lua/ge/extensions/ui/vehicleSelector/vehicleMetadataEditor.lua` · VM: Game Engine (GE) · 14 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_vehicleSelector_vehicleMetadataEditor`: `extensions.load("ui_vehicleSelector_vehicleMetadataEditor")`, then the global `ui_vehicleSelector_vehicleMetadataEditor`

Sketch of a vehicle metadata editor for the selector. The module is almost empty: its only function returns fixed values. Its reference in the dependencies of ui_vehicleSelector_general is commented out.

## Notes

- getVehicleMetadataDetails ignores its data parameter and always returns {name = 'Default Vehicle Name', description = 'Default vehicle description', type = 'Car'}: it is a placeholder.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_vehicleSelector_vehicleMetadataEditor.getVehicleMetadataDetails(data)` | Returns dummy vehicle metadata (name, description, type), whatever the argument. | 4 |

### Parameter details

#### `ui_vehicleSelector_vehicleMetadataEditor.getVehicleMetadataDetails(data)`

Returns dummy vehicle metadata (name, description, type), whatever the argument.

- `data` (*any*) : Ignored.
- **returns**: table {name, description, type} with fixed default values.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/vehicleSelector/vehicleMetadataEditor.lua`.*
