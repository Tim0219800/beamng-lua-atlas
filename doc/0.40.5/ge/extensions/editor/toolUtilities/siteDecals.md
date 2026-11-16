# `editor_toolUtilities_siteDecals`

*File: `lua/ge/extensions/editor/toolUtilities/siteDecals.lua` · VM: Game Engine (GE) · 144 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_siteDecals`: `extensions.load("editor_toolUtilities_siteDecals")`, then the global `editor_toolUtilities_siteDecals`

Stamped decals as a site carries them: traffic arrows, painted EXIT text, asphalt repair patches. They are glyphs taken from a sheet (atlas) and placed at a point, oriented in a direction, and not paint traced along a line (which is what distinguishes them from siteMarks). The module creates the DecalData (templates), places the instances via the editor, converts them to/from the manifest format and makes them persistent.

## Notes

- A decal record (plan): { mat, rows, cols, prio, tplSize (template size), x, y, a (angle in radians), size, frame (atlas cell), lift (elevation in m) }.
- The templates are named "SiteDecal_<tag>_<n>" per site, because burning a site makes its own templates persistent and must not do the same for a neighbor's.
- localise rounds the coordinates to the millimeter and writes the orientation as an angle, so that rotating the site is one addition per decal.
- The instances are created by editor.addDecalInstanceWithTan with the normal pointing up, the terrain z obtained by terrainZ(x, y) + lift. The last two arguments of the call (3, 1) are constants in the code.
- The decals are removed by editor.deleteDecalInstance; commit marks the templates "dirty" in decalPersistMan so that they survive the level save.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_siteDecals.build(plan, tag, terrainZ)` | Stamps a whole plan at once, creating the required templates. tag distinguishes these templates from those of other sites. Returns the instances and the template identifiers, two things to clean up differently: an instance goes with the site, a template is shared by all the site's decals. | 90 |
| `editor_toolUtilities_siteDecals.commit(tplIds)` | Gives the templates to the level, which makes the decals placed from them survive the save: the persistence manager keeps the instances against their template, so marking the few templates "dirty" writes all the decals. No effect if decalPersistMan does not exist. | 119 |
| `editor_toolUtilities_siteDecals.emit(tpl, rec, terrainZ)` | Places a decal from its record: position (x, y) at terrain height plus lift, normal pointing up, tangent directed according to angle a. | 36 |
| `editor_toolUtilities_siteDecals.facing(tx, ty)` | Heading angle of a decal (atan2(ty, tx)) from the direction vector a builder already has. | 130 |
| `editor_toolUtilities_siteDecals.localise(plan, ox, oy)` | Converts a decal plan to the manifest format, local to the bake origin (ox, oy). Grouped by template (same mat, rows, cols, prio). Returns nil if the plan is empty. | 49 |
| `editor_toolUtilities_siteDecals.place(rec, px, py, yaw, ox, oy)` | The inverse of localise: the manifest's decals as a plan, placed where a placement is and rotated to its heading. (ox, oy) is the point of the site's frame around which the placement rotates. | 69 |
| `editor_toolUtilities_siteDecals.remove(objs)` | Removes placed decals (editor.deleteDecalInstance). | 110 |
| `editor_toolUtilities_siteDecals.template(name, spec)` | Gets or creates the DecalData of a decal group, named after the site that stands it up. Fields set: material, frame, texRows, texCols, size, renderPriority (default 5). | 20 |

### Parameter details

#### `editor_toolUtilities_siteDecals.build(plan, tag, terrainZ)`

Stamps a whole plan at once, creating the required templates. tag distinguishes these templates from those of other sites. Returns the instances and the template identifiers, two things to clean up differently: an instance goes with the site, a template is shared by all the site's decals.

- `plan` (*table|nil*) : List of decal records.
- `tag` (*string*) : Site label.
- `terrainZ` (*function*) : terrainZ(x, y) returns the terrain height.
- **returns**: table Decal instances.
- **returns**: integer[] Identifiers of the DecalData templates created.

#### `editor_toolUtilities_siteDecals.commit(tplIds)`

Gives the templates to the level, which makes the decals placed from them survive the save: the persistence manager keeps the instances against their template, so marking the few templates "dirty" writes all the decals. No effect if decalPersistMan does not exist.

- `tplIds` (*integer[]|nil*) : Template identifiers returned by build.

#### `editor_toolUtilities_siteDecals.emit(tpl, rec, terrainZ)`

Places a decal from its record: position (x, y) at terrain height plus lift, normal pointing up, tangent directed according to angle a.

- `tpl` (*userdata*) : DecalData template.
- `rec` (*table*) : { x, y, a, size, frame, lift }.
- `terrainZ` (*function*) : terrainZ(x, y) returns the terrain height.
- **returns**: any Decal instance returned by editor.addDecalInstanceWithTan.

#### `editor_toolUtilities_siteDecals.facing(tx, ty)`

Heading angle of a decal (atan2(ty, tx)) from the direction vector a builder already has.

- `tx` (*number*) : x component of the direction.
- `ty` (*number*) : y component of the direction.
- **returns**: number Angle in radians.

#### `editor_toolUtilities_siteDecals.localise(plan, ox, oy)`

Converts a decal plan to the manifest format, local to the bake origin (ox, oy). Grouped by template (same mat, rows, cols, prio). Returns nil if the plan is empty.

- `plan` (*table|nil*) : List of decal records.
- `ox` (*number*) : x of the bake origin.
- `oy` (*number*) : y of the bake origin.
- **returns**: table|nil { tpls = { {mat, rows, cols, prio, size}, ... }, items = { {t, x, y, a, size, frame, lift}, ... } }.

#### `editor_toolUtilities_siteDecals.place(rec, px, py, yaw, ox, oy)`

The inverse of localise: the manifest's decals as a plan, placed where a placement is and rotated to its heading. (ox, oy) is the point of the site's frame around which the placement rotates.

- `rec` (*table|nil*) : Manifest record { tpls, items }.
- `px` (*number*) : x of the placement.
- `py` (*number*) : y of the placement.
- `yaw` (*number|nil*) : Heading in radians (default 0).
- `ox` (*number|nil*) : x of the pivot in the site's frame (default 0).
- `oy` (*number|nil*) : y of the pivot (default 0).
- **returns**: table|nil Decal plan in world coordinates, or nil if empty.

#### `editor_toolUtilities_siteDecals.remove(objs)`

Removes placed decals (editor.deleteDecalInstance).

- `objs` (*table|nil*) : Instances returned by build.

#### `editor_toolUtilities_siteDecals.template(name, spec)`

Gets or creates the DecalData of a decal group, named after the site that stands it up. Fields set: material, frame, texRows, texCols, size, renderPriority (default 5).

- `name` (*string*) : Object name of the template.
- `spec` (*table*) : { mat, frame, rows, cols, size, prio }.
- **returns**: userdata|nil DecalData object, or nil if creation fails.

## Calls into the engine (C++)

- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/siteDecals.lua`.*
