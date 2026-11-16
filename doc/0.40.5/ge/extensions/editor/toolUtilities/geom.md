# `editor_toolUtilities_geom`

*File: `lua/ge/extensions/editor/toolUtilities/geom.lua` · VM: Game Engine (GE) · 3236 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_geom`: `extensions.load("editor_toolUtilities_geom")`, then the global `editor_toolUtilities_geom`

Geometry library of the editor's spline editing tools (roads, rails, fences, buildings): Catmull-Rom spline interpolation (free, raycast, terrain-conforming, with banking), Frenet frame, arc-length sampling, 2D polygon geometry (point in ring, clipping to a box, beveled offset/inset, ear clipping triangulation with holes), intersections, distances, mouse hover, spline cutting/joining and terrain utilities. A "spline" is a table with nodes, widths, nmls (input) and divPoints, divWidths, normals, tangents, binormals, discMap (computed outputs).

## Notes

- Internal constants: minimum division 10 per segment, maximum spacing 20 m between division points (hard cap 2000), polygon end margin 10 m, mouse-node tolerance 2 m, maximum banking 15 degrees, banking setting 500, cut gap 2 m.
- The "2D" functions take {x, y} points (tables with x and y are enough, not necessarily vec3); the scalar functions (cross2, dot2, distSqPointSeg2D...) avoid any allocation for hot loops.
- Units: meters, radians except signedAngleAroundAxis (degrees).
- Tricky argument order: perpDistPointSeg2D takes the segment (ax, ay, bx, by) first then the point (px, py), the reverse of distSqPointSeg2D.
- The module uses kdtreebox2d and editor/toolUtilities/util; some functions call editor APIs (getCameraMouseRay, core_terrain).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_geom.angleBetweenVecs(a, b)` | Small angle between two vectors of arbitrary length (rad). | 1600 |
| `editor_toolUtilities_geom.angleBetweenVecsNorm(a, b)` | Small angle between two unit vectors (rad). | 1597 |
| `editor_toolUtilities_geom.applyBankFraction(spline, bankT, peakRad)` | Rolls the frame per station of a spline according to a READY-MADE banking fraction (bankT[i] in [-1, 1], + = left curve), peakRad being the angle reached by a full-amplitude station. The caller handles the curvature -> fraction mapping and the arc-length blending (otherwise the banking becomes a square wave). | 2204 |
| `editor_toolUtilities_geom.bridgeHoles2D(outer, holes, count)` | Merges hole rings into the outer ring by bridge edges. count caps the number of holes taken. | 1281 |
| `editor_toolUtilities_geom.catmullRomCentripetalFast(p0, p1, p2, p3, t, s, outVec)` | Fast, allocation-free version of catmullRomCentripetal. If outVec is provided, writes into it and returns it; otherwise creates a vec3. | 2471 |
| `editor_toolUtilities_geom.catmullRomConformToTerrain(spline, minNumDivIn, minSpacing, rayRaise)` | Like catmullRomRaycast but the points are conformed to the terrain. Falls back to catmullRomRaycast if there is no terrain block. | 2804 |
| `editor_toolUtilities_geom.catmullRomFree(spline, minNumDivIn, deckZ, maxSpacingIn)` | Interpolates nodes and widths with standard Catmull-Rom (centripetal XY; Z by Steffen for a ground road, smooth Catmull-Rom for an elevated deck if deckZ). The data is stored in the spline. | 2860 |
| `editor_toolUtilities_geom.catmullRomFreeWithBanking(spline, minNumDivIn, bankStrength, maxDegIn, tuningIn, deckZ, maxSpacingIn)` | Like catmullRomFree with automatic banking and blending. | 2918 |
| `editor_toolUtilities_geom.catmullRomNodesOnly(nodes, gran)` | Interpolates the given points with Catmull-Rom. | 2590 |
| `editor_toolUtilities_geom.catmullRomNodesWidthsOnly(nodes, widths, gran, isLoop)` | Interpolates points and widths with Catmull-Rom (a single array of nodes). | 2613 |
| `editor_toolUtilities_geom.catmullRomNodesWidthsVelVelLimits(spline, gran)` | Interpolates points, widths, speeds and speed limits of a spline with Catmull-Rom (a single array of nodes). | 2645 |
| `editor_toolUtilities_geom.catmullRomRaycast(spline, minNumDivIn, minSpacing, rayRaise)` | Interpolates the nodes and widths of a spline with standard Catmull-Rom to produce its secondary geometry; points are placed by raycast onto the surface below. The data is stored in the spline (divPoints, divWidths, normals, discMap). | 2753 |
| `editor_toolUtilities_geom.chordify(pts, n, chord, flags)` | Reduces a tessellated curve to chords of about chord meters; flagged points (flags) are always kept, as are the ends. | 945 |
| `editor_toolUtilities_geom.clipRingRect2D(pts, x0, x1, y0, y1)` | Clips a ring to the box x0..x1, y0..y1. A concave ring comes back as a single ring that runs along the edge of the box between its pieces, which covers the same area in the box. | 1123 |
| `editor_toolUtilities_geom.closestPointOnPolyline(pts, p, outPos)` | Closest point to p on a 3D polyline. Writes the result into outPos and returns the squared distance. | 77 |
| `editor_toolUtilities_geom.closestPointOnPolyline2D(pts, p, outPos, tMin, tMax, closed)` | Closest point to p on a polyline, measured in XY (Z interpolated). Writes into outPos and returns the squared distance. | 123 |
| `editor_toolUtilities_geom.closestRibbonSegPointToPoint(segIdx, ribbon, p)` | Closest point, on a given ribbon segment, to a given point. | 1897 |
| `editor_toolUtilities_geom.computeFrenetFrame(spline)` | Computes the local Frenet frame at each division point (tangents, binormals, normals). Zero-length segments must not be normalized (otherwise NaN binormals and infinite DecalRoad nodes). | 2689 |
| `editor_toolUtilities_geom.computeGraphPathFromNodes(spline)` | Computes the graph path from the nodes and fills the spline geometry (divPoints, divWidths, normals). No effect if there are not enough nodes. | 2990 |
| `editor_toolUtilities_geom.computeRandomJitterQuat(spline, tgt, rightVec, nmlVec, outQuat)` | Random variation quaternion, per component. | 2226 |
| `editor_toolUtilities_geom.computeRandomJitterQuatFromFreedomAxes(spline, freedomAxes, outQuat)` | Random variation quaternion based on the joint's freedom axes. | 2249 |
| `editor_toolUtilities_geom.computeRandomJitterQuat_ZOnly(jitter, nmlVec, outQuat)` | Random variation quaternion around Z only. | 2219 |
| `editor_toolUtilities_geom.computeSDF(mask)` | Computes the signed distance field (SDF) of a mask (2D array, 0 = inside). | 2431 |
| `editor_toolUtilities_geom.computeSourcesAABB(sources)` | Bounding box (XY) of the given sources. | 1686 |
| `editor_toolUtilities_geom.computeSplinePolygon(spline, margin, polygon)` | Computes a polygonal outline around a spline (left and right edges at the half-width + margin, extended by 10 m at both ends). Fast to process by scanline spans. Fills the polygon array. | 372 |
| `editor_toolUtilities_geom.computeTurningRadius(p1, p2, p3)` | Radius of curvature approximated by 3 consecutive points (average of the lengths of the two sides divided by tan(angle/2)). | 481 |
| `editor_toolUtilities_geom.cornerAxis(ix, iy, ox, oy, period)` | Direction taken by a post, pillar or bollard PLACED ON A CORNER, from the entry and exit direction: the axis is rotated by half the turn reduced modulo period (default pi/2). Ties go to the smaller turn so that left and right corners mirror each other. | 3070 |
| `editor_toolUtilities_geom.cross2(ax, ay, bx, by)` | 2D scalar cross product of (ax, ay) and (bx, by), on plain components (without allocating a vec3 or a table). | 3059 |
| `editor_toolUtilities_geom.curvatureToBankAngle(curv, bankStrength, maxDeg, tuning)` | Converts a curvature into a banking angle (rad). maxDeg (cap on the tightest turns, default 15) and tuning (curvature at which the cap is reached, default 500) are optional overrides. | 2194 |
| `editor_toolUtilities_geom.densifyByMaxSpacing(points, maxSpacing)` | Densifies a polyline so that no segment exceeds maxSpacing. | 989 |
| `editor_toolUtilities_geom.distSqPointSeg2D(px, py, ax, ay, bx, by)` | Squared distance from the point (px, py) to the FINITE segment AB (t clamped to the segment). For frequent proximity tests. | 1063 |
| `editor_toolUtilities_geom.dot2(ax, ay, bx, by)` | 2D dot product on plain components. | 3061 |
| `editor_toolUtilities_geom.flipSplineDirection(spline)` | Reverses the direction of a spline in place (nodes, normals, corners) and marks spline.isDirty. | 1878 |
| `editor_toolUtilities_geom.getAABB(points)` | Axis-aligned bounding box (XY) of an array of points. | 335 |
| `editor_toolUtilities_geom.getAllQuadrilaterals(sources, margin)` | Builds the quadrilaterals of the sources, with lateral inflation (without longitudinal stretching). | 1700 |
| `editor_toolUtilities_geom.getBarScale()` | Returns the scale factor of the speed bars (height = barScale * speed, 0.5). | 68 |
| `editor_toolUtilities_geom.getNodeSpansInsidePolygon(nodes, polygon)` | Given a polyline and a polygon, returns the runs of consecutive indices that are in the polygon. | 1915 |
| `editor_toolUtilities_geom.getPreRotQuats()` | Returns the table of pre-rotation quaternions indexed from 0 to 3 (0, 90, 180, 270 degrees around Z). | 65 |
| `editor_toolUtilities_geom.getScanlineSpans(gMinY, gMaxY, te, tb, polygon, spansXMin, spansXMax, spansY)` | Computes the scanline spans of a polygon on the Y axis, in terrain grid space. Stores the results in spansXMin, spansXMax and spansY. | 2397 |
| `editor_toolUtilities_geom.getTerrainNormal(p)` | Terrain normal at the given world point. | 420 |
| `editor_toolUtilities_geom.getTerrainNormalInPlace(p, out)` | Terrain normal at the given world point, written into out. | 433 |
| `editor_toolUtilities_geom.insetClosedRing2D(ring, dist)` | Shrinks a closed polygon of {x, y} inward by at most dist, along the average normal of the edges of each vertex (true local inward direction, correct for concave rings). | 1465 |
| `editor_toolUtilities_geom.insetPathAlongNormal2D(path, cx, cy, insetM)` | Offsets a 2D path toward the center (cx, cy) by insetM along the local normal (inferred from code). | 705 |
| `editor_toolUtilities_geom.intersection2LineSegs(p1, p2, q1, q2, out)` | Intersection point of two segments (inline). Returns nil without an intersection. | 502 |
| `editor_toolUtilities_geom.intersectsUpQuadBarycentric(p, q)` | Intersects a point (x, y) with a quad and returns the interpolated height there, or false if outside the quad. | 1672 |
| `editor_toolUtilities_geom.isLineSegIntersect(a, b, c, d)` | Tests whether segment (a, b) crosses segment (c, d). | 496 |
| `editor_toolUtilities_geom.isMouseOverBar(splines)` | Tests whether the mouse hovers a bar (splines with an ordered barPoints array). | 301 |
| `editor_toolUtilities_geom.isMouseOverGraphNode(nodes)` | Tests whether the mouse hovers a node of the navigation graph. | 322 |
| `editor_toolUtilities_geom.isMouseOverNode(splines)` | Tests whether the mouse hovers a node of one of the splines (tolerance 2 m). Each spline must have a nodes array. | 258 |
| `editor_toolUtilities_geom.isMouseOverPolyline(points, mousePos, closed)` | Tests whether the mouse hovers a polyline; closed also tests the edge from the last node to the first. | 280 |
| `editor_toolUtilities_geom.isMouseOverSpline(spline, maxDistSq)` | Tests whether the mouse hovers the spline (to insert a node or hover). Uses the closest camera-ray / axis approach, so elevated roads work. maxDistSq: squared tolerance (math.huge to get the closest point unconditionally). | 2516 |
| `editor_toolUtilities_geom.isPointInTriangle(p, a, b, c)` | Tests whether p is in the triangle (a, b, c) (barycentric coordinates). | 406 |
| `editor_toolUtilities_geom.joinSplineGeometry(n1, w1, nm1, nodeIdx1, n2, w2, nm2, nodeIdx2, c1, c2)` | Joins two spline geometries at the given node indices. Returns nil if the indices are invalid. | 1822 |
| `editor_toolUtilities_geom.lineDirsHitT2D(p0x, p0y, d0x, d0y, p1x, p1y, d1x, d1y, eps)` | Parameter t along p0 + t*d0 at the intersection point with p1 + u*d1; nil if parallel. With d0 unit, t is in meters. | 580 |
| `editor_toolUtilities_geom.lineIntersect2D(px, py, dx, dy, qx, qy, ex, ey, eps)` | Intersection of two INFINITE lines P+s*D and Q+s*E; returns ix, iy or nil if parallel. | 3086 |
| `editor_toolUtilities_geom.linesIntersect2D(a0, a1, b0, b1, eps)` | Intersection of two lines a0-a1 and b0-b1. Returns nil if parallel. | 559 |
| `editor_toolUtilities_geom.multiPolygonCentroidXY(regions)` | Area-weighted centroid of one or more closed 2D rings ({x, y}). Returns cx, cy or nil. | 835 |
| `editor_toolUtilities_geom.normalize2(x, y)` | Normalizes a 2D vector (x, y). | 3063 |
| `editor_toolUtilities_geom.offsetPathFromCenter2D(path, cx, cy, distM, distArr)` | Offsets a 2D polyline away from (cx, cy) along its local normal per vertex. | 816 |
| `editor_toolUtilities_geom.offsetPathMiter2D(pts, dist, cx, cy, z, inward)` | Parallel offset with mitered corners of an OPEN 2D polyline: one output point per vertex (paired rails stay aligned), z kept. Corners keep the true perpendicular width. The side is chosen ONCE for the whole path: away from (cx, cy), or toward it if inward. | 728 |
| `editor_toolUtilities_geom.outsetClosedRing2D(ring, dist)` | Pushes a closed ring OUTWARD by a small distance, mitered corners. | 1400 |
| `editor_toolUtilities_geom.outsetRingSides2D(ring, dist, move)` | Like outsetClosedRing2D but only for the sides designated by move[i]; the others stay exactly on their line. A vertex between a moving side and a fixed side slides along the fixed side: no notch, vertex count unchanged. | 1432 |
| `editor_toolUtilities_geom.perpDistPointSeg2D(ax, ay, bx, by, px, py)` | Perpendicular distance from the point (px, py) to the segment (ax, ay)->(bx, by) in XY. Degenerate segment: distance to A. Mind the argument order: the segment points first. | 3046 |
| `editor_toolUtilities_geom.pointAboveOrOnLine2D(pt, left, right, eps)` | Is the point above or on the line left->right (cross product >= -eps). | 532 |
| `editor_toolUtilities_geom.pointBetween2D(p, left, right, eps)` | For a p assumed aligned with left->right: false if it is an endpoint or outside. Tested on the dot product (unit m^2) and not on the normalized position, so as not to split a segment at its own endpoint (which would give a zero-length piece). | 547 |
| `editor_toolUtilities_geom.pointInQuadBarycentric(p, q)` | Determines whether a point is in a quad (in XY). | 1681 |
| `editor_toolUtilities_geom.pointInRing2D(px, py, ring)` | Point in a 2D polygon (ray casting, even-odd), independent of the ring's direction. The vertices are {x, y}. | 1087 |
| `editor_toolUtilities_geom.pointInTri2D(px, py, ax, ay, bx, by, cx, cy)` | Point in a 2D triangle (barycentric), in scalars for tight loops like ear clipping. | 1131 |
| `editor_toolUtilities_geom.pointsCollinear2D(a, b, c, eps)` | Are three points aligned in XY (\|cross product\| < eps). | 537 |
| `editor_toolUtilities_geom.pointsCompare2D(a, b, eps)` | Comparison of two points in XY, for sorting (-1 or 1, first by x then by y). | 525 |
| `editor_toolUtilities_geom.pointsSame2D(a, b, eps)` | Are two points coincident in XY within eps (per component). | 520 |
| `editor_toolUtilities_geom.polygonOBB(poly)` | Oriented bounding box of a 2D polygon by PCA. The points are pairs [1]=x, [2]=y. | 346 |
| `editor_toolUtilities_geom.polylineCumLength2D(pts, out)` | 2D (XY only) cousin of polylineCumLength3D for plain {x, y} points: out[i] = distance from pts[1] to pts[i]. A reusable out array avoids allocations. | 875 |
| `editor_toolUtilities_geom.polylineCumLength3D(pts)` | Cumulative 3D lengths along a polyline. | 864 |
| `editor_toolUtilities_geom.polylineZAtArcFromTip(pts, cum, total, fromStart, dist)` | Z of the first sample at arc distance dist from the start or end tip. | 1559 |
| `editor_toolUtilities_geom.populateTreeQuads(quads)` | Creates and fills a kd-tree containing the given quads. | 1723 |
| `editor_toolUtilities_geom.projectPointToSpline(pos, spline)` | Projects a point onto a spline. Returns nil if outside the segment bounds. | 1942 |
| `editor_toolUtilities_geom.quadUV(px, py, q1, q2, q3, q4)` | Inverse bilinear in the XY plane: the (u, v) such that p = lerp(lerp(q1, q2, u), lerp(q3, q4, u), v), or nil if p is outside the quad. u runs from q1 toward q2, v from q1 toward q3. | 1631 |
| `editor_toolUtilities_geom.rayIntersect2D(px, py, dx, dy, qx, qy, ex, ey, eps)` | Intersection of two RAYS (forward only) P+s*D and Q+u*E; returns ix, iy or nil (parallel or point behind one of the rays). | 3093 |
| `editor_toolUtilities_geom.resampleUniformNodesWidths(nodes, widths, spacing)` | Resamples a polyline (nodes and widths) at a regular step. | 1008 |
| `editor_toolUtilities_geom.reshapeLeadInBezier2D(nodes, fromStart, p0x, p0y, gx, gy, L)` | Reshapes in place ONE end of a node polyline (x/y, z unchanged) according to a lead-in Bezier toward a goal point, over a length L. | 633 |
| `editor_toolUtilities_geom.ribbonIntervalFrame(p1, p2, t1, t2, n1, n2, outPos, outTan, outUp, prevAcross)` | Mid-interval frame for rigid kit panels on a sloped or banked edge (fences, guardrails). | 2103 |
| `editor_toolUtilities_geom.ribbonOverlapEnd2D(hx, hy, a, aFromStart, b, bFromStart, clearM, stepM, maxM)` | Where two ribbons (roads) leaving the same junction stop overlapping, in arc length along A from the center (hx, hy). Returns maxM if no usable ribbon. | 153 |
| `editor_toolUtilities_geom.ribbonUpFromAlong(along, upRef, outUp, prevAcross)` | Up vector of the road ribbon for a unit along direction: up perpendicular to along, roll taken from upRef. prevAcross keeps the lateral sign continuous along a series of placements. | 2076 |
| `editor_toolUtilities_geom.ringSignedArea2(ring)` | Twice the signed area of a 2D ring of {x, y}; positive = counter-clockwise (x to the right, y up). | 1223 |
| `editor_toolUtilities_geom.rotateVecAroundAxis(v, k, theta)` | Rotates vector v around the unit axis k by the angle theta (Rodrigues formula). | 453 |
| `editor_toolUtilities_geom.rotateVecAroundAxisInlined(v, k, theta, out)` | Like rotateVecAroundAxis without allocation: out = v*cos + (k x v)*sin + k*(k.v)*(1-cos). | 467 |
| `editor_toolUtilities_geom.rotateVecAroundZ(vec, v, angle)` | Rotates vector v around the Z axis by the given angle, in place (the function receives vec as destination). | 445 |
| `editor_toolUtilities_geom.sampleCubicBezier2D(p0, p1, p2, p3, segs)` | Samples a cubic Bezier in XY (endpoints included). | 589 |
| `editor_toolUtilities_geom.sampleSpline(divPoints, tangents, normals, spacing, outPosns, outTans, outNormals)` | Samples a polyline at true arc length to compute positions and Frenet frame at regular intervals. No effect if spacing is not > 0. | 1996 |
| `editor_toolUtilities_geom.sampleSplineAdaptive(divPoints, tangents, normals, meshLength, outPosns, outTans, outNormals, outScales)` | Adaptive sampling along a spline: computes positions, Frenet frame and scales per meshLength step; the scale (minimum 0.01) depends on the curvature (sensitivity kappaSensitivity = 150). No effect if meshLength is not > 0. | 2152 |
| `editor_toolUtilities_geom.sampleSplineEvenFit(divPoints, tangents, normals, targetSpacing, isLoop, outPosns, outTans, outNormals)` | Sampler with adjusted distribution for discrete objects (lamp posts, bollards): the step is adjusted so that the total length is a whole number of intervals. | 2024 |
| `editor_toolUtilities_geom.segCrossParam2D(ax, ay, bx, by, cx, cy, dx, dy)` | Strict crossing of two open segments AB and CD: returns the parameter t on AB in (0,1), otherwise nil (parallel or crossing at an endpoint). Endpoints are excluded so that two strips that touch are not read as a fold. | 1074 |
| `editor_toolUtilities_geom.sigMoved(old, new, tolM)` | Has a shape signature (flat list of numbers and strings) moved since old: numbers by more than tolM, strings as soon as they differ. | 889 |
| `editor_toolUtilities_geom.signedAngleAroundAxis(fromVec, toVec, axis)` | Signed angle between two vectors around an axis, after projection onto the plane of rotation. Returned in DEGREES (unlike signedAngleBetweenVecs). | 1620 |
| `editor_toolUtilities_geom.signedAngleBetweenVecs(a, b, axis)` | Signed angle between two vectors around an axis, assuming the vectors are in the plane of rotation. | 1610 |
| `editor_toolUtilities_geom.simplifyRDP(points, tolM)` | Ramer-Douglas-Peucker simplification of a polyline (perpendicular distance measured in 3D). | 903 |
| `editor_toolUtilities_geom.smoothClosedPolygonChaikin(poly, iterations)` | Chaikin corner cutting of a closed polygon of {x, y} points. | 1046 |
| `editor_toolUtilities_geom.smoothNodesHeightSteffen(nodes)` | End-to-end height smoothing: fixes z[1] and z[n] and rewrites the interior Zs by Steffen interpolation along the XY length. No effect (returns false) below 3 nodes. | 101 |
| `editor_toolUtilities_geom.splitLoopSplineGeometry(nodes, widths, nmls, splitNodeIdx, corners)` | Cuts a looped spline at the given index and returns the reordered geometry. corners is returned as the 4th value. | 1791 |
| `editor_toolUtilities_geom.splitPolylineByBlocked(pts, isBlocked, stepM, minKeepM)` | Cuts a 2D polyline into stretches that stay outside a blocked region. | 1508 |
| `editor_toolUtilities_geom.splitSplineGeometry(nodes, widths, nmls, splitNodeIdx, corners)` | Cuts a spline geometry at the given node index (the two halves are moved 2 m apart at the cut point). corners (optional) is an array of per-node overrides, kept so that the engineering tools keep their per-turn radii. | 1752 |
| `editor_toolUtilities_geom.squaredDistance2D(a, b)` | Squared distance in XY between two points (Z ignored). | 71 |
| `editor_toolUtilities_geom.squaredSegSegDist(a0, a1, b0, b1, outP1, outP2)` | Squared distance between two 3D segments; writes the closest points into outP1 and outP2. | 219 |
| `editor_toolUtilities_geom.tipOutwardXY(pts, fromStart, minWalkM)` | Outward unit XY direction beyond an end (away from the polyline). Walks minWalkM along the chain so that a short folded-back first segment does not reverse the aim. | 1576 |
| `editor_toolUtilities_geom.translateSpline(pts, binormals, t, out)` | Translates a polyline by t meters along the binormal (lateral direction). | 2183 |
| `editor_toolUtilities_geom.triangulatePolygon2D(poly)` | Ear clipping triangulation of a simple 2D polygon (ring of {x, y}, either direction). The closing repeat is removed beforehand: a zero-length edge would block the clipping and cause the whole cap to be discarded. | 1162 |
| `editor_toolUtilities_geom.triangulateWithHoles2D(outer, holes)` | Triangulates a possibly holed 2D polygon. If ear clipping fails with a bridging ring, drops the holes one by one rather than losing the whole cap. | 1374 |
| `editor_toolUtilities_geom.updateBarPoints(spline, isBarsLimits)` | Updates the speed bar points of a spline; fills spline.vels and spline.velLimits. | 2318 |
| `editor_toolUtilities_geom.updateBarPointsGraph(spline, graphData, isBarsLimit)` | Updates the bar points for a navigation graph path; fills spline.vels and spline.velLimits. | 2357 |
| `editor_toolUtilities_geom.updateRibPointsFree(spline)` | Recomputes the rib points of a spline in free 3D. No effect below 2 nodes. | 2263 |
| `editor_toolUtilities_geom.updateRibPointsRaycast(spline)` | Recomputes the rib points of a spline by vertical raycast to the nearest surface below. No effect below 2 nodes. | 2290 |
| `editor_toolUtilities_geom.weldShortSegments(nodes, widths, minLen)` | Welds in place consecutive nodes that are almost coincident (segments shorter than minLen). | 964 |

### Parameter details

#### `editor_toolUtilities_geom.angleBetweenVecs(a, b)`

Small angle between two vectors of arbitrary length (rad).

- `a` (*vec3*) : Vector.
- `b` (*vec3*) : Vector.
- **returns**: number Angle (rad).

#### `editor_toolUtilities_geom.angleBetweenVecsNorm(a, b)`

Small angle between two unit vectors (rad).

- `a` (*vec3*) : Unit vector.
- `b` (*vec3*) : Unit vector.
- **returns**: number Angle (rad).

#### `editor_toolUtilities_geom.applyBankFraction(spline, bankT, peakRad)`

Rolls the frame per station of a spline according to a READY-MADE banking fraction (bankT[i] in [-1, 1], + = left curve), peakRad being the angle reached by a full-amplitude station. The caller handles the curvature -> fraction mapping and the arc-length blending (otherwise the banking becomes a square wave).

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
- `bankT` (*number[]*) : Banking fraction per station.
- `peakRad` (*number*) : Full-amplitude angle (rad).

#### `editor_toolUtilities_geom.bridgeHoles2D(outer, holes, count)`

Merges hole rings into the outer ring by bridge edges. count caps the number of holes taken.

- `outer` (*table[]*) : Outer ring (set back to counter-clockwise).
- `holes` (*table[][]*) : Holes (set back to clockwise, bridges by increasing min-x).
- `count` (*integer|nil*) : Maximum number of holes taken.
- **returns**: table[] Merged ring.

#### `editor_toolUtilities_geom.catmullRomCentripetalFast(p0, p1, p2, p3, t, s, outVec)`

Fast, allocation-free version of catmullRomCentripetal. If outVec is provided, writes into it and returns it; otherwise creates a vec3.

- `p0` (*vec3*) : Control point.
- `p1` (*vec3*) : Control point.
- `p2` (*vec3*) : Control point.
- `p3` (*vec3*) : Control point.
- `t` (*number*) : Parameter.
- `s` (*number*) : Tension/knots parameter (inferred from code).
- `outVec` (*vec3|nil*) : Optional output.
- **returns**: vec3 Interpolated point.

#### `editor_toolUtilities_geom.catmullRomConformToTerrain(spline, minNumDivIn, minSpacing, rayRaise)`

Like catmullRomRaycast but the points are conformed to the terrain. Falls back to catmullRomRaycast if there is no terrain block.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
- `minNumDivIn` (*integer|nil*) : Minimum divisions per segment.
- `minSpacing` (*number|nil*) : Minimum spacing (m).
- `rayRaise` (*number|nil*) : Ray starting elevation (m).

#### `editor_toolUtilities_geom.catmullRomFree(spline, minNumDivIn, deckZ, maxSpacingIn)`

Interpolates nodes and widths with standard Catmull-Rom (centripetal XY; Z by Steffen for a ground road, smooth Catmull-Rom for an elevated deck if deckZ). The data is stored in the spline.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
- `minNumDivIn` (*integer|nil*) : Minimum divisions per segment (default 10).
- `deckZ` (*boolean|nil*) : Elevated deck: Z smoothed by Catmull-Rom.
- `maxSpacingIn` (*number|nil*) : Maximum spacing between divisions (default 20 m).

#### `editor_toolUtilities_geom.catmullRomFreeWithBanking(spline, minNumDivIn, bankStrength, maxDegIn, tuningIn, deckZ, maxSpacingIn)`

Like catmullRomFree with automatic banking and blending.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
- `minNumDivIn` (*integer|nil*) : Minimum divisions.
- `bankStrength` (*number*) : Banking intensity.
- `maxDegIn` (*number|nil*) : Maximum banking (degrees, default 15).
- `tuningIn` (*number|nil*) : Saturation setting (default 500).
- `deckZ` (*boolean|nil*) : Elevated deck.
- `maxSpacingIn` (*number|nil*) : Maximum spacing.

#### `editor_toolUtilities_geom.catmullRomNodesOnly(nodes, gran)`

Interpolates the given points with Catmull-Rom.

- `nodes` (*vec3[]*) : Points.
- `gran` (*integer*) : Granularity (subdivisions per segment).
- **returns**: vec3[] Interpolated points.

#### `editor_toolUtilities_geom.catmullRomNodesWidthsOnly(nodes, widths, gran, isLoop)`

Interpolates points and widths with Catmull-Rom (a single array of nodes).

- `nodes` (*vec3[]*) : Points.
- `widths` (*number[]*) : Widths.
- `gran` (*integer*) : Granularity.
- `isLoop` (*boolean|nil*) : Loop.
- **returns**: vec3[] Points.
- **returns**: number[] Widths.

#### `editor_toolUtilities_geom.catmullRomNodesWidthsVelVelLimits(spline, gran)`

Interpolates points, widths, speeds and speed limits of a spline with Catmull-Rom (a single array of nodes).

- `spline` (*table*) : Spline with nodes, widths, vels, velLimits.
- `gran` (*integer*) : Granularity.
- **returns**: vec3[] Points.
- **returns**: number[] Widths.
- **returns**: number[] Speeds.
- **returns**: number[] Speed limits.

#### `editor_toolUtilities_geom.catmullRomRaycast(spline, minNumDivIn, minSpacing, rayRaise)`

Interpolates the nodes and widths of a spline with standard Catmull-Rom to produce its secondary geometry; points are placed by raycast onto the surface below. The data is stored in the spline (divPoints, divWidths, normals, discMap).

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
- `minNumDivIn` (*integer|nil*) : Minimum number of divisions per segment (default 10).
- `minSpacing` (*number|nil*) : Minimum spacing between points (m).
- `rayRaise` (*number|nil*) : Ray starting elevation (m); default spline.rayRaise.

#### `editor_toolUtilities_geom.chordify(pts, n, chord, flags)`

Reduces a tessellated curve to chords of about chord meters; flagged points (flags) are always kept, as are the ends.

- `pts` (*table[]*) : Points.
- `n` (*integer*) : Number of points.
- `chord` (*number*) : Chord length (m).
- `flags` (*table|nil*) : Flags per point.
- **returns**: table[] Kept points.
- **returns**: table|nil Corresponding flags.

#### `editor_toolUtilities_geom.clipRingRect2D(pts, x0, x1, y0, y1)`

Clips a ring to the box x0..x1, y0..y1. A concave ring comes back as a single ring that runs along the edge of the box between its pieces, which covers the same area in the box.

- `pts` (*table[]*) : Ring.
- `x0` (*number*) : X min.
- `x1` (*number*) : X max.
- `y0` (*number*) : Y min.
- `y1` (*number*) : Y max.
- **returns**: table[] Clipped ring (may have fewer than 3 points).

#### `editor_toolUtilities_geom.closestPointOnPolyline(pts, p, outPos)`

Closest point to p on a 3D polyline. Writes the result into outPos and returns the squared distance.

- `pts` (*vec3[]*) : Polyline.
- `p` (*vec3*) : Point.
- `outPos` (*vec3*) : Receives the closest point.
- **returns**: number Squared distance (m^2).

#### `editor_toolUtilities_geom.closestPointOnPolyline2D(pts, p, outPos, tMin, tMax, closed)`

Closest point to p on a polyline, measured in XY (Z interpolated). Writes into outPos and returns the squared distance.

- `pts` (*vec3[]*) : Polyline.
- `p` (*vec3*) : Point.
- `outPos` (*vec3*) : Receives the point.
- `tMin` (*number|nil*) : Lower search bound (inferred from code).
- `tMax` (*number|nil*) : Upper search bound (inferred from code).
- `closed` (*boolean|nil*) : Closed polyline.
- **returns**: number Squared distance.

#### `editor_toolUtilities_geom.closestRibbonSegPointToPoint(segIdx, ribbon, p)`

Closest point, on a given ribbon segment, to a given point.

- `segIdx` (*integer*) : Segment index.
- `ribbon` (*table*) : Ribbon.
- `p` (*vec3*) : Point.
- **returns**: any|nil Closest point (nil, nil if unavailable).
- **returns**: number|nil Squared distance.

#### `editor_toolUtilities_geom.computeFrenetFrame(spline)`

Computes the local Frenet frame at each division point (tangents, binormals, normals). Zero-length segments must not be normalized (otherwise NaN binormals and infinite DecalRoad nodes).

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).

#### `editor_toolUtilities_geom.computeGraphPathFromNodes(spline)`

Computes the graph path from the nodes and fills the spline geometry (divPoints, divWidths, normals). No effect if there are not enough nodes.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).

#### `editor_toolUtilities_geom.computeRandomJitterQuat(spline, tgt, rightVec, nmlVec, outQuat)`

Random variation quaternion, per component.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
- `tgt` (*vec3*) : Tangent.
- `rightVec` (*vec3*) : Right vector.
- `nmlVec` (*vec3*) : Normal.
- `outQuat` (*quat*) : Receives the result.
- **returns**: quat outQuat.

#### `editor_toolUtilities_geom.computeRandomJitterQuatFromFreedomAxes(spline, freedomAxes, outQuat)`

Random variation quaternion based on the joint's freedom axes.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
- `freedomAxes` (*table*) : Freedom axes.
- `outQuat` (*quat*) : Receives the result.
- **returns**: quat outQuat.

#### `editor_toolUtilities_geom.computeRandomJitterQuat_ZOnly(jitter, nmlVec, outQuat)`

Random variation quaternion around Z only.

- `jitter` (*number*) : Amplitude.
- `nmlVec` (*vec3*) : Normal.
- `outQuat` (*quat*) : Receives the result.
- **returns**: quat outQuat.

#### `editor_toolUtilities_geom.computeSDF(mask)`

Computes the signed distance field (SDF) of a mask (2D array, 0 = inside).

- `mask` (*number[][]*) : Mask mask[y][x].
- **returns**: number[][] Distance field.

#### `editor_toolUtilities_geom.computeSourcesAABB(sources)`

Bounding box (XY) of the given sources.

- `sources` (*table[]*) : Sources (points or splines, inferred from code).
- **returns**: table { xMin, xMax, yMin, yMax }.

#### `editor_toolUtilities_geom.computeSplinePolygon(spline, margin, polygon)`

Computes a polygonal outline around a spline (left and right edges at the half-width + margin, extended by 10 m at both ends). Fast to process by scanline spans. Fills the polygon array.

- `spline` (*table*) : Spline with divPoints, tangents, binormals, divWidths.
- `margin` (*number*) : Lateral margin (m).
- `polygon` (*table*) : Output array, cleared then filled with vec3.

#### `editor_toolUtilities_geom.computeTurningRadius(p1, p2, p3)`

Radius of curvature approximated by 3 consecutive points (average of the lengths of the two sides divided by tan(angle/2)).

- `p1` (*vec3*) : Point.
- `p2` (*vec3*) : Center point.
- `p3` (*vec3*) : Point.
- **returns**: number Radius (m).

#### `editor_toolUtilities_geom.cornerAxis(ix, iy, ox, oy, period)`

Direction taken by a post, pillar or bollard PLACED ON A CORNER, from the entry and exit direction: the axis is rotated by half the turn reduced modulo period (default pi/2). Ties go to the smaller turn so that left and right corners mirror each other.

- `ix` (*number*) : Entry direction x.
- `iy` (*number*) : Entry direction y.
- `ox` (*number*) : Exit direction x.
- `oy` (*number*) : Exit direction y.
- `period` (*number|nil*) : Symmetry period of the post (rad, default pi/2).
- **returns**: number cos of the axis.
- **returns**: number sin of the axis.

#### `editor_toolUtilities_geom.cross2(ax, ay, bx, by)`

2D scalar cross product of (ax, ay) and (bx, by), on plain components (without allocating a vec3 or a table).

- `ax` (*number*) : A x.
- `ay` (*number*) : A y.
- `bx` (*number*) : B x.
- `by` (*number*) : B y.
- **returns**: number ax*by - ay*bx.

#### `editor_toolUtilities_geom.curvatureToBankAngle(curv, bankStrength, maxDeg, tuning)`

Converts a curvature into a banking angle (rad). maxDeg (cap on the tightest turns, default 15) and tuning (curvature at which the cap is reached, default 500) are optional overrides.

- `curv` (*number*) : Curvature.
- `bankStrength` (*number*) : Banking intensity.
- `maxDeg` (*number|nil*) : Cap (degrees).
- `tuning` (*number|nil*) : Saturation setting.
- **returns**: number Banking angle (rad).

#### `editor_toolUtilities_geom.densifyByMaxSpacing(points, maxSpacing)`

Densifies a polyline so that no segment exceeds maxSpacing.

- `points` (*table[]*) : Polyline.
- `maxSpacing` (*number*) : Maximum spacing (m).
- **returns**: table[] Densified polyline.

#### `editor_toolUtilities_geom.distSqPointSeg2D(px, py, ax, ay, bx, by)`

Squared distance from the point (px, py) to the FINITE segment AB (t clamped to the segment). For frequent proximity tests.

- `px` (*number*) : Point x.
- `py` (*number*) : Point y.
- `ax` (*number*) : A x.
- `ay` (*number*) : A y.
- `bx` (*number*) : B x.
- `by` (*number*) : B y.
- **returns**: number Squared distance.

#### `editor_toolUtilities_geom.dot2(ax, ay, bx, by)`

2D dot product on plain components.

- `ax` (*number*) : A x.
- `ay` (*number*) : A y.
- `bx` (*number*) : B x.
- `by` (*number*) : B y.
- **returns**: number ax*bx + ay*by.

#### `editor_toolUtilities_geom.flipSplineDirection(spline)`

Reverses the direction of a spline in place (nodes, normals, corners) and marks spline.isDirty.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).

#### `editor_toolUtilities_geom.getAABB(points)`

Axis-aligned bounding box (XY) of an array of points.

- `points` (*vec3[]*) : Points.
- **returns**: table { xMin, xMax, yMin, yMax }.

#### `editor_toolUtilities_geom.getAllQuadrilaterals(sources, margin)`

Builds the quadrilaterals of the sources, with lateral inflation (without longitudinal stretching).

- `sources` (*table[]*) : Spline-type sources.
- `margin` (*number*) : Lateral margin (m).
- **returns**: table[] Quads.

#### `editor_toolUtilities_geom.getBarScale()`

Returns the scale factor of the speed bars (height = barScale * speed, 0.5).

- **returns**: number Factor.

#### `editor_toolUtilities_geom.getNodeSpansInsidePolygon(nodes, polygon)`

Given a polyline and a polygon, returns the runs of consecutive indices that are in the polygon.

- `nodes` (*vec3[]*) : Polyline.
- `polygon` (*table[]*) : Polygon.
- **returns**: table[] Runs of indices.

#### `editor_toolUtilities_geom.getPreRotQuats()`

Returns the table of pre-rotation quaternions indexed from 0 to 3 (0, 90, 180, 270 degrees around Z).

- **returns**: table<integer, quat> Pre-rotation quaternions.

#### `editor_toolUtilities_geom.getScanlineSpans(gMinY, gMaxY, te, tb, polygon, spansXMin, spansXMax, spansY)`

Computes the scanline spans of a polygon on the Y axis, in terrain grid space. Stores the results in spansXMin, spansXMax and spansY.

- `gMinY` (*integer*) : Minimum grid row.
- `gMaxY` (*integer*) : Maximum grid row.
- `te` (*userdata*) : Terrain editor (gridToWorldByPoint2I).
- `tb` (*userdata*) : Terrain block.
- `polygon` (*table[]*) : Polygon in world.
- `spansXMin` (*table*) : Output, cleared.
- `spansXMax` (*table*) : Output.
- `spansY` (*table*) : Output.

#### `editor_toolUtilities_geom.getTerrainNormal(p)`

Terrain normal at the given world point.

- `p` (*vec3*) : World point.
- **returns**: vec3 Normal.

#### `editor_toolUtilities_geom.getTerrainNormalInPlace(p, out)`

Terrain normal at the given world point, written into out.

- `p` (*vec3*) : World point.
- `out` (*vec3*) : Receives the normal.

#### `editor_toolUtilities_geom.insetClosedRing2D(ring, dist)`

Shrinks a closed polygon of {x, y} inward by at most dist, along the average normal of the edges of each vertex (true local inward direction, correct for concave rings).

- `ring` (*table[]*) : Ring.
- `dist` (*number*) : Distance (m).
- **returns**: table[] Shrunk ring.

#### `editor_toolUtilities_geom.insetPathAlongNormal2D(path, cx, cy, insetM)`

Offsets a 2D path toward the center (cx, cy) by insetM along the local normal (inferred from code).

- `path` (*table[]*) : Path.
- `cx` (*number*) : Center x.
- `cy` (*number*) : Center y.
- `insetM` (*number*) : Inset (m).
- **returns**: table[] New path.

#### `editor_toolUtilities_geom.intersection2LineSegs(p1, p2, q1, q2, out)`

Intersection point of two segments (inline). Returns nil without an intersection.

- `p1` (*vec3*) : Start of segment 1.
- `p2` (*vec3*) : End of segment 1.
- `q1` (*vec3*) : Start of segment 2.
- `q2` (*vec3*) : End of segment 2.
- `out` (*vec3*) : Receives the point.
- **returns**: vec3|nil out or nil.

#### `editor_toolUtilities_geom.intersectsUpQuadBarycentric(p, q)`

Intersects a point (x, y) with a quad and returns the interpolated height there, or false if outside the quad.

- `p` (*vec3*) : Point.
- `q` (*table*) : Quad: 4 vec3 vertices.
- **returns**: number|boolean Height or false.

#### `editor_toolUtilities_geom.isLineSegIntersect(a, b, c, d)`

Tests whether segment (a, b) crosses segment (c, d).

- `a` (*vec3*) : Start of ab.
- `b` (*vec3*) : End of ab.
- `c` (*vec3*) : Start of cd.
- `d` (*vec3*) : End of cd.
- **returns**: boolean Intersection.

#### `editor_toolUtilities_geom.isMouseOverBar(splines)`

Tests whether the mouse hovers a bar (splines with an ordered barPoints array).

- `splines` (*table[]*) : Splines to test.
- **returns**: boolean Hover.
- **returns**: integer|nil Spline index.
- **returns**: integer|nil Bar index.

#### `editor_toolUtilities_geom.isMouseOverGraphNode(nodes)`

Tests whether the mouse hovers a node of the navigation graph.

- `nodes` (*table*) : Graph nodes (indexed by key).
- **returns**: boolean Hover.
- **returns**: any|nil Node key.

#### `editor_toolUtilities_geom.isMouseOverNode(splines)`

Tests whether the mouse hovers a node of one of the splines (tolerance 2 m). Each spline must have a nodes array.

- `splines` (*table[]*) : Splines to test.
- **returns**: boolean Hover.
- **returns**: integer|nil Spline index.
- **returns**: integer|nil Node index.

#### `editor_toolUtilities_geom.isMouseOverPolyline(points, mousePos, closed)`

Tests whether the mouse hovers a polyline; closed also tests the edge from the last node to the first.

- `points` (*vec3[]*) : Polyline.
- `mousePos` (*vec3*) : Mouse position.
- `closed` (*boolean|nil*) : Closed polygon.
- **returns**: boolean Hover.
- **returns**: integer|nil Segment index.

#### `editor_toolUtilities_geom.isMouseOverSpline(spline, maxDistSq)`

Tests whether the mouse hovers the spline (to insert a node or hover). Uses the closest camera-ray / axis approach, so elevated roads work. maxDistSq: squared tolerance (math.huge to get the closest point unconditionally).

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
- `maxDistSq` (*number|nil*) : Squared ray-axis tolerance (default 1).
- **returns**: boolean Hover.
- **returns**: integer|nil Segment index.
- **returns**: vec3|nil Point on the spline.

#### `editor_toolUtilities_geom.isPointInTriangle(p, a, b, c)`

Tests whether p is in the triangle (a, b, c) (barycentric coordinates).

- `p` (*vec3*) : Point.
- `a` (*vec3*) : Vertex.
- `b` (*vec3*) : Vertex.
- `c` (*vec3*) : Vertex.
- **returns**: boolean Inside.

#### `editor_toolUtilities_geom.joinSplineGeometry(n1, w1, nm1, nodeIdx1, n2, w2, nm2, nodeIdx2, c1, c2)`

Joins two spline geometries at the given node indices. Returns nil if the indices are invalid.

- `n1` (*vec3[]*) : Nodes 1.
- `w1` (*number[]*) : Widths 1.
- `nm1` (*vec3[]*) : Normals 1.
- `nodeIdx1` (*integer*) : Junction index 1.
- `n2` (*vec3[]*) : Nodes 2.
- `w2` (*number[]*) : Widths 2.
- `nm2` (*vec3[]*) : Normals 2.
- `nodeIdx2` (*integer*) : Junction index 2.
- `c1` (*table|nil*) : Turn overrides 1.
- `c2` (*table|nil*) : Overrides 2.
- **returns**: table|nil nodesNew.
- **returns**: table|nil widthsNew.
- **returns**: table|nil nmlsNew.
- **returns**: table|nil cornersNew.

#### `editor_toolUtilities_geom.lineDirsHitT2D(p0x, p0y, d0x, d0y, p1x, p1y, d1x, d1y, eps)`

Parameter t along p0 + t*d0 at the intersection point with p1 + u*d1; nil if parallel. With d0 unit, t is in meters.

- `p0x` (*number*) : Point 0 x.
- `p0y` (*number*) : Point 0 y.
- `d0x` (*number*) : Direction 0 x.
- `d0y` (*number*) : Direction 0 y.
- `p1x` (*number*) : Point 1 x.
- `p1y` (*number*) : Point 1 y.
- `d1x` (*number*) : Direction 1 x.
- `d1y` (*number*) : Direction 1 y.
- `eps` (*number*) : Parallelism tolerance.
- **returns**: number|nil t, or nil.

#### `editor_toolUtilities_geom.lineIntersect2D(px, py, dx, dy, qx, qy, ex, ey, eps)`

Intersection of two INFINITE lines P+s*D and Q+s*E; returns ix, iy or nil if parallel.

- `px` (*number*) : P x.
- `py` (*number*) : P y.
- `dx` (*number*) : D x.
- `dy` (*number*) : D y.
- `qx` (*number*) : Q x.
- `qy` (*number*) : Q y.
- `ex` (*number*) : E x.
- `ey` (*number*) : E y.
- `eps` (*number|nil*) : Parallelism tolerance.
- **returns**: number|nil ix.
- **returns**: number|nil iy.

#### `editor_toolUtilities_geom.linesIntersect2D(a0, a1, b0, b1, eps)`

Intersection of two lines a0-a1 and b0-b1. Returns nil if parallel.

- `a0` (*table*) : Point.
- `a1` (*table*) : Point.
- `b0` (*table*) : Point.
- `b1` (*table*) : Point.
- `eps` (*number*) : Tolerance.
- **returns**: table|nil { pt = {x, y}, alongA, alongB } (Martinez along codes).

#### `editor_toolUtilities_geom.multiPolygonCentroidXY(regions)`

Area-weighted centroid of one or more closed 2D rings ({x, y}). Returns cx, cy or nil.

- `regions` (*table[]*) : Rings.
- **returns**: number|nil cx.
- **returns**: number|nil cy.

#### `editor_toolUtilities_geom.normalize2(x, y)`

Normalizes a 2D vector (x, y).

- `x` (*number*) : x.
- `y` (*number*) : y.
- **returns**: number Normalized x.
- **returns**: number Normalized y.

#### `editor_toolUtilities_geom.offsetPathFromCenter2D(path, cx, cy, distM, distArr)`

Offsets a 2D polyline away from (cx, cy) along its local normal per vertex.

- `path` (*table[]*) : Polyline.
- `cx` (*number*) : Center x.
- `cy` (*number*) : Center y.
- `distM` (*number*) : Distance (m).
- `distArr` (*number[]|nil*) : Per-vertex distances (inferred from code).
- **returns**: table[] Offset points.

#### `editor_toolUtilities_geom.offsetPathMiter2D(pts, dist, cx, cy, z, inward)`

Parallel offset with mitered corners of an OPEN 2D polyline: one output point per vertex (paired rails stay aligned), z kept. Corners keep the true perpendicular width. The side is chosen ONCE for the whole path: away from (cx, cy), or toward it if inward.

- `pts` (*table[]*) : Open polyline.
- `dist` (*number*) : Offset distance (m).
- `cx` (*number*) : Center x.
- `cy` (*number*) : Center y.
- `z` (*number|nil*) : Imposed Z (inferred from code).
- `inward` (*boolean|nil*) : Offset toward the center.
- **returns**: table[] Offset points.

#### `editor_toolUtilities_geom.outsetClosedRing2D(ring, dist)`

Pushes a closed ring OUTWARD by a small distance, mitered corners.

- `ring` (*table[]*) : Ring.
- `dist` (*number*) : Distance (m).
- **returns**: table[]|nil Enlarged ring.

#### `editor_toolUtilities_geom.outsetRingSides2D(ring, dist, move)`

Like outsetClosedRing2D but only for the sides designated by move[i]; the others stay exactly on their line. A vertex between a moving side and a fixed side slides along the fixed side: no notch, vertex count unchanged.

- `ring` (*table[]*) : Ring.
- `dist` (*number*) : Distance (m).
- `move` (*table<integer, boolean>*) : Sides to move.
- **returns**: table[] Ring.

#### `editor_toolUtilities_geom.perpDistPointSeg2D(ax, ay, bx, by, px, py)`

Perpendicular distance from the point (px, py) to the segment (ax, ay)->(bx, by) in XY. Degenerate segment: distance to A. Mind the argument order: the segment points first.

- `ax` (*number*) : A x.
- `ay` (*number*) : A y.
- `bx` (*number*) : B x.
- `by` (*number*) : B y.
- `px` (*number*) : Point x.
- `py` (*number*) : Point y.
- **returns**: number Distance (m).

#### `editor_toolUtilities_geom.pointAboveOrOnLine2D(pt, left, right, eps)`

Is the point above or on the line left->right (cross product >= -eps).

- `pt` (*table*) : Point.
- `left` (*table*) : Start.
- `right` (*table*) : End.
- `eps` (*number*) : Tolerance.
- **returns**: boolean Result.

#### `editor_toolUtilities_geom.pointBetween2D(p, left, right, eps)`

For a p assumed aligned with left->right: false if it is an endpoint or outside. Tested on the dot product (unit m^2) and not on the normalized position, so as not to split a segment at its own endpoint (which would give a zero-length piece).

- `p` (*table*) : Point.
- `left` (*table*) : Start.
- `right` (*table*) : End.
- `eps` (*number*) : Tolerance.
- **returns**: boolean Strictly between.

#### `editor_toolUtilities_geom.pointInQuadBarycentric(p, q)`

Determines whether a point is in a quad (in XY).

- `p` (*vec3*) : Point.
- `q` (*table*) : Quad: 4 vertices.
- **returns**: boolean Inside.

#### `editor_toolUtilities_geom.pointInRing2D(px, py, ring)`

Point in a 2D polygon (ray casting, even-odd), independent of the ring's direction. The vertices are {x, y}.

- `px` (*number*) : Point x.
- `py` (*number*) : Point y.
- `ring` (*table[]*) : Ring.
- **returns**: boolean Inside.

#### `editor_toolUtilities_geom.pointInTri2D(px, py, ax, ay, bx, by, cx, cy)`

Point in a 2D triangle (barycentric), in scalars for tight loops like ear clipping.

- `px` (*number*) : Point x.
- `py` (*number*) : Point y.
- `ax` (*number*) : A x.
- `ay` (*number*) : A y.
- `bx` (*number*) : B x.
- `by` (*number*) : B y.
- `cx` (*number*) : C x.
- `cy` (*number*) : C y.
- **returns**: boolean Inside.

#### `editor_toolUtilities_geom.pointsCollinear2D(a, b, c, eps)`

Are three points aligned in XY (|cross product| < eps).

- `a` (*table*) : Point.
- `b` (*table*) : Point.
- `c` (*table*) : Point.
- `eps` (*number*) : Tolerance.
- **returns**: boolean Aligned.

#### `editor_toolUtilities_geom.pointsCompare2D(a, b, eps)`

Comparison of two points in XY, for sorting (-1 or 1, first by x then by y).

- `a` (*table*) : Point.
- `b` (*table*) : Point.
- `eps` (*number*) : Tolerance on x.
- **returns**: integer -1 if a is before b, otherwise 1.

#### `editor_toolUtilities_geom.pointsSame2D(a, b, eps)`

Are two points coincident in XY within eps (per component).

- `a` (*table*) : Point {x, y}.
- `b` (*table*) : Point.
- `eps` (*number*) : Tolerance.
- **returns**: boolean Identical.

#### `editor_toolUtilities_geom.polygonOBB(poly)`

Oriented bounding box of a 2D polygon by PCA. The points are pairs [1]=x, [2]=y.

- `poly` (*number[][]*) : Polygon.
- **returns**: number Center x.
- **returns**: number Center y.
- **returns**: number Half-width along the principal axis.
- **returns**: number Transverse half-width.
- **returns**: number Angle theta of the principal axis (rad).

#### `editor_toolUtilities_geom.polylineCumLength2D(pts, out)`

2D (XY only) cousin of polylineCumLength3D for plain {x, y} points: out[i] = distance from pts[1] to pts[i]. A reusable out array avoids allocations.

- `pts` (*table[]*) : Polyline.
- `out` (*number[]|nil*) : Reused array (cleared then filled).
- **returns**: number[] out.
- **returns**: number Total length.

#### `editor_toolUtilities_geom.polylineCumLength3D(pts)`

Cumulative 3D lengths along a polyline.

- `pts` (*vec3[]*) : Polyline.
- **returns**: number[] cum[1..n].
- **returns**: number Total length.

#### `editor_toolUtilities_geom.polylineZAtArcFromTip(pts, cum, total, fromStart, dist)`

Z of the first sample at arc distance dist from the start or end tip.

- `pts` (*vec3[]*) : Polyline.
- `cum` (*number[]*) : Cumulative lengths.
- `total` (*number*) : Total length.
- `fromStart` (*boolean*) : Measure from the start.
- `dist` (*number*) : Distance (m).
- **returns**: number Z.

#### `editor_toolUtilities_geom.populateTreeQuads(quads)`

Creates and fills a kd-tree containing the given quads.

- `quads` (*table[]*) : Quads.
- **returns**: table kdtreebox2d tree.

#### `editor_toolUtilities_geom.projectPointToSpline(pos, spline)`

Projects a point onto a spline. Returns nil if outside the segment bounds.

- `pos` (*vec3*) : Point.
- `spline` (*table*) : Spline.
- **returns**: vec3|nil Closest projected point.
- **returns**: number|nil s in [0,1].
- **returns**: number|nil Lateral t in [-inf, inf].

#### `editor_toolUtilities_geom.quadUV(px, py, q1, q2, q3, q4)`

Inverse bilinear in the XY plane: the (u, v) such that p = lerp(lerp(q1, q2, u), lerp(q3, q4, u), v), or nil if p is outside the quad. u runs from q1 toward q2, v from q1 toward q3.

- `px` (*number*) : Point x.
- `py` (*number*) : Point y.
- `q1` (*table*) : Corner 1.
- `q2` (*table*) : Corner 2.
- `q3` (*table*) : Corner 3.
- `q4` (*table*) : Corner 4.
- **returns**: number|nil u.
- **returns**: number|nil v.

#### `editor_toolUtilities_geom.rayIntersect2D(px, py, dx, dy, qx, qy, ex, ey, eps)`

Intersection of two RAYS (forward only) P+s*D and Q+u*E; returns ix, iy or nil (parallel or point behind one of the rays).

- `px` (*number*) : P x.
- `py` (*number*) : P y.
- `dx` (*number*) : D x.
- `dy` (*number*) : D y.
- `qx` (*number*) : Q x.
- `qy` (*number*) : Q y.
- `ex` (*number*) : E x.
- `ey` (*number*) : E y.
- `eps` (*number|nil*) : Tolerance.
- **returns**: number|nil ix.
- **returns**: number|nil iy.

#### `editor_toolUtilities_geom.resampleUniformNodesWidths(nodes, widths, spacing)`

Resamples a polyline (nodes and widths) at a regular step.

- `nodes` (*vec3[]*) : Nodes.
- `widths` (*number[]*) : Widths.
- `spacing` (*number*) : Step (m).
- **returns**: vec3[] New nodes (the corresponding widths are also produced, inferred from code).

#### `editor_toolUtilities_geom.reshapeLeadInBezier2D(nodes, fromStart, p0x, p0y, gx, gy, L)`

Reshapes in place ONE end of a node polyline (x/y, z unchanged) according to a lead-in Bezier toward a goal point, over a length L.

- `nodes` (*vec3[]*) : Modified nodes.
- `fromStart` (*boolean*) : true: the start is the moving end.
- `p0x` (*number*) : Tip x (inferred from code).
- `p0y` (*number*) : Tip y.
- `gx` (*number*) : Goal x (inferred from code).
- `gy` (*number*) : Goal y.
- `L` (*number*) : Reshaped length (m).

#### `editor_toolUtilities_geom.ribbonIntervalFrame(p1, p2, t1, t2, n1, n2, outPos, outTan, outUp, prevAcross)`

Mid-interval frame for rigid kit panels on a sloped or banked edge (fences, guardrails).

- `p1` (*vec3*) : Start.
- `p2` (*vec3*) : End.
- `t1` (*vec3*) : Start tangent.
- `t2` (*vec3*) : End tangent.
- `n1` (*vec3*) : Start normal.
- `n2` (*vec3*) : End normal.
- `outPos` (*vec3*) : Receives the position.
- `outTan` (*vec3*) : Receives the tangent.
- `outUp` (*vec3*) : Receives the up.
- `prevAcross` (*vec3|nil*) : Previous lateral.

#### `editor_toolUtilities_geom.ribbonOverlapEnd2D(hx, hy, a, aFromStart, b, bFromStart, clearM, stepM, maxM)`

Where two ribbons (roads) leaving the same junction stop overlapping, in arc length along A from the center (hx, hy). Returns maxM if no usable ribbon.

- `hx` (*number*) : X of the junction center.
- `hy` (*number*) : Y of the center.
- `a` (*table*) : Points of ribbon A.
- `aFromStart` (*boolean*) : A starts from its first point.
- `b` (*table*) : Points of ribbon B.
- `bFromStart` (*boolean*) : B starts from its first point.
- `clearM` (*number*) : Clearance distance (m).
- `stepM` (*number*) : Search step (m, must be > 0).
- `maxM` (*number*) : Maximum length (m).
- **returns**: number Arc length (m).

#### `editor_toolUtilities_geom.ribbonUpFromAlong(along, upRef, outUp, prevAcross)`

Up vector of the road ribbon for a unit along direction: up perpendicular to along, roll taken from upRef. prevAcross keeps the lateral sign continuous along a series of placements.

- `along` (*vec3*) : Unit direction.
- `upRef` (*vec3*) : Reference up.
- `outUp` (*vec3*) : Receives the up.
- `prevAcross` (*vec3|nil*) : Previous lateral vector.

#### `editor_toolUtilities_geom.ringSignedArea2(ring)`

Twice the signed area of a 2D ring of {x, y}; positive = counter-clockwise (x to the right, y up).

- `ring` (*table[]*) : Ring.
- **returns**: number 2 x signed area.

#### `editor_toolUtilities_geom.rotateVecAroundAxis(v, k, theta)`

Rotates vector v around the unit axis k by the angle theta (Rodrigues formula).

- `v` (*vec3*) : Vector.
- `k` (*vec3*) : Unit axis.
- `theta` (*number*) : Angle (rad).
- **returns**: vec3 Copy of the result.

#### `editor_toolUtilities_geom.rotateVecAroundAxisInlined(v, k, theta, out)`

Like rotateVecAroundAxis without allocation: out = v*cos + (k x v)*sin + k*(k.v)*(1-cos).

- `v` (*vec3*) : Vector.
- `k` (*vec3*) : Unit axis.
- `theta` (*number*) : Angle (rad).
- `out` (*vec3*) : Receives the result.
- **returns**: vec3 out.

#### `editor_toolUtilities_geom.rotateVecAroundZ(vec, v, angle)`

Rotates vector v around the Z axis by the given angle, in place (the function receives vec as destination).

- `vec` (*vec3*) : Modified vector.
- `v` (*vec3*) : Source vector (inferred from code).
- `angle` (*number*) : Angle (rad).

#### `editor_toolUtilities_geom.sampleCubicBezier2D(p0, p1, p2, p3, segs)`

Samples a cubic Bezier in XY (endpoints included).

- `p0` (*table*) : Control point.
- `p1` (*table*) : Control point.
- `p2` (*table*) : Control point.
- `p3` (*table*) : Control point.
- `segs` (*integer|nil*) : Number of segments (default 14).
- **returns**: table[] Points.

#### `editor_toolUtilities_geom.sampleSpline(divPoints, tangents, normals, spacing, outPosns, outTans, outNormals)`

Samples a polyline at true arc length to compute positions and Frenet frame at regular intervals. No effect if spacing is not > 0.

- `divPoints` (*vec3[]*) : Division points.
- `tangents` (*vec3[]*) : Tangents.
- `normals` (*vec3[]*) : Normals.
- `spacing` (*number*) : Step (m).
- `outPosns` (*vec3[]*) : Positions output (cleared).
- `outTans` (*vec3[]*) : Tangents output.
- `outNormals` (*vec3[]*) : Normals output.
- **returns**: vec3[] outPosns.
- **returns**: vec3[] outTans.
- **returns**: vec3[] outNormals.

#### `editor_toolUtilities_geom.sampleSplineAdaptive(divPoints, tangents, normals, meshLength, outPosns, outTans, outNormals, outScales)`

Adaptive sampling along a spline: computes positions, Frenet frame and scales per meshLength step; the scale (minimum 0.01) depends on the curvature (sensitivity kappaSensitivity = 150). No effect if meshLength is not > 0.

- `divPoints` (*vec3[]*) : Division points.
- `tangents` (*vec3[]*) : Tangents.
- `normals` (*vec3[]*) : Normals.
- `meshLength` (*number*) : Nominal mesh length (m).
- `outPosns` (*vec3[]*) : Positions output.
- `outTans` (*vec3[]*) : Tangents output.
- `outNormals` (*vec3[]*) : Normals output.
- `outScales` (*number[]*) : Scales output (minimum 0.01).
- **returns**: vec3[] outPosns.
- **returns**: vec3[] outTans.
- **returns**: vec3[] outNormals.
- **returns**: number[] outScales.

#### `editor_toolUtilities_geom.sampleSplineEvenFit(divPoints, tangents, normals, targetSpacing, isLoop, outPosns, outTans, outNormals)`

Sampler with adjusted distribution for discrete objects (lamp posts, bollards): the step is adjusted so that the total length is a whole number of intervals.

- `divPoints` (*vec3[]*) : Division points.
- `tangents` (*vec3[]*) : Tangents.
- `normals` (*vec3[]*) : Normals.
- `targetSpacing` (*number*) : Target step (m, > 0).
- `isLoop` (*boolean*) : Looped spline.
- `outPosns` (*vec3[]*) : Positions output.
- `outTans` (*vec3[]*) : Tangents output.
- `outNormals` (*vec3[]*) : Normals output.

#### `editor_toolUtilities_geom.segCrossParam2D(ax, ay, bx, by, cx, cy, dx, dy)`

Strict crossing of two open segments AB and CD: returns the parameter t on AB in (0,1), otherwise nil (parallel or crossing at an endpoint). Endpoints are excluded so that two strips that touch are not read as a fold.

- `ax` (*number*) : A x.
- `ay` (*number*) : A y.
- `bx` (*number*) : B x.
- `by` (*number*) : B y.
- `cx` (*number*) : C x.
- `cy` (*number*) : C y.
- `dx` (*number*) : D x.
- `dy` (*number*) : D y.
- **returns**: number|nil t on AB, or nil.

#### `editor_toolUtilities_geom.sigMoved(old, new, tolM)`

Has a shape signature (flat list of numbers and strings) moved since old: numbers by more than tolM, strings as soon as they differ.

- `old` (*table|nil*) : Old signature.
- `new` (*table*) : New signature.
- `tolM` (*number*) : Numeric tolerance.
- **returns**: boolean true if it moved.

#### `editor_toolUtilities_geom.signedAngleAroundAxis(fromVec, toVec, axis)`

Signed angle between two vectors around an axis, after projection onto the plane of rotation. Returned in DEGREES (unlike signedAngleBetweenVecs).

- `fromVec` (*vec3*) : Start vector.
- `toVec` (*vec3*) : End vector.
- `axis` (*vec3*) : Axis.
- **returns**: number Signed angle (degrees).

#### `editor_toolUtilities_geom.signedAngleBetweenVecs(a, b, axis)`

Signed angle between two vectors around an axis, assuming the vectors are in the plane of rotation.

- `a` (*vec3*) : Vector.
- `b` (*vec3*) : Vector.
- `axis` (*vec3*) : Axis.
- **returns**: number Signed angle (rad).

#### `editor_toolUtilities_geom.simplifyRDP(points, tolM)`

Ramer-Douglas-Peucker simplification of a polyline (perpendicular distance measured in 3D).

- `points` (*vec3[]*) : Polyline.
- `tolM` (*number*) : Tolerance (m).
- **returns**: vec3[] Simplified polyline.

#### `editor_toolUtilities_geom.smoothClosedPolygonChaikin(poly, iterations)`

Chaikin corner cutting of a closed polygon of {x, y} points.

- `poly` (*table[]*) : Polygon.
- `iterations` (*integer*) : Number of iterations.
- **returns**: table[] Smoothed polygon.

#### `editor_toolUtilities_geom.smoothNodesHeightSteffen(nodes)`

End-to-end height smoothing: fixes z[1] and z[n] and rewrites the interior Zs by Steffen interpolation along the XY length. No effect (returns false) below 3 nodes.

- `nodes` (*vec3[]*) : Nodes modified in place.
- **returns**: boolean true if the smoothing was done.

#### `editor_toolUtilities_geom.splitLoopSplineGeometry(nodes, widths, nmls, splitNodeIdx, corners)`

Cuts a looped spline at the given index and returns the reordered geometry. corners is returned as the 4th value.

- `nodes` (*vec3[]*) : Nodes.
- `widths` (*number[]*) : Widths.
- `nmls` (*vec3[]*) : Normals.
- `splitNodeIdx` (*integer*) : Cut index.
- `corners` (*table|nil*) : Turn overrides.
- **returns**: table|nil nodesNew.
- **returns**: table|nil widthsNew.
- **returns**: table|nil nmlsNew.
- **returns**: table|nil cornersNew.

#### `editor_toolUtilities_geom.splitPolylineByBlocked(pts, isBlocked, stepM, minKeepM)`

Cuts a 2D polyline into stretches that stay outside a blocked region.

- `pts` (*table[]*) : Polyline {x, y}.
- `isBlocked` (*function*) : isBlocked(x, y) -> boolean.
- `stepM` (*number|nil*) : Test step (m, default 1.0 if <= 0.05).
- `minKeepM` (*number|nil*) : Minimum length of a kept stretch (inferred from code).
- **returns**: table[][] Stretches.

#### `editor_toolUtilities_geom.splitSplineGeometry(nodes, widths, nmls, splitNodeIdx, corners)`

Cuts a spline geometry at the given node index (the two halves are moved 2 m apart at the cut point). corners (optional) is an array of per-node overrides, kept so that the engineering tools keep their per-turn radii.

- `nodes` (*vec3[]*) : Nodes.
- `widths` (*number[]*) : Widths.
- `nmls` (*vec3[]*) : Normals.
- `splitNodeIdx` (*integer*) : Cut index.
- `corners` (*table|nil*) : Turn overrides aligned with the nodes.
- **returns**: table|nil nodes1 (nil if invalid index).
- **returns**: table|nil widths1.
- **returns**: table|nil nmls1.
- **returns**: table|nil nodes2.
- **returns**: table|nil widths2.
- **returns**: table|nil nmls2.
- **returns**: table|nil corners1.
- **returns**: table|nil corners2.

#### `editor_toolUtilities_geom.squaredDistance2D(a, b)`

Squared distance in XY between two points (Z ignored).

- `a` (*vec3*) : Point.
- `b` (*vec3*) : Point.
- **returns**: number Squared distance (m^2).

#### `editor_toolUtilities_geom.squaredSegSegDist(a0, a1, b0, b1, outP1, outP2)`

Squared distance between two 3D segments; writes the closest points into outP1 and outP2.

- `a0` (*vec3*) : Start of segment A.
- `a1` (*vec3*) : End of segment A.
- `b0` (*vec3*) : Start of B.
- `b1` (*vec3*) : End of B.
- `outP1` (*vec3*) : Closest point on A.
- `outP2` (*vec3*) : Closest point on B.
- **returns**: number Squared distance.

#### `editor_toolUtilities_geom.tipOutwardXY(pts, fromStart, minWalkM)`

Outward unit XY direction beyond an end (away from the polyline). Walks minWalkM along the chain so that a short folded-back first segment does not reverse the aim.

- `pts` (*table[]*) : Polyline.
- `fromStart` (*boolean*) : Start or end tip.
- `minWalkM` (*number*) : Minimum walked distance (m).
- **returns**: number Direction x.
- **returns**: number Direction y.

#### `editor_toolUtilities_geom.translateSpline(pts, binormals, t, out)`

Translates a polyline by t meters along the binormal (lateral direction).

- `pts` (*vec3[]*) : Points.
- `binormals` (*vec3[]*) : Binormals.
- `t` (*number*) : Offset (m).
- `out` (*table*) : Output (cleared) of vec3.

#### `editor_toolUtilities_geom.triangulatePolygon2D(poly)`

Ear clipping triangulation of a simple 2D polygon (ring of {x, y}, either direction). The closing repeat is removed beforehand: a zero-length edge would block the clipping and cause the whole cap to be discarded.

- `poly` (*table[]*) : Ring.
- **returns**: integer[][] Triplets of indices into the open ring (empty list on failure).

#### `editor_toolUtilities_geom.triangulateWithHoles2D(outer, holes)`

Triangulates a possibly holed 2D polygon. If ear clipping fails with a bridging ring, drops the holes one by one rather than losing the whole cap.

- `outer` (*table[]*) : Outer ring.
- `holes` (*table[][]|nil*) : Holes.
- **returns**: table[] Ring to which the triangles refer.
- **returns**: integer[][] Triplets of indices.

#### `editor_toolUtilities_geom.updateBarPoints(spline, isBarsLimits)`

Updates the speed bar points of a spline; fills spline.vels and spline.velLimits.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
- `isBarsLimits` (*boolean*) : Bars for speed limits (true) or speeds (false).

#### `editor_toolUtilities_geom.updateBarPointsGraph(spline, graphData, isBarsLimit)`

Updates the bar points for a navigation graph path; fills spline.vels and spline.velLimits.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
- `graphData` (*table*) : Navigation graph data.
- `isBarsLimit` (*boolean*) : Use velLimits (true) or vels (false) for the bar height.

#### `editor_toolUtilities_geom.updateRibPointsFree(spline)`

Recomputes the rib points of a spline in free 3D. No effect below 2 nodes.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).

#### `editor_toolUtilities_geom.updateRibPointsRaycast(spline)`

Recomputes the rib points of a spline by vertical raycast to the nearest surface below. No effect below 2 nodes.

- `spline` (*table*) : Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).

#### `editor_toolUtilities_geom.weldShortSegments(nodes, widths, minLen)`

Welds in place consecutive nodes that are almost coincident (segments shorter than minLen).

- `nodes` (*vec3[]*) : Modified nodes.
- `widths` (*number[]*) : Widths, updated in parallel.
- `minLen` (*number*) : Minimum length (m).
- **returns**: integer Number of kept nodes (inferred from code).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/geom.lua`.*
