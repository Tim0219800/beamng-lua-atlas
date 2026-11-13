# `editor_toolUtilities_util`

*Fichier : `lua/ge/extensions/editor/toolUtilities/util.lua` · VM : Game Engine (GE) · 840 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_util` : `extensions.load("editor_toolUtilities_util")`, puis la globale `editor_toolUtilities_util`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_util.beginSubTab(label, flags)` | A sub tab whose row stays put. | 768 |
| `editor_toolUtilities_util.buildRibbonGLTF(points, widths, binormals)` | Converts a ribbon polyline to GLTF JSON with embedded buffer. | 493 |
| `editor_toolUtilities_util.buildRibbonMeshFromPolyline(points, widths, binormals)` | Converts a ribbon polyline to a triangle mesh.<br> Returns: { vertices = {vec3, ...}, indices = {int, ...} } | 451 |
| `editor_toolUtilities_util.calculateAverageSpacingXY(positions, minSpacing)` | Estimates average XY-plane spacing between nodes, simulating Catmull-Rom interpolation but excluding mesh extents. | 326 |
| `editor_toolUtilities_util.clearLevelContent()` | Strip a level back to bare terrain, so a scene can be built on it from nothing. Forest INSTANCES go too (gridmap<br> ships trees and bushes that nothing else removes), but the ForestItemData datablocks stay: planting resolves its<br> species by name, so dropping those would break the next thing that plants. Returns how many objects went. | 119 |
| `editor_toolUtilities_util.commitStep(label, data, undoFn, redoFn)` | One undo step, filed as a transaction of its own. A lone commitAction deep-copies the step on top of the stack and the<br> new one to look for a duplicate, and a grade step holds millions of heights; a transaction is filed without that check. | 235 |
| `editor_toolUtilities_util.computeIdToIdxMap(splines, map)` | Computes a map of spline IDs to their indices. | 205 |
| `editor_toolUtilities_util.deepEqual(a, b)` |  | 212 |
| `editor_toolUtilities_util.doesPathContainNode(path, nodeKey)` | Returns true/idx if the path contains the given node key, otherwise false/nil. | 358 |
| `editor_toolUtilities_util.endSubTab()` | EndChild goes in whether or not the child was clipped, so this is not guarded. | 775 |
| `editor_toolUtilities_util.fastArrayCopy(arr)` | Fast copy function for simple arrays. | 94 |
| `editor_toolUtilities_util.filterClosePointsXY(points, minDist)` | Removes consecutive points that are closer than minDist in XY-plane. | 301 |
| `editor_toolUtilities_util.findMaterialIdx(candidates)` | First terrain layer actually called one of the candidates, ignoring case; nil if the level has none of them. | 253 |
| `editor_toolUtilities_util.flipBitmapY(bmpIn)` | Flip the bitmap vertically, in-place. | 650 |
| `editor_toolUtilities_util.flipSplineDirection(spline)` | Flips the direction of the given spline. | 368 |
| `editor_toolUtilities_util.footSnap()` |  | 431 |
| `editor_toolUtilities_util.footSnapped(x, y)` | A world x,y taken to that grid. For the points a tool puts down itself: a starter shape off the grid goes crooked the<br>moment one of its corners is dragged onto it. | 435 |
| `editor_toolUtilities_util.generateUniqueName(baseName, prefixIn)` | Generates a unique name, so it will not clash with any existing names in the scene tree. | 191 |
| `editor_toolUtilities_util.getAllSources(splines)` | Returns the sources from all given splines. | 610 |
| `editor_toolUtilities_util.getBlueToRedColour(value, minValue, maxValue)` | Computes a blue to red color by interpolating between blue [minValue] and red [maxValue]. | 164 |
| `editor_toolUtilities_util.getHueBasedColour255(t)` | Generates a hue-based colour, based on the given value. | 188 |
| `editor_toolUtilities_util.getMaterialNames()` | Terrain material layer names (0-based index -> name), same source roadNetwork paints from. | 243 |
| `editor_toolUtilities_util.getMeshBox(meshPath)` | Returns mesh bounding box info for a TSStatic shape path. | 145 |
| `editor_toolUtilities_util.getMinMaxWidth(spline)` | Returns the minimum and maximum widths of the given spline. | 277 |
| `editor_toolUtilities_util.getPolyLength(pts)` | Returns the length of the given polyline. | 268 |
| `editor_toolUtilities_util.getSourcesSingle(spline)` | Returns the sources from the given spline. | 596 |
| `editor_toolUtilities_util.goToSpline(points)` |  | 408 |
| `editor_toolUtilities_util.hsvToRgb(h, s, v)` | Converts HSV to RGB (all in range [0,1]). | 630 |
| `editor_toolUtilities_util.hsvToRgb255(h, s, v)` | Converts HSV to RGB (all in range [0,255]). | 170 |
| `editor_toolUtilities_util.isMouseHoveringOverTerrain()` | Tests if mouse is hovering over the terrain (as opposed to any windows, etc). | 41 |
| `editor_toolUtilities_util.isWidthFixed(nodes)` | Returns true if the width of the nodes is fixed, to some tolerance. | 291 |
| `editor_toolUtilities_util.lookAtGround()` | The ground under the middle of the screen, in x,y. Where the site tools put whatever they open with, so a new one lands<br>in front of the user rather than wherever the map happens to be centred. | 418 |
| `editor_toolUtilities_util.mouseOnMapPos()` | Computes the position on the map at which the mouse points. | 46 |
| `editor_toolUtilities_util.mouseOnPlaneZ(planeZ)` | Position where the mouse ray crosses the horizontal plane z = planeZ. | 61 |
| `editor_toolUtilities_util.mouseOnTerrainPos(seedZ)` | The GROUND under the mouse, settled onto the terrain heightfield rather than onto whatever static geometry stands in the ray's way. | 71 |
| `editor_toolUtilities_util.msToKph(ms)` |  | 105 |
| `editor_toolUtilities_util.msToMph(ms)` | Conversion functions for velocities in meters per second. | 103 |
| `editor_toolUtilities_util.splineFocus(points)` | Moves the camera directly above the spline with the given index. | 381 |
| `editor_toolUtilities_util.starterRing(w, d, zAt)` | A rectangle on the ground under the middle of the screen, wound counter-clockwise, its corners on the footprint grid. | 440 |
| `editor_toolUtilities_util.sumOverNonArrayTable(t)` | Returns the sum of all values in the given non-array table. | 108 |
| `editor_toolUtilities_util.unchangedIds(a, b)` | The ids whose copies in two snapshots of the same items are the same: what an undo step between them never touched. | 222 |
| `editor_toolUtilities_util.vertRaycast(pos, rayRaise, postFloat)` | Downward vertical raycast which modifies the point's Z value in-place.<br> Keeps the point slightly above the terrain surface to prevent sinking. | 85 |
| `editor_toolUtilities_util.writeMaskToPng(mask, path)` | Writes a binary mask to a .png file in RGBA format. Debug utility. | 665 |
| `editor_toolUtilities_util.writePathsToPng(paths, width, height, path)` | Writes a set of vectorized paths to a .png file in 16-bit greyscale format.<br> Each path gets a distinct greyscale intensity for visual differentiation. | 689 |
| `editor_toolUtilities_util.writeWidthsToPng(paths, widths, width, height, outPath)` | Updated: writeWidthsToPng using continuous thick strokes. | 724 |

## Appels vers le moteur (C++)

- `obj:` `delete`, `getObjBox`, `registerObject`, `setField`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/util.lua`.*
