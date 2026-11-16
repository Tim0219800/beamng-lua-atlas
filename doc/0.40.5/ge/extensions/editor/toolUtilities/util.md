# `editor_toolUtilities_util`

*File: `lua/ge/extensions/editor/toolUtilities/util.lua` · VM: Game Engine (GE) · 840 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_util`: `extensions.load("editor_toolUtilities_util")`, then the global `editor_toolUtilities_util`

Toolbox common to the editor's spline and "site" tools: mouse and raycasts (position on the map, on the terrain, on a plane), conversions and colors, level cleanup, unique names, undo (commitStep), terrain material names, polyline and spline computations (length, width, spacing, reversal, camera framing), ribbon building (mesh, GLTF), spline sources for terraforming, bitmaps (flipping, debug PNG export) and ImGui sub-tabs. Default constants: min and max width 10 m, fixed-width tolerance 0.01, max camera ray distance 5000 m.

## Example

```lua
local util = require('editor/toolUtilities/util')
local p = util.mouseOnTerrainPos()
local len = util.getPolyLength(points)
```

## Notes

- Units: msToKph and msToMph take m/s; distances are in meters.
- flipBitmapY is described as "in place" in the code but returns a NEW GBitmap (GFXFormatR16 format) without modifying the original.
- generateUniqueName requires prefixIn (it is concatenated without a check): a call without the second argument raises an error.
- buildRibbonGLTF converts BeamNG coordinates (x, y, z) to GLTF (x, z, -y) and packs positions as float and indices as uint16, so it is limited to 65536 vertices.
- In ribbon structures, a 'source' is a list of { pos, width, binormal }; width is the total width, the half-width is used on either side of the binormal.
- The site footprint grid (footSnap) has a 1 m step, aligned to the world.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_util.beginSubTab(label, flags)` | Opens an ImGui sub-tab (BeginTabItem) whose body is a child, so the tab row stays in place. Returns false if the tab is not open. | 768 |
| `editor_toolUtilities_util.buildRibbonGLTF(points, widths, binormals)` | Converts a ribbon polyline into GLTF JSON with an embedded binary buffer (float positions, uint16 indices), coordinates converted (x, z, -y). | 493 |
| `editor_toolUtilities_util.buildRibbonMeshFromPolyline(points, widths, binormals)` | Converts a ribbon polyline into a triangle mesh: two vertices per point (left and right, at half-width along the binormal), two triangles per segment. | 451 |
| `editor_toolUtilities_util.calculateAverageSpacingXY(positions, minSpacing)` | Estimates the average XY spacing between nodes by simulating a centripetal Catmull-Rom interpolation (10 samples per segment), without counting the mesh footprint. | 326 |
| `editor_toolUtilities_util.clearLevelContent()` | Brings a level back to bare terrain to build a scene from scratch. Deletes all objects of the DecalRoad, TSStatic, MeshRoad, ProceduralMesh, PointLight and SpotLight classes, as well as all forest INSTANCES; the ForestItemData datablocks stay (planting finds its species by name). Sets editor.forestDirty. | 119 |
| `editor_toolUtilities_util.commitStep(label, data, undoFn, redoFn)` | Records an undo step as a full transaction. A plain commitAction deep-copies the top step of the stack and the new one to look for a duplicate, which is prohibitive for a terraforming step of millions of heights; a transaction is recorded without this check. | 235 |
| `editor_toolUtilities_util.computeIdToIdxMap(splines, map)` | Fills `map` (emptied first) with spline.id -> index in the list. | 205 |
| `editor_toolUtilities_util.deepEqual(a, b)` | Deep equality of two values. Tests the type before == because comparing a vec3 to something else raises an error. | 212 |
| `editor_toolUtilities_util.doesPathContainNode(path, nodeKey)` | Looks for a node key in a path. | 358 |
| `editor_toolUtilities_util.endSubTab()` | Closes the sub-tab (EndChild then EndTabItem). No guard: EndChild must be called even if the child is clipped. | 775 |
| `editor_toolUtilities_util.fastArrayCopy(arr)` | Fast copy of a simple array (shallow copy). | 94 |
| `editor_toolUtilities_util.filterClosePointsXY(points, minDist)` | Removes consecutive points closer than minDist in the XY plane (keeps the first). | 301 |
| `editor_toolUtilities_util.findMaterialIdx(candidates)` | Index of the first terrain layer that carries one of the candidate names, case-insensitive. | 253 |
| `editor_toolUtilities_util.flipBitmapY(bmpIn)` | Flips a bitmap vertically: creates a new GFXFormatR16 GBitmap where each texel copies the value of the mirrored row. | 650 |
| `editor_toolUtilities_util.flipSplineDirection(spline)` | Reverses the direction of a spline (nodes, widths, nmls) and marks it isDirty. | 368 |
| `editor_toolUtilities_util.footSnap()` | Specification of the snapping grid for site footprints: { ox = 0, oy = 0, step = 1 }, aligned to the world and shared by the three site tools. | 431 |
| `editor_toolUtilities_util.footSnapped(x, y)` | Snaps a world x, y to this grid (1 m step). For points that a tool places itself: an off-grid starting shape becomes crooked as soon as a corner is dragged onto it. | 435 |
| `editor_toolUtilities_util.generateUniqueName(baseName, prefixIn)` | Generates a name that does not conflict with the scene tree: tests "prefix - name", then "prefix - name - 1", "- 2", etc. Returns the name part without the prefix. | 191 |
| `editor_toolUtilities_util.getAllSources(splines)` | Sources of all enabled (isEnabled) splines, one list per spline. | 610 |
| `editor_toolUtilities_util.getBlueToRedColour(value, minValue, maxValue)` | Color interpolated from blue (minValue) to red (maxValue), value clamped. | 164 |
| `editor_toolUtilities_util.getHueBasedColour255(t)` | Hue color for t clamped between 0 and 1: from 240 degrees (blue) to 0 (red), saturation and value at 1. | 188 |
| `editor_toolUtilities_util.getMaterialNames()` | Names of the terrain material layers (0-based index -> name), same source as roadNetwork. 'Material i' if a name is missing. | 243 |
| `editor_toolUtilities_util.getMeshBox(meshPath)` | Bounding box of a TSStatic shape: creates a temporary TSStatic ('temp_getMeshBox'), reads its object box, deletes it. | 145 |
| `editor_toolUtilities_util.getMinMaxWidth(spline)` | Minimum and maximum widths of a spline (spline.widths); 10 and 10 if there are none. | 277 |
| `editor_toolUtilities_util.getPolyLength(pts)` | Length of a polyline (sum of 3D distances). | 268 |
| `editor_toolUtilities_util.getSourcesSingle(spline)` | Sources of a spline for terraforming: a single list of { pos, width, binormal } over divPoints, with spline.terraWidth if defined in place of divWidths. | 596 |
| `editor_toolUtilities_util.goToSpline(points)` | Switches to the free camera and places the camera above the spline, looking down, according to splineFocus. | 408 |
| `editor_toolUtilities_util.hsvToRgb(h, s, v)` | Converts HSV to RGB, everything in [0,1] (h is one full turn = 1). | 630 |
| `editor_toolUtilities_util.hsvToRgb255(h, s, v)` | Converts HSV to RGB on 0-255 (h in degrees 0-360, s and v in 0-1). | 170 |
| `editor_toolUtilities_util.isMouseHoveringOverTerrain()` | True if the mouse is over the viewport (not over an ImGui element or window, nor the axes gizmo). | 41 |
| `editor_toolUtilities_util.isWidthFixed(nodes)` | True if the node width is fixed (difference less than 0.01). | 291 |
| `editor_toolUtilities_util.lookAtGround()` | The ground under the middle of the screen, in x, y (raycast from the camera). Used to place a new object in front of the user. Returns 0, 0 if the view is in the sky or off the map. | 418 |
| `editor_toolUtilities_util.mouseOnMapPos()` | Map position the mouse points at (castRayStatic, range 5000 m). With no hit, returns the last valid position, or failing that the ray point at maximum range. | 46 |
| `editor_toolUtilities_util.mouseOnPlaneZ(planeZ)` | Point where the mouse ray intersects the horizontal plane z = planeZ. | 61 |
| `editor_toolUtilities_util.mouseOnTerrainPos(seedZ)` | The GROUND under the mouse, placed on the terrain height grid rather than on some static geometry lying on the ray. Iterates 4 times, intersecting with the terrain height. | 71 |
| `editor_toolUtilities_util.msToKph(ms)` | Converts m/s to km/h (x 3.6). | 105 |
| `editor_toolUtilities_util.msToMph(ms)` | Converts m/s to mph (x 2.236936). | 103 |
| `editor_toolUtilities_util.splineFocus(points)` | Computes a top-down framing for a spline: middle of the 2D box and altitude such that everything fits in the field of view (distance / tan(fov/2) + zMax + 5). | 381 |
| `editor_toolUtilities_util.starterRing(w, d, zAt)` | A rectangle placed on the ground under the middle of the screen, oriented counter-clockwise, corners on the footprint grid. | 440 |
| `editor_toolUtilities_util.sumOverNonArrayTable(t)` | Sum of all the values of a non-array table. | 108 |
| `editor_toolUtilities_util.unchangedIds(a, b)` | Ids whose copies in two snapshots of the same items are identical: what an intermediate undo step did not touch. | 222 |
| `editor_toolUtilities_util.vertRaycast(pos, rayRaise, postFloat)` | Vertical downward raycast that modifies the point's Z in place: rises by rayRaise, shoots down, then comes back down onto the surface + postFloat so as not to sink in. | 85 |
| `editor_toolUtilities_util.writeMaskToPng(mask, path)` | Debug utility: writes a binary mask (rows of 0 or 1) as a 16-bit PNG (white if 1). | 665 |
| `editor_toolUtilities_util.writePathsToPng(paths, width, height, path)` | Writes vectorized paths as a 16-bit grayscale PNG, with a distinct intensity per path. | 689 |
| `editor_toolUtilities_util.writeWidthsToPng(paths, widths, width, height, outPath)` | Writes the paths as continuous thick strokes: a filled disc at each point, of radius max(1, floor(width/2)), white on a black background. | 724 |

### Parameter details

#### `editor_toolUtilities_util.beginSubTab(label, flags)`

Opens an ImGui sub-tab (BeginTabItem) whose body is a child, so the tab row stays in place. Returns false if the tab is not open.

- `label` (*string*) : Title.
- `flags` (*integer|nil*) : TabItemFlags flags.
- **returns**: boolean Tab open.

#### `editor_toolUtilities_util.buildRibbonGLTF(points, widths, binormals)`

Converts a ribbon polyline into GLTF JSON with an embedded binary buffer (float positions, uint16 indices), coordinates converted (x, z, -y).

- `points` (*vec3[]*) : Points.
- `widths` (*number[]*) : Widths.
- `binormals` (*vec3[]*) : Binormals.
- **returns**: table GLTF table.

#### `editor_toolUtilities_util.buildRibbonMeshFromPolyline(points, widths, binormals)`

Converts a ribbon polyline into a triangle mesh: two vertices per point (left and right, at half-width along the binormal), two triangles per segment.

- `points` (*vec3[]*) : Centerline points.
- `widths` (*number[]*) : Total width at each point.
- `binormals` (*vec3[]*) : Binormal at each point.
- **returns**: table { vertices = vec3[], indices = integer[] } (indices 1-based).

#### `editor_toolUtilities_util.calculateAverageSpacingXY(positions, minSpacing)`

Estimates the average XY spacing between nodes by simulating a centripetal Catmull-Rom interpolation (10 samples per segment), without counting the mesh footprint.

- `positions` (*vec3[]*) : Node positions.
- `minSpacing` (*number|nil*) : Floor of the spacing; also serves as the fallback value (1.0 by default) if there are fewer than 2 nodes.
- **returns**: number Average spacing (m).

#### `editor_toolUtilities_util.clearLevelContent()`

Brings a level back to bare terrain to build a scene from scratch. Deletes all objects of the DecalRoad, TSStatic, MeshRoad, ProceduralMesh, PointLight and SpotLight classes, as well as all forest INSTANCES; the ForestItemData datablocks stay (planting finds its species by name). Sets editor.forestDirty.

- **returns**: integer Number of scene objects deleted (excluding forest items).

#### `editor_toolUtilities_util.commitStep(label, data, undoFn, redoFn)`

Records an undo step as a full transaction. A plain commitAction deep-copies the top step of the stack and the new one to look for a duplicate, which is prohibitive for a terraforming step of millions of heights; a transaction is recorded without this check.

- `label` (*string*) : Label.
- `data` (*any*) : Step data.
- `undoFn` (*function*) : Undo callback.
- `redoFn` (*function*) : Redo callback.

#### `editor_toolUtilities_util.computeIdToIdxMap(splines, map)`

Fills `map` (emptied first) with spline.id -> index in the list.

- `splines` (*table*) : List of splines.
- `map` (*table*) : Output table.

#### `editor_toolUtilities_util.deepEqual(a, b)`

Deep equality of two values. Tests the type before == because comparing a vec3 to something else raises an error.

- `a` (*any*) : Value.
- `b` (*any*) : Value.
- **returns**: boolean Equal.

#### `editor_toolUtilities_util.doesPathContainNode(path, nodeKey)`

Looks for a node key in a path.

- `path` (*table*) : List of keys.
- `nodeKey` (*any*) : Key searched for.
- **returns**: boolean Found.
- **returns**: integer|nil Index or nil.

#### `editor_toolUtilities_util.fastArrayCopy(arr)`

Fast copy of a simple array (shallow copy).

- `arr` (*table*) : Source array.
- **returns**: table New copy.

#### `editor_toolUtilities_util.filterClosePointsXY(points, minDist)`

Removes consecutive points closer than minDist in the XY plane (keeps the first).

- `points` (*vec3[]*) : Points.
- `minDist` (*number*) : Minimum distance (m).
- **returns**: table New list (the same table if fewer than 2 points).

#### `editor_toolUtilities_util.findMaterialIdx(candidates)`

Index of the first terrain layer that carries one of the candidate names, case-insensitive.

- `candidates` (*string[]*) : Candidate names, in priority order.
- **returns**: integer|nil Index (0-based) or nil.

#### `editor_toolUtilities_util.flipBitmapY(bmpIn)`

Flips a bitmap vertically: creates a new GFXFormatR16 GBitmap where each texel copies the value of the mirrored row.

- `bmpIn` (*GBitmap*) : Source bitmap (not modified).
- **returns**: GBitmap New flipped bitmap.

#### `editor_toolUtilities_util.flipSplineDirection(spline)`

Reverses the direction of a spline (nodes, widths, nmls) and marks it isDirty.

- `spline` (*table*) : Spline modified in place.

#### `editor_toolUtilities_util.footSnap()`

Specification of the snapping grid for site footprints: { ox = 0, oy = 0, step = 1 }, aligned to the world and shared by the three site tools.

- **returns**: table { ox, oy, step }.

#### `editor_toolUtilities_util.footSnapped(x, y)`

Snaps a world x, y to this grid (1 m step). For points that a tool places itself: an off-grid starting shape becomes crooked as soon as a corner is dragged onto it.

- `x` (*number*) : World X.
- `y` (*number*) : World Y.
- **returns**: number Snapped X.
- **returns**: number Snapped Y.

#### `editor_toolUtilities_util.generateUniqueName(baseName, prefixIn)`

Generates a name that does not conflict with the scene tree: tests "prefix - name", then "prefix - name - 1", "- 2", etc. Returns the name part without the prefix.

- `baseName` (*string*) : Base name.
- `prefixIn` (*string*) : Prefix (required).
- **returns**: string Unique name, without the prefix.

#### `editor_toolUtilities_util.getAllSources(splines)`

Sources of all enabled (isEnabled) splines, one list per spline.

- `splines` (*table*) : List of splines.
- **returns**: table List of lists of { pos, width, binormal }.

#### `editor_toolUtilities_util.getBlueToRedColour(value, minValue, maxValue)`

Color interpolated from blue (minValue) to red (maxValue), value clamped.

- `value` (*number*) : Value.
- `minValue` (*number*) : Value for blue.
- `maxValue` (*number*) : Value for red.
- **returns**: ColorI color(r, 0, b, 255).

#### `editor_toolUtilities_util.getHueBasedColour255(t)`

Hue color for t clamped between 0 and 1: from 240 degrees (blue) to 0 (red), saturation and value at 1.

- `t` (*number*) : Value 0..1.
- **returns**: integer R (0-255).
- **returns**: integer G (0-255).
- **returns**: integer B (0-255).

#### `editor_toolUtilities_util.getMaterialNames()`

Names of the terrain material layers (0-based index -> name), same source as roadNetwork. 'Material i' if a name is missing.

- **returns**: table<integer, string> Empty table if no terrain.

#### `editor_toolUtilities_util.getMeshBox(meshPath)`

Bounding box of a TSStatic shape: creates a temporary TSStatic ('temp_getMeshBox'), reads its object box, deletes it.

- `meshPath` (*string*) : Shape path (shapeName).
- **returns**: table { minExtents, maxExtents, center, extents } (vec3).

#### `editor_toolUtilities_util.getMinMaxWidth(spline)`

Minimum and maximum widths of a spline (spline.widths); 10 and 10 if there are none.

- `spline` (*table*) : Spline with widths.
- **returns**: number Minimum.
- **returns**: number Maximum.

#### `editor_toolUtilities_util.getPolyLength(pts)`

Length of a polyline (sum of 3D distances).

- `pts` (*vec3[]*) : Points.
- **returns**: number Length in meters.

#### `editor_toolUtilities_util.getSourcesSingle(spline)`

Sources of a spline for terraforming: a single list of { pos, width, binormal } over divPoints, with spline.terraWidth if defined in place of divWidths.

- `spline` (*table*) : Spline (divPoints, divWidths, binormals, terraWidth).
- **returns**: table { sData }.

#### `editor_toolUtilities_util.goToSpline(points)`

Switches to the free camera and places the camera above the spline, looking down, according to splineFocus.

- `points` (*vec3[]*) : Spline points.

#### `editor_toolUtilities_util.hsvToRgb(h, s, v)`

Converts HSV to RGB, everything in [0,1] (h is one full turn = 1).

- `h` (*number*) : Hue 0-1.
- `s` (*number*) : Saturation 0-1.
- `v` (*number*) : Value 0-1.
- **returns**: number R.
- **returns**: number G.
- **returns**: number B.

#### `editor_toolUtilities_util.hsvToRgb255(h, s, v)`

Converts HSV to RGB on 0-255 (h in degrees 0-360, s and v in 0-1).

- `h` (*number*) : Hue in degrees.
- `s` (*number*) : Saturation 0-1.
- `v` (*number*) : Value 0-1.
- **returns**: integer R.
- **returns**: integer G.
- **returns**: integer B.

#### `editor_toolUtilities_util.isMouseHoveringOverTerrain()`

True if the mouse is over the viewport (not over an ImGui element or window, nor the axes gizmo).

- **returns**: boolean The mouse points at the world.

#### `editor_toolUtilities_util.isWidthFixed(nodes)`

True if the node width is fixed (difference less than 0.01).

- `nodes` (*table*) : Nodes with .width.
- **returns**: boolean Fixed width.
- **returns**: number Minimum width.

#### `editor_toolUtilities_util.lookAtGround()`

The ground under the middle of the screen, in x, y (raycast from the camera). Used to place a new object in front of the user. Returns 0, 0 if the view is in the sky or off the map.

- **returns**: number X.
- **returns**: number Y.

#### `editor_toolUtilities_util.mouseOnMapPos()`

Map position the mouse points at (castRayStatic, range 5000 m). With no hit, returns the last valid position, or failing that the ray point at maximum range.

- **returns**: vec3 World position.

#### `editor_toolUtilities_util.mouseOnPlaneZ(planeZ)`

Point where the mouse ray intersects the horizontal plane z = planeZ.

- `planeZ` (*number*) : Altitude of the plane.
- **returns**: vec3|nil Intersection point; nil if the ray is almost horizontal or the plane is behind the camera.

#### `editor_toolUtilities_util.mouseOnTerrainPos(seedZ)`

The GROUND under the mouse, placed on the terrain height grid rather than on some static geometry lying on the ray. Iterates 4 times, intersecting with the terrain height.

- `seedZ` (*number|nil*) : Starting altitude of the plane (0 by default).
- **returns**: vec3|nil Point on the terrain.

#### `editor_toolUtilities_util.msToKph(ms)`

Converts m/s to km/h (x 3.6).

- `ms` (*number*) : Speed in m/s.
- **returns**: number Speed in km/h.

#### `editor_toolUtilities_util.msToMph(ms)`

Converts m/s to mph (x 2.236936).

- `ms` (*number*) : Speed in m/s.
- **returns**: number Speed in mph.

#### `editor_toolUtilities_util.splineFocus(points)`

Computes a top-down framing for a spline: middle of the 2D box and altitude such that everything fits in the field of view (distance / tan(fov/2) + zMax + 5).

- `points` (*vec3[]*) : Spline points.
- **returns**: number|nil X of the middle, nil if the spline is too small (less than 0.1 m).
- **returns**: number Y of the middle.
- **returns**: number Camera altitude.

#### `editor_toolUtilities_util.starterRing(w, d, zAt)`

A rectangle placed on the ground under the middle of the screen, oriented counter-clockwise, corners on the footprint grid.

- `w` (*number*) : Width (m).
- `d` (*number*) : Depth (m).
- `zAt` (*function|nil*) : zAt(x, y) gives the altitude of each corner (0 by default).
- **returns**: vec3[] 4 corners.

#### `editor_toolUtilities_util.sumOverNonArrayTable(t)`

Sum of all the values of a non-array table.

- `t` (*table<any, number>*) : Table key -> number.
- **returns**: number Sum.

#### `editor_toolUtilities_util.unchangedIds(a, b)`

Ids whose copies in two snapshots of the same items are identical: what an intermediate undo step did not touch.

- `a` (*table*) : Snapshot A (items with .id).
- `b` (*table*) : Snapshot B.
- **returns**: table<any, boolean> Set id -> true.

#### `editor_toolUtilities_util.vertRaycast(pos, rayRaise, postFloat)`

Vertical downward raycast that modifies the point's Z in place: rises by rayRaise, shoots down, then comes back down onto the surface + postFloat so as not to sink in.

- `pos` (*vec3*) : Point modified in place.
- `rayRaise` (*number|nil*) : Rise before the shot (10 by default).
- `postFloat` (*number|nil*) : Small height added afterwards (0.05 by default).

#### `editor_toolUtilities_util.writeMaskToPng(mask, path)`

Debug utility: writes a binary mask (rows of 0 or 1) as a 16-bit PNG (white if 1).

- `mask` (*table*) : 2D mask.
- `path` (*string*) : Output file.

#### `editor_toolUtilities_util.writePathsToPng(paths, width, height, path)`

Writes vectorized paths as a 16-bit grayscale PNG, with a distinct intensity per path.

- `paths` (*table*) : Paths.
- `width` (*integer*) : Image width.
- `height` (*integer*) : Image height.
- `path` (*string*) : Output file.

#### `editor_toolUtilities_util.writeWidthsToPng(paths, widths, width, height, outPath)`

Writes the paths as continuous thick strokes: a filled disc at each point, of radius max(1, floor(width/2)), white on a black background.

- `paths` (*table*) : Paths.
- `widths` (*table*) : Widths per path.
- `width` (*integer*) : Image width.
- `height` (*integer*) : Image height.
- `outPath` (*string*) : Output file.

## Calls into the engine (C++)

- `obj:` `delete`, `getObjBox`, `registerObject`, `setField`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/util.lua`.*
