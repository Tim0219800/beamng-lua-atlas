# `jbeam_sections_colors`

*File: `lua/common/jbeam/sections/colors.lua` · VM: Common (GE + vehicle) · 32 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/sections/colors")`

Applies the legacy body color from the vehicle configuration (vehicleConfig.colors, old format) to the vehicle object: colors[1] -> vehicleObj.color, colors[2] -> colorPalette0, colors[3] -> colorPalette1. Each entry is an array {r, g, b, a} converted to a linear color. Replaced by jbeam/sections/paints for the current format (paints).

## Notes

- No validation: an entry with fewer than 4 components will give nils in ColorF.
- Called in loadBundle on the GE side before paints.process, which can overwrite the same properties.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_sections_colors.process(vehicleObj, vehicleConfig, vehicle)` | Sets color, colorPalette0 and colorPalette1 of the vehicle object from vehicleConfig.colors if it exists. *(internal)* | 10 |

### Parameter details

#### `jbeam_sections_colors.process(vehicleObj, vehicleConfig, vehicle)`

Sets color, colorPalette0 and colorPalette1 of the vehicle object from vehicleConfig.colors if it exists.

- `vehicleObj` (*userdata*) : Engine vehicle object.
- `vehicleConfig` (*table*) : Vehicle configuration (colors field).
- `vehicle` (*table*) : Jbeam data (unused).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/sections/colors.lua`.*
