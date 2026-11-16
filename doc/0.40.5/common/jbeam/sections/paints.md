# `jbeam_sections_paints`

*File: `lua/common/jbeam/sections/paints.lua` · VM: Common (GE + vehicle) · 41 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/sections/paints")`

Applies the vehicle paints: vehicleConfig.paints (or, failing that, vehicleConfig.colors converted by convertVehicleColorsToPaints) provides up to three paints. For each one, validateVehiclePaint checks it, then baseColor becomes the object's color (paints[1] -> color, paints[2] -> colorPalette0, paints[3] -> colorPalette1). The whole list is then sent to the engine via setMetallicPaintData for the metallic/clearcoat parameters.

## Notes

- baseColor is an array {r, g, b, a}.
- convertVehicleColorsToPaints and validateVehiclePaint are global functions defined elsewhere.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_sections_paints.process(vehicleObj, vehicleConfig, vehicle)` | Applies the config's paints to the vehicle object and passes on the metallic paint data. *(internal)* | 10 |

### Parameter details

#### `jbeam_sections_paints.process(vehicleObj, vehicleConfig, vehicle)`

Applies the config's paints to the vehicle object and passes on the metallic paint data.

- `vehicleObj` (*userdata*) : Engine vehicle object.
- `vehicleConfig` (*table*) : Configuration (paints or colors).
- `vehicle` (*table*) : Jbeam data (unused).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/sections/paints.lua`.*
