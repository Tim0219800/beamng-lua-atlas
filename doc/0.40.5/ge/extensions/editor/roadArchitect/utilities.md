# `editor_roadArchitect_utilities`

*Fichier : `lua/ge/extensions/editor/roadArchitect/utilities.lua` · VM : Game Engine (GE) · 635 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_utilities` : `extensions.load("editor_roadArchitect_utilities")`, puis la globale `editor_roadArchitect_utilities`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_utilities.angleBetweenVecs(a, b)` | Computes the (small) angle between two vectors of arbitrary length, in radians. | 494 |
| `editor_roadArchitect_utilities.angleBetweenVecs2D(a, b)` | Computes the (small) angle between two vectors (converted to 2D first). | 497 |
| `editor_roadArchitect_utilities.circle2DFrom3Points(p1, p2, p3)` | Attemps to fit a circle (2D) to three given points. | 459 |
| `editor_roadArchitect_utilities.clockwiseAngleBetweenVecs2D(v1, v2)` | Computes the clockwise angle between the two given vectors, in 2D | 500 |
| `editor_roadArchitect_utilities.computeAABB2DAllRoads(roads)` | Computes the 2D axis-aligned bounding box of all roads in the session. | 101 |
| `editor_roadArchitect_utilities.computeAABB2DGroup(group, roads, map)` | Computes the 2D axis-aligned bounding box of the given group.<br> [Only nodes in the group are included - not all nodes in each group road].<br> When group is nil (whole-network terraform), uses every node of every road. | 117 |
| `editor_roadArchitect_utilities.computeDivIndicesFromNode(nIdx, road)` | For a given node, find the corresponding div index in the road render data. | 287 |
| `editor_roadArchitect_utilities.computeRoadLength(rD)` | Computes the lengths (from road start) of each div point in the given render data. | 232 |
| `editor_roadArchitect_utilities.distance2D(x1, y1, x2, y2)` | Computes the 2D distance between two points, given component-wise. | 158 |
| `editor_roadArchitect_utilities.drawAutoJctMarkup(pos, rName, rLie)` | Draw text markup for auto junctions. | 57 |
| `editor_roadArchitect_utilities.drawGroupSphere(pos)` |  | 47 |
| `editor_roadArchitect_utilities.drawHighlightSphereRad(pos, rad)` |  | 51 |
| `editor_roadArchitect_utilities.drawPurpleLine(p1, p2)` | Draw lines. | 54 |
| `editor_roadArchitect_utilities.drawSphere(pos)` | Draws spheres (for various purposes).<br> [The size of the sphere varies with the camera distance, so as to keep the sphere about the same size]. | 46 |
| `editor_roadArchitect_utilities.drawSphereHighlight(pos)` |  | 48 |
| `editor_roadArchitect_utilities.drawSphereHighlightPurple(pos)` |  | 50 |
| `editor_roadArchitect_utilities.drawSphereHighlightRed(pos)` |  | 49 |
| `editor_roadArchitect_utilities.findBounds(pEval, lengths)` | Finds the lower and upper bounding div point index of a given length along a road. | 271 |
| `editor_roadArchitect_utilities.getFilenameFromPath(path)` | Function to extract filename and extension from a path. | 217 |
| `editor_roadArchitect_utilities.getHalfWidthAtNode(r)` | Computes the half width of the given road (at the first node - assumes width is equal throughout). | 260 |
| `editor_roadArchitect_utilities.getRotationBetweenVecs(v1, v2)` | Computes the rotation between two vectors. | 522 |
| `editor_roadArchitect_utilities.intersection2LineSegs(p1, p2, q1, q2)` | Function to find the intersection point between two line segments. | 382 |
| `editor_roadArchitect_utilities.intersection2Lines(p1, p2, p3, p4)` | Finds the intersection between two lines (p1 -> p2), (p3 -> p4). | 343 |
| `editor_roadArchitect_utilities.intersectionLineSegmentCircle(x1, y1, x2, y2, cx, cy, r)` | Function to find the intersection between a 2D line segment and a circle. | 394 |
| `editor_roadArchitect_utilities.isInBox(p, box)` | Determines if the given point is inside the given 2D Axis-Aligned bounding box. | 553 |
| `editor_roadArchitect_utilities.isInTunnel(idx, tunnels, extraS, extraE)` | Determines if a given div point index is inside a tunnel or not. | 309 |
| `editor_roadArchitect_utilities.isMouseCloseToNode(roads, selectedRoadIdx, selectedNodeIdx)` | Checks if the mouse is close to any existing node, excluding a given avoid road.<br> [The road and node indices are returned for every road/node combo which is found]. | 162 |
| `editor_roadArchitect_utilities.isMouseHoveringOverTerrain()` | Tests if mouse is hovering over the terrain (as opposed to any windows, etc). | 63 |
| `editor_roadArchitect_utilities.isMouseOverNode(roads)` | Checks if the mouse is hovering over any existing reference node. If so, returns the relevant data.<br> [The road and node indices are returned]. | 74 |
| `editor_roadArchitect_utilities.isOverTerrain(p)` | Determines if the given point is directly over the terrain (rather than over a bridge). | 559 |
| `editor_roadArchitect_utilities.isPointOnLeftSideOfLine(p, p1, p2)` |  | 550 |
| `editor_roadArchitect_utilities.mouseOnMapPos()` | Computes the position on the map at which the mouse points. | 66 |
| `editor_roadArchitect_utilities.polyLerp(pos, nml, lens, q)` | Linearly interpolates into a given polyline, including the orthonormal frame. | 320 |
| `editor_roadArchitect_utilities.projectPointToLine(p, a, b)` | Function to project point p onto the line defined by points a and b (in 2D). | 432 |
| `editor_roadArchitect_utilities.randomInRange(a, b)` | Returns a random integer in range [a, b] inclusive. | 567 |
| `editor_roadArchitect_utilities.removeExtension(filename)` | Function to remove the three-letter extension (and dot) from a filename. | 220 |
| `editor_roadArchitect_utilities.removeFileNameFromPath(path)` | Function to remove the filename and extension from the given path | 223 |
| `editor_roadArchitect_utilities.rotateVecAroundAxis(v, k, theta)` | Rotates vector v around unit axis k, by angle theta (in radians).<br> [This function uses the standard Rodrigues formula]. | 516 |
| `editor_roadArchitect_utilities.rotateVecByQuaternion(v, q)` | Function to rotate a vector by a quaternion. | 544 |
| `editor_roadArchitect_utilities.round2(num)` | Rounds the given floating-point number to two decimal places. | 149 |
| `editor_roadArchitect_utilities.slerp(v1, v2, t)` | Performs spherical linear interpolation between two vectors. | 475 |
| `editor_roadArchitect_utilities.sqDist2D(a, b)` | Computes the squared 2D distance between two points (which may be 3D-valued). | 152 |
| `editor_roadArchitect_utilities.tryAddGroupIdxToRoad(r, placedGroupIdx)` | Adds the given placed group index to the given road, if it is not already there. | 134 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/utilities.lua`.*
