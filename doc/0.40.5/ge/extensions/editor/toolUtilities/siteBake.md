# `editor_toolUtilities_siteBake`

*File: `lua/ge/extensions/editor/toolUtilities/siteBake.lua` · VM: Game Engine (GE) · 289 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_siteBake`: `extensions.load("editor_toolUtilities_siteBake")`, then the global `editor_toolUtilities_siteBake`

Transforms what an editor has just built in the world into what a site manifest carries. A site is designed at one place on the map and placed elsewhere: all bakes therefore subtract their origin (ox, oy, oz) from everything before writing (geometry, kit transforms, lamps, plantings, ground plan). The chosen origin matters little to the placer (it realigns on the bounds read) but must be the SAME for all lists of a manifest. Plan coordinates are rounded to the millimeter.

## Notes

- A ground "plan" is made of {x,y} polygons or polylines; a terraform "feature" is either a graded QUAD (4 corners with their heights), or RINGS at a common height; default mode 'carve'.
- The feature rings come out flat (a single z per feature); the reader must rebuild them as vec3.
- groupInstances groups by shape + color (glow) + street flag (piece placed on the sidewalk) + stand (post on the ground line, height stretched by the placer). Each instance takes 12 numbers in xf: position (3), forward axis (3), up axis (3), scale (3).
- Lamps come out { x, y, z, r (radius), b (brightness), col, street } and, for a spotlight, dir and cone.
- localPaint requires extensions.editor_terrainEditor.getTerrainBlock() to exist, and names the paint layers by name (an index is only valid for a single terrain).
- Plants travel as anchors (items already scattered, or points + species + an already computed seed) because the forest belongs to the level and not to the site.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_siteBake.bounds(parts, instances, ox, oy, oz)` | The extent of everything the bake places (part vertices and instance positions, relative to the origin), so that the placer can frame a site, pick it under the cursor and know the room it needs before loading a mesh. Returns two null corners if nothing. | 253 |
| `editor_toolUtilities_siteBake.groupInstances(instances, ox, oy, oz)` | Groups the kit's placements by shape. One group per distinct mesh becomes a single instanced draw on arrival: a square with two hundred identical bollards costs one shape and two hundred transforms. | 109 |
| `editor_toolUtilities_siteBake.harvestKit(list, out)` | Rereads the frames of kit pieces already placed in the scene and adds them to out as instance records accepted by groupInstances. Accepts either kit entries (obj field) or the objects themselves; vanished objects or those without shapeName are skipped; the night glow (nightEmissive) is reread. | 153 |
| `editor_toolUtilities_siteBake.instanceCount(groups)` | Number of pieces that a list of groups stands up (size of xf divided by 12), for display before writing. | 183 |
| `editor_toolUtilities_siteBake.localFeatures(features, ox, oy, oz)` | The shapes the site asks the ground to be carved to, in its frame. Each feature becomes { quad = 4 corners {local x,y,z}, mode, band } or { rings, z, mode, band }. Ignores what the feature is used for (landing, ramp, retaining wall). | 59 |
| `editor_toolUtilities_siteBake.localLamps(lights, ox, oy, oz)` | The lamps that accompany the pieces, in the site's frame. The color comes from glow or col (white by default). A spotlight (dx present) comes out with dir and cone; a bulb does not. | 190 |
| `editor_toolUtilities_siteBake.localPaint(coats, ox, oy)` | The terrain paint a site lays, in its frame. Each layer { m, ring } or { m, xs, ys } (cell by cell) comes out named by terrain material layer. | 87 |
| `editor_toolUtilities_siteBake.localPlants(anchors, ox, oy, oz)` | Planting as anchors: { items } for already scattered plants (x, y, sp, s, a), or { points, species, speciesWeights, size, vary, seed, drape, street } for a scatter to redo (the seed is already computed, to obtain the same plants at the same places). | 211 |
| `editor_toolUtilities_siteBake.localPts(pts, ox, oy)` | A polyline in the same way (no minimum number of points). Also used for unit normals with a null origin. | 34 |
| `editor_toolUtilities_siteBake.localRing(ring, ox, oy)` | A plan polygon, local to the bake origin, rounded to the millimeter. Returns nil if fewer than 3 points, so that a caller can collect the return directly into a list. | 26 |
| `editor_toolUtilities_siteBake.localRings(rings, ox, oy)` | A list of local rings; nil if none was a polygon (a key absent from the manifest means "this site has none"). | 42 |
| `editor_toolUtilities_siteBake.plantCount(anchors)` | Number of plants that a bake would carry, over all anchors (items or points). For display only. | 242 |

### Parameter details

#### `editor_toolUtilities_siteBake.bounds(parts, instances, ox, oy, oz)`

The extent of everything the bake places (part vertices and instance positions, relative to the origin), so that the placer can frame a site, pick it under the cursor and know the room it needs before loading a mesh. Returns two null corners if nothing.

- `parts` (*table|nil*) : Mesh parts with verts.
- `instances` (*table|nil*) : Instances with px, py, pz.
- `ox` (*number*) : x of the origin.
- `oy` (*number*) : y of the origin.
- `oz` (*number*) : z of the origin.
- **returns**: table Minimum corner {x,y,z}.
- **returns**: table Maximum corner {x,y,z}.

#### `editor_toolUtilities_siteBake.groupInstances(instances, ox, oy, oz)`

Groups the kit's placements by shape. One group per distinct mesh becomes a single instanced draw on arrival: a square with two hundred identical bollards costs one shape and two hundred transforms.

- `instances` (*table|nil*) : List of instances { shape, px, py, pz, ax, ay, az, ux, uy, uz, scl, glow, street, stand }.
- `ox` (*number*) : x of the origin.
- `oy` (*number*) : y of the origin.
- `oz` (*number*) : z of the origin.
- **returns**: table List of groups { shape, xf (12 numbers per instance), glow, street, stand }.

#### `editor_toolUtilities_siteBake.harvestKit(list, out)`

Rereads the frames of kit pieces already placed in the scene and adds them to out as instance records accepted by groupInstances. Accepts either kit entries (obj field) or the objects themselves; vanished objects or those without shapeName are skipped; the night glow (nightEmissive) is reread.

- `list` (*table|nil*) : List of { obj } entries or scene objects.
- `out` (*table|nil*) : List to complete (created if nil).
- **returns**: table Records { shape, glow, px, py, pz, ax.., ux.., scl = {x,y,z} }.

#### `editor_toolUtilities_siteBake.instanceCount(groups)`

Number of pieces that a list of groups stands up (size of xf divided by 12), for display before writing.

- `groups` (*table|nil*) : Groups returned by groupInstances.
- **returns**: number Number of pieces.

#### `editor_toolUtilities_siteBake.localFeatures(features, ox, oy, oz)`

The shapes the site asks the ground to be carved to, in its frame. Each feature becomes { quad = 4 corners {local x,y,z}, mode, band } or { rings, z, mode, band }. Ignores what the feature is used for (landing, ramp, retaining wall).

- `features` (*table|nil*) : List of features { quad } or { rings, z }, with mode ('carve' by default) and band.
- `ox` (*number*) : x of the origin.
- `oy` (*number*) : y of the origin.
- `oz` (*number*) : z of the origin.
- **returns**: table|nil List of local features, nil if there are none.

#### `editor_toolUtilities_siteBake.localLamps(lights, ox, oy, oz)`

The lamps that accompany the pieces, in the site's frame. The color comes from glow or col (white by default). A spotlight (dx present) comes out with dir and cone; a bulb does not.

- `lights` (*table|nil*) : List of light records { px, py, pz, radius, brightness, glow|col, street, dx, dy, dz, cone }.
- `ox` (*number*) : x of the origin.
- `oy` (*number*) : y of the origin.
- `oz` (*number*) : z of the origin.
- **returns**: table|nil List of local lamps, nil if empty.

#### `editor_toolUtilities_siteBake.localPaint(coats, ox, oy)`

The terrain paint a site lays, in its frame. Each layer { m, ring } or { m, xs, ys } (cell by cell) comes out named by terrain material layer.

- `coats` (*table|nil*) : List of layers: m = material index, ring or xs/ys.
- `ox` (*number*) : x of the origin.
- `oy` (*number*) : y of the origin.
- **returns**: table|nil List { layer, ring } or { layer, cells = {x1,y1,x2,y2,...} }; nil if no terrain block or nothing to paint.

#### `editor_toolUtilities_siteBake.localPlants(anchors, ox, oy, oz)`

Planting as anchors: { items } for already scattered plants (x, y, sp, s, a), or { points, species, speciesWeights, size, vary, seed, drape, street } for a scatter to redo (the seed is already computed, to obtain the same plants at the same places).

- `anchors` (*table|nil*) : Editor anchors.
- `ox` (*number*) : x of the origin.
- `oy` (*number*) : y of the origin.
- `oz` (*number*) : z of the origin.
- **returns**: table|nil List of local anchors, nil if empty.

#### `editor_toolUtilities_siteBake.localPts(pts, ox, oy)`

A polyline in the same way (no minimum number of points). Also used for unit normals with a null origin.

- `pts` (*table|nil*) : List of {x,y} points.
- `ox` (*number*) : x of the origin.
- `oy` (*number*) : y of the origin.
- **returns**: table Local polyline.

#### `editor_toolUtilities_siteBake.localRing(ring, ox, oy)`

A plan polygon, local to the bake origin, rounded to the millimeter. Returns nil if fewer than 3 points, so that a caller can collect the return directly into a list.

- `ring` (*table|nil*) : List of {x,y} points.
- `ox` (*number*) : x of the origin.
- `oy` (*number*) : y of the origin.
- **returns**: table|nil Local ring.

#### `editor_toolUtilities_siteBake.localRings(rings, ox, oy)`

A list of local rings; nil if none was a polygon (a key absent from the manifest means "this site has none").

- `rings` (*table|nil*) : List of rings.
- `ox` (*number*) : x of the origin.
- `oy` (*number*) : y of the origin.
- **returns**: table|nil List of local rings.

#### `editor_toolUtilities_siteBake.plantCount(anchors)`

Number of plants that a bake would carry, over all anchors (items or points). For display only.

- `anchors` (*table|nil*) : Planting anchors.
- **returns**: integer Number of plants.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/siteBake.lua`.*
