# `util_trackBuilder_materialUtil`

*File: `lua/ge/extensions/util/trackBuilder/materialUtil.lua` · VM: Game Engine (GE) · 455 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_trackBuilder_materialUtil`: `extensions.load("util_trackBuilder_materialUtil")`, then the global `util_trackBuilder_materialUtil`

Manages the eight material sets (letters A to H) of the Track Builder. Each letter corresponds to two scene materials, 'track_editor_<letter>_center' and 'track_editor_<letter>_border'. The module reads and writes their colors, textures (base, specular, normal, center/border decals), glow (glow/emissive) and ground type (groundtype); it can also revert to the original values and return only the values that differ from the defaults.

## Notes

- A material is a table with: baseCenterColor, baseBorderColor, centerColor, borderColor ({r,g,b,a} arrays from 0 to 1), baseTexture, baseTextureN, baseTextureS, centerTexture, borderTexture, centerGlow, borderGlow (booleans), groundtype (ASPHALT by default).
- The scene materials are found with scenetree.findObject; the functions fail if 'track_editor_X_center' or '_border' do not exist.
- loadMaterial (local) rereads the actual state from the material objects unless skipSet is true, and uses editor.texObj: this assumes the editor is loaded.
- Bug: M.loadMaterials is exported but loadMaterials is not defined in the file (the call is commented out), so the field is nil.
- resetMaterialsToDefault(letter) calls dump() twice (debug traces left in the code).

## Functions

| Function | Description | Line |
|---|---|---|
| `util_trackBuilder_materialUtil.getMaterials()` | Rereads the 8 materials from the scene and returns, per letter, only the values that differ from the original values (removeDefaults). | 437 |
| `util_trackBuilder_materialUtil.resetMaterialsToDefault(letter)` | Resets the materials to the original values: all if letter is nil, otherwise only that letter. | 426 |
| `util_trackBuilder_materialUtil.setMaterials(materials, skipSet)` | Applies several materials: completes each entry with the missing original values (fillDefaults) then calls setSingleMaterial. With no argument, does nothing. | 395 |
| `util_trackBuilder_materialUtil.setSingleMaterial(letter, material, skipSet)` | Applies a material to the given letter: textures, colors, glow, groundtype, then flush and reload of the center and border materials; updates currentMaterials. | 402 |

### Parameter details

#### `util_trackBuilder_materialUtil.getMaterials()`

Rereads the 8 materials from the scene and returns, per letter, only the values that differ from the original values (removeDefaults).

- **returns**: table<string, table> Slimmed-down materials, keyed by letter.

#### `util_trackBuilder_materialUtil.resetMaterialsToDefault(letter)`

Resets the materials to the original values: all if letter is nil, otherwise only that letter.

- `letter` (*string|nil*) : Letter 'A' to 'H', or nil for all.

#### `util_trackBuilder_materialUtil.setMaterials(materials, skipSet)`

Applies several materials: completes each entry with the missing original values (fillDefaults) then calls setSingleMaterial. With no argument, does nothing.

- `materials` (*table<string, table>|nil*) : Materials keyed by letter.
- `skipSet` (*boolean|nil*) : If true, does not reread the current state of the scene objects before applying.

#### `util_trackBuilder_materialUtil.setSingleMaterial(letter, material, skipSet)`

Applies a material to the given letter: textures, colors, glow, groundtype, then flush and reload of the center and border materials; updates currentMaterials.

- `letter` (*string*) : Letter 'A' to 'H'.
- `material` (*table*) : Full material table (see module).
- `skipSet` (*boolean|nil*) : See setMaterials.

## Fields

| Field | Type | Description |
|---|---|---|
| `currentMaterials` | table<string, table> | Current state of the materials, keyed by letter (A to H). |
| `loadMaterials` | nil | Always nil: reference to an undefined function (bug). ⚠ reference `loadMaterials` not defined in the file (probably nil) |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/trackBuilder/materialUtil.lua`.*
