---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/geom.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Geometry library of the editor's spline editing tools (roads, rails, fences, buildings): Catmull-Rom spline interpolation (free, raycast, terrain-conforming, with banking), Frenet frame, arc-length sampling, 2D polygon geometry (point in ring, clipping to a box, beveled offset/inset, ear clipping triangulation with holes), intersections, distances, mouse hover, spline cutting/joining and terrain utilities. A "spline" is a table with nodes, widths, nmls (input) and divPoints, divWidths, normals, tangents, binormals, discMap (computed outputs).
--- Access: extension `editor_toolUtilities_geom`: `extensions.load("editor_toolUtilities_geom")`, then the global `editor_toolUtilities_geom`
---@class editor_toolUtilities_geom
editor_toolUtilities_geom = {}

--- Small angle between two vectors of arbitrary length (rad).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1600
---@param a vec3 Vector.
---@param b vec3 Vector.
---@return number  Angle (rad).
function editor_toolUtilities_geom.angleBetweenVecs(a, b) end

--- Small angle between two unit vectors (rad).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1597
---@param a vec3 Unit vector.
---@param b vec3 Unit vector.
---@return number  Angle (rad).
function editor_toolUtilities_geom.angleBetweenVecsNorm(a, b) end

--- Rolls the frame per station of a spline according to a READY-MADE banking fraction (bankT[i] in [-1, 1], + = left curve), peakRad being the angle reached by a full-amplitude station. The caller handles the curvature -> fraction mapping and the arc-length blending (otherwise the banking becomes a square wave).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2204
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
---@param bankT number[] Banking fraction per station.
---@param peakRad number Full-amplitude angle (rad).
function editor_toolUtilities_geom.applyBankFraction(spline, bankT, peakRad) end

--- Merges hole rings into the outer ring by bridge edges. count caps the number of holes taken.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1281
---@param outer table[] Outer ring (set back to counter-clockwise).
---@param holes table[][] Holes (set back to clockwise, bridges by increasing min-x).
---@param count integer|nil Maximum number of holes taken.
---@return table[]  Merged ring.
function editor_toolUtilities_geom.bridgeHoles2D(outer, holes, count) end

--- Fast, allocation-free version of catmullRomCentripetal. If outVec is provided, writes into it and returns it; otherwise creates a vec3.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2471
---@param p0 vec3 Control point.
---@param p1 vec3 Control point.
---@param p2 vec3 Control point.
---@param p3 vec3 Control point.
---@param t number Parameter.
---@param s number Tension/knots parameter (inferred from code).
---@param outVec vec3|nil Optional output.
---@return vec3  Interpolated point.
function editor_toolUtilities_geom.catmullRomCentripetalFast(p0, p1, p2, p3, t, s, outVec) end

--- Like catmullRomRaycast but the points are conformed to the terrain. Falls back to catmullRomRaycast if there is no terrain block.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2804
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
---@param minNumDivIn integer|nil Minimum divisions per segment.
---@param minSpacing number|nil Minimum spacing (m).
---@param rayRaise number|nil Ray starting elevation (m).
function editor_toolUtilities_geom.catmullRomConformToTerrain(spline, minNumDivIn, minSpacing, rayRaise) end

--- Interpolates nodes and widths with standard Catmull-Rom (centripetal XY; Z by Steffen for a ground road, smooth Catmull-Rom for an elevated deck if deckZ). The data is stored in the spline.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2860
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
---@param minNumDivIn integer|nil Minimum divisions per segment (default 10).
---@param deckZ boolean|nil Elevated deck: Z smoothed by Catmull-Rom.
---@param maxSpacingIn number|nil Maximum spacing between divisions (default 20 m).
function editor_toolUtilities_geom.catmullRomFree(spline, minNumDivIn, deckZ, maxSpacingIn) end

--- Like catmullRomFree with automatic banking and blending.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2918
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
---@param minNumDivIn integer|nil Minimum divisions.
---@param bankStrength number Banking intensity.
---@param maxDegIn number|nil Maximum banking (degrees, default 15).
---@param tuningIn number|nil Saturation setting (default 500).
---@param deckZ boolean|nil Elevated deck.
---@param maxSpacingIn number|nil Maximum spacing.
function editor_toolUtilities_geom.catmullRomFreeWithBanking(spline, minNumDivIn, bankStrength, maxDegIn, tuningIn, deckZ, maxSpacingIn) end

--- Interpolates the given points with Catmull-Rom.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2590
---@param nodes vec3[] Points.
---@param gran integer Granularity (subdivisions per segment).
---@return vec3[]  Interpolated points.
function editor_toolUtilities_geom.catmullRomNodesOnly(nodes, gran) end

--- Interpolates points and widths with Catmull-Rom (a single array of nodes).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2613
---@param nodes vec3[] Points.
---@param widths number[] Widths.
---@param gran integer Granularity.
---@param isLoop boolean|nil Loop.
---@return vec3[]  Points.
---@return number[]  Widths.
function editor_toolUtilities_geom.catmullRomNodesWidthsOnly(nodes, widths, gran, isLoop) end

--- Interpolates points, widths, speeds and speed limits of a spline with Catmull-Rom (a single array of nodes).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2645
---@param spline table Spline with nodes, widths, vels, velLimits.
---@param gran integer Granularity.
---@return vec3[]  Points.
---@return number[]  Widths.
---@return number[]  Speeds.
---@return number[]  Speed limits.
function editor_toolUtilities_geom.catmullRomNodesWidthsVelVelLimits(spline, gran) end

--- Interpolates the nodes and widths of a spline with standard Catmull-Rom to produce its secondary geometry; points are placed by raycast onto the surface below. The data is stored in the spline (divPoints, divWidths, normals, discMap).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2753
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
---@param minNumDivIn integer|nil Minimum number of divisions per segment (default 10).
---@param minSpacing number|nil Minimum spacing between points (m).
---@param rayRaise number|nil Ray starting elevation (m); default spline.rayRaise.
function editor_toolUtilities_geom.catmullRomRaycast(spline, minNumDivIn, minSpacing, rayRaise) end

--- Reduces a tessellated curve to chords of about chord meters; flagged points (flags) are always kept, as are the ends.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:945
---@param pts table[] Points.
---@param n integer Number of points.
---@param chord number Chord length (m).
---@param flags table|nil Flags per point.
---@return table[]  Kept points.
---@return table|nil  Corresponding flags.
function editor_toolUtilities_geom.chordify(pts, n, chord, flags) end

--- Clips a ring to the box x0..x1, y0..y1. A concave ring comes back as a single ring that runs along the edge of the box between its pieces, which covers the same area in the box.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1123
---@param pts table[] Ring.
---@param x0 number X min.
---@param x1 number X max.
---@param y0 number Y min.
---@param y1 number Y max.
---@return table[]  Clipped ring (may have fewer than 3 points).
function editor_toolUtilities_geom.clipRingRect2D(pts, x0, x1, y0, y1) end

--- Closest point to p on a 3D polyline. Writes the result into outPos and returns the squared distance.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:77
---@param pts vec3[] Polyline.
---@param p vec3 Point.
---@param outPos vec3 Receives the closest point.
---@return number  Squared distance (m^2).
function editor_toolUtilities_geom.closestPointOnPolyline(pts, p, outPos) end

--- Closest point to p on a polyline, measured in XY (Z interpolated). Writes into outPos and returns the squared distance.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:123
---@param pts vec3[] Polyline.
---@param p vec3 Point.
---@param outPos vec3 Receives the point.
---@param tMin number|nil Lower search bound (inferred from code).
---@param tMax number|nil Upper search bound (inferred from code).
---@param closed boolean|nil Closed polyline.
---@return number  Squared distance.
function editor_toolUtilities_geom.closestPointOnPolyline2D(pts, p, outPos, tMin, tMax, closed) end

--- Closest point, on a given ribbon segment, to a given point.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1897
---@param segIdx integer Segment index.
---@param ribbon table Ribbon.
---@param p vec3 Point.
---@return any|nil  Closest point (nil, nil if unavailable).
---@return number|nil  Squared distance.
function editor_toolUtilities_geom.closestRibbonSegPointToPoint(segIdx, ribbon, p) end

--- Computes the local Frenet frame at each division point (tangents, binormals, normals). Zero-length segments must not be normalized (otherwise NaN binormals and infinite DecalRoad nodes).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2689
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
function editor_toolUtilities_geom.computeFrenetFrame(spline) end

--- Computes the graph path from the nodes and fills the spline geometry (divPoints, divWidths, normals). No effect if there are not enough nodes.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2990
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
function editor_toolUtilities_geom.computeGraphPathFromNodes(spline) end

--- Random variation quaternion, per component.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2226
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
---@param tgt vec3 Tangent.
---@param rightVec vec3 Right vector.
---@param nmlVec vec3 Normal.
---@param outQuat quat Receives the result.
---@return quat  outQuat.
function editor_toolUtilities_geom.computeRandomJitterQuat(spline, tgt, rightVec, nmlVec, outQuat) end

--- Random variation quaternion based on the joint's freedom axes.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2249
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
---@param freedomAxes table Freedom axes.
---@param outQuat quat Receives the result.
---@return quat  outQuat.
function editor_toolUtilities_geom.computeRandomJitterQuatFromFreedomAxes(spline, freedomAxes, outQuat) end

--- Random variation quaternion around Z only.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2219
---@param jitter number Amplitude.
---@param nmlVec vec3 Normal.
---@param outQuat quat Receives the result.
---@return quat  outQuat.
function editor_toolUtilities_geom.computeRandomJitterQuat_ZOnly(jitter, nmlVec, outQuat) end

--- Computes the signed distance field (SDF) of a mask (2D array, 0 = inside).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2431
---@param mask number[][] Mask mask[y][x].
---@return number[][]  Distance field.
function editor_toolUtilities_geom.computeSDF(mask) end

--- Bounding box (XY) of the given sources.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1686
---@param sources table[] Sources (points or splines, inferred from code).
---@return table  { xMin, xMax, yMin, yMax }.
function editor_toolUtilities_geom.computeSourcesAABB(sources) end

--- Computes a polygonal outline around a spline (left and right edges at the half-width + margin, extended by 10 m at both ends). Fast to process by scanline spans. Fills the polygon array.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:372
---@param spline table Spline with divPoints, tangents, binormals, divWidths.
---@param margin number Lateral margin (m).
---@param polygon table Output array, cleared then filled with vec3.
function editor_toolUtilities_geom.computeSplinePolygon(spline, margin, polygon) end

--- Radius of curvature approximated by 3 consecutive points (average of the lengths of the two sides divided by tan(angle/2)).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:481
---@param p1 vec3 Point.
---@param p2 vec3 Center point.
---@param p3 vec3 Point.
---@return number  Radius (m).
function editor_toolUtilities_geom.computeTurningRadius(p1, p2, p3) end

--- Direction taken by a post, pillar or bollard PLACED ON A CORNER, from the entry and exit direction: the axis is rotated by half the turn reduced modulo period (default pi/2). Ties go to the smaller turn so that left and right corners mirror each other.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:3070
---@param ix number Entry direction x.
---@param iy number Entry direction y.
---@param ox number Exit direction x.
---@param oy number Exit direction y.
---@param period number|nil Symmetry period of the post (rad, default pi/2).
---@return number  cos of the axis.
---@return number  sin of the axis.
function editor_toolUtilities_geom.cornerAxis(ix, iy, ox, oy, period) end

--- 2D scalar cross product of (ax, ay) and (bx, by), on plain components (without allocating a vec3 or a table).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:3059
---@param ax number A x.
---@param ay number A y.
---@param bx number B x.
---@param by number B y.
---@return number  ax*by - ay*bx.
function editor_toolUtilities_geom.cross2(ax, ay, bx, by) end

--- Converts a curvature into a banking angle (rad). maxDeg (cap on the tightest turns, default 15) and tuning (curvature at which the cap is reached, default 500) are optional overrides.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2194
---@param curv number Curvature.
---@param bankStrength number Banking intensity.
---@param maxDeg number|nil Cap (degrees).
---@param tuning number|nil Saturation setting.
---@return number  Banking angle (rad).
function editor_toolUtilities_geom.curvatureToBankAngle(curv, bankStrength, maxDeg, tuning) end

--- Densifies a polyline so that no segment exceeds maxSpacing.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:989
---@param points table[] Polyline.
---@param maxSpacing number Maximum spacing (m).
---@return table[]  Densified polyline.
function editor_toolUtilities_geom.densifyByMaxSpacing(points, maxSpacing) end

--- Squared distance from the point (px, py) to the FINITE segment AB (t clamped to the segment). For frequent proximity tests.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1063
---@param px number Point x.
---@param py number Point y.
---@param ax number A x.
---@param ay number A y.
---@param bx number B x.
---@param by number B y.
---@return number  Squared distance.
function editor_toolUtilities_geom.distSqPointSeg2D(px, py, ax, ay, bx, by) end

--- 2D dot product on plain components.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:3061
---@param ax number A x.
---@param ay number A y.
---@param bx number B x.
---@param by number B y.
---@return number  ax*bx + ay*by.
function editor_toolUtilities_geom.dot2(ax, ay, bx, by) end

--- Reverses the direction of a spline in place (nodes, normals, corners) and marks spline.isDirty.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1878
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
function editor_toolUtilities_geom.flipSplineDirection(spline) end

--- Axis-aligned bounding box (XY) of an array of points.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:335
---@param points vec3[] Points.
---@return table  { xMin, xMax, yMin, yMax }.
function editor_toolUtilities_geom.getAABB(points) end

--- Builds the quadrilaterals of the sources, with lateral inflation (without longitudinal stretching).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1700
---@param sources table[] Spline-type sources.
---@param margin number Lateral margin (m).
---@return table[]  Quads.
function editor_toolUtilities_geom.getAllQuadrilaterals(sources, margin) end

--- Returns the scale factor of the speed bars (height = barScale * speed, 0.5).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:68
---@return number  Factor.
function editor_toolUtilities_geom.getBarScale() end

--- Given a polyline and a polygon, returns the runs of consecutive indices that are in the polygon.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1915
---@param nodes vec3[] Polyline.
---@param polygon table[] Polygon.
---@return table[]  Runs of indices.
function editor_toolUtilities_geom.getNodeSpansInsidePolygon(nodes, polygon) end

--- Returns the table of pre-rotation quaternions indexed from 0 to 3 (0, 90, 180, 270 degrees around Z).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:65
---@return table<integer, quat>  Pre-rotation quaternions.
function editor_toolUtilities_geom.getPreRotQuats() end

--- Computes the scanline spans of a polygon on the Y axis, in terrain grid space. Stores the results in spansXMin, spansXMax and spansY.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2397
---@param gMinY integer Minimum grid row.
---@param gMaxY integer Maximum grid row.
---@param te userdata Terrain editor (gridToWorldByPoint2I).
---@param tb userdata Terrain block.
---@param polygon table[] Polygon in world.
---@param spansXMin table Output, cleared.
---@param spansXMax table Output.
---@param spansY table Output.
function editor_toolUtilities_geom.getScanlineSpans(gMinY, gMaxY, te, tb, polygon, spansXMin, spansXMax, spansY) end

--- Terrain normal at the given world point.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:420
---@param p vec3 World point.
---@return vec3  Normal.
function editor_toolUtilities_geom.getTerrainNormal(p) end

--- Terrain normal at the given world point, written into out.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:433
---@param p vec3 World point.
---@param out vec3 Receives the normal.
function editor_toolUtilities_geom.getTerrainNormalInPlace(p, out) end

--- Shrinks a closed polygon of {x, y} inward by at most dist, along the average normal of the edges of each vertex (true local inward direction, correct for concave rings).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1465
---@param ring table[] Ring.
---@param dist number Distance (m).
---@return table[]  Shrunk ring.
function editor_toolUtilities_geom.insetClosedRing2D(ring, dist) end

--- Offsets a 2D path toward the center (cx, cy) by insetM along the local normal (inferred from code).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:705
---@param path table[] Path.
---@param cx number Center x.
---@param cy number Center y.
---@param insetM number Inset (m).
---@return table[]  New path.
function editor_toolUtilities_geom.insetPathAlongNormal2D(path, cx, cy, insetM) end

--- Intersection point of two segments (inline). Returns nil without an intersection.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:502
---@param p1 vec3 Start of segment 1.
---@param p2 vec3 End of segment 1.
---@param q1 vec3 Start of segment 2.
---@param q2 vec3 End of segment 2.
---@param out vec3 Receives the point.
---@return vec3|nil  out or nil.
function editor_toolUtilities_geom.intersection2LineSegs(p1, p2, q1, q2, out) end

--- Intersects a point (x, y) with a quad and returns the interpolated height there, or false if outside the quad.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1672
---@param p vec3 Point.
---@param q table Quad: 4 vec3 vertices.
---@return number|boolean  Height or false.
function editor_toolUtilities_geom.intersectsUpQuadBarycentric(p, q) end

--- Tests whether segment (a, b) crosses segment (c, d).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:496
---@param a vec3 Start of ab.
---@param b vec3 End of ab.
---@param c vec3 Start of cd.
---@param d vec3 End of cd.
---@return boolean  Intersection.
function editor_toolUtilities_geom.isLineSegIntersect(a, b, c, d) end

--- Tests whether the mouse hovers a bar (splines with an ordered barPoints array).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:301
---@param splines table[] Splines to test.
---@return boolean  Hover.
---@return integer|nil  Spline index.
---@return integer|nil  Bar index.
function editor_toolUtilities_geom.isMouseOverBar(splines) end

--- Tests whether the mouse hovers a node of the navigation graph.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:322
---@param nodes table Graph nodes (indexed by key).
---@return boolean  Hover.
---@return any|nil  Node key.
function editor_toolUtilities_geom.isMouseOverGraphNode(nodes) end

--- Tests whether the mouse hovers a node of one of the splines (tolerance 2 m). Each spline must have a nodes array.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:258
---@param splines table[] Splines to test.
---@return boolean  Hover.
---@return integer|nil  Spline index.
---@return integer|nil  Node index.
function editor_toolUtilities_geom.isMouseOverNode(splines) end

--- Tests whether the mouse hovers a polyline; closed also tests the edge from the last node to the first.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:280
---@param points vec3[] Polyline.
---@param mousePos vec3 Mouse position.
---@param closed boolean|nil Closed polygon.
---@return boolean  Hover.
---@return integer|nil  Segment index.
function editor_toolUtilities_geom.isMouseOverPolyline(points, mousePos, closed) end

--- Tests whether the mouse hovers the spline (to insert a node or hover). Uses the closest camera-ray / axis approach, so elevated roads work. maxDistSq: squared tolerance (math.huge to get the closest point unconditionally).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2516
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
---@param maxDistSq number|nil Squared ray-axis tolerance (default 1).
---@return boolean  Hover.
---@return integer|nil  Segment index.
---@return vec3|nil  Point on the spline.
function editor_toolUtilities_geom.isMouseOverSpline(spline, maxDistSq) end

--- Tests whether p is in the triangle (a, b, c) (barycentric coordinates).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:406
---@param p vec3 Point.
---@param a vec3 Vertex.
---@param b vec3 Vertex.
---@param c vec3 Vertex.
---@return boolean  Inside.
function editor_toolUtilities_geom.isPointInTriangle(p, a, b, c) end

--- Joins two spline geometries at the given node indices. Returns nil if the indices are invalid.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1822
---@param n1 vec3[] Nodes 1.
---@param w1 number[] Widths 1.
---@param nm1 vec3[] Normals 1.
---@param nodeIdx1 integer Junction index 1.
---@param n2 vec3[] Nodes 2.
---@param w2 number[] Widths 2.
---@param nm2 vec3[] Normals 2.
---@param nodeIdx2 integer Junction index 2.
---@param c1 table|nil Turn overrides 1.
---@param c2 table|nil Overrides 2.
---@return table|nil  nodesNew.
---@return table|nil  widthsNew.
---@return table|nil  nmlsNew.
---@return table|nil  cornersNew.
function editor_toolUtilities_geom.joinSplineGeometry(n1, w1, nm1, nodeIdx1, n2, w2, nm2, nodeIdx2, c1, c2) end

--- Parameter t along p0 + t*d0 at the intersection point with p1 + u*d1; nil if parallel. With d0 unit, t is in meters.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:580
---@param p0x number Point 0 x.
---@param p0y number Point 0 y.
---@param d0x number Direction 0 x.
---@param d0y number Direction 0 y.
---@param p1x number Point 1 x.
---@param p1y number Point 1 y.
---@param d1x number Direction 1 x.
---@param d1y number Direction 1 y.
---@param eps number Parallelism tolerance.
---@return number|nil  t, or nil.
function editor_toolUtilities_geom.lineDirsHitT2D(p0x, p0y, d0x, d0y, p1x, p1y, d1x, d1y, eps) end

--- Intersection of two INFINITE lines P+s*D and Q+s*E; returns ix, iy or nil if parallel.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:3086
---@param px number P x.
---@param py number P y.
---@param dx number D x.
---@param dy number D y.
---@param qx number Q x.
---@param qy number Q y.
---@param ex number E x.
---@param ey number E y.
---@param eps number|nil Parallelism tolerance.
---@return number|nil  ix.
---@return number|nil  iy.
function editor_toolUtilities_geom.lineIntersect2D(px, py, dx, dy, qx, qy, ex, ey, eps) end

--- Intersection of two lines a0-a1 and b0-b1. Returns nil if parallel.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:559
---@param a0 table Point.
---@param a1 table Point.
---@param b0 table Point.
---@param b1 table Point.
---@param eps number Tolerance.
---@return table|nil  { pt = {x, y}, alongA, alongB } (Martinez along codes).
function editor_toolUtilities_geom.linesIntersect2D(a0, a1, b0, b1, eps) end

--- Area-weighted centroid of one or more closed 2D rings ({x, y}). Returns cx, cy or nil.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:835
---@param regions table[] Rings.
---@return number|nil  cx.
---@return number|nil  cy.
function editor_toolUtilities_geom.multiPolygonCentroidXY(regions) end

--- Normalizes a 2D vector (x, y).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:3063
---@param x number x.
---@param y number y.
---@return number  Normalized x.
---@return number  Normalized y.
function editor_toolUtilities_geom.normalize2(x, y) end

--- Offsets a 2D polyline away from (cx, cy) along its local normal per vertex.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:816
---@param path table[] Polyline.
---@param cx number Center x.
---@param cy number Center y.
---@param distM number Distance (m).
---@param distArr number[]|nil Per-vertex distances (inferred from code).
---@return table[]  Offset points.
function editor_toolUtilities_geom.offsetPathFromCenter2D(path, cx, cy, distM, distArr) end

--- Parallel offset with mitered corners of an OPEN 2D polyline: one output point per vertex (paired rails stay aligned), z kept. Corners keep the true perpendicular width. The side is chosen ONCE for the whole path: away from (cx, cy), or toward it if inward.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:728
---@param pts table[] Open polyline.
---@param dist number Offset distance (m).
---@param cx number Center x.
---@param cy number Center y.
---@param z number|nil Imposed Z (inferred from code).
---@param inward boolean|nil Offset toward the center.
---@return table[]  Offset points.
function editor_toolUtilities_geom.offsetPathMiter2D(pts, dist, cx, cy, z, inward) end

--- Pushes a closed ring OUTWARD by a small distance, mitered corners.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1400
---@param ring table[] Ring.
---@param dist number Distance (m).
---@return table[]|nil  Enlarged ring.
function editor_toolUtilities_geom.outsetClosedRing2D(ring, dist) end

--- Like outsetClosedRing2D but only for the sides designated by move[i]; the others stay exactly on their line. A vertex between a moving side and a fixed side slides along the fixed side: no notch, vertex count unchanged.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1432
---@param ring table[] Ring.
---@param dist number Distance (m).
---@param move table<integer, boolean> Sides to move.
---@return table[]  Ring.
function editor_toolUtilities_geom.outsetRingSides2D(ring, dist, move) end

--- Perpendicular distance from the point (px, py) to the segment (ax, ay)->(bx, by) in XY. Degenerate segment: distance to A. Mind the argument order: the segment points first.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:3046
---@param ax number A x.
---@param ay number A y.
---@param bx number B x.
---@param by number B y.
---@param px number Point x.
---@param py number Point y.
---@return number  Distance (m).
function editor_toolUtilities_geom.perpDistPointSeg2D(ax, ay, bx, by, px, py) end

--- Is the point above or on the line left->right (cross product >= -eps).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:532
---@param pt table Point.
---@param left table Start.
---@param right table End.
---@param eps number Tolerance.
---@return boolean  Result.
function editor_toolUtilities_geom.pointAboveOrOnLine2D(pt, left, right, eps) end

--- For a p assumed aligned with left->right: false if it is an endpoint or outside. Tested on the dot product (unit m^2) and not on the normalized position, so as not to split a segment at its own endpoint (which would give a zero-length piece).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:547
---@param p table Point.
---@param left table Start.
---@param right table End.
---@param eps number Tolerance.
---@return boolean  Strictly between.
function editor_toolUtilities_geom.pointBetween2D(p, left, right, eps) end

--- Determines whether a point is in a quad (in XY).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1681
---@param p vec3 Point.
---@param q table Quad: 4 vertices.
---@return boolean  Inside.
function editor_toolUtilities_geom.pointInQuadBarycentric(p, q) end

--- Point in a 2D polygon (ray casting, even-odd), independent of the ring's direction. The vertices are {x, y}.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1087
---@param px number Point x.
---@param py number Point y.
---@param ring table[] Ring.
---@return boolean  Inside.
function editor_toolUtilities_geom.pointInRing2D(px, py, ring) end

--- Point in a 2D triangle (barycentric), in scalars for tight loops like ear clipping.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1131
---@param px number Point x.
---@param py number Point y.
---@param ax number A x.
---@param ay number A y.
---@param bx number B x.
---@param by number B y.
---@param cx number C x.
---@param cy number C y.
---@return boolean  Inside.
function editor_toolUtilities_geom.pointInTri2D(px, py, ax, ay, bx, by, cx, cy) end

--- Are three points aligned in XY (|cross product| < eps).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:537
---@param a table Point.
---@param b table Point.
---@param c table Point.
---@param eps number Tolerance.
---@return boolean  Aligned.
function editor_toolUtilities_geom.pointsCollinear2D(a, b, c, eps) end

--- Comparison of two points in XY, for sorting (-1 or 1, first by x then by y).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:525
---@param a table Point.
---@param b table Point.
---@param eps number Tolerance on x.
---@return integer  -1 if a is before b, otherwise 1.
function editor_toolUtilities_geom.pointsCompare2D(a, b, eps) end

--- Are two points coincident in XY within eps (per component).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:520
---@param a table Point {x, y}.
---@param b table Point.
---@param eps number Tolerance.
---@return boolean  Identical.
function editor_toolUtilities_geom.pointsSame2D(a, b, eps) end

--- Oriented bounding box of a 2D polygon by PCA. The points are pairs [1]=x, [2]=y.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:346
---@param poly number[][] Polygon.
---@return number  Center x.
---@return number  Center y.
---@return number  Half-width along the principal axis.
---@return number  Transverse half-width.
---@return number  Angle theta of the principal axis (rad).
function editor_toolUtilities_geom.polygonOBB(poly) end

--- 2D (XY only) cousin of polylineCumLength3D for plain {x, y} points: out[i] = distance from pts[1] to pts[i]. A reusable out array avoids allocations.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:875
---@param pts table[] Polyline.
---@param out number[]|nil Reused array (cleared then filled).
---@return number[]  out.
---@return number  Total length.
function editor_toolUtilities_geom.polylineCumLength2D(pts, out) end

--- Cumulative 3D lengths along a polyline.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:864
---@param pts vec3[] Polyline.
---@return number[]  cum[1..n].
---@return number  Total length.
function editor_toolUtilities_geom.polylineCumLength3D(pts) end

--- Z of the first sample at arc distance dist from the start or end tip.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1559
---@param pts vec3[] Polyline.
---@param cum number[] Cumulative lengths.
---@param total number Total length.
---@param fromStart boolean Measure from the start.
---@param dist number Distance (m).
---@return number  Z.
function editor_toolUtilities_geom.polylineZAtArcFromTip(pts, cum, total, fromStart, dist) end

--- Creates and fills a kd-tree containing the given quads.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1723
---@param quads table[] Quads.
---@return table  kdtreebox2d tree.
function editor_toolUtilities_geom.populateTreeQuads(quads) end

--- Projects a point onto a spline. Returns nil if outside the segment bounds.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1942
---@param pos vec3 Point.
---@param spline table Spline.
---@return vec3|nil  Closest projected point.
---@return number|nil  s in [0,1].
---@return number|nil  Lateral t in [-inf, inf].
function editor_toolUtilities_geom.projectPointToSpline(pos, spline) end

--- Inverse bilinear in the XY plane: the (u, v) such that p = lerp(lerp(q1, q2, u), lerp(q3, q4, u), v), or nil if p is outside the quad. u runs from q1 toward q2, v from q1 toward q3.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1631
---@param px number Point x.
---@param py number Point y.
---@param q1 table Corner 1.
---@param q2 table Corner 2.
---@param q3 table Corner 3.
---@param q4 table Corner 4.
---@return number|nil  u.
---@return number|nil  v.
function editor_toolUtilities_geom.quadUV(px, py, q1, q2, q3, q4) end

--- Intersection of two RAYS (forward only) P+s*D and Q+u*E; returns ix, iy or nil (parallel or point behind one of the rays).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:3093
---@param px number P x.
---@param py number P y.
---@param dx number D x.
---@param dy number D y.
---@param qx number Q x.
---@param qy number Q y.
---@param ex number E x.
---@param ey number E y.
---@param eps number|nil Tolerance.
---@return number|nil  ix.
---@return number|nil  iy.
function editor_toolUtilities_geom.rayIntersect2D(px, py, dx, dy, qx, qy, ex, ey, eps) end

--- Resamples a polyline (nodes and widths) at a regular step.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1008
---@param nodes vec3[] Nodes.
---@param widths number[] Widths.
---@param spacing number Step (m).
---@return vec3[]  New nodes (the corresponding widths are also produced, inferred from code).
function editor_toolUtilities_geom.resampleUniformNodesWidths(nodes, widths, spacing) end

--- Reshapes in place ONE end of a node polyline (x/y, z unchanged) according to a lead-in Bezier toward a goal point, over a length L.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:633
---@param nodes vec3[] Modified nodes.
---@param fromStart boolean true: the start is the moving end.
---@param p0x number Tip x (inferred from code).
---@param p0y number Tip y.
---@param gx number Goal x (inferred from code).
---@param gy number Goal y.
---@param L number Reshaped length (m).
function editor_toolUtilities_geom.reshapeLeadInBezier2D(nodes, fromStart, p0x, p0y, gx, gy, L) end

--- Mid-interval frame for rigid kit panels on a sloped or banked edge (fences, guardrails).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2103
---@param p1 vec3 Start.
---@param p2 vec3 End.
---@param t1 vec3 Start tangent.
---@param t2 vec3 End tangent.
---@param n1 vec3 Start normal.
---@param n2 vec3 End normal.
---@param outPos vec3 Receives the position.
---@param outTan vec3 Receives the tangent.
---@param outUp vec3 Receives the up.
---@param prevAcross vec3|nil Previous lateral.
function editor_toolUtilities_geom.ribbonIntervalFrame(p1, p2, t1, t2, n1, n2, outPos, outTan, outUp, prevAcross) end

--- Where two ribbons (roads) leaving the same junction stop overlapping, in arc length along A from the center (hx, hy). Returns maxM if no usable ribbon.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:153
---@param hx number X of the junction center.
---@param hy number Y of the center.
---@param a table Points of ribbon A.
---@param aFromStart boolean A starts from its first point.
---@param b table Points of ribbon B.
---@param bFromStart boolean B starts from its first point.
---@param clearM number Clearance distance (m).
---@param stepM number Search step (m, must be > 0).
---@param maxM number Maximum length (m).
---@return number  Arc length (m).
function editor_toolUtilities_geom.ribbonOverlapEnd2D(hx, hy, a, aFromStart, b, bFromStart, clearM, stepM, maxM) end

--- Up vector of the road ribbon for a unit along direction: up perpendicular to along, roll taken from upRef. prevAcross keeps the lateral sign continuous along a series of placements.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2076
---@param along vec3 Unit direction.
---@param upRef vec3 Reference up.
---@param outUp vec3 Receives the up.
---@param prevAcross vec3|nil Previous lateral vector.
function editor_toolUtilities_geom.ribbonUpFromAlong(along, upRef, outUp, prevAcross) end

--- Twice the signed area of a 2D ring of {x, y}; positive = counter-clockwise (x to the right, y up).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1223
---@param ring table[] Ring.
---@return number  2 x signed area.
function editor_toolUtilities_geom.ringSignedArea2(ring) end

--- Rotates vector v around the unit axis k by the angle theta (Rodrigues formula).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:453
---@param v vec3 Vector.
---@param k vec3 Unit axis.
---@param theta number Angle (rad).
---@return vec3  Copy of the result.
function editor_toolUtilities_geom.rotateVecAroundAxis(v, k, theta) end

--- Like rotateVecAroundAxis without allocation: out = v*cos + (k x v)*sin + k*(k.v)*(1-cos).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:467
---@param v vec3 Vector.
---@param k vec3 Unit axis.
---@param theta number Angle (rad).
---@param out vec3 Receives the result.
---@return vec3  out.
function editor_toolUtilities_geom.rotateVecAroundAxisInlined(v, k, theta, out) end

--- Rotates vector v around the Z axis by the given angle, in place (the function receives vec as destination).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:445
---@param vec vec3 Modified vector.
---@param v vec3 Source vector (inferred from code).
---@param angle number Angle (rad).
function editor_toolUtilities_geom.rotateVecAroundZ(vec, v, angle) end

--- Samples a cubic Bezier in XY (endpoints included).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:589
---@param p0 table Control point.
---@param p1 table Control point.
---@param p2 table Control point.
---@param p3 table Control point.
---@param segs integer|nil Number of segments (default 14).
---@return table[]  Points.
function editor_toolUtilities_geom.sampleCubicBezier2D(p0, p1, p2, p3, segs) end

--- Samples a polyline at true arc length to compute positions and Frenet frame at regular intervals. No effect if spacing is not > 0.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1996
---@param divPoints vec3[] Division points.
---@param tangents vec3[] Tangents.
---@param normals vec3[] Normals.
---@param spacing number Step (m).
---@param outPosns vec3[] Positions output (cleared).
---@param outTans vec3[] Tangents output.
---@param outNormals vec3[] Normals output.
---@return vec3[]  outPosns.
---@return vec3[]  outTans.
---@return vec3[]  outNormals.
function editor_toolUtilities_geom.sampleSpline(divPoints, tangents, normals, spacing, outPosns, outTans, outNormals) end

--- Adaptive sampling along a spline: computes positions, Frenet frame and scales per meshLength step; the scale (minimum 0.01) depends on the curvature (sensitivity kappaSensitivity = 150). No effect if meshLength is not > 0.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2152
---@param divPoints vec3[] Division points.
---@param tangents vec3[] Tangents.
---@param normals vec3[] Normals.
---@param meshLength number Nominal mesh length (m).
---@param outPosns vec3[] Positions output.
---@param outTans vec3[] Tangents output.
---@param outNormals vec3[] Normals output.
---@param outScales number[] Scales output (minimum 0.01).
---@return vec3[]  outPosns.
---@return vec3[]  outTans.
---@return vec3[]  outNormals.
---@return number[]  outScales.
function editor_toolUtilities_geom.sampleSplineAdaptive(divPoints, tangents, normals, meshLength, outPosns, outTans, outNormals, outScales) end

--- Sampler with adjusted distribution for discrete objects (lamp posts, bollards): the step is adjusted so that the total length is a whole number of intervals.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2024
---@param divPoints vec3[] Division points.
---@param tangents vec3[] Tangents.
---@param normals vec3[] Normals.
---@param targetSpacing number Target step (m, > 0).
---@param isLoop boolean Looped spline.
---@param outPosns vec3[] Positions output.
---@param outTans vec3[] Tangents output.
---@param outNormals vec3[] Normals output.
function editor_toolUtilities_geom.sampleSplineEvenFit(divPoints, tangents, normals, targetSpacing, isLoop, outPosns, outTans, outNormals) end

--- Strict crossing of two open segments AB and CD: returns the parameter t on AB in (0,1), otherwise nil (parallel or crossing at an endpoint). Endpoints are excluded so that two strips that touch are not read as a fold.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1074
---@param ax number A x.
---@param ay number A y.
---@param bx number B x.
---@param by number B y.
---@param cx number C x.
---@param cy number C y.
---@param dx number D x.
---@param dy number D y.
---@return number|nil  t on AB, or nil.
function editor_toolUtilities_geom.segCrossParam2D(ax, ay, bx, by, cx, cy, dx, dy) end

--- Has a shape signature (flat list of numbers and strings) moved since old: numbers by more than tolM, strings as soon as they differ.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:889
---@param old table|nil Old signature.
---@param new table New signature.
---@param tolM number Numeric tolerance.
---@return boolean  true if it moved.
function editor_toolUtilities_geom.sigMoved(old, new, tolM) end

--- Signed angle between two vectors around an axis, after projection onto the plane of rotation. Returned in DEGREES (unlike signedAngleBetweenVecs).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1620
---@param fromVec vec3 Start vector.
---@param toVec vec3 End vector.
---@param axis vec3 Axis.
---@return number  Signed angle (degrees).
function editor_toolUtilities_geom.signedAngleAroundAxis(fromVec, toVec, axis) end

--- Signed angle between two vectors around an axis, assuming the vectors are in the plane of rotation.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1610
---@param a vec3 Vector.
---@param b vec3 Vector.
---@param axis vec3 Axis.
---@return number  Signed angle (rad).
function editor_toolUtilities_geom.signedAngleBetweenVecs(a, b, axis) end

--- Ramer-Douglas-Peucker simplification of a polyline (perpendicular distance measured in 3D).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:903
---@param points vec3[] Polyline.
---@param tolM number Tolerance (m).
---@return vec3[]  Simplified polyline.
function editor_toolUtilities_geom.simplifyRDP(points, tolM) end

--- Chaikin corner cutting of a closed polygon of {x, y} points.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1046
---@param poly table[] Polygon.
---@param iterations integer Number of iterations.
---@return table[]  Smoothed polygon.
function editor_toolUtilities_geom.smoothClosedPolygonChaikin(poly, iterations) end

--- End-to-end height smoothing: fixes z[1] and z[n] and rewrites the interior Zs by Steffen interpolation along the XY length. No effect (returns false) below 3 nodes.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:101
---@param nodes vec3[] Nodes modified in place.
---@return boolean  true if the smoothing was done.
function editor_toolUtilities_geom.smoothNodesHeightSteffen(nodes) end

--- Cuts a looped spline at the given index and returns the reordered geometry. corners is returned as the 4th value.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1791
---@param nodes vec3[] Nodes.
---@param widths number[] Widths.
---@param nmls vec3[] Normals.
---@param splitNodeIdx integer Cut index.
---@param corners table|nil Turn overrides.
---@return table|nil  nodesNew.
---@return table|nil  widthsNew.
---@return table|nil  nmlsNew.
---@return table|nil  cornersNew.
function editor_toolUtilities_geom.splitLoopSplineGeometry(nodes, widths, nmls, splitNodeIdx, corners) end

--- Cuts a 2D polyline into stretches that stay outside a blocked region.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1508
---@param pts table[] Polyline {x, y}.
---@param isBlocked function isBlocked(x, y) -> boolean.
---@param stepM number|nil Test step (m, default 1.0 if <= 0.05).
---@param minKeepM number|nil Minimum length of a kept stretch (inferred from code).
---@return table[][]  Stretches.
function editor_toolUtilities_geom.splitPolylineByBlocked(pts, isBlocked, stepM, minKeepM) end

--- Cuts a spline geometry at the given node index (the two halves are moved 2 m apart at the cut point). corners (optional) is an array of per-node overrides, kept so that the engineering tools keep their per-turn radii.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1752
---@param nodes vec3[] Nodes.
---@param widths number[] Widths.
---@param nmls vec3[] Normals.
---@param splitNodeIdx integer Cut index.
---@param corners table|nil Turn overrides aligned with the nodes.
---@return table|nil  nodes1 (nil if invalid index).
---@return table|nil  widths1.
---@return table|nil  nmls1.
---@return table|nil  nodes2.
---@return table|nil  widths2.
---@return table|nil  nmls2.
---@return table|nil  corners1.
---@return table|nil  corners2.
function editor_toolUtilities_geom.splitSplineGeometry(nodes, widths, nmls, splitNodeIdx, corners) end

--- Squared distance in XY between two points (Z ignored).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:71
---@param a vec3 Point.
---@param b vec3 Point.
---@return number  Squared distance (m^2).
function editor_toolUtilities_geom.squaredDistance2D(a, b) end

--- Squared distance between two 3D segments; writes the closest points into outP1 and outP2.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:219
---@param a0 vec3 Start of segment A.
---@param a1 vec3 End of segment A.
---@param b0 vec3 Start of B.
---@param b1 vec3 End of B.
---@param outP1 vec3 Closest point on A.
---@param outP2 vec3 Closest point on B.
---@return number  Squared distance.
function editor_toolUtilities_geom.squaredSegSegDist(a0, a1, b0, b1, outP1, outP2) end

--- Outward unit XY direction beyond an end (away from the polyline). Walks minWalkM along the chain so that a short folded-back first segment does not reverse the aim.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1576
---@param pts table[] Polyline.
---@param fromStart boolean Start or end tip.
---@param minWalkM number Minimum walked distance (m).
---@return number  Direction x.
---@return number  Direction y.
function editor_toolUtilities_geom.tipOutwardXY(pts, fromStart, minWalkM) end

--- Translates a polyline by t meters along the binormal (lateral direction).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2183
---@param pts vec3[] Points.
---@param binormals vec3[] Binormals.
---@param t number Offset (m).
---@param out table Output (cleared) of vec3.
function editor_toolUtilities_geom.translateSpline(pts, binormals, t, out) end

--- Ear clipping triangulation of a simple 2D polygon (ring of {x, y}, either direction). The closing repeat is removed beforehand: a zero-length edge would block the clipping and cause the whole cap to be discarded.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1162
---@param poly table[] Ring.
---@return integer[][]  Triplets of indices into the open ring (empty list on failure).
function editor_toolUtilities_geom.triangulatePolygon2D(poly) end

--- Triangulates a possibly holed 2D polygon. If ear clipping fails with a bridging ring, drops the holes one by one rather than losing the whole cap.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:1374
---@param outer table[] Outer ring.
---@param holes table[][]|nil Holes.
---@return table[]  Ring to which the triangles refer.
---@return integer[][]  Triplets of indices.
function editor_toolUtilities_geom.triangulateWithHoles2D(outer, holes) end

--- Updates the speed bar points of a spline; fills spline.vels and spline.velLimits.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2318
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
---@param isBarsLimits boolean Bars for speed limits (true) or speeds (false).
function editor_toolUtilities_geom.updateBarPoints(spline, isBarsLimits) end

--- Updates the bar points for a navigation graph path; fills spline.vels and spline.velLimits.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2357
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
---@param graphData table Navigation graph data.
---@param isBarsLimit boolean Use velLimits (true) or vels (false) for the bar height.
function editor_toolUtilities_geom.updateBarPointsGraph(spline, graphData, isBarsLimit) end

--- Recomputes the rib points of a spline in free 3D. No effect below 2 nodes.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2263
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
function editor_toolUtilities_geom.updateRibPointsFree(spline) end

--- Recomputes the rib points of a spline by vertical raycast to the nearest surface below. No effect below 2 nodes.
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:2290
---@param spline table Spline (nodes, widths, nmls, divPoints, divWidths, normals, tangents, binormals, discMap, isLoop...).
function editor_toolUtilities_geom.updateRibPointsRaycast(spline) end

--- Welds in place consecutive nodes that are almost coincident (segments shorter than minLen).
---Source: lua/ge/extensions/editor/toolUtilities/geom.lua:964
---@param nodes vec3[] Modified nodes.
---@param widths number[] Widths, updated in parallel.
---@param minLen number Minimum length (m).
---@return integer  Number of kept nodes (inferred from code).
function editor_toolUtilities_geom.weldShortSegments(nodes, widths, minLen) end

