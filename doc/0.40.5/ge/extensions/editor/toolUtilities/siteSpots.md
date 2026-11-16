# `editor_toolUtilities_siteSpots`

*File: `lua/ge/extensions/editor/toolUtilities/siteSpots.lua` · VM: Game Engine (GE) · 162 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_siteSpots`: `extensions.load("editor_toolUtilities_siteSpots")`, then the global `editor_toolUtilities_siteSpots`

Parking spaces as a site carries them and as the level rereads them in its sites file. A space is neither geometry nor paint: it is a box the game looks for when it wants to park a car. It therefore does not go into a shell, but into the level's city.sites.json (parkingSpots field), the only output of a site bake that is not a file of its own. It waits for the "burn": baked locally and written at that time, the copies of a parking lot each have their spaces at their place and at their height.

## Notes

- Baked space: { x, y, yaw, w (width of a space), d (depth), n (number of spaces in the run, absent for a single space), dir ('Left' if the run advances to the left) }. Only the position is recentered; the heading stays, place adds that of the placement to it.
- A run of identical spaces side by side is written as ONE multi-space (isMultiSpot, spotAmount = n, spotOffset = 0 because the spaces are joined edge to edge, spotDirection 'Right' by default) like the spaces of hand-made cities.
- SPOT_H = 3: height of the box; the position is on the ground and the box extends half a height on each side.
- The file is <level folder>/city.sites.json (getMissionFilename). If absent or unreadable, an empty sites file is created in memory { name = 'sites', description, locations, zones, parkingSpots }.
- write appends instead of replacing: names prefix + number (skipping those already taken) and oldId beyond the largest existing one, so that two burns and a hand-made space coexist.
- write returns nil without a space to write or without a loaded level (sitesPath nil).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_siteSpots.localise(list, ox, oy)` | The spaces computed by a site's solver, local to the bake origin. Each space enters in the form { x, y, yaw, w, d, n, dir } and comes out rounded to the millimeter, n and dir omitted for a simple right-hand space. Returns nil if the list is empty. | 38 |
| `editor_toolUtilities_siteSpots.place(rec, px, py, yaw, ox, oy, groundZ)` | The inverse: the manifest's spaces as parkingSpot records (pos, rot, scl = {width, depth, SPOT_H}, isMultiSpot, spotAmount, spotOffset, spotDirection, spotRotation, color, customFields), placed where a placement is and rotated to its heading. (ox, oy) is the site's pivot (middle of its footprint). groundZ(x, y) gives the ground height, because a space rests on the ground where it is and not on the placement's frame. No name here: they must be unique across the whole level file and are assigned by write. | 62 |
| `editor_toolUtilities_siteSpots.restore(undo)` | Undoes a write: puts the parkingSpots array back exactly as it was. | 145 |
| `editor_toolUtilities_siteSpots.write(spots, prefix)` | Adds spaces to the level's sites file, under names starting with prefix, keeping what exists. Writes the file with jsonWriteFile. | 108 |

### Parameter details

#### `editor_toolUtilities_siteSpots.localise(list, ox, oy)`

The spaces computed by a site's solver, local to the bake origin. Each space enters in the form { x, y, yaw, w, d, n, dir } and comes out rounded to the millimeter, n and dir omitted for a simple right-hand space. Returns nil if the list is empty.

- `list` (*table|nil*) : List of spaces { x, y, yaw, w, d, n, dir }.
- `ox` (*number|nil*) : x of the origin (default 0).
- `oy` (*number|nil*) : y of the origin (default 0).
- **returns**: table|nil List of local spaces.

#### `editor_toolUtilities_siteSpots.place(rec, px, py, yaw, ox, oy, groundZ)`

The inverse: the manifest's spaces as parkingSpot records (pos, rot, scl = {width, depth, SPOT_H}, isMultiSpot, spotAmount, spotOffset, spotDirection, spotRotation, color, customFields), placed where a placement is and rotated to its heading. (ox, oy) is the site's pivot (middle of its footprint). groundZ(x, y) gives the ground height, because a space rests on the ground where it is and not on the placement's frame. No name here: they must be unique across the whole level file and are assigned by write.

- `rec` (*table|nil*) : Manifest spaces.
- `px` (*number*) : x of the placement.
- `py` (*number*) : y of the placement.
- `yaw` (*number|nil*) : Heading in radians (default 0).
- `ox` (*number|nil*) : x of the pivot (default 0).
- `oy` (*number|nil*) : y of the pivot (default 0).
- `groundZ` (*function|nil*) : groundZ(x, y) returns the ground height (0 if absent).
- **returns**: table|nil List of parkingSpot records, nil if empty.

#### `editor_toolUtilities_siteSpots.restore(undo)`

Undoes a write: puts the parkingSpots array back exactly as it was.

- `undo` (*table|nil*) : Table returned by write.

#### `editor_toolUtilities_siteSpots.write(spots, prefix)`

Adds spaces to the level's sites file, under names starting with prefix, keeping what exists. Writes the file with jsonWriteFile.

- `spots` (*table|nil*) : parkingSpot records returned by place; their name and oldId are filled in by this call.
- `prefix` (*string*) : Prefix of the space names.
- **returns**: table|nil { path, prev }: what is needed to undo (the array as it was), or nil if there was nothing to add.

## Fields

| Field | Type | Description |
|---|---|---|
| `SPOT_H` | number | Height of a space's box, in meters (3). |

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/siteSpots.lua`.*
