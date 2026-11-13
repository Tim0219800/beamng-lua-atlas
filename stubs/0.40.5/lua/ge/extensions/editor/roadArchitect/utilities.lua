---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/utilities.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_roadArchitect_utilities` : `extensions.load("editor_roadArchitect_utilities")`, puis la globale `editor_roadArchitect_utilities`
---@class editor_roadArchitect_utilities
editor_roadArchitect_utilities = {}

--- Computes the (small) angle between two vectors of arbitrary length, in radians.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:494
---@param a any
---@param b any
function editor_roadArchitect_utilities.angleBetweenVecs(a, b) end

--- Computes the (small) angle between two vectors (converted to 2D first).
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:497
---@param a any
---@param b any
function editor_roadArchitect_utilities.angleBetweenVecs2D(a, b) end

--- Attemps to fit a circle (2D) to three given points.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:459
---@param p1 any
---@param p2 any
---@param p3 any
function editor_roadArchitect_utilities.circle2DFrom3Points(p1, p2, p3) end

--- Computes the clockwise angle between the two given vectors, in 2D
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:500
---@param v1 any
---@param v2 any
function editor_roadArchitect_utilities.clockwiseAngleBetweenVecs2D(v1, v2) end

--- Computes the 2D axis-aligned bounding box of all roads in the session.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:101
---@param roads any
function editor_roadArchitect_utilities.computeAABB2DAllRoads(roads) end

--- Computes the 2D axis-aligned bounding box of the given group.
---  [Only nodes in the group are included - not all nodes in each group road].
---  When group is nil (whole-network terraform), uses every node of every road.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:117
---@param group any
---@param roads any
---@param map any
function editor_roadArchitect_utilities.computeAABB2DGroup(group, roads, map) end

--- For a given node, find the corresponding div index in the road render data.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:287
---@param nIdx any
---@param road any
function editor_roadArchitect_utilities.computeDivIndicesFromNode(nIdx, road) end

--- Computes the lengths (from road start) of each div point in the given render data.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:232
---@param rD any
function editor_roadArchitect_utilities.computeRoadLength(rD) end

--- Computes the 2D distance between two points, given component-wise.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:158
---@param x1 any
---@param y1 any
---@param x2 any
---@param y2 any
function editor_roadArchitect_utilities.distance2D(x1, y1, x2, y2) end

--- Draw text markup for auto junctions.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:57
---@param pos any
---@param rName any
---@param rLie any
function editor_roadArchitect_utilities.drawAutoJctMarkup(pos, rName, rLie) end

---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:47
---@param pos any
function editor_roadArchitect_utilities.drawGroupSphere(pos) end

---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:51
---@param pos any
---@param rad any
function editor_roadArchitect_utilities.drawHighlightSphereRad(pos, rad) end

--- Draw lines.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:54
---@param p1 any
---@param p2 any
function editor_roadArchitect_utilities.drawPurpleLine(p1, p2) end

--- Draws spheres (for various purposes).
---  [The size of the sphere varies with the camera distance, so as to keep the sphere about the same size].
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:46
---@param pos any
function editor_roadArchitect_utilities.drawSphere(pos) end

---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:48
---@param pos any
function editor_roadArchitect_utilities.drawSphereHighlight(pos) end

---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:50
---@param pos any
function editor_roadArchitect_utilities.drawSphereHighlightPurple(pos) end

---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:49
---@param pos any
function editor_roadArchitect_utilities.drawSphereHighlightRed(pos) end

--- Finds the lower and upper bounding div point index of a given length along a road.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:271
---@param pEval any
---@param lengths any
function editor_roadArchitect_utilities.findBounds(pEval, lengths) end

--- Function to extract filename and extension from a path.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:217
---@param path any
function editor_roadArchitect_utilities.getFilenameFromPath(path) end

--- Computes the half width of the given road (at the first node - assumes width is equal throughout).
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:260
---@param r any
function editor_roadArchitect_utilities.getHalfWidthAtNode(r) end

--- Computes the rotation between two vectors.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:522
---@param v1 any
---@param v2 any
function editor_roadArchitect_utilities.getRotationBetweenVecs(v1, v2) end

--- Function to find the intersection point between two line segments.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:382
---@param p1 any
---@param p2 any
---@param q1 any
---@param q2 any
function editor_roadArchitect_utilities.intersection2LineSegs(p1, p2, q1, q2) end

--- Finds the intersection between two lines (p1 -> p2), (p3 -> p4).
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:343
---@param p1 any
---@param p2 any
---@param p3 any
---@param p4 any
function editor_roadArchitect_utilities.intersection2Lines(p1, p2, p3, p4) end

--- Function to find the intersection between a 2D line segment and a circle.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:394
---@param x1 any
---@param y1 any
---@param x2 any
---@param y2 any
---@param cx any
---@param cy any
---@param r any
function editor_roadArchitect_utilities.intersectionLineSegmentCircle(x1, y1, x2, y2, cx, cy, r) end

--- Determines if the given point is inside the given 2D Axis-Aligned bounding box.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:553
---@param p any
---@param box any
function editor_roadArchitect_utilities.isInBox(p, box) end

--- Determines if a given div point index is inside a tunnel or not.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:309
---@param idx any
---@param tunnels any
---@param extraS any
---@param extraE any
function editor_roadArchitect_utilities.isInTunnel(idx, tunnels, extraS, extraE) end

--- Checks if the mouse is close to any existing node, excluding a given avoid road.
---  [The road and node indices are returned for every road/node combo which is found].
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:162
---@param roads any
---@param selectedRoadIdx any
---@param selectedNodeIdx any
function editor_roadArchitect_utilities.isMouseCloseToNode(roads, selectedRoadIdx, selectedNodeIdx) end

--- Tests if mouse is hovering over the terrain (as opposed to any windows, etc).
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:63
function editor_roadArchitect_utilities.isMouseHoveringOverTerrain() end

--- Checks if the mouse is hovering over any existing reference node. If so, returns the relevant data.
---  [The road and node indices are returned].
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:74
---@param roads any
function editor_roadArchitect_utilities.isMouseOverNode(roads) end

--- Determines if the given point is directly over the terrain (rather than over a bridge).
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:559
---@param p any
function editor_roadArchitect_utilities.isOverTerrain(p) end

---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:550
---@param p any
---@param p1 any
---@param p2 any
function editor_roadArchitect_utilities.isPointOnLeftSideOfLine(p, p1, p2) end

--- Computes the position on the map at which the mouse points.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:66
function editor_roadArchitect_utilities.mouseOnMapPos() end

--- Linearly interpolates into a given polyline, including the orthonormal frame.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:320
---@param pos any
---@param nml any
---@param lens any
---@param q any
function editor_roadArchitect_utilities.polyLerp(pos, nml, lens, q) end

--- Function to project point p onto the line defined by points a and b (in 2D).
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:432
---@param p any
---@param a any
---@param b any
function editor_roadArchitect_utilities.projectPointToLine(p, a, b) end

--- Returns a random integer in range [a, b] inclusive.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:567
---@param a any
---@param b any
function editor_roadArchitect_utilities.randomInRange(a, b) end

--- Function to remove the three-letter extension (and dot) from a filename.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:220
---@param filename any
function editor_roadArchitect_utilities.removeExtension(filename) end

--- Function to remove the filename and extension from the given path
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:223
---@param path any
function editor_roadArchitect_utilities.removeFileNameFromPath(path) end

--- Rotates vector v around unit axis k, by angle theta (in radians).
---  [This function uses the standard Rodrigues formula].
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:516
---@param v any
---@param k any
---@param theta any
function editor_roadArchitect_utilities.rotateVecAroundAxis(v, k, theta) end

--- Function to rotate a vector by a quaternion.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:544
---@param v any
---@param q any
function editor_roadArchitect_utilities.rotateVecByQuaternion(v, q) end

--- Rounds the given floating-point number to two decimal places.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:149
---@param num any
function editor_roadArchitect_utilities.round2(num) end

--- Performs spherical linear interpolation between two vectors.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:475
---@param v1 any
---@param v2 any
---@param t any
function editor_roadArchitect_utilities.slerp(v1, v2, t) end

--- Computes the squared 2D distance between two points (which may be 3D-valued).
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:152
---@param a any
---@param b any
function editor_roadArchitect_utilities.sqDist2D(a, b) end

--- Adds the given placed group index to the given road, if it is not already there.
---Source : lua/ge/extensions/editor/roadArchitect/utilities.lua:134
---@param r any
---@param placedGroupIdx any
function editor_roadArchitect_utilities.tryAddGroupIdxToRoad(r, placedGroupIdx) end

