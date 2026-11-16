# `editor_toolUtilities_siteWater`

*File: `lua/ge/extensions/editor/toolUtilities/siteWater.lua` · VM: Game Engine (GE) · 438 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_siteWater`: `extensions.load("editor_toolUtilities_siteWater")`, then the global `editor_toolUtilities_siteWater`

Standing and falling water of a "site" (open space editor): waterfall basins, sheets that overflow between them, jets, sprays and foam jets (particle emitter BNGP_sprinkler). Water is not a mesh and therefore cannot be baked into a shell; the site manifest carries it as numbers and everything that assembles the site recreates the objects (WaterBlock, River, ParticleEmitterNode). Everything starts from a single record, expressed in the site's frame: an anchor point and an angle set the whole placement.

## Example

```lua
local sw = extensions.editor_toolUtilities_siteWater
local rec = sw.localise(ca, ox, oy, oz)      -- to the manifest
local ca2 = sw.place(rec, px, py, pz, yaw, ox, oy) -- from the manifest
local ids, names = sw.build(ca2, folder, 'site1')
```

## Notes

- build() starts by calling remove(folder), so it rebuilds everything from scratch.
- remove() sweeps by class (WaterBlock, River, ParticleEmitterNode) rather than by id list, because undo restores a document whose ids may refer to deleted objects.
- A sheet (fall) starts from each of the 8 edges of a basin's rim (4 flat and 4 cut corners); the number of sprays is capped at 8 per edge.
- The flow, sprayPow and sprayVar values are clamped to 0..1 in build; flow is 0.55 by default, sprayPow and sprayVar 0.5.
- The altitudes (z, jetZ, spoutZ, zTop, zBot) are relative to oz/pz in the manifest and absolute in the editor record.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_siteWater.build(ca, folder, tag)` | Floods what the point of interest has placed (basins), then attaches a sheet to each face of each basin that overflows, with foam sprays, then the crowns (jets and weirs). Empties the folder first. | 305 |
| `editor_toolUtilities_siteWater.commit(ids)` | Makes each object persistent (canSave and cansave set to true) and returns their names, which is used to undo a burn. | 338 |
| `editor_toolUtilities_siteWater.localise(ca, ox, oy, oz)` | Produces the manifest record, in the site's frame: only what build reads (basins, crowns, sheets, flow, sprays). Positions relative to (ox, oy, oz), basins and crowns relative to the anchor. | 356 |
| `editor_toolUtilities_siteWater.place(rec, px, py, pz, yaw, ox, oy)` | Inverse operation: places a manifest record at a position and heading, ready for build. The anchor rotates around the placement and the angle is added to its own. (ox, oy) is the point of the site's frame around which the placement rotates (the middle of the footprint). | 391 |
| `editor_toolUtilities_siteWater.remove(folder)` | Removes everything wet under a folder: objects of the WaterBlock, River and ParticleEmitterNode classes. | 293 |

### Parameter details

#### `editor_toolUtilities_siteWater.build(ca, folder, tag)`

Floods what the point of interest has placed (basins), then attaches a sheet to each face of each basin that overflows, with foam sprays, then the crowns (jets and weirs). Empties the folder first.

- `ca` (*table|nil*) : Editor record: pools, falls, crowns, flow, sprayPow, sprayVar, spraySeed.
- `folder` (*userdata|nil*) : Scene folder (SimGroup) that receives the objects.
- `tag` (*string|nil*) : Name of the site that assembles the water, so that two identical sites on a map do not have the same object names (default 'site').
- **returns**: table|nil Ids of the created objects (nil if no basins or no folder).
- **returns**: table|nil Names of the created objects.

#### `editor_toolUtilities_siteWater.commit(ids)`

Makes each object persistent (canSave and cansave set to true) and returns their names, which is used to undo a burn.

- `ids` (*table|nil*) : Ids returned by build.
- **returns**: table<integer, string> Names of the objects found and named.

#### `editor_toolUtilities_siteWater.localise(ca, ox, oy, oz)`

Produces the manifest record, in the site's frame: only what build reads (basins, crowns, sheets, flow, sprays). Positions relative to (ox, oy, oz), basins and crowns relative to the anchor.

- `ca` (*table|nil*) : Editor record (must have non-empty pools).
- `ox` (*number*) : X of the site origin.
- `oy` (*number*) : Y of the site origin.
- `oz` (*number*) : Z of the site origin.
- **returns**: table|nil Manifest record, nil if there is no basin.

#### `editor_toolUtilities_siteWater.place(rec, px, py, pz, yaw, ox, oy)`

Inverse operation: places a manifest record at a position and heading, ready for build. The anchor rotates around the placement and the angle is added to its own. (ox, oy) is the point of the site's frame around which the placement rotates (the middle of the footprint).

- `rec` (*table|nil*) : Manifest record (with pools).
- `px` (*number*) : World X of the placement.
- `py` (*number*) : World Y of the placement.
- `pz` (*number*) : Base world Z.
- `yaw` (*number|nil*) : Heading in radians (0 by default).
- `ox` (*number|nil*) : X of the pivot point in the site's frame (0 by default).
- `oy` (*number|nil*) : Y of the pivot point in the site's frame (0 by default).
- **returns**: table|nil World record, with ct and sn (cosine and sine of the heading); nil if rec is invalid.

#### `editor_toolUtilities_siteWater.remove(folder)`

Removes everything wet under a folder: objects of the WaterBlock, River and ParticleEmitterNode classes.

- `folder` (*userdata|nil*) : Scene folder; no effect if nil.

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/siteWater.lua`.*
