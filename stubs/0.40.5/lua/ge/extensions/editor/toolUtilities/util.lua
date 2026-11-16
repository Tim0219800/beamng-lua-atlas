---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/util.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Toolbox common to the editor's spline and "site" tools: mouse and raycasts (position on the map, on the terrain, on a plane), conversions and colors, level cleanup, unique names, undo (commitStep), terrain material names, polyline and spline computations (length, width, spacing, reversal, camera framing), ribbon building (mesh, GLTF), spline sources for terraforming, bitmaps (flipping, debug PNG export) and ImGui sub-tabs. Default constants: min and max width 10 m, fixed-width tolerance 0.01, max camera ray distance 5000 m.
--- Access: extension `editor_toolUtilities_util`: `extensions.load("editor_toolUtilities_util")`, then the global `editor_toolUtilities_util`
---@class editor_toolUtilities_util
editor_toolUtilities_util = {}

--- Opens an ImGui sub-tab (BeginTabItem) whose body is a child, so the tab row stays in place. Returns false if the tab is not open.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:768
---@param label string Title.
---@param flags integer|nil TabItemFlags flags.
---@return boolean  Tab open.
function editor_toolUtilities_util.beginSubTab(label, flags) end

--- Converts a ribbon polyline into GLTF JSON with an embedded binary buffer (float positions, uint16 indices), coordinates converted (x, z, -y).
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:493
---@param points vec3[] Points.
---@param widths number[] Widths.
---@param binormals vec3[] Binormals.
---@return table  GLTF table.
function editor_toolUtilities_util.buildRibbonGLTF(points, widths, binormals) end

--- Converts a ribbon polyline into a triangle mesh: two vertices per point (left and right, at half-width along the binormal), two triangles per segment.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:451
---@param points vec3[] Centerline points.
---@param widths number[] Total width at each point.
---@param binormals vec3[] Binormal at each point.
---@return table  { vertices = vec3[], indices = integer[] } (indices 1-based).
function editor_toolUtilities_util.buildRibbonMeshFromPolyline(points, widths, binormals) end

--- Estimates the average XY spacing between nodes by simulating a centripetal Catmull-Rom interpolation (10 samples per segment), without counting the mesh footprint.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:326
---@param positions vec3[] Node positions.
---@param minSpacing number|nil Floor of the spacing; also serves as the fallback value (1.0 by default) if there are fewer than 2 nodes.
---@return number  Average spacing (m).
function editor_toolUtilities_util.calculateAverageSpacingXY(positions, minSpacing) end

--- Brings a level back to bare terrain to build a scene from scratch. Deletes all objects of the DecalRoad, TSStatic, MeshRoad, ProceduralMesh, PointLight and SpotLight classes, as well as all forest INSTANCES; the ForestItemData datablocks stay (planting finds its species by name). Sets editor.forestDirty.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:119
---@return integer  Number of scene objects deleted (excluding forest items).
function editor_toolUtilities_util.clearLevelContent() end

--- Records an undo step as a full transaction. A plain commitAction deep-copies the top step of the stack and the new one to look for a duplicate, which is prohibitive for a terraforming step of millions of heights; a transaction is recorded without this check.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:235
---@param label string Label.
---@param data any Step data.
---@param undoFn function Undo callback.
---@param redoFn function Redo callback.
function editor_toolUtilities_util.commitStep(label, data, undoFn, redoFn) end

--- Fills `map` (emptied first) with spline.id -> index in the list.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:205
---@param splines table List of splines.
---@param map table Output table.
function editor_toolUtilities_util.computeIdToIdxMap(splines, map) end

--- Deep equality of two values. Tests the type before == because comparing a vec3 to something else raises an error.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:212
---@param a any Value.
---@param b any Value.
---@return boolean  Equal.
function editor_toolUtilities_util.deepEqual(a, b) end

--- Looks for a node key in a path.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:358
---@param path table List of keys.
---@param nodeKey any Key searched for.
---@return boolean  Found.
---@return integer|nil  Index or nil.
function editor_toolUtilities_util.doesPathContainNode(path, nodeKey) end

--- Closes the sub-tab (EndChild then EndTabItem). No guard: EndChild must be called even if the child is clipped.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:775
function editor_toolUtilities_util.endSubTab() end

--- Fast copy of a simple array (shallow copy).
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:94
---@param arr table Source array.
---@return table  New copy.
function editor_toolUtilities_util.fastArrayCopy(arr) end

--- Removes consecutive points closer than minDist in the XY plane (keeps the first).
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:301
---@param points vec3[] Points.
---@param minDist number Minimum distance (m).
---@return table  New list (the same table if fewer than 2 points).
function editor_toolUtilities_util.filterClosePointsXY(points, minDist) end

--- Index of the first terrain layer that carries one of the candidate names, case-insensitive.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:253
---@param candidates string[] Candidate names, in priority order.
---@return integer|nil  Index (0-based) or nil.
function editor_toolUtilities_util.findMaterialIdx(candidates) end

--- Flips a bitmap vertically: creates a new GFXFormatR16 GBitmap where each texel copies the value of the mirrored row.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:650
---@param bmpIn GBitmap Source bitmap (not modified).
---@return GBitmap  New flipped bitmap.
function editor_toolUtilities_util.flipBitmapY(bmpIn) end

--- Reverses the direction of a spline (nodes, widths, nmls) and marks it isDirty.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:368
---@param spline table Spline modified in place.
function editor_toolUtilities_util.flipSplineDirection(spline) end

--- Specification of the snapping grid for site footprints: { ox = 0, oy = 0, step = 1 }, aligned to the world and shared by the three site tools.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:431
---@return table  { ox, oy, step }.
function editor_toolUtilities_util.footSnap() end

--- Snaps a world x, y to this grid (1 m step). For points that a tool places itself: an off-grid starting shape becomes crooked as soon as a corner is dragged onto it.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:435
---@param x number World X.
---@param y number World Y.
---@return number  Snapped X.
---@return number  Snapped Y.
function editor_toolUtilities_util.footSnapped(x, y) end

--- Generates a name that does not conflict with the scene tree: tests "prefix - name", then "prefix - name - 1", "- 2", etc. Returns the name part without the prefix.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:191
---@param baseName string Base name.
---@param prefixIn string Prefix (required).
---@return string  Unique name, without the prefix.
function editor_toolUtilities_util.generateUniqueName(baseName, prefixIn) end

--- Sources of all enabled (isEnabled) splines, one list per spline.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:610
---@param splines table List of splines.
---@return table  List of lists of { pos, width, binormal }.
function editor_toolUtilities_util.getAllSources(splines) end

--- Color interpolated from blue (minValue) to red (maxValue), value clamped.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:164
---@param value number Value.
---@param minValue number Value for blue.
---@param maxValue number Value for red.
---@return ColorI  color(r, 0, b, 255).
function editor_toolUtilities_util.getBlueToRedColour(value, minValue, maxValue) end

--- Hue color for t clamped between 0 and 1: from 240 degrees (blue) to 0 (red), saturation and value at 1.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:188
---@param t number Value 0..1.
---@return integer  R (0-255).
---@return integer  G (0-255).
---@return integer  B (0-255).
function editor_toolUtilities_util.getHueBasedColour255(t) end

--- Names of the terrain material layers (0-based index -> name), same source as roadNetwork. 'Material i' if a name is missing.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:243
---@return table<integer, string>  Empty table if no terrain.
function editor_toolUtilities_util.getMaterialNames() end

--- Bounding box of a TSStatic shape: creates a temporary TSStatic ('temp_getMeshBox'), reads its object box, deletes it.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:145
---@param meshPath string Shape path (shapeName).
---@return table  { minExtents, maxExtents, center, extents } (vec3).
function editor_toolUtilities_util.getMeshBox(meshPath) end

--- Minimum and maximum widths of a spline (spline.widths); 10 and 10 if there are none.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:277
---@param spline table Spline with widths.
---@return number  Minimum.
---@return number  Maximum.
function editor_toolUtilities_util.getMinMaxWidth(spline) end

--- Length of a polyline (sum of 3D distances).
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:268
---@param pts vec3[] Points.
---@return number  Length in meters.
function editor_toolUtilities_util.getPolyLength(pts) end

--- Sources of a spline for terraforming: a single list of { pos, width, binormal } over divPoints, with spline.terraWidth if defined in place of divWidths.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:596
---@param spline table Spline (divPoints, divWidths, binormals, terraWidth).
---@return table  { sData }.
function editor_toolUtilities_util.getSourcesSingle(spline) end

--- Switches to the free camera and places the camera above the spline, looking down, according to splineFocus.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:408
---@param points vec3[] Spline points.
function editor_toolUtilities_util.goToSpline(points) end

--- Converts HSV to RGB, everything in [0,1] (h is one full turn = 1).
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:630
---@param h number Hue 0-1.
---@param s number Saturation 0-1.
---@param v number Value 0-1.
---@return number  R.
---@return number  G.
---@return number  B.
function editor_toolUtilities_util.hsvToRgb(h, s, v) end

--- Converts HSV to RGB on 0-255 (h in degrees 0-360, s and v in 0-1).
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:170
---@param h number Hue in degrees.
---@param s number Saturation 0-1.
---@param v number Value 0-1.
---@return integer  R.
---@return integer  G.
---@return integer  B.
function editor_toolUtilities_util.hsvToRgb255(h, s, v) end

--- True if the mouse is over the viewport (not over an ImGui element or window, nor the axes gizmo).
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:41
---@return boolean  The mouse points at the world.
function editor_toolUtilities_util.isMouseHoveringOverTerrain() end

--- True if the node width is fixed (difference less than 0.01).
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:291
---@param nodes table Nodes with .width.
---@return boolean  Fixed width.
---@return number  Minimum width.
function editor_toolUtilities_util.isWidthFixed(nodes) end

--- The ground under the middle of the screen, in x, y (raycast from the camera). Used to place a new object in front of the user. Returns 0, 0 if the view is in the sky or off the map.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:418
---@return number  X.
---@return number  Y.
function editor_toolUtilities_util.lookAtGround() end

--- Map position the mouse points at (castRayStatic, range 5000 m). With no hit, returns the last valid position, or failing that the ray point at maximum range.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:46
---@return vec3  World position.
function editor_toolUtilities_util.mouseOnMapPos() end

--- Point where the mouse ray intersects the horizontal plane z = planeZ.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:61
---@param planeZ number Altitude of the plane.
---@return vec3|nil  Intersection point; nil if the ray is almost horizontal or the plane is behind the camera.
function editor_toolUtilities_util.mouseOnPlaneZ(planeZ) end

--- The GROUND under the mouse, placed on the terrain height grid rather than on some static geometry lying on the ray. Iterates 4 times, intersecting with the terrain height.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:71
---@param seedZ number|nil Starting altitude of the plane (0 by default).
---@return vec3|nil  Point on the terrain.
function editor_toolUtilities_util.mouseOnTerrainPos(seedZ) end

--- Converts m/s to km/h (x 3.6).
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:105
---@param ms number Speed in m/s.
---@return number  Speed in km/h.
function editor_toolUtilities_util.msToKph(ms) end

--- Converts m/s to mph (x 2.236936).
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:103
---@param ms number Speed in m/s.
---@return number  Speed in mph.
function editor_toolUtilities_util.msToMph(ms) end

--- Computes a top-down framing for a spline: middle of the 2D box and altitude such that everything fits in the field of view (distance / tan(fov/2) + zMax + 5).
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:381
---@param points vec3[] Spline points.
---@return number|nil  X of the middle, nil if the spline is too small (less than 0.1 m).
---@return number  Y of the middle.
---@return number  Camera altitude.
function editor_toolUtilities_util.splineFocus(points) end

--- A rectangle placed on the ground under the middle of the screen, oriented counter-clockwise, corners on the footprint grid.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:440
---@param w number Width (m).
---@param d number Depth (m).
---@param zAt function|nil zAt(x, y) gives the altitude of each corner (0 by default).
---@return vec3[]  4 corners.
function editor_toolUtilities_util.starterRing(w, d, zAt) end

--- Sum of all the values of a non-array table.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:108
---@param t table<any, number> Table key -> number.
---@return number  Sum.
function editor_toolUtilities_util.sumOverNonArrayTable(t) end

--- Ids whose copies in two snapshots of the same items are identical: what an intermediate undo step did not touch.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:222
---@param a table Snapshot A (items with .id).
---@param b table Snapshot B.
---@return table<any, boolean>  Set id -> true.
function editor_toolUtilities_util.unchangedIds(a, b) end

--- Vertical downward raycast that modifies the point's Z in place: rises by rayRaise, shoots down, then comes back down onto the surface + postFloat so as not to sink in.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:85
---@param pos vec3 Point modified in place.
---@param rayRaise number|nil Rise before the shot (10 by default).
---@param postFloat number|nil Small height added afterwards (0.05 by default).
function editor_toolUtilities_util.vertRaycast(pos, rayRaise, postFloat) end

--- Debug utility: writes a binary mask (rows of 0 or 1) as a 16-bit PNG (white if 1).
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:665
---@param mask table 2D mask.
---@param path string Output file.
function editor_toolUtilities_util.writeMaskToPng(mask, path) end

--- Writes vectorized paths as a 16-bit grayscale PNG, with a distinct intensity per path.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:689
---@param paths table Paths.
---@param width integer Image width.
---@param height integer Image height.
---@param path string Output file.
function editor_toolUtilities_util.writePathsToPng(paths, width, height, path) end

--- Writes the paths as continuous thick strokes: a filled disc at each point, of radius max(1, floor(width/2)), white on a black background.
---Source: lua/ge/extensions/editor/toolUtilities/util.lua:724
---@param paths table Paths.
---@param widths table Widths per path.
---@param width integer Image width.
---@param height integer Image height.
---@param outPath string Output file.
function editor_toolUtilities_util.writeWidthsToPng(paths, widths, width, height, outPath) end

