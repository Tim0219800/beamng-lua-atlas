# `jbeam_sections_mirror`

*File: `lua/common/jbeam/sections/mirror.lua` · VM: Common (GE + vehicle) · 62 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/sections/mirror")`

Processes the jbeam "mirrors" section. For each entry with a mesh field, registers the mirror in the engine (addMirror with mesh, idRef, id1, id2) and gets the resulting id in v.id, then configures the mirror object: offset (refBaseTranslation or offset), normal (deduced from baseRotationGlobal in degrees or from normal) and offsetNormal (deprecated fields). Entries without mesh are considered old data.

## Notes

- baseRotationGlobal is in degrees {x, y, z}; the normal is obtained by rotating the vector (0,1,0).
- The fields offsetRotationGlobal and offsetNormal are deprecated: they trigger a migration error message in the log but are still applied. A directly provided normal also logs a migration message.
- If addMirror returns a negative id, the entry is ignored.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_sections_mirror.process(objID, vehicleObj, vehicle)` | Creates and configures the mirrors declared in vehicle.mirrors. *(internal)* | 11 |

### Parameter details

#### `jbeam_sections_mirror.process(objID, vehicleObj, vehicle)`

Creates and configures the mirrors declared in vehicle.mirrors.

- `objID` (*integer*) : Vehicle identifier (unused).
- `vehicleObj` (*userdata*) : Engine vehicle object (addMirror, getMirror).
- `vehicle` (*table*) : Jbeam data (mirrors section).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/sections/mirror.lua`.*
