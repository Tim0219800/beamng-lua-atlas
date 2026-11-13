---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/geom.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_geom` : `extensions.load("editor_toolUtilities_geom")`, puis la globale `editor_toolUtilities_geom`
---@class editor_toolUtilities_geom
editor_toolUtilities_geom = {}

--- Computes the (small) angle between two vectors of arbitrary length, in radians.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1600
---@param a any
---@param b any
function editor_toolUtilities_geom.angleBetweenVecs(a, b) end

--- Computes the (small) angle between two unit vectors, in radians.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1597
---@param a any
---@param b any
function editor_toolUtilities_geom.angleBetweenVecsNorm(a, b) end

--- Rolls a spline's per-station frame by a READY-MADE signed bank fraction (bankT[i] in [-1, 1], + = curving left),
---  peakRad being the angle a full-magnitude station reaches. The caller owns both the curvature -> fraction mapping and
---  the arc-length RUNOFF that eases the roll in and out. Deriving the angle per station from local curvature here is
---  what this function used to do, and it made the bank a square wave: full tilt the instant a corner starts, flat again
---  on the straight, and a sign flip across an S-curve with nothing in between.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2204
---@param spline any
---@param bankT any
---@param peakRad any
function editor_toolUtilities_geom.applyBankFraction(spline, bankT, peakRad) end

--- Merge hole rings into an outer ring with bridge edges. `count` caps how many of `holes` are taken.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1281
---@param outer any
---@param holes any
---@param count any
function editor_toolUtilities_geom.bridgeHoles2D(outer, holes, count) end

--- Fast, non-allocating version of catmullRomCentripetal
---  [If outVec is provided, sets it and returns it. Otherwise creates a new vec3.]
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2471
---@param p0 any
---@param p1 any
---@param p2 any
---@param p3 any
---@param t any
---@param s any
---@param outVec any
function editor_toolUtilities_geom.catmullRomCentripetalFast(p0, p1, p2, p3, t, s, outVec) end

--- Interpolates the nodes and widths of the given spline with 'standard' Catmull-Rom splines to generate the secondary geometry properties.
---  [Points are conformed to the terrain.]
---  [The secondary geometry data is stored in the given spline object.]
---  [minSpacing - minimum spacing between division points in meters (optional, prevents over-dense points)]
---  [rayRaise - vertical raycast start offset in meters when falling back to raycast (optional)]
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2804
---@param spline any
---@param minNumDivIn any
---@param minSpacing any
---@param rayRaise any
function editor_toolUtilities_geom.catmullRomConformToTerrain(spline, minNumDivIn, minSpacing, rayRaise) end

--- Interpolates the nodes and widths of the given spline with 'standard' Catmull-Rom splines to generate the secondary geometry properties.
---  [The secondary geometry data is stored in the given spline object.]
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2860
---@param spline any
---@param minNumDivIn any
---@param deckZ any
---@param maxSpacingIn any
function editor_toolUtilities_geom.catmullRomFree(spline, minNumDivIn, deckZ, maxSpacingIn) end

--- Interpolates the nodes and widths of the given spline with Catmull-Rom splines, applying auto banking with falloff.
---  [The secondary geometry data is stored in the given spline object.]
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2918
---@param spline any
---@param minNumDivIn any
---@param bankStrength any
---@param maxDegIn any
---@param tuningIn any
---@param deckZ any
---@param maxSpacingIn any
function editor_toolUtilities_geom.catmullRomFreeWithBanking(spline, minNumDivIn, bankStrength, maxDegIn, tuningIn, deckZ, maxSpacingIn) end

--- Interpolates the given points with Catmull-Rom splines.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2590
---@param nodes any
---@param gran any
function editor_toolUtilities_geom.catmullRomNodesOnly(nodes, gran) end

--- Interpolates the given points with Catmull-Rom splines.
---  [Only works for a single array of nodes.]
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2613
---@param nodes any
---@param widths any
---@param gran any
---@param isLoop any
function editor_toolUtilities_geom.catmullRomNodesWidthsOnly(nodes, widths, gran, isLoop) end

--- Interpolates the given points with Catmull-Rom splines.
---  [Only works for a single array of nodes.]
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2645
---@param spline any
---@param gran any
function editor_toolUtilities_geom.catmullRomNodesWidthsVelVelLimits(spline, gran) end

--- Interpolates the nodes and widths of the given spline with 'standard' Catmull-Rom splines to generate the secondary geometry properties.
---  [Points are raycast to the surface below.]
---  [The secondary geometry data is stored in the given spline object.]
---  [minNumDivIn - minimum number of divisions per segment]
---  [minSpacing - minimum spacing between division points in meters (optional, prevents over-dense points)]
---  [rayRaise - vertical raycast start offset in meters (optional)]
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2753
---@param spline any
---@param minNumDivIn any
---@param minSpacing any
---@param rayRaise any
function editor_toolUtilities_geom.catmullRomRaycast(spline, minNumDivIn, minSpacing, rayRaise) end

--- Thin a tessellated curve down to chords of about `chord` metres.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:945
---@param pts any
---@param n any
---@param chord any
---@param flags any
function editor_toolUtilities_geom.chordify(pts, n, chord, flags) end

--- A ring cut to the box x0..x1, y0..y1. A concave ring comes back as one ring that runs along the box edge between its
---  pieces, which covers the same ground inside the box.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1123
---@param pts any
---@param x0 any
---@param x1 any
---@param y0 any
---@param y1 any
function editor_toolUtilities_geom.clipRingRect2D(pts, x0, x1, y0, y1) end

--- Closest point on a polyline to p (3D). Writes into outPos; returns squared distance.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:77
---@param pts any
---@param p any
---@param outPos any
function editor_toolUtilities_geom.closestPointOnPolyline(pts, p, outPos) end

--- Closest point on polyline to p in XY (Z lerped).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:123
---@param pts any
---@param p any
---@param outPos any
---@param tMin any
---@param tMax any
---@param closed any
function editor_toolUtilities_geom.closestPointOnPolyline2D(pts, p, outPos, tMin, tMax, closed) end

--- Compute the closest point on the given ribbon segment, to the given point.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1897
---@param segIdx any
---@param ribbon any
---@param p any
function editor_toolUtilities_geom.closestRibbonSegPointToPoint(segIdx, ribbon, p) end

--- Compute the local Frenet frame at each division point.
---  Zero-length spans must not normalize (that yields NaN binormals → Inf DecalRoad nodes).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2689
---@param spline any
function editor_toolUtilities_geom.computeFrenetFrame(spline) end

--- Computes the graph path from the given nodes and populates the spline's geometry data.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2990
---@param spline any
function editor_toolUtilities_geom.computeGraphPathFromNodes(spline) end

--- Computes a random jitter quaternion, for component-wise jitter.
---  [The result is written into 'outQuat' (modified in-place).]
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2226
---@param spline any
---@param tgt any
---@param rightVec any
---@param nmlVec any
---@param outQuat any
function editor_toolUtilities_geom.computeRandomJitterQuat(spline, tgt, rightVec, nmlVec, outQuat) end

--- Computes a random jitter quaternion based on join freedom axes.
---  [The result is written into 'outQuat' (modified in-place).]
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2249
---@param spline any
---@param freedomAxes any
---@param outQuat any
function editor_toolUtilities_geom.computeRandomJitterQuatFromFreedomAxes(spline, freedomAxes, outQuat) end

--- Computes a random jitter quaternion, for Z-only jitter.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2219
---@param jitter any
---@param nmlVec any
---@param outQuat any
function editor_toolUtilities_geom.computeRandomJitterQuat_ZOnly(jitter, nmlVec, outQuat) end

--- Computes the signed distance field (SDF) of the given mask.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2431
---@param mask any
function editor_toolUtilities_geom.computeSDF(mask) end

--- Computes the bounding box of the given sources.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1686
---@param sources any
function editor_toolUtilities_geom.computeSourcesAABB(sources) end

--- Computes a polygonal outline from the given spline. Includes a given margin.
---  [Polygons are fast to deal with using scanline spans.]
---  [Returns: polygon]
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:372
---@param spline any
---@param margin any
---@param polygon any
function editor_toolUtilities_geom.computeSplinePolygon(spline, margin, polygon) end

--- Curvature radius approximation using 3 points.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:481
---@param p1 any
---@param p2 any
---@param p3 any
function editor_toolUtilities_geom.computeTurningRadius(p1, p2, p3) end

--- Which way a post, pier or newel STANDING ON A CORNER faces, given the direction in and the direction out.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:3070
---@param ix any
---@param iy any
---@param ox any
---@param oy any
---@param period any
function editor_toolUtilities_geom.cornerAxis(ix, iy, ox, oy, period) end

--- 2D scalar primitives on plain components (no vec3 / table churn - for hot geometry paths).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:3059
---@param ax any
---@param ay any
---@param bx any
---@param by any
function editor_toolUtilities_geom.cross2(ax, ay, bx, by) end

--- Converts curvature to banking angle in radians. maxDeg (cap on the sharpest curves) and tuning
---  (curv at which the cap is reached; higher = max reached at a tighter radius) are optional per-call
---  overrides; they default to the module constants so existing callers are unchanged.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2194
---@param curv any
---@param bankStrength any
---@param maxDeg any
---@param tuning any
function editor_toolUtilities_geom.curvatureToBankAngle(curv, bankStrength, maxDeg, tuning) end

--- Densifies a polyline so no segment exceeds maxSpacing.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:989
---@param points any
---@param maxSpacing any
function editor_toolUtilities_geom.densifyByMaxSpacing(points, maxSpacing) end

--- Squared distance from point (px,py) to the FINITE segment AB (t clamped to the segment) - for hot proximity tests.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1063
---@param px any
---@param py any
---@param ax any
---@param ay any
---@param bx any
---@param by any
function editor_toolUtilities_geom.distSqPointSeg2D(px, py, ax, ay, bx, by) end

---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:3061
---@param ax any
---@param ay any
---@param bx any
---@param by any
function editor_toolUtilities_geom.dot2(ax, ay, bx, by) end

--- Flips the direction of the given spline.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1878
---@param spline any
function editor_toolUtilities_geom.flipSplineDirection(spline) end

--- Returns the axis-aligned bounding box of the given array of points.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:335
---@param points any
function editor_toolUtilities_geom.getAABB(points) end

--- Gets quadrilaterals, with lateral bloating (no longitudinal stretching).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1700
---@param sources any
---@param margin any
function editor_toolUtilities_geom.getAllQuadrilaterals(sources, margin) end

--- Returns the scale factor for the bar points.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:68
function editor_toolUtilities_geom.getBarScale() end

--- Given a polyline and a polygon, returns sequences of consecutive indices that are inside the polygon.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1915
---@param nodes any
---@param polygon any
function editor_toolUtilities_geom.getNodeSpansInsidePolygon(nodes, polygon) end

--- Returns the pre-rotation quaternions.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:65
function editor_toolUtilities_geom.getPreRotQuats() end

--- Computes the scanline spans for the given polygon.
---  [The scanline spans are the spans of the polygon on the Y-axis, in grid space.]
---  [The spans are stored in the given spansXMin, spansXMax, and spansY tables.]
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2397
---@param gMinY any
---@param gMaxY any
---@param te any
---@param tb any
---@param polygon any
---@param spansXMin any
---@param spansXMax any
---@param spansY any
function editor_toolUtilities_geom.getScanlineSpans(gMinY, gMaxY, te, tb, polygon, spansXMin, spansXMax, spansY) end

--- Returns the normal of the terrain at the given world-space point.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:420
---@param p any
function editor_toolUtilities_geom.getTerrainNormal(p) end

--- Returns the normal of the terrain at the given world-space point, in-place.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:433
---@param p any
---@param out any
function editor_toolUtilities_geom.getTerrainNormalInPlace(p, out) end

--- Inset a CLOSED polygon of {x=,y=} verts inward by up to dist, along each vertex's averaged edge normal (the
---  true local inward direction, so it works on concave rings where a centroid-ward push would send points to the
---  wrong side).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1465
---@param ring any
---@param dist any
function editor_toolUtilities_geom.insetClosedRing2D(ring, dist) end

---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:705
---@param path any
---@param cx any
---@param cy any
---@param insetM any
function editor_toolUtilities_geom.insetPathAlongNormal2D(path, cx, cy, insetM) end

--- Finds the intersection point between two line segments. Inlined.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:502
---@param p1 any
---@param p2 any
---@param q1 any
---@param q2 any
---@param out any
function editor_toolUtilities_geom.intersection2LineSegs(p1, p2, q1, q2, out) end

--- Intersects the given point with the given quadrilateral, and returns the height at the intersection point.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1672
---@param p any
---@param q any
function editor_toolUtilities_geom.intersectsUpQuadBarycentric(p, q) end

--- Checks if the given line segment (a, b) intersects with the given line segment (c, d).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:496
---@param a any
---@param b any
---@param c any
---@param d any
function editor_toolUtilities_geom.isLineSegIntersect(a, b, c, d) end

--- Checks if the mouse is over a bar.
---  [Splines - The collection of splines to check, which must have a member 1D array 'barPoints', containing the ordered points of the bars.]
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:301
---@param splines any
function editor_toolUtilities_geom.isMouseOverBar(splines) end

--- Checks if the mouse is over a node in the navigation graph.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:322
---@param nodes any
function editor_toolUtilities_geom.isMouseOverGraphNode(nodes) end

--- Checks if the mouse is over a node of any spline in the given collection of splines.
---  [Splines - The collection of splines to check, which must have a member array 'nodes', containing the ordered points of the splines.]
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:258
---@param splines any
function editor_toolUtilities_geom.isMouseOverNode(splines) end

--- Checks if the mouse is over the given polyline. `closed` also tests the edge from the last node back to the first, which
---  is a real edge of a polygon and not of a polyline.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:280
---@param points any
---@param mousePos any
---@param closed any
function editor_toolUtilities_geom.isMouseOverPolyline(points, mousePos, closed) end

--- Checks if the mouse is over the given spline (insert-node / hover pick).
---  Uses camera ray ↔ centerline closest approach so elevated roads work.
---  Returns: hit, segmentIndex, pointOnSpline.
---  maxDistSq: optional ray↔centerline tolerance (squared). Pass a large value (e.g. math.huge) to get the
---  nearest point unconditionally — used when dragging a handle that sits off the centerline (road edge).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2516
---@param spline any
---@param maxDistSq any
function editor_toolUtilities_geom.isMouseOverSpline(spline, maxDistSq) end

--- Checks if the given point (p) is inside the given triangle (a, b, c).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:406
---@param p any
---@param a any
---@param b any
---@param c any
function editor_toolUtilities_geom.isPointInTriangle(p, a, b, c) end

--- Joins two spline geometries at the specified node indices.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1822
---@param n1 any
---@param w1 any
---@param nm1 any
---@param nodeIdx1 any
---@param n2 any
---@param w2 any
---@param nm2 any
---@param nodeIdx2 any
---@param c1 any
---@param c2 any
function editor_toolUtilities_geom.joinSplineGeometry(n1, w1, nm1, nodeIdx1, n2, w2, nm2, nodeIdx2, c1, c2) end

--- t along p0+t*d0 at intersection with p1+u*d1 (nil if parallel). Unit d0 => t in metres.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:580
---@param p0x any
---@param p0y any
---@param d0x any
---@param d0y any
---@param p1x any
---@param p1y any
---@param d1x any
---@param d1y any
---@param eps any
function editor_toolUtilities_geom.lineDirsHitT2D(p0x, p0y, d0x, d0y, p1x, p1y, d1x, d1y, eps) end

--- Intersect two INFINITE lines P+s*D and Q+s*E; returns ix,iy or nil when parallel (thin point-returning wrapper on
---  lineDirsHitT2D, which returns the parameter along the first line).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:3086
---@param px any
---@param py any
---@param dx any
---@param dy any
---@param qx any
---@param qy any
---@param ex any
---@param ey any
---@param eps any
function editor_toolUtilities_geom.lineIntersect2D(px, py, dx, dy, qx, qy, ex, ey, eps) end

--- Returns { pt={x,y}, alongA, alongB } or nil if parallel (along* Martinez codes).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:559
---@param a0 any
---@param a1 any
---@param b0 any
---@param b1 any
---@param eps any
function editor_toolUtilities_geom.linesIntersect2D(a0, a1, b0, b1, eps) end

--- Area-weighted centroid of one or more closed 2D rings ({x,y} verts). Returns cx, cy or nil.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:835
---@param regions any
function editor_toolUtilities_geom.multiPolygonCentroidXY(regions) end

---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:3063
---@param x any
---@param y any
function editor_toolUtilities_geom.normalize2(x, y) end

--- Offset a 2D polyline AWAY from (cx, cy) along its local normal.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:816
---@param path any
---@param cx any
---@param cy any
---@param distM any
---@param distArr any
function editor_toolUtilities_geom.offsetPathFromCenter2D(path, cx, cy, distM, distArr) end

--- Miter-clipped parallel offset of an OPEN 2D polyline: one output point per source vertex (so paired rails stay
---  index-aligned) with z carried through. Corners keep true perpendicular width, unlike offsetPathFromCenter2D's
---  per-vertex normals. The side is chosen ONCE for the whole path so it cannot flip halfway along: away from
---  (cx, cy), or toward it when inward.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:728
---@param pts any
---@param dist any
---@param cx any
---@param cy any
---@param z any
---@param inward any
function editor_toolUtilities_geom.offsetPathMiter2D(pts, dist, cx, cy, z, inward) end

--- A closed ring pushed OUTWARD by a small `dist`, corners mitred.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1400
---@param ring any
---@param dist any
function editor_toolUtilities_geom.outsetClosedRing2D(ring, dist) end

--- The same, but only for the sides `move[i]` picks out; every other side stays exactly on the line it was on. A vertex
---  between a side that moves and one that does not slides ALONG the stationary side to meet the moved one, so the two
---  stay a closed ring with no notch at the changeover. Vertex count is unchanged.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1432
---@param ring any
---@param dist any
---@param move any
function editor_toolUtilities_geom.outsetRingSides2D(ring, dist, move) end

--- Perpendicular distance of point (px,py) from segment (ax,ay)->(bx,by) in XY. Degenerate segment -> distance to A.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:3046
---@param ax any
---@param ay any
---@param bx any
---@param by any
---@param px any
---@param py any
function editor_toolUtilities_geom.perpDistPointSeg2D(ax, ay, bx, by, px, py) end

---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:532
---@param pt any
---@param left any
---@param right any
---@param eps any
function editor_toolUtilities_geom.pointAboveOrOnLine2D(pt, left, right, eps) end

--- p is taken to be collinear with left->right; false if it is either endpoint, or outside them.
---  The test is on the DOT PRODUCT, not on the normalised position along the line. Both read the same at a metre or so, but the
---  dot carries units of length squared, so on a two millimetre edge a normalised test tolerates a p that is an endpoint to
---  within a ten-thousandth of the edge -- and the sweep that calls this then splits a segment at its own end, leaving a
---  zero-length piece that corrupts the fill.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:547
---@param p any
---@param left any
---@param right any
---@param eps any
function editor_toolUtilities_geom.pointBetween2D(p, left, right, eps) end

--- Determines if the given point is inside the given quadrilateral.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1681
---@param p any
---@param q any
function editor_toolUtilities_geom.pointInQuadBarycentric(p, q) end

--- 2D point-in-polygon (ray cast) for a ring of {x=,y=} verts. Winding-agnostic (even-odd).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1087
---@param px any
---@param py any
---@param ring any
function editor_toolUtilities_geom.pointInRing2D(px, py, ring) end

--- Point-in-triangle (2D, barycentric). Scalar (no vec3 alloc) for tight inner loops such as ear clipping.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1131
---@param px any
---@param py any
---@param ax any
---@param ay any
---@param bx any
---@param by any
---@param cx any
---@param cy any
function editor_toolUtilities_geom.pointInTri2D(px, py, ax, ay, bx, by, cx, cy) end

---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:537
---@param a any
---@param b any
---@param c any
---@param eps any
function editor_toolUtilities_geom.pointsCollinear2D(a, b, c, eps) end

---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:525
---@param a any
---@param b any
---@param eps any
function editor_toolUtilities_geom.pointsCompare2D(a, b, eps) end

---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:520
---@param a any
---@param b any
---@param eps any
function editor_toolUtilities_geom.pointsSame2D(a, b, eps) end

--- Oriented bounding box of a 2D polygon (array of {[1]=x,[2]=y}) via PCA.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:346
---@param poly any
function editor_toolUtilities_geom.polygonOBB(poly) end

--- 2D (XY-only) sibling of polylineCumLength3D for plain {x,y} points (no vec3 :distance): out[i] = distance from pts[1]
---  to pts[i]. Takes an optional reused `out` table (cleared then refilled) so a hot rebuild allocates nothing; omit for a
---  fresh one. Returns out and its total length.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:875
---@param pts any
---@param out any
function editor_toolUtilities_geom.polylineCumLength2D(pts, out) end

--- Cumulative 3D chord lengths along a polyline. Returns cum[1..n], total.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:864
---@param pts any
function editor_toolUtilities_geom.polylineCumLength3D(pts) end

--- Z of the first sample at arc distance `dist` from start or finish tip.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1559
---@param pts any
---@param cum any
---@param total any
---@param fromStart any
---@param dist any
function editor_toolUtilities_geom.polylineZAtArcFromTip(pts, cum, total, fromStart, dist) end

--- Creates and populates a kd-tree containing the given quadrilaterals.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1723
---@param quads any
function editor_toolUtilities_geom.populateTreeQuads(quads) end

--- Projects the given point onto the given spline.
---  [Returns: closest point (p), s in [0,1], t in [-inf,inf]; or nil if outside segment bounds.]
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1942
---@param pos any
---@param spline any
function editor_toolUtilities_geom.projectPointToSpline(pos, spline) end

--- Inverse bilinear on the XY plane: the (u, v) with p = lerp(lerp(q1, q2, u), lerp(q3, q4, u), v), or nil
---  when p lies outside the quad. u runs across q1->q2, v along q1->q3.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1631
---@param px any
---@param py any
---@param q1 any
---@param q2 any
---@param q3 any
---@param q4 any
function editor_toolUtilities_geom.quadUV(px, py, q1, q2, q3, q4) end

--- Intersect two RAYS (forward only) P+s*D and Q+u*E; returns ix,iy or nil (parallel, or the hit lies behind either ray).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:3093
---@param px any
---@param py any
---@param dx any
---@param dy any
---@param qx any
---@param qy any
---@param ex any
---@param ey any
---@param eps any
function editor_toolUtilities_geom.rayIntersect2D(px, py, dx, dy, qx, qy, ex, ey, eps) end

--- Resamples a polyline (nodes = vec3[], widths = number[]).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1008
---@param nodes any
---@param widths any
---@param spacing any
function editor_toolUtilities_geom.resampleUniformNodesWidths(nodes, widths, spacing) end

--- Reshape one END of a node polyline in place (2D x/y; z untouched).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:633
---@param nodes any
---@param fromStart any
---@param p0x any
---@param p0y any
---@param gx any
---@param gy any
---@param L any
function editor_toolUtilities_geom.reshapeLeadInBezier2D(nodes, fromStart, p0x, p0y, gx, gy, L) end

--- Mid-interval frame for rigid kit panels on a graded/banked edge (fences, barriers).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2103
---@param p1 any
---@param p2 any
---@param t1 any
---@param t2 any
---@param n1 any
---@param n2 any
---@param outPos any
---@param outTan any
---@param outUp any
---@param prevAcross any
function editor_toolUtilities_geom.ribbonIntervalFrame(p1, p2, t1, t2, n1, n2, outPos, outTan, outUp, prevAcross) end

--- Where two ribbons that leave a shared junction stop overlapping, as arc length along A measured from the hub (hx, hy)..
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:153
---@param hx any
---@param hy any
---@param a any
---@param aFromStart any
---@param b any
---@param bFromStart any
---@param clearM any
---@param stepM any
---@param maxM any
function editor_toolUtilities_geom.ribbonOverlapEnd2D(hx, hy, a, aFromStart, b, bFromStart, clearM, stepM, maxM) end

--- Road-ribbon up for a unit along direction: up ⊥ along, bank from upRef.
---  prevAcross (optional vec3) keeps lateral sign continuous across a placement run.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2076
---@param along any
---@param upRef any
---@param outUp any
---@param prevAcross any
function editor_toolUtilities_geom.ribbonUpFromAlong(along, upRef, outUp, prevAcross) end

--- Twice the signed area of a 2D ring ({x=,y=} verts). Positive => CCW (x-right, y-up).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1223
---@param ring any
function editor_toolUtilities_geom.ringSignedArea2(ring) end

--- Rotates vector v around unit axis k, by angle theta (in radians).
---  [Uses the standard Rodrigues formula].
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:453
---@param v any
---@param k any
---@param theta any
function editor_toolUtilities_geom.rotateVecAroundAxis(v, k, theta) end

--- Rotates vector v around unit axis k, by angle theta (radians) into 'out' without allocations.
---  out = v * cos(theta) + (k x v) * sin(theta) + k * (k . v) * (1 - cos(theta))
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:467
---@param v any
---@param k any
---@param theta any
---@param out any
function editor_toolUtilities_geom.rotateVecAroundAxisInlined(v, k, theta, out) end

--- Rotates vector v around the z-axis, by angle theta (in radians). In place.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:445
---@param vec any
---@param v any
---@param angle any
function editor_toolUtilities_geom.rotateVecAroundZ(vec, v, angle) end

--- Sample a cubic Bezier in XY (inclusive endpoints). segs = number of segments (default 14).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:589
---@param p0 any
---@param p1 any
---@param p2 any
---@param p3 any
---@param segs any
function editor_toolUtilities_geom.sampleCubicBezier2D(p0, p1, p2, p3, segs) end

--- Sample along true arc-length of the given polyline, to compute the positions and Frenet frame at regular intervals.
---  [Returns: outPosns, outTans, outNormals]
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1996
---@param divPoints any
---@param tangents any
---@param normals any
---@param spacing any
---@param outPosns any
---@param outTans any
---@param outNormals any
function editor_toolUtilities_geom.sampleSpline(divPoints, tangents, normals, spacing, outPosns, outTans, outNormals) end

--- Adaptive sampling along the given spline, to compute the positions and Frenet frame at regular intervals.
---  [Adaptive in the sense that small curvature segments are sampled more densely, and large curvature segments are sampled more sparsely.]
---  [Returns: outPosns, outTans, outNormals, outScales]
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2152
---@param divPoints any
---@param tangents any
---@param normals any
---@param meshLength any
---@param outPosns any
---@param outTans any
---@param outNormals any
---@param outScales any
function editor_toolUtilities_geom.sampleSplineAdaptive(divPoints, tangents, normals, meshLength, outPosns, outTans, outNormals, outScales) end

--- Even-fit sampler for discrete props (lamp posts / bollards).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2024
---@param divPoints any
---@param tangents any
---@param normals any
---@param targetSpacing any
---@param isLoop any
---@param outPosns any
---@param outTans any
---@param outNormals any
function editor_toolUtilities_geom.sampleSplineEvenFit(divPoints, tangents, normals, targetSpacing, isLoop, outPosns, outTans, outNormals) end

--- Proper crossing of open segments AB x CD: returns the parameter t on AB in (0,1) at the interior crossing, else nil
---  (parallel, or the crossing lies on/at an endpoint). Endpoints are excluded so touching strips don't read as a fold.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1074
---@param ax any
---@param ay any
---@param bx any
---@param by any
---@param cx any
---@param cy any
---@param dx any
---@param dy any
function editor_toolUtilities_geom.segCrossParam2D(ax, ay, bx, by, cx, cy, dx, dy) end

--- Whether a shape signature (a flat list of numbers and strings) moved since `old`: numbers by more than tolM, strings at all.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:889
---@param old any
---@param new any
---@param tolM any
function editor_toolUtilities_geom.sigMoved(old, new, tolM) end

--- Compute the signed angle between two vectors around a given axis.
---  [Vectors are projected onto the plane of rotation before computation.]
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1620
---@param fromVec any
---@param toVec any
---@param axis any
function editor_toolUtilities_geom.signedAngleAroundAxis(fromVec, toVec, axis) end

--- Compute the signed angle between two vectors around a given axis.
---  [Assumes vectors are in plane of rotation.]
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1610
---@param a any
---@param b any
---@param axis any
function editor_toolUtilities_geom.signedAngleBetweenVecs(a, b, axis) end

--- Ramer-Douglas-Peucker simplification of a polyline (perpendicular distance measured in full 3D).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:903
---@param points any
---@param tolM any
function editor_toolUtilities_geom.simplifyRDP(points, tolM) end

--- Chaikin corner-cutting for a closed polygon of {x=,y=} points.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1046
---@param poly any
---@param iterations any
function editor_toolUtilities_geom.smoothClosedPolygonChaikin(poly, iterations) end

--- Tip-to-tip height smooth: fix z[1] and z[n], rewrite interior Z via Steffen along XY length.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:101
---@param nodes any
function editor_toolUtilities_geom.smoothNodesHeightSteffen(nodes) end

--- Splits a loop spline at the given node index, returning reordered geometry.
---  [Returns: nodesNew, widthsNew, nmlsNew (reordered loop arrays).]
---  `corners` (optional) is carried through the reorder and returned as a 4th value (cornersNew), index-aligned to nodesNew.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1791
---@param nodes any
---@param widths any
---@param nmls any
---@param splitNodeIdx any
---@param corners any
function editor_toolUtilities_geom.splitLoopSplineGeometry(nodes, widths, nmls, splitNodeIdx, corners) end

--- Split a 2D polyline into the runs that stay clear of a blocked region.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1508
---@param pts any
---@param isBlocked any
---@param stepM any
---@param minKeepM any
function editor_toolUtilities_geom.splitPolylineByBlocked(pts, isBlocked, stepM, minKeepM) end

--- `corners` (optional) is a parallel per-node override array carried through the split so engineered tools keep their per-corner
---  radius/widen/etc. It is returned as two extra trailing values (corners1, corners2), index-aligned to nodes1/nodes2; callers that
---  don't pass it get nil and are unaffected.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1752
---@param nodes any
---@param widths any
---@param nmls any
---@param splitNodeIdx any
---@param corners any
function editor_toolUtilities_geom.splitSplineGeometry(nodes, widths, nmls, splitNodeIdx, corners) end

--- Squared XY distance between two points (ignores Z).
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:71
---@param a any
---@param b any
function editor_toolUtilities_geom.squaredDistance2D(a, b) end

--- Returns the squared distance between two line segments.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:219
---@param a0 any
---@param a1 any
---@param b0 any
---@param b1 any
---@param outP1 any
---@param outP2 any
function editor_toolUtilities_geom.squaredSegSegDist(a0, a1, b0, b1, outP1, outP2) end

--- Unit XY direction outward past a tip (away from the polyline). Walks minWalkM
---  along the chain so a short back-folded first segment cannot reverse the aim.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1576
---@param pts any
---@param fromStart any
---@param minWalkM any
function editor_toolUtilities_geom.tipOutwardXY(pts, fromStart, minWalkM) end

--- Translates the given spline by the given amount on the binormal (lateral) direction.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2183
---@param pts any
---@param binormals any
---@param t any
---@param out any
function editor_toolUtilities_geom.translateSpline(pts, binormals, t, out) end

--- Ear-clipping triangulation of a simple 2D polygon (array of {x=,y=} verts, either winding).
---  The closing repeat has to go before any of this: it is a zero-length edge, so the corner on either side of it has no turn
---  in it and neither can ever be clipped as an ear. On most outlines the clip gets round them; on some it stalls, comes up
---  short of the n-2 triangles a cap needs, and the WHOLE cap is thrown away.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1162
---@param poly any
function editor_toolUtilities_geom.triangulatePolygon2D(poly) end

--- Triangulate a 2D polygon that may have holes. Returns the ring the triangles index into and the triangles.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:1374
---@param outer any
---@param holes any
function editor_toolUtilities_geom.triangulateWithHoles2D(outer, holes) end

--- Update the bar points.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2318
---@param spline any
---@param isBarsLimits any
function editor_toolUtilities_geom.updateBarPoints(spline, isBarsLimits) end

--- Update the bar points for a graph path.
---  [spline - The spline to update bar points for.]
---  [graphData - The navigation graph data.]
---  [isBarsLimit - Whether to use velLimits (true) or vels (false) for bar heights.]
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2357
---@param spline any
---@param graphData any
---@param isBarsLimit any
function editor_toolUtilities_geom.updateBarPointsGraph(spline, graphData, isBarsLimit) end

--- Re-compute the rib points, in free-floating 3D space.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2263
---@param spline any
function editor_toolUtilities_geom.updateRibPointsFree(spline) end

--- Update the rib points. using vertical raycasting to conform them to the nearest surface below .
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:2290
---@param spline any
function editor_toolUtilities_geom.updateRibPointsRaycast(spline) end

--- Welds out near-coincident consecutive nodes, in place.
---Source : lua/ge/extensions/editor/toolUtilities/geom.lua:964
---@param nodes any
---@param widths any
---@param minLen any
function editor_toolUtilities_geom.weldShortSegments(nodes, widths, minLen) end

