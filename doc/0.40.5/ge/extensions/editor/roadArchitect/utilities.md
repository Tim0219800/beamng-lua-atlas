# `editor_roadArchitect_utilities`

*File: `lua/ge/extensions/editor/roadArchitect/utilities.lua` · VM: Game Engine (GE) · 635 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_utilities`: `extensions.load("editor_roadArchitect_utilities")`, then the global `editor_roadArchitect_utilities`

Road Architect toolbox: drawing of debug spheres/lines, mouse detection on the terrain or on a node, road bounding box computations, file path manipulation, and many 2D/3D geometry functions (intersections, projections, circle through 3 points, angles, rotations, slerp). A modder can reuse the pure geometry functions; the drawing or mouse functions assume the editor is active.

## Example

```lua
local util = extensions.editor_roadArchitect_utilities
local p = util.intersection2Lines(vec3(0,0,0), vec3(10,0,0), vec3(5,-5,0), vec3(5,5,0))  -- vec3(5,0,0)
local a = util.angleBetweenVecs2D(vec3(1,0,0), vec3(0,1,0))  -- pi/2
```

## Notes

- The 2D functions ignore the z coordinate. Angles are in radians.
- Functions that MODIFY their arguments: getRotationBetweenVecs normalizes v1 and v2 in place; rotateVecByQuaternion normalizes q in place.
- circle2DFrom3Points only returns the center (vec3 without radius); returns nil, nil if the points are collinear.
- getFilenameFromPath only splits on '/', whereas removeFileNameFromPath accepts '/' and '\' and keeps the trailing separator.
- slerp: the angle is multiplied by t then used in sin((1-t)*theta): this is not the standard slerp formula, result to be checked before precise use (inferred from code).
- The drawing functions use dbgDraw and the distance to the camera: the sphere size is proportional to sqrt(distance).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadArchitect_utilities.angleBetweenVecs(a, b)` | Small angle between two vectors of arbitrary length, in radians. | 494 |
| `editor_roadArchitect_utilities.angleBetweenVecs2D(a, b)` | Like angleBetweenVecs after projecting the vectors onto the XY plane. | 497 |
| `editor_roadArchitect_utilities.circle2DFrom3Points(p1, p2, p3)` | Fits a 2D circle through three points; returns its center. | 459 |
| `editor_roadArchitect_utilities.clockwiseAngleBetweenVecs2D(v1, v2)` | 2D angle between two vectors in the direction given by the sign of the cross product: returns the angle if cross < 0, otherwise 2*pi - angle. | 500 |
| `editor_roadArchitect_utilities.computeAABB2DAllRoads(roads)` | 2D bounding box of all nodes of all roads. | 101 |
| `editor_roadArchitect_utilities.computeAABB2DGroup(group, roads, map)` | 2D bounding box of only the nodes listed in the group. If group is nil, uses all nodes of all roads. | 117 |
| `editor_roadArchitect_utilities.computeDivIndicesFromNode(nIdx, road)` | Finds the index of the renderData division point that corresponds to a node (2D comparison with a tolerance). Returns 1 by default. | 287 |
| `editor_roadArchitect_utilities.computeRoadLength(rD)` | Computes the cumulative length from the start of the road for each division point of the renderData (following the centerline). | 232 |
| `editor_roadArchitect_utilities.distance2D(x1, y1, x2, y2)` | 2D distance between two points given by components. | 158 |
| `editor_roadArchitect_utilities.drawAutoJctMarkup(pos, rName, rLie)` | Displays at a position two debug texts: the road name and its position in the automatic junction. | 57 |
| `editor_roadArchitect_utilities.drawGroupSphere(pos)` | Like drawSphere, with the group sphere color. | 47 |
| `editor_roadArchitect_utilities.drawHighlightSphereRad(pos, rad)` | Highlight sphere of given radius. | 51 |
| `editor_roadArchitect_utilities.drawPurpleLine(p1, p2)` | Draws a purple debug line (thickness 5) between two points. | 54 |
| `editor_roadArchitect_utilities.drawSphere(pos)` | Draws a debug sphere whose radius grows with sqrt(camera distance) to keep a roughly constant apparent size. | 46 |
| `editor_roadArchitect_utilities.drawSphereHighlight(pos)` | Highlight sphere (highlight color). | 48 |
| `editor_roadArchitect_utilities.drawSphereHighlightPurple(pos)` | Purple highlight sphere. | 50 |
| `editor_roadArchitect_utilities.drawSphereHighlightRed(pos)` | Red highlight sphere. | 49 |
| `editor_roadArchitect_utilities.findBounds(pEval, lengths)` | Finds the two division point indices that bracket a given length along the road. Out of range, returns the first two or the last two indices. | 271 |
| `editor_roadArchitect_utilities.getFilenameFromPath(path)` | Extracts the file name (with extension) after the last '/'. | 217 |
| `editor_roadArchitect_utilities.getHalfWidthAtNode(r)` | Half-width of the road at the first point of the renderData (assumes a constant width). | 260 |
| `editor_roadArchitect_utilities.getRotationBetweenVecs(v1, v2)` | Quaternion that rotates v1 toward v2 (v1 and v2 are normalized in place). Special cases: nearly identical vectors -> identity; opposite -> rotation of pi around an orthogonal axis. | 522 |
| `editor_roadArchitect_utilities.intersection2LineSegs(p1, p2, q1, q2)` | (2D) intersection of two segments [p1,p2] and [q1,q2]. Returns nil if they do not cross. | 382 |
| `editor_roadArchitect_utilities.intersection2Lines(p1, p2, p3, p4)` | (2D) intersection of the infinite lines (p1,p2) and (p3,p4). Returns nil if they are parallel. | 343 |
| `editor_roadArchitect_utilities.intersectionLineSegmentCircle(x1, y1, x2, y2, cx, cy, r)` | Intersection points of a 2D segment with a circle. | 394 |
| `editor_roadArchitect_utilities.isInBox(p, box)` | True if the point is inside the 2D box {xMin, xMax, yMin, yMax} (bounds included). | 553 |
| `editor_roadArchitect_utilities.isInTunnel(idx, tunnels, extraS, extraE)` | Indicates whether a division point index is inside a tunnel (between t.s + extraS and t.e - extraE - 1). | 309 |
| `editor_roadArchitect_utilities.isMouseCloseToNode(roads, selectedRoadIdx, selectedNodeIdx)` | Looks for nodes of other roads close (2D distance) to the selected node, for snapping/junction. The ends (first/last node) and the intermediate nodes are returned in separate lists. Ignores locked nodes and non-visible roads. | 162 |
| `editor_roadArchitect_utilities.isMouseHoveringOverTerrain()` | True if the mouse is over no ImGui element, no window and not the axes gizmo (so over the 3D view). | 63 |
| `editor_roadArchitect_utilities.isMouseOverNode(roads)` | Checks whether the mouse hovers a road node (roads whose node spheres and visibility are active, excluding locked nodes). Returns nil, nil, nil if the mouse is not over the scene or over no node. | 74 |
| `editor_roadArchitect_utilities.isOverTerrain(p)` | True if the point is directly above the terrain (and not a bridge): compares the terrain height with that of a ray cast downward from 4.5 m above (tolerance 0.25 m). | 559 |
| `editor_roadArchitect_utilities.isPointOnLeftSideOfLine(p, p1, p2)` | True if the point is to the left of the directed line p1 -> p2 (2D). | 550 |
| `editor_roadArchitect_utilities.mouseOnMapPos()` | World position pointed at by the mouse: static raycast from the camera, range 1000 m. | 66 |
| `editor_roadArchitect_utilities.polyLerp(pos, nml, lens, q)` | Linearly interpolates in a polyline (positions and normals) at length q. Returns nil, nil if q is outside the range of lengths. | 320 |
| `editor_roadArchitect_utilities.projectPointToLine(p, a, b)` | Projects a point onto the line (a,b) in 2D; the point's z is kept. | 432 |
| `editor_roadArchitect_utilities.randomInRange(a, b)` | Random integer in [a, b] (bounds included; a and b are swapped if a > b). | 567 |
| `editor_roadArchitect_utilities.removeExtension(filename)` | Removes the extension (dot included) from a file name; returns it as is if it has none. | 220 |
| `editor_roadArchitect_utilities.removeFileNameFromPath(path)` | Returns the folder of a path (trailing separator included), or '' if there is no separator. | 223 |
| `editor_roadArchitect_utilities.rotateVecAroundAxis(v, k, theta)` | Rotates v around the unit axis k by an angle theta (Rodrigues formula). | 516 |
| `editor_roadArchitect_utilities.rotateVecByQuaternion(v, q)` | Rotates a vector by a quaternion (q is normalized in place). | 544 |
| `editor_roadArchitect_utilities.round2(num)` | Rounds to two decimals. | 149 |
| `editor_roadArchitect_utilities.slerp(v1, v2, t)` | Spherical interpolation between two unit vectors (see notes on the formula). | 475 |
| `editor_roadArchitect_utilities.sqDist2D(a, b)` | Squared 2D distance between two points (z ignored). | 152 |
| `editor_roadArchitect_utilities.tryAddGroupIdxToRoad(r, placedGroupIdx)` | Adds a placed group index to r.groupIdx if it is not already there. | 134 |

### Parameter details

#### `editor_roadArchitect_utilities.angleBetweenVecs(a, b)`

Small angle between two vectors of arbitrary length, in radians.

- `a` (*vec3*) : Vector A.
- `b` (*vec3*) : Vector B.
- **returns**: number Angle in [0, pi].

#### `editor_roadArchitect_utilities.angleBetweenVecs2D(a, b)`

Like angleBetweenVecs after projecting the vectors onto the XY plane.

- `a` (*vec3*) : Vector A.
- `b` (*vec3*) : Vector B.
- **returns**: number Angle in radians.

#### `editor_roadArchitect_utilities.circle2DFrom3Points(p1, p2, p3)`

Fits a 2D circle through three points; returns its center.

- `p1` (*vec3*) : Point 1.
- `p2` (*vec3*) : Point 2.
- `p3` (*vec3*) : Point 3.
- **returns**: vec3|nil Center of the circle, or nil (with a second nil) if the points are nearly collinear.

#### `editor_roadArchitect_utilities.clockwiseAngleBetweenVecs2D(v1, v2)`

2D angle between two vectors in the direction given by the sign of the cross product: returns the angle if cross < 0, otherwise 2*pi - angle.

- `v1` (*vec3*) : First vector.
- `v2` (*vec3*) : Second vector.
- **returns**: number Angle in [0, 2*pi].

#### `editor_roadArchitect_utilities.computeAABB2DAllRoads(roads)`

2D bounding box of all nodes of all roads.

- `roads` (*table*) : List of roads.
- **returns**: table {xMin, xMax, yMin, yMax}.

#### `editor_roadArchitect_utilities.computeAABB2DGroup(group, roads, map)`

2D bounding box of only the nodes listed in the group. If group is nil, uses all nodes of all roads.

- `group` (*table|nil*) : Group with list = {{r = name, n = node index}}.
- `roads` (*table*) : List of roads.
- `map` (*table<string, integer>*) : Table name -> road index.
- **returns**: table {xMin, xMax, yMin, yMax}.

#### `editor_roadArchitect_utilities.computeDivIndicesFromNode(nIdx, road)`

Finds the index of the renderData division point that corresponds to a node (2D comparison with a tolerance). Returns 1 by default.

- `nIdx` (*integer*) : Index of the node.
- `road` (*table*) : Road.
- **returns**: integer Division index.

#### `editor_roadArchitect_utilities.computeRoadLength(rD)`

Computes the cumulative length from the start of the road for each division point of the renderData (following the centerline).

- `rD` (*table*) : renderData of the road.
- **returns**: number[] Cumulative lengths in meters (lengths[1] = 0).

#### `editor_roadArchitect_utilities.distance2D(x1, y1, x2, y2)`

2D distance between two points given by components.

- `x1` (*number*) : x of point 1.
- `y1` (*number*) : y of point 1.
- `x2` (*number*) : x of point 2.
- `y2` (*number*) : y of point 2.
- **returns**: number Distance.

#### `editor_roadArchitect_utilities.drawAutoJctMarkup(pos, rName, rLie)`

Displays at a position two debug texts: the road name and its position in the automatic junction.

- `pos` (*vec3*) : Text position.
- `rName` (*string*) : Road name.
- `rLie` (*string*) : Position text (lie).

#### `editor_roadArchitect_utilities.drawGroupSphere(pos)`

Like drawSphere, with the group sphere color.

- `pos` (*vec3*) : Center.

#### `editor_roadArchitect_utilities.drawHighlightSphereRad(pos, rad)`

Highlight sphere of given radius.

- `pos` (*vec3*) : Center.
- `rad` (*number*) : Radius in meters.

#### `editor_roadArchitect_utilities.drawPurpleLine(p1, p2)`

Draws a purple debug line (thickness 5) between two points.

- `p1` (*vec3*) : Start.
- `p2` (*vec3*) : End.

#### `editor_roadArchitect_utilities.drawSphere(pos)`

Draws a debug sphere whose radius grows with sqrt(camera distance) to keep a roughly constant apparent size.

- `pos` (*vec3*) : Center.

#### `editor_roadArchitect_utilities.drawSphereHighlight(pos)`

Highlight sphere (highlight color).

- `pos` (*vec3*) : Center.

#### `editor_roadArchitect_utilities.drawSphereHighlightPurple(pos)`

Purple highlight sphere.

- `pos` (*vec3*) : Center.

#### `editor_roadArchitect_utilities.drawSphereHighlightRed(pos)`

Red highlight sphere.

- `pos` (*vec3*) : Center.

#### `editor_roadArchitect_utilities.findBounds(pEval, lengths)`

Finds the two division point indices that bracket a given length along the road. Out of range, returns the first two or the last two indices.

- `pEval` (*number*) : Length to locate.
- `lengths` (*number[]*) : Cumulative lengths (computeRoadLength).
- **returns**: integer Lower index.
- **returns**: integer Upper index.

#### `editor_roadArchitect_utilities.getFilenameFromPath(path)`

Extracts the file name (with extension) after the last '/'.

- `path` (*string*) : Path.
- **returns**: string|nil File name.

#### `editor_roadArchitect_utilities.getHalfWidthAtNode(r)`

Half-width of the road at the first point of the renderData (assumes a constant width).

- `r` (*table*) : Road (with renderData).
- **returns**: number Half-width in meters.

#### `editor_roadArchitect_utilities.getRotationBetweenVecs(v1, v2)`

Quaternion that rotates v1 toward v2 (v1 and v2 are normalized in place). Special cases: nearly identical vectors -> identity; opposite -> rotation of pi around an orthogonal axis.

- `v1` (*vec3*) : Start vector (modified).
- `v2` (*vec3*) : End vector (modified).
- **returns**: quat Rotation.

#### `editor_roadArchitect_utilities.intersection2LineSegs(p1, p2, q1, q2)`

(2D) intersection of two segments [p1,p2] and [q1,q2]. Returns nil if they do not cross.

- `p1` (*vec3*) : Start of segment 1.
- `p2` (*vec3*) : End of segment 1.
- `q1` (*vec3*) : Start of segment 2.
- `q2` (*vec3*) : End of segment 2.
- **returns**: vec3|nil Intersection point (z = 0). Collinear cases: division by zero possible (inferred from code).

#### `editor_roadArchitect_utilities.intersection2Lines(p1, p2, p3, p4)`

(2D) intersection of the infinite lines (p1,p2) and (p3,p4). Returns nil if they are parallel.

- `p1` (*vec3*) : Point of line 1.
- `p2` (*vec3*) : Second point of line 1.
- `p3` (*vec3*) : Point of line 2.
- `p4` (*vec3*) : Second point of line 2.
- **returns**: vec3|nil Intersection point (z = 0).

#### `editor_roadArchitect_utilities.intersectionLineSegmentCircle(x1, y1, x2, y2, cx, cy, r)`

Intersection points of a 2D segment with a circle.

- `x1` (*number*) : x start.
- `y1` (*number*) : y start.
- `x2` (*number*) : x end.
- `y2` (*number*) : y end.
- `cx` (*number*) : x of the center.
- `cy` (*number*) : y of the center.
- `r` (*number*) : Radius.
- **returns**: table<integer, {[1]: number, [2]: number}>|nil List of points {x, y} located on the segment, or nil if there are none.

#### `editor_roadArchitect_utilities.isInBox(p, box)`

True if the point is inside the 2D box {xMin, xMax, yMin, yMax} (bounds included).

- `p` (*vec3*) : Point.
- `box` (*table*) : Box.
- **returns**: boolean true if inside.

#### `editor_roadArchitect_utilities.isInTunnel(idx, tunnels, extraS, extraE)`

Indicates whether a division point index is inside a tunnel (between t.s + extraS and t.e - extraE - 1).

- `idx` (*integer*) : Division point index.
- `tunnels` (*table*) : List of tunnels {s, e}.
- `extraS` (*integer*) : Margin at the start.
- `extraE` (*integer*) : Margin at the end.
- **returns**: boolean true if inside a tunnel.

#### `editor_roadArchitect_utilities.isMouseCloseToNode(roads, selectedRoadIdx, selectedNodeIdx)`

Looks for nodes of other roads close (2D distance) to the selected node, for snapping/junction. The ends (first/last node) and the intermediate nodes are returned in separate lists. Ignores locked nodes and non-visible roads.

- `roads` (*table*) : List of roads.
- `selectedRoadIdx` (*integer*) : Road to exclude.
- `selectedNodeIdx` (*integer*) : Reference node.
- **returns**: boolean true if at least one nearby node exists.
- **returns**: integer[] Road indices of the nearby ends.
- **returns**: integer[] Corresponding node indices.
- **returns**: integer[] Road indices of the nearby intermediate nodes.
- **returns**: integer[] Corresponding node indices.

#### `editor_roadArchitect_utilities.isMouseHoveringOverTerrain()`

True if the mouse is over no ImGui element, no window and not the axes gizmo (so over the 3D view).

- **returns**: boolean true if the mouse is over the scene.

#### `editor_roadArchitect_utilities.isMouseOverNode(roads)`

Checks whether the mouse hovers a road node (roads whose node spheres and visibility are active, excluding locked nodes). Returns nil, nil, nil if the mouse is not over the scene or over no node.

- `roads` (*table*) : List of roads.
- **returns**: boolean|nil true if a node is hovered.
- **returns**: integer|nil Road index.
- **returns**: integer|nil Node index.

#### `editor_roadArchitect_utilities.isOverTerrain(p)`

True if the point is directly above the terrain (and not a bridge): compares the terrain height with that of a ray cast downward from 4.5 m above (tolerance 0.25 m).

- `p` (*vec3*) : Point.
- **returns**: boolean true if on the terrain.

#### `editor_roadArchitect_utilities.isPointOnLeftSideOfLine(p, p1, p2)`

True if the point is to the left of the directed line p1 -> p2 (2D).

- `p` (*vec3*) : Point tested.
- `p1` (*vec3*) : Start of the line.
- `p2` (*vec3*) : End of the line.
- **returns**: boolean true if on the left.

#### `editor_roadArchitect_utilities.mouseOnMapPos()`

World position pointed at by the mouse: static raycast from the camera, range 1000 m.

- **returns**: vec3 Point hit.

#### `editor_roadArchitect_utilities.polyLerp(pos, nml, lens, q)`

Linearly interpolates in a polyline (positions and normals) at length q. Returns nil, nil if q is outside the range of lengths.

- `pos` (*vec3[]*) : Points of the polyline.
- `nml` (*vec3[]*) : Normals at the points.
- `lens` (*number[]*) : Cumulative lengths.
- `q` (*number*) : Evaluation length.
- **returns**: vec3|nil Interpolated position.
- **returns**: vec3|nil Interpolated and normalized normal.

#### `editor_roadArchitect_utilities.projectPointToLine(p, a, b)`

Projects a point onto the line (a,b) in 2D; the point's z is kept.

- `p` (*vec3*) : Point.
- `a` (*vec3*) : Point of the line.
- `b` (*vec3*) : Second point of the line.
- **returns**: vec3 Projected point.

#### `editor_roadArchitect_utilities.randomInRange(a, b)`

Random integer in [a, b] (bounds included; a and b are swapped if a > b).

- `a` (*integer*) : Bound.
- `b` (*integer*) : Bound.
- **returns**: integer Draw.

#### `editor_roadArchitect_utilities.removeExtension(filename)`

Removes the extension (dot included) from a file name; returns it as is if it has none.

- `filename` (*string*) : File name.
- **returns**: string Name without extension.

#### `editor_roadArchitect_utilities.removeFileNameFromPath(path)`

Returns the folder of a path (trailing separator included), or '' if there is no separator.

- `path` (*string*) : Path.
- **returns**: string Folder path.

#### `editor_roadArchitect_utilities.rotateVecAroundAxis(v, k, theta)`

Rotates v around the unit axis k by an angle theta (Rodrigues formula).

- `v` (*vec3*) : Vector.
- `k` (*vec3*) : Unit axis.
- `theta` (*number*) : Angle in radians.
- **returns**: vec3 Rotated vector.

#### `editor_roadArchitect_utilities.rotateVecByQuaternion(v, q)`

Rotates a vector by a quaternion (q is normalized in place).

- `v` (*vec3*) : Vector.
- `q` (*quat*) : Quaternion (modified).
- **returns**: vec3 Rotated vector.

#### `editor_roadArchitect_utilities.round2(num)`

Rounds to two decimals.

- `num` (*number*) : Value.
- **returns**: number Rounded value.

#### `editor_roadArchitect_utilities.slerp(v1, v2, t)`

Spherical interpolation between two unit vectors (see notes on the formula).

- `v1` (*vec3*) : Start vector (unit).
- `v2` (*vec3*) : End vector (unit).
- `t` (*number*) : Parameter in [0, 1].
- **returns**: vec3 Interpolated vector.

#### `editor_roadArchitect_utilities.sqDist2D(a, b)`

Squared 2D distance between two points (z ignored).

- `a` (*vec3*) : Point A.
- `b` (*vec3*) : Point B.
- **returns**: number Squared distance.

#### `editor_roadArchitect_utilities.tryAddGroupIdxToRoad(r, placedGroupIdx)`

Adds a placed group index to r.groupIdx if it is not already there.

- `r` (*table*) : Road.
- `placedGroupIdx` (*integer*) : Group index.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/utilities.lua`.*
