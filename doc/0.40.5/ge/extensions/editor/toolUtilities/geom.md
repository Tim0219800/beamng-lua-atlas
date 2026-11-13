# `editor_toolUtilities_geom`

*Fichier : `lua/ge/extensions/editor/toolUtilities/geom.lua` · VM : Game Engine (GE) · 3236 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_geom` : `extensions.load("editor_toolUtilities_geom")`, puis la globale `editor_toolUtilities_geom`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_geom.angleBetweenVecs(a, b)` | Computes the (small) angle between two vectors of arbitrary length, in radians. | 1600 |
| `editor_toolUtilities_geom.angleBetweenVecsNorm(a, b)` | Computes the (small) angle between two unit vectors, in radians. | 1597 |
| `editor_toolUtilities_geom.applyBankFraction(spline, bankT, peakRad)` | Rolls a spline's per-station frame by a READY-MADE signed bank fraction (bankT[i] in [-1, 1], + = curving left),<br> peakRad being the angle a full-magnitude station reaches. The caller owns both the curvature -> fraction mapping and<br> the arc-length RUNOFF that eases the roll in and out. Deriving the angle per station from local curvature here is<br> what this function used to do, and it made the bank a square wave: full tilt the instant a corner starts, flat again<br> on the straight, and a sign flip across an S-curve with nothing in between. | 2204 |
| `editor_toolUtilities_geom.bridgeHoles2D(outer, holes, count)` | Merge hole rings into an outer ring with bridge edges. `count` caps how many of `holes` are taken. | 1281 |
| `editor_toolUtilities_geom.catmullRomCentripetalFast(p0, p1, p2, p3, t, s, outVec)` | Fast, non-allocating version of catmullRomCentripetal<br> [If outVec is provided, sets it and returns it. Otherwise creates a new vec3.] | 2471 |
| `editor_toolUtilities_geom.catmullRomConformToTerrain(spline, minNumDivIn, minSpacing, rayRaise)` | Interpolates the nodes and widths of the given spline with 'standard' Catmull-Rom splines to generate the secondary geometry properties.<br> [Points are conformed to the terrain.]<br> [The secondary geometry data is stored in the given spline object.]<br> [minSpacing - minimum spacing between division points in meters (optional, prevents over-dense points)]<br> [rayRaise - vertical raycast start offset in meters when falling back to raycast (optional)] | 2804 |
| `editor_toolUtilities_geom.catmullRomFree(spline, minNumDivIn, deckZ, maxSpacingIn)` | Interpolates the nodes and widths of the given spline with 'standard' Catmull-Rom splines to generate the secondary geometry properties.<br> [The secondary geometry data is stored in the given spline object.] | 2860 |
| `editor_toolUtilities_geom.catmullRomFreeWithBanking(spline, minNumDivIn, bankStrength, maxDegIn, tuningIn, deckZ, maxSpacingIn)` | Interpolates the nodes and widths of the given spline with Catmull-Rom splines, applying auto banking with falloff.<br> [The secondary geometry data is stored in the given spline object.] | 2918 |
| `editor_toolUtilities_geom.catmullRomNodesOnly(nodes, gran)` | Interpolates the given points with Catmull-Rom splines. | 2590 |
| `editor_toolUtilities_geom.catmullRomNodesWidthsOnly(nodes, widths, gran, isLoop)` | Interpolates the given points with Catmull-Rom splines.<br> [Only works for a single array of nodes.] | 2613 |
| `editor_toolUtilities_geom.catmullRomNodesWidthsVelVelLimits(spline, gran)` | Interpolates the given points with Catmull-Rom splines.<br> [Only works for a single array of nodes.] | 2645 |
| `editor_toolUtilities_geom.catmullRomRaycast(spline, minNumDivIn, minSpacing, rayRaise)` | Interpolates the nodes and widths of the given spline with 'standard' Catmull-Rom splines to generate the secondary geometry properties.<br> [Points are raycast to the surface below.]<br> [The secondary geometry data is stored in the given spline object.]<br> [minNumDivIn - minimum number of divisions per segment]<br> [minSpacing - minimum spacing between division points in meters (optional, prevents over-dense points)]<br> [rayRaise - vertical raycast start offset in meters (optional)] | 2753 |
| `editor_toolUtilities_geom.chordify(pts, n, chord, flags)` | Thin a tessellated curve down to chords of about `chord` metres. | 945 |
| `editor_toolUtilities_geom.clipRingRect2D(pts, x0, x1, y0, y1)` | A ring cut to the box x0..x1, y0..y1. A concave ring comes back as one ring that runs along the box edge between its<br> pieces, which covers the same ground inside the box. | 1123 |
| `editor_toolUtilities_geom.closestPointOnPolyline(pts, p, outPos)` | Closest point on a polyline to p (3D). Writes into outPos; returns squared distance. | 77 |
| `editor_toolUtilities_geom.closestPointOnPolyline2D(pts, p, outPos, tMin, tMax, closed)` | Closest point on polyline to p in XY (Z lerped). | 123 |
| `editor_toolUtilities_geom.closestRibbonSegPointToPoint(segIdx, ribbon, p)` | Compute the closest point on the given ribbon segment, to the given point. | 1897 |
| `editor_toolUtilities_geom.computeFrenetFrame(spline)` | Compute the local Frenet frame at each division point.<br> Zero-length spans must not normalize (that yields NaN binormals → Inf DecalRoad nodes). | 2689 |
| `editor_toolUtilities_geom.computeGraphPathFromNodes(spline)` | Computes the graph path from the given nodes and populates the spline's geometry data. | 2990 |
| `editor_toolUtilities_geom.computeRandomJitterQuat(spline, tgt, rightVec, nmlVec, outQuat)` | Computes a random jitter quaternion, for component-wise jitter.<br> [The result is written into 'outQuat' (modified in-place).] | 2226 |
| `editor_toolUtilities_geom.computeRandomJitterQuatFromFreedomAxes(spline, freedomAxes, outQuat)` | Computes a random jitter quaternion based on join freedom axes.<br> [The result is written into 'outQuat' (modified in-place).] | 2249 |
| `editor_toolUtilities_geom.computeRandomJitterQuat_ZOnly(jitter, nmlVec, outQuat)` | Computes a random jitter quaternion, for Z-only jitter. | 2219 |
| `editor_toolUtilities_geom.computeSDF(mask)` | Computes the signed distance field (SDF) of the given mask. | 2431 |
| `editor_toolUtilities_geom.computeSourcesAABB(sources)` | Computes the bounding box of the given sources. | 1686 |
| `editor_toolUtilities_geom.computeSplinePolygon(spline, margin, polygon)` | Computes a polygonal outline from the given spline. Includes a given margin.<br> [Polygons are fast to deal with using scanline spans.]<br> [Returns: polygon] | 372 |
| `editor_toolUtilities_geom.computeTurningRadius(p1, p2, p3)` | Curvature radius approximation using 3 points. | 481 |
| `editor_toolUtilities_geom.cornerAxis(ix, iy, ox, oy, period)` | Which way a post, pier or newel STANDING ON A CORNER faces, given the direction in and the direction out. | 3070 |
| `editor_toolUtilities_geom.cross2(ax, ay, bx, by)` | 2D scalar primitives on plain components (no vec3 / table churn - for hot geometry paths). | 3059 |
| `editor_toolUtilities_geom.curvatureToBankAngle(curv, bankStrength, maxDeg, tuning)` | Converts curvature to banking angle in radians. maxDeg (cap on the sharpest curves) and tuning<br> (curv at which the cap is reached; higher = max reached at a tighter radius) are optional per-call<br> overrides; they default to the module constants so existing callers are unchanged. | 2194 |
| `editor_toolUtilities_geom.densifyByMaxSpacing(points, maxSpacing)` | Densifies a polyline so no segment exceeds maxSpacing. | 989 |
| `editor_toolUtilities_geom.distSqPointSeg2D(px, py, ax, ay, bx, by)` | Squared distance from point (px,py) to the FINITE segment AB (t clamped to the segment) - for hot proximity tests. | 1063 |
| `editor_toolUtilities_geom.dot2(ax, ay, bx, by)` |  | 3061 |
| `editor_toolUtilities_geom.flipSplineDirection(spline)` | Flips the direction of the given spline. | 1878 |
| `editor_toolUtilities_geom.getAABB(points)` | Returns the axis-aligned bounding box of the given array of points. | 335 |
| `editor_toolUtilities_geom.getAllQuadrilaterals(sources, margin)` | Gets quadrilaterals, with lateral bloating (no longitudinal stretching). | 1700 |
| `editor_toolUtilities_geom.getBarScale()` | Returns the scale factor for the bar points. | 68 |
| `editor_toolUtilities_geom.getNodeSpansInsidePolygon(nodes, polygon)` | Given a polyline and a polygon, returns sequences of consecutive indices that are inside the polygon. | 1915 |
| `editor_toolUtilities_geom.getPreRotQuats()` | Returns the pre-rotation quaternions. | 65 |
| `editor_toolUtilities_geom.getScanlineSpans(gMinY, gMaxY, te, tb, polygon, spansXMin, spansXMax, spansY)` | Computes the scanline spans for the given polygon.<br> [The scanline spans are the spans of the polygon on the Y-axis, in grid space.]<br> [The spans are stored in the given spansXMin, spansXMax, and spansY tables.] | 2397 |
| `editor_toolUtilities_geom.getTerrainNormal(p)` | Returns the normal of the terrain at the given world-space point. | 420 |
| `editor_toolUtilities_geom.getTerrainNormalInPlace(p, out)` | Returns the normal of the terrain at the given world-space point, in-place. | 433 |
| `editor_toolUtilities_geom.insetClosedRing2D(ring, dist)` | Inset a CLOSED polygon of {x=,y=} verts inward by up to dist, along each vertex's averaged edge normal (the<br> true local inward direction, so it works on concave rings where a centroid-ward push would send points to the<br> wrong side). | 1465 |
| `editor_toolUtilities_geom.insetPathAlongNormal2D(path, cx, cy, insetM)` |  | 705 |
| `editor_toolUtilities_geom.intersection2LineSegs(p1, p2, q1, q2, out)` | Finds the intersection point between two line segments. Inlined. | 502 |
| `editor_toolUtilities_geom.intersectsUpQuadBarycentric(p, q)` | Intersects the given point with the given quadrilateral, and returns the height at the intersection point. | 1672 |
| `editor_toolUtilities_geom.isLineSegIntersect(a, b, c, d)` | Checks if the given line segment (a, b) intersects with the given line segment (c, d). | 496 |
| `editor_toolUtilities_geom.isMouseOverBar(splines)` | Checks if the mouse is over a bar.<br> [Splines - The collection of splines to check, which must have a member 1D array 'barPoints', containing the ordered points of the bars.] | 301 |
| `editor_toolUtilities_geom.isMouseOverGraphNode(nodes)` | Checks if the mouse is over a node in the navigation graph. | 322 |
| `editor_toolUtilities_geom.isMouseOverNode(splines)` | Checks if the mouse is over a node of any spline in the given collection of splines.<br> [Splines - The collection of splines to check, which must have a member array 'nodes', containing the ordered points of the splines.] | 258 |
| `editor_toolUtilities_geom.isMouseOverPolyline(points, mousePos, closed)` | Checks if the mouse is over the given polyline. `closed` also tests the edge from the last node back to the first, which<br> is a real edge of a polygon and not of a polyline. | 280 |
| `editor_toolUtilities_geom.isMouseOverSpline(spline, maxDistSq)` | Checks if the mouse is over the given spline (insert-node / hover pick).<br> Uses camera ray ↔ centerline closest approach so elevated roads work.<br> Returns: hit, segmentIndex, pointOnSpline.<br> maxDistSq: optional ray↔centerline tolerance (squared). Pass a large value (e.g. math.huge) to get the<br> nearest point unconditionally — used when dragging a handle that sits off the centerline (road edge). | 2516 |
| `editor_toolUtilities_geom.isPointInTriangle(p, a, b, c)` | Checks if the given point (p) is inside the given triangle (a, b, c). | 406 |
| `editor_toolUtilities_geom.joinSplineGeometry(n1, w1, nm1, nodeIdx1, n2, w2, nm2, nodeIdx2, c1, c2)` | Joins two spline geometries at the specified node indices. | 1822 |
| `editor_toolUtilities_geom.lineDirsHitT2D(p0x, p0y, d0x, d0y, p1x, p1y, d1x, d1y, eps)` | t along p0+t*d0 at intersection with p1+u*d1 (nil if parallel). Unit d0 => t in metres. | 580 |
| `editor_toolUtilities_geom.lineIntersect2D(px, py, dx, dy, qx, qy, ex, ey, eps)` | Intersect two INFINITE lines P+s*D and Q+s*E; returns ix,iy or nil when parallel (thin point-returning wrapper on<br> lineDirsHitT2D, which returns the parameter along the first line). | 3086 |
| `editor_toolUtilities_geom.linesIntersect2D(a0, a1, b0, b1, eps)` | Returns { pt={x,y}, alongA, alongB } or nil if parallel (along* Martinez codes). | 559 |
| `editor_toolUtilities_geom.multiPolygonCentroidXY(regions)` | Area-weighted centroid of one or more closed 2D rings ({x,y} verts). Returns cx, cy or nil. | 835 |
| `editor_toolUtilities_geom.normalize2(x, y)` |  | 3063 |
| `editor_toolUtilities_geom.offsetPathFromCenter2D(path, cx, cy, distM, distArr)` | Offset a 2D polyline AWAY from (cx, cy) along its local normal. | 816 |
| `editor_toolUtilities_geom.offsetPathMiter2D(pts, dist, cx, cy, z, inward)` | Miter-clipped parallel offset of an OPEN 2D polyline: one output point per source vertex (so paired rails stay<br> index-aligned) with z carried through. Corners keep true perpendicular width, unlike offsetPathFromCenter2D's<br> per-vertex normals. The side is chosen ONCE for the whole path so it cannot flip halfway along: away from<br> (cx, cy), or toward it when inward. | 728 |
| `editor_toolUtilities_geom.outsetClosedRing2D(ring, dist)` | A closed ring pushed OUTWARD by a small `dist`, corners mitred. | 1400 |
| `editor_toolUtilities_geom.outsetRingSides2D(ring, dist, move)` | The same, but only for the sides `move[i]` picks out; every other side stays exactly on the line it was on. A vertex<br> between a side that moves and one that does not slides ALONG the stationary side to meet the moved one, so the two<br> stay a closed ring with no notch at the changeover. Vertex count is unchanged. | 1432 |
| `editor_toolUtilities_geom.perpDistPointSeg2D(ax, ay, bx, by, px, py)` | Perpendicular distance of point (px,py) from segment (ax,ay)->(bx,by) in XY. Degenerate segment -> distance to A. | 3046 |
| `editor_toolUtilities_geom.pointAboveOrOnLine2D(pt, left, right, eps)` |  | 532 |
| `editor_toolUtilities_geom.pointBetween2D(p, left, right, eps)` | p is taken to be collinear with left->right; false if it is either endpoint, or outside them.<br> The test is on the DOT PRODUCT, not on the normalised position along the line. Both read the same at a metre or so, but the<br> dot carries units of length squared, so on a two millimetre edge a normalised test tolerates a p that is an endpoint to<br> within a ten-thousandth of the edge -- and the sweep that calls this then splits a segment at its own end, leaving a<br> zero-length piece that corrupts the fill. | 547 |
| `editor_toolUtilities_geom.pointInQuadBarycentric(p, q)` | Determines if the given point is inside the given quadrilateral. | 1681 |
| `editor_toolUtilities_geom.pointInRing2D(px, py, ring)` | 2D point-in-polygon (ray cast) for a ring of {x=,y=} verts. Winding-agnostic (even-odd). | 1087 |
| `editor_toolUtilities_geom.pointInTri2D(px, py, ax, ay, bx, by, cx, cy)` | Point-in-triangle (2D, barycentric). Scalar (no vec3 alloc) for tight inner loops such as ear clipping. | 1131 |
| `editor_toolUtilities_geom.pointsCollinear2D(a, b, c, eps)` |  | 537 |
| `editor_toolUtilities_geom.pointsCompare2D(a, b, eps)` |  | 525 |
| `editor_toolUtilities_geom.pointsSame2D(a, b, eps)` |  | 520 |
| `editor_toolUtilities_geom.polygonOBB(poly)` | Oriented bounding box of a 2D polygon (array of {[1]=x,[2]=y}) via PCA. | 346 |
| `editor_toolUtilities_geom.polylineCumLength2D(pts, out)` | 2D (XY-only) sibling of polylineCumLength3D for plain {x,y} points (no vec3 :distance): out[i] = distance from pts[1]<br> to pts[i]. Takes an optional reused `out` table (cleared then refilled) so a hot rebuild allocates nothing; omit for a<br> fresh one. Returns out and its total length. | 875 |
| `editor_toolUtilities_geom.polylineCumLength3D(pts)` | Cumulative 3D chord lengths along a polyline. Returns cum[1..n], total. | 864 |
| `editor_toolUtilities_geom.polylineZAtArcFromTip(pts, cum, total, fromStart, dist)` | Z of the first sample at arc distance `dist` from start or finish tip. | 1559 |
| `editor_toolUtilities_geom.populateTreeQuads(quads)` | Creates and populates a kd-tree containing the given quadrilaterals. | 1723 |
| `editor_toolUtilities_geom.projectPointToSpline(pos, spline)` | Projects the given point onto the given spline.<br> [Returns: closest point (p), s in [0,1], t in [-inf,inf]; or nil if outside segment bounds.] | 1942 |
| `editor_toolUtilities_geom.quadUV(px, py, q1, q2, q3, q4)` | Inverse bilinear on the XY plane: the (u, v) with p = lerp(lerp(q1, q2, u), lerp(q3, q4, u), v), or nil<br> when p lies outside the quad. u runs across q1->q2, v along q1->q3. | 1631 |
| `editor_toolUtilities_geom.rayIntersect2D(px, py, dx, dy, qx, qy, ex, ey, eps)` | Intersect two RAYS (forward only) P+s*D and Q+u*E; returns ix,iy or nil (parallel, or the hit lies behind either ray). | 3093 |
| `editor_toolUtilities_geom.resampleUniformNodesWidths(nodes, widths, spacing)` | Resamples a polyline (nodes = vec3[], widths = number[]). | 1008 |
| `editor_toolUtilities_geom.reshapeLeadInBezier2D(nodes, fromStart, p0x, p0y, gx, gy, L)` | Reshape one END of a node polyline in place (2D x/y; z untouched). | 633 |
| `editor_toolUtilities_geom.ribbonIntervalFrame(p1, p2, t1, t2, n1, n2, outPos, outTan, outUp, prevAcross)` | Mid-interval frame for rigid kit panels on a graded/banked edge (fences, barriers). | 2103 |
| `editor_toolUtilities_geom.ribbonOverlapEnd2D(hx, hy, a, aFromStart, b, bFromStart, clearM, stepM, maxM)` | Where two ribbons that leave a shared junction stop overlapping, as arc length along A measured from the hub (hx, hy).. | 153 |
| `editor_toolUtilities_geom.ribbonUpFromAlong(along, upRef, outUp, prevAcross)` | Road-ribbon up for a unit along direction: up ⊥ along, bank from upRef.<br> prevAcross (optional vec3) keeps lateral sign continuous across a placement run. | 2076 |
| `editor_toolUtilities_geom.ringSignedArea2(ring)` | Twice the signed area of a 2D ring ({x=,y=} verts). Positive => CCW (x-right, y-up). | 1223 |
| `editor_toolUtilities_geom.rotateVecAroundAxis(v, k, theta)` | Rotates vector v around unit axis k, by angle theta (in radians).<br> [Uses the standard Rodrigues formula]. | 453 |
| `editor_toolUtilities_geom.rotateVecAroundAxisInlined(v, k, theta, out)` | Rotates vector v around unit axis k, by angle theta (radians) into 'out' without allocations.<br> out = v * cos(theta) + (k x v) * sin(theta) + k * (k . v) * (1 - cos(theta)) | 467 |
| `editor_toolUtilities_geom.rotateVecAroundZ(vec, v, angle)` | Rotates vector v around the z-axis, by angle theta (in radians). In place. | 445 |
| `editor_toolUtilities_geom.sampleCubicBezier2D(p0, p1, p2, p3, segs)` | Sample a cubic Bezier in XY (inclusive endpoints). segs = number of segments (default 14). | 589 |
| `editor_toolUtilities_geom.sampleSpline(divPoints, tangents, normals, spacing, outPosns, outTans, outNormals)` | Sample along true arc-length of the given polyline, to compute the positions and Frenet frame at regular intervals.<br> [Returns: outPosns, outTans, outNormals] | 1996 |
| `editor_toolUtilities_geom.sampleSplineAdaptive(divPoints, tangents, normals, meshLength, outPosns, outTans, outNormals, outScales)` | Adaptive sampling along the given spline, to compute the positions and Frenet frame at regular intervals.<br> [Adaptive in the sense that small curvature segments are sampled more densely, and large curvature segments are sampled more sparsely.]<br> [Returns: outPosns, outTans, outNormals, outScales] | 2152 |
| `editor_toolUtilities_geom.sampleSplineEvenFit(divPoints, tangents, normals, targetSpacing, isLoop, outPosns, outTans, outNormals)` | Even-fit sampler for discrete props (lamp posts / bollards). | 2024 |
| `editor_toolUtilities_geom.segCrossParam2D(ax, ay, bx, by, cx, cy, dx, dy)` | Proper crossing of open segments AB x CD: returns the parameter t on AB in (0,1) at the interior crossing, else nil<br> (parallel, or the crossing lies on/at an endpoint). Endpoints are excluded so touching strips don't read as a fold. | 1074 |
| `editor_toolUtilities_geom.sigMoved(old, new, tolM)` | Whether a shape signature (a flat list of numbers and strings) moved since `old`: numbers by more than tolM, strings at all. | 889 |
| `editor_toolUtilities_geom.signedAngleAroundAxis(fromVec, toVec, axis)` | Compute the signed angle between two vectors around a given axis.<br> [Vectors are projected onto the plane of rotation before computation.] | 1620 |
| `editor_toolUtilities_geom.signedAngleBetweenVecs(a, b, axis)` | Compute the signed angle between two vectors around a given axis.<br> [Assumes vectors are in plane of rotation.] | 1610 |
| `editor_toolUtilities_geom.simplifyRDP(points, tolM)` | Ramer-Douglas-Peucker simplification of a polyline (perpendicular distance measured in full 3D). | 903 |
| `editor_toolUtilities_geom.smoothClosedPolygonChaikin(poly, iterations)` | Chaikin corner-cutting for a closed polygon of {x=,y=} points. | 1046 |
| `editor_toolUtilities_geom.smoothNodesHeightSteffen(nodes)` | Tip-to-tip height smooth: fix z[1] and z[n], rewrite interior Z via Steffen along XY length. | 101 |
| `editor_toolUtilities_geom.splitLoopSplineGeometry(nodes, widths, nmls, splitNodeIdx, corners)` | Splits a loop spline at the given node index, returning reordered geometry.<br> [Returns: nodesNew, widthsNew, nmlsNew (reordered loop arrays).]<br> `corners` (optional) is carried through the reorder and returned as a 4th value (cornersNew), index-aligned to nodesNew. | 1791 |
| `editor_toolUtilities_geom.splitPolylineByBlocked(pts, isBlocked, stepM, minKeepM)` | Split a 2D polyline into the runs that stay clear of a blocked region. | 1508 |
| `editor_toolUtilities_geom.splitSplineGeometry(nodes, widths, nmls, splitNodeIdx, corners)` | `corners` (optional) is a parallel per-node override array carried through the split so engineered tools keep their per-corner<br> radius/widen/etc. It is returned as two extra trailing values (corners1, corners2), index-aligned to nodes1/nodes2; callers that<br> don't pass it get nil and are unaffected. | 1752 |
| `editor_toolUtilities_geom.squaredDistance2D(a, b)` | Squared XY distance between two points (ignores Z). | 71 |
| `editor_toolUtilities_geom.squaredSegSegDist(a0, a1, b0, b1, outP1, outP2)` | Returns the squared distance between two line segments. | 219 |
| `editor_toolUtilities_geom.tipOutwardXY(pts, fromStart, minWalkM)` | Unit XY direction outward past a tip (away from the polyline). Walks minWalkM<br> along the chain so a short back-folded first segment cannot reverse the aim. | 1576 |
| `editor_toolUtilities_geom.translateSpline(pts, binormals, t, out)` | Translates the given spline by the given amount on the binormal (lateral) direction. | 2183 |
| `editor_toolUtilities_geom.triangulatePolygon2D(poly)` | Ear-clipping triangulation of a simple 2D polygon (array of {x=,y=} verts, either winding).<br> The closing repeat has to go before any of this: it is a zero-length edge, so the corner on either side of it has no turn<br> in it and neither can ever be clipped as an ear. On most outlines the clip gets round them; on some it stalls, comes up<br> short of the n-2 triangles a cap needs, and the WHOLE cap is thrown away. | 1162 |
| `editor_toolUtilities_geom.triangulateWithHoles2D(outer, holes)` | Triangulate a 2D polygon that may have holes. Returns the ring the triangles index into and the triangles. | 1374 |
| `editor_toolUtilities_geom.updateBarPoints(spline, isBarsLimits)` | Update the bar points. | 2318 |
| `editor_toolUtilities_geom.updateBarPointsGraph(spline, graphData, isBarsLimit)` | Update the bar points for a graph path.<br> [spline - The spline to update bar points for.]<br> [graphData - The navigation graph data.]<br> [isBarsLimit - Whether to use velLimits (true) or vels (false) for bar heights.] | 2357 |
| `editor_toolUtilities_geom.updateRibPointsFree(spline)` | Re-compute the rib points, in free-floating 3D space. | 2263 |
| `editor_toolUtilities_geom.updateRibPointsRaycast(spline)` | Update the rib points. using vertical raycasting to conform them to the nearest surface below . | 2290 |
| `editor_toolUtilities_geom.weldShortSegments(nodes, widths, minLen)` | Welds out near-coincident consecutive nodes, in place. | 964 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/geom.lua`.*
