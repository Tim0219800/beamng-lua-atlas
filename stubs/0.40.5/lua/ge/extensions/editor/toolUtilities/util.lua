---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/util.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_util` : `extensions.load("editor_toolUtilities_util")`, puis la globale `editor_toolUtilities_util`
---@class editor_toolUtilities_util
editor_toolUtilities_util = {}

--- A sub tab whose row stays put.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:768
---@param label any
---@param flags any
function editor_toolUtilities_util.beginSubTab(label, flags) end

--- Converts a ribbon polyline to GLTF JSON with embedded buffer.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:493
---@param points any
---@param widths any
---@param binormals any
function editor_toolUtilities_util.buildRibbonGLTF(points, widths, binormals) end

--- Converts a ribbon polyline to a triangle mesh.
---  Returns: { vertices = {vec3, ...}, indices = {int, ...} }
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:451
---@param points any
---@param widths any
---@param binormals any
function editor_toolUtilities_util.buildRibbonMeshFromPolyline(points, widths, binormals) end

--- Estimates average XY-plane spacing between nodes, simulating Catmull-Rom interpolation but excluding mesh extents.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:326
---@param positions any
---@param minSpacing any
function editor_toolUtilities_util.calculateAverageSpacingXY(positions, minSpacing) end

--- Strip a level back to bare terrain, so a scene can be built on it from nothing. Forest INSTANCES go too (gridmap
---  ships trees and bushes that nothing else removes), but the ForestItemData datablocks stay: planting resolves its
---  species by name, so dropping those would break the next thing that plants. Returns how many objects went.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:119
function editor_toolUtilities_util.clearLevelContent() end

--- One undo step, filed as a transaction of its own. A lone commitAction deep-copies the step on top of the stack and the
---  new one to look for a duplicate, and a grade step holds millions of heights; a transaction is filed without that check.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:235
---@param label any
---@param data any
---@param undoFn any
---@param redoFn any
function editor_toolUtilities_util.commitStep(label, data, undoFn, redoFn) end

--- Computes a map of spline IDs to their indices.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:205
---@param splines any
---@param map any
function editor_toolUtilities_util.computeIdToIdxMap(splines, map) end

---Source : lua/ge/extensions/editor/toolUtilities/util.lua:212
---@param a any
---@param b any
function editor_toolUtilities_util.deepEqual(a, b) end

--- Returns true/idx if the path contains the given node key, otherwise false/nil.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:358
---@param path any
---@param nodeKey any
function editor_toolUtilities_util.doesPathContainNode(path, nodeKey) end

--- EndChild goes in whether or not the child was clipped, so this is not guarded.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:775
function editor_toolUtilities_util.endSubTab() end

--- Fast copy function for simple arrays.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:94
---@param arr any
function editor_toolUtilities_util.fastArrayCopy(arr) end

--- Removes consecutive points that are closer than minDist in XY-plane.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:301
---@param points any
---@param minDist any
function editor_toolUtilities_util.filterClosePointsXY(points, minDist) end

--- First terrain layer actually called one of the candidates, ignoring case; nil if the level has none of them.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:253
---@param candidates any
function editor_toolUtilities_util.findMaterialIdx(candidates) end

--- Flip the bitmap vertically, in-place.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:650
---@param bmpIn any
function editor_toolUtilities_util.flipBitmapY(bmpIn) end

--- Flips the direction of the given spline.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:368
---@param spline any
function editor_toolUtilities_util.flipSplineDirection(spline) end

---Source : lua/ge/extensions/editor/toolUtilities/util.lua:431
function editor_toolUtilities_util.footSnap() end

--- A world x,y taken to that grid. For the points a tool puts down itself: a starter shape off the grid goes crooked the
--- moment one of its corners is dragged onto it.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:435
---@param x any
---@param y any
function editor_toolUtilities_util.footSnapped(x, y) end

--- Generates a unique name, so it will not clash with any existing names in the scene tree.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:191
---@param baseName any
---@param prefixIn any
function editor_toolUtilities_util.generateUniqueName(baseName, prefixIn) end

--- Returns the sources from all given splines.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:610
---@param splines any
function editor_toolUtilities_util.getAllSources(splines) end

--- Computes a blue to red color by interpolating between blue [minValue] and red [maxValue].
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:164
---@param value any
---@param minValue any
---@param maxValue any
function editor_toolUtilities_util.getBlueToRedColour(value, minValue, maxValue) end

--- Generates a hue-based colour, based on the given value.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:188
---@param t any
function editor_toolUtilities_util.getHueBasedColour255(t) end

--- Terrain material layer names (0-based index -> name), same source roadNetwork paints from.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:243
function editor_toolUtilities_util.getMaterialNames() end

--- Returns mesh bounding box info for a TSStatic shape path.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:145
---@param meshPath any
function editor_toolUtilities_util.getMeshBox(meshPath) end

--- Returns the minimum and maximum widths of the given spline.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:277
---@param spline any
function editor_toolUtilities_util.getMinMaxWidth(spline) end

--- Returns the length of the given polyline.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:268
---@param pts any
function editor_toolUtilities_util.getPolyLength(pts) end

--- Returns the sources from the given spline.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:596
---@param spline any
function editor_toolUtilities_util.getSourcesSingle(spline) end

---Source : lua/ge/extensions/editor/toolUtilities/util.lua:408
---@param points any
function editor_toolUtilities_util.goToSpline(points) end

--- Converts HSV to RGB (all in range [0,1]).
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:630
---@param h any
---@param s any
---@param v any
function editor_toolUtilities_util.hsvToRgb(h, s, v) end

--- Converts HSV to RGB (all in range [0,255]).
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:170
---@param h any
---@param s any
---@param v any
function editor_toolUtilities_util.hsvToRgb255(h, s, v) end

--- Tests if mouse is hovering over the terrain (as opposed to any windows, etc).
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:41
function editor_toolUtilities_util.isMouseHoveringOverTerrain() end

--- Returns true if the width of the nodes is fixed, to some tolerance.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:291
---@param nodes any
function editor_toolUtilities_util.isWidthFixed(nodes) end

--- The ground under the middle of the screen, in x,y. Where the site tools put whatever they open with, so a new one lands
--- in front of the user rather than wherever the map happens to be centred.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:418
function editor_toolUtilities_util.lookAtGround() end

--- Computes the position on the map at which the mouse points.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:46
function editor_toolUtilities_util.mouseOnMapPos() end

--- Position where the mouse ray crosses the horizontal plane z = planeZ.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:61
---@param planeZ any
function editor_toolUtilities_util.mouseOnPlaneZ(planeZ) end

--- The GROUND under the mouse, settled onto the terrain heightfield rather than onto whatever static geometry stands in the ray's way.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:71
---@param seedZ any
function editor_toolUtilities_util.mouseOnTerrainPos(seedZ) end

---Source : lua/ge/extensions/editor/toolUtilities/util.lua:105
---@param ms any
function editor_toolUtilities_util.msToKph(ms) end

--- Conversion functions for velocities in meters per second.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:103
---@param ms any
function editor_toolUtilities_util.msToMph(ms) end

--- Moves the camera directly above the spline with the given index.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:381
---@param points any
function editor_toolUtilities_util.splineFocus(points) end

--- A rectangle on the ground under the middle of the screen, wound counter-clockwise, its corners on the footprint grid.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:440
---@param w any
---@param d any
---@param zAt any
function editor_toolUtilities_util.starterRing(w, d, zAt) end

--- Returns the sum of all values in the given non-array table.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:108
---@param t any
function editor_toolUtilities_util.sumOverNonArrayTable(t) end

--- The ids whose copies in two snapshots of the same items are the same: what an undo step between them never touched.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:222
---@param a any
---@param b any
function editor_toolUtilities_util.unchangedIds(a, b) end

--- Downward vertical raycast which modifies the point's Z value in-place.
---  Keeps the point slightly above the terrain surface to prevent sinking.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:85
---@param pos any
---@param rayRaise any
---@param postFloat any
function editor_toolUtilities_util.vertRaycast(pos, rayRaise, postFloat) end

--- Writes a binary mask to a .png file in RGBA format. Debug utility.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:665
---@param mask any
---@param path any
function editor_toolUtilities_util.writeMaskToPng(mask, path) end

--- Writes a set of vectorized paths to a .png file in 16-bit greyscale format.
---  Each path gets a distinct greyscale intensity for visual differentiation.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:689
---@param paths any
---@param width any
---@param height any
---@param path any
function editor_toolUtilities_util.writePathsToPng(paths, width, height, path) end

--- Updated: writeWidthsToPng using continuous thick strokes.
---Source : lua/ge/extensions/editor/toolUtilities/util.lua:724
---@param paths any
---@param widths any
---@param width any
---@param height any
---@param outPath any
function editor_toolUtilities_util.writeWidthsToPng(paths, widths, width, height, outPath) end

