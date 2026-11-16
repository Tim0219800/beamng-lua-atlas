---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/utilities.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Road Architect toolbox: drawing of debug spheres/lines, mouse detection on the terrain or on a node, road bounding box computations, file path manipulation, and many 2D/3D geometry functions (intersections, projections, circle through 3 points, angles, rotations, slerp). A modder can reuse the pure geometry functions; the drawing or mouse functions assume the editor is active.
--- Access: extension `editor_roadArchitect_utilities`: `extensions.load("editor_roadArchitect_utilities")`, then the global `editor_roadArchitect_utilities`
---@class editor_roadArchitect_utilities
editor_roadArchitect_utilities = {}

--- Small angle between two vectors of arbitrary length, in radians.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:494
---@param a vec3 Vector A.
---@param b vec3 Vector B.
---@return number  Angle in [0, pi].
function editor_roadArchitect_utilities.angleBetweenVecs(a, b) end

--- Like angleBetweenVecs after projecting the vectors onto the XY plane.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:497
---@param a vec3 Vector A.
---@param b vec3 Vector B.
---@return number  Angle in radians.
function editor_roadArchitect_utilities.angleBetweenVecs2D(a, b) end

--- Fits a 2D circle through three points; returns its center.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:459
---@param p1 vec3 Point 1.
---@param p2 vec3 Point 2.
---@param p3 vec3 Point 3.
---@return vec3|nil  Center of the circle, or nil (with a second nil) if the points are nearly collinear.
function editor_roadArchitect_utilities.circle2DFrom3Points(p1, p2, p3) end

--- 2D angle between two vectors in the direction given by the sign of the cross product: returns the angle if cross < 0, otherwise 2*pi - angle.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:500
---@param v1 vec3 First vector.
---@param v2 vec3 Second vector.
---@return number  Angle in [0, 2*pi].
function editor_roadArchitect_utilities.clockwiseAngleBetweenVecs2D(v1, v2) end

--- 2D bounding box of all nodes of all roads.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:101
---@param roads table List of roads.
---@return table  {xMin, xMax, yMin, yMax}.
function editor_roadArchitect_utilities.computeAABB2DAllRoads(roads) end

--- 2D bounding box of only the nodes listed in the group. If group is nil, uses all nodes of all roads.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:117
---@param group table|nil Group with list = {{r = name, n = node index}}.
---@param roads table List of roads.
---@param map table<string, integer> Table name -> road index.
---@return table  {xMin, xMax, yMin, yMax}.
function editor_roadArchitect_utilities.computeAABB2DGroup(group, roads, map) end

--- Finds the index of the renderData division point that corresponds to a node (2D comparison with a tolerance). Returns 1 by default.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:287
---@param nIdx integer Index of the node.
---@param road table Road.
---@return integer  Division index.
function editor_roadArchitect_utilities.computeDivIndicesFromNode(nIdx, road) end

--- Computes the cumulative length from the start of the road for each division point of the renderData (following the centerline).
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:232
---@param rD table renderData of the road.
---@return number[]  Cumulative lengths in meters (lengths[1] = 0).
function editor_roadArchitect_utilities.computeRoadLength(rD) end

--- 2D distance between two points given by components.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:158
---@param x1 number x of point 1.
---@param y1 number y of point 1.
---@param x2 number x of point 2.
---@param y2 number y of point 2.
---@return number  Distance.
function editor_roadArchitect_utilities.distance2D(x1, y1, x2, y2) end

--- Displays at a position two debug texts: the road name and its position in the automatic junction.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:57
---@param pos vec3 Text position.
---@param rName string Road name.
---@param rLie string Position text (lie).
function editor_roadArchitect_utilities.drawAutoJctMarkup(pos, rName, rLie) end

--- Like drawSphere, with the group sphere color.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:47
---@param pos vec3 Center.
function editor_roadArchitect_utilities.drawGroupSphere(pos) end

--- Highlight sphere of given radius.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:51
---@param pos vec3 Center.
---@param rad number Radius in meters.
function editor_roadArchitect_utilities.drawHighlightSphereRad(pos, rad) end

--- Draws a purple debug line (thickness 5) between two points.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:54
---@param p1 vec3 Start.
---@param p2 vec3 End.
function editor_roadArchitect_utilities.drawPurpleLine(p1, p2) end

--- Draws a debug sphere whose radius grows with sqrt(camera distance) to keep a roughly constant apparent size.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:46
---@param pos vec3 Center.
function editor_roadArchitect_utilities.drawSphere(pos) end

--- Highlight sphere (highlight color).
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:48
---@param pos vec3 Center.
function editor_roadArchitect_utilities.drawSphereHighlight(pos) end

--- Purple highlight sphere.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:50
---@param pos vec3 Center.
function editor_roadArchitect_utilities.drawSphereHighlightPurple(pos) end

--- Red highlight sphere.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:49
---@param pos vec3 Center.
function editor_roadArchitect_utilities.drawSphereHighlightRed(pos) end

--- Finds the two division point indices that bracket a given length along the road. Out of range, returns the first two or the last two indices.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:271
---@param pEval number Length to locate.
---@param lengths number[] Cumulative lengths (computeRoadLength).
---@return integer  Lower index.
---@return integer  Upper index.
function editor_roadArchitect_utilities.findBounds(pEval, lengths) end

--- Extracts the file name (with extension) after the last '/'.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:217
---@param path string Path.
---@return string|nil  File name.
function editor_roadArchitect_utilities.getFilenameFromPath(path) end

--- Half-width of the road at the first point of the renderData (assumes a constant width).
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:260
---@param r table Road (with renderData).
---@return number  Half-width in meters.
function editor_roadArchitect_utilities.getHalfWidthAtNode(r) end

--- Quaternion that rotates v1 toward v2 (v1 and v2 are normalized in place). Special cases: nearly identical vectors -> identity; opposite -> rotation of pi around an orthogonal axis.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:522
---@param v1 vec3 Start vector (modified).
---@param v2 vec3 End vector (modified).
---@return quat  Rotation.
function editor_roadArchitect_utilities.getRotationBetweenVecs(v1, v2) end

--- (2D) intersection of two segments [p1,p2] and [q1,q2]. Returns nil if they do not cross.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:382
---@param p1 vec3 Start of segment 1.
---@param p2 vec3 End of segment 1.
---@param q1 vec3 Start of segment 2.
---@param q2 vec3 End of segment 2.
---@return vec3|nil  Intersection point (z = 0). Collinear cases: division by zero possible (inferred from code).
function editor_roadArchitect_utilities.intersection2LineSegs(p1, p2, q1, q2) end

--- (2D) intersection of the infinite lines (p1,p2) and (p3,p4). Returns nil if they are parallel.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:343
---@param p1 vec3 Point of line 1.
---@param p2 vec3 Second point of line 1.
---@param p3 vec3 Point of line 2.
---@param p4 vec3 Second point of line 2.
---@return vec3|nil  Intersection point (z = 0).
function editor_roadArchitect_utilities.intersection2Lines(p1, p2, p3, p4) end

--- Intersection points of a 2D segment with a circle.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:394
---@param x1 number x start.
---@param y1 number y start.
---@param x2 number x end.
---@param y2 number y end.
---@param cx number x of the center.
---@param cy number y of the center.
---@param r number Radius.
---@return table<integer, {[1]: number, [2]: number}>|nil  List of points {x, y} located on the segment, or nil if there are none.
function editor_roadArchitect_utilities.intersectionLineSegmentCircle(x1, y1, x2, y2, cx, cy, r) end

--- True if the point is inside the 2D box {xMin, xMax, yMin, yMax} (bounds included).
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:553
---@param p vec3 Point.
---@param box table Box.
---@return boolean  true if inside.
function editor_roadArchitect_utilities.isInBox(p, box) end

--- Indicates whether a division point index is inside a tunnel (between t.s + extraS and t.e - extraE - 1).
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:309
---@param idx integer Division point index.
---@param tunnels table List of tunnels {s, e}.
---@param extraS integer Margin at the start.
---@param extraE integer Margin at the end.
---@return boolean  true if inside a tunnel.
function editor_roadArchitect_utilities.isInTunnel(idx, tunnels, extraS, extraE) end

--- Looks for nodes of other roads close (2D distance) to the selected node, for snapping/junction. The ends (first/last node) and the intermediate nodes are returned in separate lists. Ignores locked nodes and non-visible roads.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:162
---@param roads table List of roads.
---@param selectedRoadIdx integer Road to exclude.
---@param selectedNodeIdx integer Reference node.
---@return boolean  true if at least one nearby node exists.
---@return integer[]  Road indices of the nearby ends.
---@return integer[]  Corresponding node indices.
---@return integer[]  Road indices of the nearby intermediate nodes.
---@return integer[]  Corresponding node indices.
function editor_roadArchitect_utilities.isMouseCloseToNode(roads, selectedRoadIdx, selectedNodeIdx) end

--- True if the mouse is over no ImGui element, no window and not the axes gizmo (so over the 3D view).
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:63
---@return boolean  true if the mouse is over the scene.
function editor_roadArchitect_utilities.isMouseHoveringOverTerrain() end

--- Checks whether the mouse hovers a road node (roads whose node spheres and visibility are active, excluding locked nodes). Returns nil, nil, nil if the mouse is not over the scene or over no node.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:74
---@param roads table List of roads.
---@return boolean|nil  true if a node is hovered.
---@return integer|nil  Road index.
---@return integer|nil  Node index.
function editor_roadArchitect_utilities.isMouseOverNode(roads) end

--- True if the point is directly above the terrain (and not a bridge): compares the terrain height with that of a ray cast downward from 4.5 m above (tolerance 0.25 m).
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:559
---@param p vec3 Point.
---@return boolean  true if on the terrain.
function editor_roadArchitect_utilities.isOverTerrain(p) end

--- True if the point is to the left of the directed line p1 -> p2 (2D).
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:550
---@param p vec3 Point tested.
---@param p1 vec3 Start of the line.
---@param p2 vec3 End of the line.
---@return boolean  true if on the left.
function editor_roadArchitect_utilities.isPointOnLeftSideOfLine(p, p1, p2) end

--- World position pointed at by the mouse: static raycast from the camera, range 1000 m.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:66
---@return vec3  Point hit.
function editor_roadArchitect_utilities.mouseOnMapPos() end

--- Linearly interpolates in a polyline (positions and normals) at length q. Returns nil, nil if q is outside the range of lengths.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:320
---@param pos vec3[] Points of the polyline.
---@param nml vec3[] Normals at the points.
---@param lens number[] Cumulative lengths.
---@param q number Evaluation length.
---@return vec3|nil  Interpolated position.
---@return vec3|nil  Interpolated and normalized normal.
function editor_roadArchitect_utilities.polyLerp(pos, nml, lens, q) end

--- Projects a point onto the line (a,b) in 2D; the point's z is kept.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:432
---@param p vec3 Point.
---@param a vec3 Point of the line.
---@param b vec3 Second point of the line.
---@return vec3  Projected point.
function editor_roadArchitect_utilities.projectPointToLine(p, a, b) end

--- Random integer in [a, b] (bounds included; a and b are swapped if a > b).
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:567
---@param a integer Bound.
---@param b integer Bound.
---@return integer  Draw.
function editor_roadArchitect_utilities.randomInRange(a, b) end

--- Removes the extension (dot included) from a file name; returns it as is if it has none.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:220
---@param filename string File name.
---@return string  Name without extension.
function editor_roadArchitect_utilities.removeExtension(filename) end

--- Returns the folder of a path (trailing separator included), or '' if there is no separator.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:223
---@param path string Path.
---@return string  Folder path.
function editor_roadArchitect_utilities.removeFileNameFromPath(path) end

--- Rotates v around the unit axis k by an angle theta (Rodrigues formula).
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:516
---@param v vec3 Vector.
---@param k vec3 Unit axis.
---@param theta number Angle in radians.
---@return vec3  Rotated vector.
function editor_roadArchitect_utilities.rotateVecAroundAxis(v, k, theta) end

--- Rotates a vector by a quaternion (q is normalized in place).
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:544
---@param v vec3 Vector.
---@param q quat Quaternion (modified).
---@return vec3  Rotated vector.
function editor_roadArchitect_utilities.rotateVecByQuaternion(v, q) end

--- Rounds to two decimals.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:149
---@param num number Value.
---@return number  Rounded value.
function editor_roadArchitect_utilities.round2(num) end

--- Spherical interpolation between two unit vectors (see notes on the formula).
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:475
---@param v1 vec3 Start vector (unit).
---@param v2 vec3 End vector (unit).
---@param t number Parameter in [0, 1].
---@return vec3  Interpolated vector.
function editor_roadArchitect_utilities.slerp(v1, v2, t) end

--- Squared 2D distance between two points (z ignored).
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:152
---@param a vec3 Point A.
---@param b vec3 Point B.
---@return number  Squared distance.
function editor_roadArchitect_utilities.sqDist2D(a, b) end

--- Adds a placed group index to r.groupIdx if it is not already there.
---Source: lua/ge/extensions/editor/roadArchitect/utilities.lua:134
---@param r table Road.
---@param placedGroupIdx integer Group index.
function editor_roadArchitect_utilities.tryAddGroupIdxToRoad(r, placedGroupIdx) end

