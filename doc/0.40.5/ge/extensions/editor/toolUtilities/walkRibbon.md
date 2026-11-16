# `editor_toolUtilities_walkRibbon`

*File: `lua/ge/extensions/editor/toolUtilities/walkRibbon.lua` · VM: Game Engine (GE) · 335 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_walkRibbon`: `extensions.load("editor_toolUtilities_walkRibbon")`, then the global `editor_toolUtilities_walkRibbon`

Generates a bordered sidewalk (curb and slabs) swept along two rails, as a single unique mesh, for the editor's road tools. The mesh parts are grouped by material (two sidewalks of the same stone share one mesh, so a single draw). Also handles curbs lowered at crosswalks: the sidewalk becomes flush over the crossing area and ramps back up on each side. Uses meshPart (face4, face4n) and kerbSpec (curb materials and dimensions).

## Example

```lua
local wr = require('editor/toolUtilities/walkRibbon')
local inner2, outer2, scale = wr.crossingDips(road.crossings, road.divPoints, inner, outer)
local tris = wr.build(inner2, outer2, { parts = parts, scale = scale, paving = 'slab_mat', uvs = 1.0 })
```

## Notes

- Constants: 1.5 m ramp (crossingRampM), 3.5 m flat part (crossingDepthM) when the crossing gives no indication, resampling every 0.4 m in the area of a crossing.
- Without densification, a coarse rail may have no station in the crossing's band and the sidewalk would stay full height: this is why crossingDips re-cuts the segments.
- build returns 0 if there are fewer than 2 common stations or if opts.parts is absent.
- The rails are lists of points { x, y, z } of the same length: the curb line on the road side (inner) and the bottom of the paving (outer).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_walkRibbon.build(inner, outer, opts)` | Sweeps the sidewalk between two matching rails: the curb line on the road and the bottom of the paving. Adds faces to opts.parts (one mesh per material). The options: parts (required, list of parts), paving (slab material, default that of kerbSpec), variant (curb variant), caps (close the ends, true by default), scale (curb height per station, 0 = curb removed), uvs (number of slabs per meter), worldUv (lay the paving from world x,y), uRail (rail on which to measure the lengthwise UVs), bury (buried depth), back (false to not close the bottom). | 73 |
| `editor_toolUtilities_walkRibbon.crossingDips(crossings, div, inner, outer)` | Densifies inner/outer in the band of each crosswalk (about every 0.4 m) and returns the densified rails with the per-station lowering multiplier. Crosswalk centers are projected onto the rail from the position t along the centerline. Returns the ORIGINAL rails and nil if the road has no crosswalk or centerline. | 261 |
| `editor_toolUtilities_walkRibbon.dropScale(cum, centres, depths)` | Curb height multiplier per station for a sidewalk crossed by crosswalks: 0 (flush) on each crosswalk, ramp on either side, 1 elsewhere. `cum`, `centres` and `depths` are arc-length abscissas along the rail. nil if no crosswalk reaches the sidewalk. | 190 |
| `editor_toolUtilities_walkRibbon.rise()` | Height of the walking surface above the road on which the inner rail rests (kerbH from kerbSpec). | 320 |
| `editor_toolUtilities_walkRibbon.width()` | Distance by which the outer rail must be offset from the inner one: the curb plus one slab (kerbW + slabW from kerbSpec). | 315 |

### Parameter details

#### `editor_toolUtilities_walkRibbon.build(inner, outer, opts)`

Sweeps the sidewalk between two matching rails: the curb line on the road and the bottom of the paving. Adds faces to opts.parts (one mesh per material). The options: parts (required, list of parts), paving (slab material, default that of kerbSpec), variant (curb variant), caps (close the ends, true by default), scale (curb height per station, 0 = curb removed), uvs (number of slabs per meter), worldUv (lay the paving from world x,y), uRail (rail on which to measure the lengthwise UVs), bury (buried depth), back (false to not close the bottom).

- `inner` (*table*) : Inner rail, list of { x, y, z } (curb line).
- `outer` (*table*) : Outer rail, list of { x, y, z } (bottom of the paving).
- `opts` (*table*) : Options described above; opts.parts required.
- **returns**: integer Number of triangles written (0 if nothing).

#### `editor_toolUtilities_walkRibbon.crossingDips(crossings, div, inner, outer)`

Densifies inner/outer in the band of each crosswalk (about every 0.4 m) and returns the densified rails with the per-station lowering multiplier. Crosswalk centers are projected onto the rail from the position t along the centerline. Returns the ORIGINAL rails and nil if the road has no crosswalk or centerline.

- `crossings` (*table|nil*) : Crosswalks of the road, list of { t (0..1, 0.5 by default), depthM }.
- `div` (*table*) : Centerline of the road (list of points).
- `inner` (*table*) : Inner rail.
- `outer` (*table*) : Outer rail.
- **returns**: table Inner rail (densified or original).
- **returns**: table Outer rail.
- **returns**: number[]|nil Multiplier per station, nil if there is no crosswalk.

#### `editor_toolUtilities_walkRibbon.dropScale(cum, centres, depths)`

Curb height multiplier per station for a sidewalk crossed by crosswalks: 0 (flush) on each crosswalk, ramp on either side, 1 elsewhere. `cum`, `centres` and `depths` are arc-length abscissas along the rail. nil if no crosswalk reaches the sidewalk.

- `cum` (*number[]*) : Cumulative arc-length abscissa of each station.
- `centres` (*number[]*) : Abscissa of the center of each crosswalk.
- `depths` (*number[]|nil*) : Depth (m) of each crosswalk; 3.5 by default.
- **returns**: number[]|nil One multiplier per station between 0 and 1.

#### `editor_toolUtilities_walkRibbon.rise()`

Height of the walking surface above the road on which the inner rail rests (kerbH from kerbSpec).

- **returns**: number Height in meters.

#### `editor_toolUtilities_walkRibbon.width()`

Distance by which the outer rail must be offset from the inner one: the curb plus one slab (kerbW + slabW from kerbSpec).

- **returns**: number Width in meters.

## Fields

| Field | Type | Description |
|---|---|---|
| `crossingDepthM` | number | Default length of the flat part when the crossing gives no indication (3.5 m). |
| `crossingRampM` | number | Length of the ramp on each side of a lowered crossing (1.5 m). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/walkRibbon.lua`.*
