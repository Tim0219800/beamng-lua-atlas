# `editor_toolUtilities_siteMarks`

*File: `lua/ge/extensions/editor/toolUtilities/siteMarks.lua` · VM: Game Engine (GE) · 161 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_siteMarks`: `extensions.load("editor_toolUtilities_siteMarks")`, then the global `editor_toolUtilities_siteMarks`

Road markings as a site carries them: parking space lines, hatching, give-way bars, aisle centerlines, tire wear tracks, cracks and zebra crossings. Each is a DecalRoad, that is, paint laid ON the ground and not geometry: nothing goes into a shell, so a baked parking lot carries what needs painting and repaints it where it is placed (same arrangement as for water). The module creates the DecalRoads, converts the plan to/from the manifest format and puts them back into the level.

## Notes

- Mark record (plan): { pts = {{x,y},...} (at least 2), mat, texLen, prio, lift, over, width (number or per-node list, for a tapering track), closed, fade = {start, end}, z (height of a slab) }.
- The DecalRoads are created with canSave = false and improvedSpline = true, drivability = -1; commit makes them saveable (canSave and cansave set to true): they are then in the level and the tool must no longer delete them.
- localise groups by style (mat, texLen, prio, lift, width, over, z): a batch paints a thousand marks in about four styles, hence one index per run instead of five fields. The points come out flat { x1, y1, x2, y2, ... } rounded to the millimeter.
- The z of a mark placed on a slab is relative to oz in the manifest and to pz in place.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_siteMarks.build(plan, folder, terrainZ)` | Paints a whole plan at once. Returns the objects created, so that the requester can put them back into the level or remove them. Empty list if plan or folder is missing. | 54 |
| `editor_toolUtilities_siteMarks.commit(objs)` | Puts the marks back into the level. Painted by the tool, they belonged to nothing and were not written; from then on they are the level's and the tool must no longer delete them. | 66 |
| `editor_toolUtilities_siteMarks.emit(folder, rec, terrainZ)` | Creates a DecalRoad from its record and adds it to folder. Each node is at terrain height (or rec.z for a mark on a slab) plus lift; if closed, the first point is added again at the end. Returns nil if there are fewer than 2 points or if creation fails. | 20 |
| `editor_toolUtilities_siteMarks.localise(plan, ox, oy, oz)` | The plan as a manifest carries it, local to the bake origin. Returns { styles, runs } or nil if nothing. Each run: { s = style index, pts = flat, closed, fade, w (per-node widths) }. | 82 |
| `editor_toolUtilities_siteMarks.place(rec, px, py, yaw, ox, oy, pz)` | The inverse: the manifest's marks as a plan, placed where a placement is and rotated to its heading. (ox, oy) is the point of the site's frame around which the placement rotates (the middle of its footprint, not the bake origin in a corner). pz is the placement height, useful only for marks placed on one of its own slabs. | 129 |

### Parameter details

#### `editor_toolUtilities_siteMarks.build(plan, folder, terrainZ)`

Paints a whole plan at once. Returns the objects created, so that the requester can put them back into the level or remove them. Empty list if plan or folder is missing.

- `plan` (*table|nil*) : List of mark records.
- `folder` (*userdata|nil*) : Parent scene group.
- `terrainZ` (*function*) : terrainZ(x, y) returns the terrain height.
- **returns**: table List of created DecalRoads.

#### `editor_toolUtilities_siteMarks.commit(objs)`

Puts the marks back into the level. Painted by the tool, they belonged to nothing and were not written; from then on they are the level's and the tool must no longer delete them.

- `objs` (*table|nil*) : DecalRoads returned by build.

#### `editor_toolUtilities_siteMarks.emit(folder, rec, terrainZ)`

Creates a DecalRoad from its record and adds it to folder. Each node is at terrain height (or rec.z for a mark on a slab) plus lift; if closed, the first point is added again at the end. Returns nil if there are fewer than 2 points or if creation fails.

- `folder` (*userdata*) : Parent scene group.
- `rec` (*table*) : Mark record.
- `terrainZ` (*function*) : terrainZ(x, y) returns the terrain height.
- **returns**: userdata|nil DecalRoad object.

#### `editor_toolUtilities_siteMarks.localise(plan, ox, oy, oz)`

The plan as a manifest carries it, local to the bake origin. Returns { styles, runs } or nil if nothing. Each run: { s = style index, pts = flat, closed, fade, w (per-node widths) }.

- `plan` (*table|nil*) : List of mark records.
- `ox` (*number*) : x of the origin.
- `oy` (*number*) : y of the origin.
- `oz` (*number|nil*) : z of the origin (for marks on a slab).
- **returns**: table|nil { styles = {...}, runs = {...} }.

#### `editor_toolUtilities_siteMarks.place(rec, px, py, yaw, ox, oy, pz)`

The inverse: the manifest's marks as a plan, placed where a placement is and rotated to its heading. (ox, oy) is the point of the site's frame around which the placement rotates (the middle of its footprint, not the bake origin in a corner). pz is the placement height, useful only for marks placed on one of its own slabs.

- `rec` (*table|nil*) : Manifest record { styles, runs }.
- `px` (*number*) : x of the placement.
- `py` (*number*) : y of the placement.
- `yaw` (*number|nil*) : Heading in radians (default 0).
- `ox` (*number|nil*) : x of the pivot (default 0).
- `oy` (*number|nil*) : y of the pivot (default 0).
- `pz` (*number|nil*) : Placement height (default 0).
- **returns**: table|nil Mark plan in world coordinates, nil if empty.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/siteMarks.lua`.*
