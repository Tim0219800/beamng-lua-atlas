# `jbeam_sections_licenseplatesSkins`

*File: `lua/common/jbeam/sections/licenseplatesSkins.lua` · VM: Common (GE + vehicle) · 75 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/sections/licenseplatesSkins")`

Processes two families of active parts: license plates and skins. A part with a slotType containing '_licenseplate' (or having licenseplateFormat) activates the plate; the formats used are collected (default '30-15'). A plate design part (slotType containing 'licenseplate_design') provides licenseplate_path. A skin part (slotType containing 'skin_' or equal to 'paint_design') calls vehicleObj:setSkin("<slot>.<skin name>") and can impose default colors. At the end, if a plate is used, core_vehicles.setPlateText is called.

## Notes

- The skin name is part.skinName, otherwise part.globalSkin, otherwise empty string; the skin slot is part.skinType (if non-empty string) otherwise the slotType; 'paint_design' or a non-string slotType gives an empty prefix.
- The default colors (part.default_color, default_color_2, default_color_3) are sent via core_vehicle_manager.setVehicleColorsNames.
- The plate text comes from config.licenseName, otherwise false (the manager generates the text).
- slotType can be a string or a table of strings.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_sections_licenseplatesSkins.process(objID, vehicleObj, config, activePartsData)` | Walks the active parts to configure the vehicle's license plate and skins. *(internal)* | 11 |

### Parameter details

#### `jbeam_sections_licenseplatesSkins.process(objID, vehicleObj, config, activePartsData)`

Walks the active parts to configure the vehicle's license plate and skins.

- `objID` (*integer*) : Vehicle identifier.
- `vehicleObj` (*userdata*) : Engine vehicle object.
- `config` (*table|nil*) : Vehicle configuration (licenseName).
- `activePartsData` (*table<string, table>|nil*) : Active parts (name -> part data).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/sections/licenseplatesSkins.lua`.*
