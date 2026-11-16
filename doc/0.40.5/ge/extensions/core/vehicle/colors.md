# `core_vehicle_colors`

*File: `lua/ge/extensions/core/vehicle/colors.lua` · VM: Game Engine (GE) · 106 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_vehicle_colors`: `extensions.load("core_vehicle_colors")`, then the global `core_vehicle_colors`

GE extension `core_vehicle_colors`: live changes of the color or paint of one of the 3 paint slots of the configured vehicle (core_vehicle_configTarget), updates the meshes through core_vehicle_manager.liveUpdateVehicleColors, then saves the paints in the config through core_vehicle_partmgmt.setConfigPaints (without respawn). Used by the vehicle configuration UI.

## Example

```lua
-- Full paint on slot 1 of the player's vehicle
core_vehicle_colors.setVehiclePaint(1, createVehiclePaint({x=0.8,y=0.1,z=0.1,w=1}, {0.5,0.5,0.8,0.1}))
-- Color from a string 'r g b a metallic roughness clearcoat clearcoatRoughness' (alpha from 0 to 2)
core_vehicle_colors.setVehicleColor(0, '0.8 0.1 0.1 2 0.5 0.5 0.8 0.1')
```

## Notes

- setVehicleColor takes a JS index (0-based) whereas setVehiclePaint takes a Lua index (1-based).
- colorStringToColorTable crashes the function (arithmetic on nil error) if the string contains fewer than 4 numbers.
- The 4th component of the color string goes from 0 to 2; it is brought back to 0..1 by colorStringToColorTable then multiplied by 2 again in updateVehicleDataPaint before createVehiclePaint.

**Dependencies (loaded first):** `core_vehicle_configTarget`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_vehicle_colors.colorStringToColorTable(colorString)` | Converts a string 'r g b a [...]' (numbers separated by spaces) into an array of numbers; the 4th element (0..2) is brought back to 0..1 (multiplied by 0.5 and clamped). | 9 |
| `core_vehicle_colors.onVehicleSpawned(vehId)` | Hook: a vehicle spawns. Copies its 3 actual colors (veh.color, colorPalette0, colorPalette1 + metallic data) into vehicleData.config.paints, rounded to 4 decimals, so that the config reflects the actual paint. *(internal)* *(hook)* | 73 |
| `core_vehicle_colors.setVehicleColor(index, colorString, objID)` | Sets the color of a paint slot from a string (8 numbers: r g b a then 4 metallic values), updates the vehicle live and saves all paints in the config. | 36 |
| `core_vehicle_colors.setVehiclePaint(index, paint, objID)` | Applies a paint table to a slot, updates the vehicle live and saves the paints in the config. | 53 |

### Parameter details

#### `core_vehicle_colors.colorStringToColorTable(colorString)`

Converts a string 'r g b a [...]' (numbers separated by spaces) into an array of numbers; the 4th element (0..2) is brought back to 0..1 (multiplied by 0.5 and clamped).

- `colorString` (*string|nil*) : e.g. '0.5 0.2 0.1 1.2'
- **returns**: number[]|nil array of numbers; nil if colorString is nil

#### `core_vehicle_colors.onVehicleSpawned(vehId)`

Hook: a vehicle spawns. Copies its 3 actual colors (veh.color, colorPalette0, colorPalette1 + metallic data) into vehicleData.config.paints, rounded to 4 decimals, so that the config reflects the actual paint.

- `vehId` (*integer*) : vehicle

#### `core_vehicle_colors.setVehicleColor(index, colorString, objID)`

Sets the color of a paint slot from a string (8 numbers: r g b a then 4 metallic values), updates the vehicle live and saves all paints in the config.

- `index` (*integer*) : paint slot, 0-based (0 to 2)
- `colorString` (*string*) : 'r g b a metallic roughness clearcoat clearcoatRoughness'
- `objID` (*integer|nil*) : vehicle; nil = configuration target or player 0

#### `core_vehicle_colors.setVehiclePaint(index, paint, objID)`

Applies a paint table to a slot, updates the vehicle live and saves the paints in the config.

- `index` (*integer*) : paint slot, 1-based (1 to 3)
- `paint` (*table*) : paint {baseColor, metallic, roughness, clearcoat, clearcoatRoughness}
- `objID` (*integer|nil*) : vehicle; nil = configuration target or player 0

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'core_vehicle_configTarget'} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/vehicle/colors.lua`.*
