# `mathlib`

*File: `lua/common/mathlib.lua` · VM: Common (GE + vehicle) · 1573 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("mathlib")`

Math library loaded in both VMs (GE and vehicle). It defines the types vec3 (x, y, z, doubles) and quat (x, y, z, w), their metamethods (+, -, *, /, ==, tostring), and a large number of global functions (clamp, lerp, smoothstep, splines, ray/OBB/sphere/capsule/triangle intersections, blue noise...). Everything is defined as global variables when `require('mathlib')` runs, there is no module table to use. When FFI is available, vec3 and quat are C structs (struct __luaVec3_t / __luaQuat_t); otherwise they are tables with a metatable.

## Example

```lua
local a = vec3(1, 2, 3)
local b = vec3({1, 2, 3})
local c = vec3({x = 1, y = 2, z = 3})
print(a == b, (a - b) == vec3(0, 0, 0))
print(vec3(10, 0, 0):dot(vec3(10, 0, 0)))
local q = quatFromDir(vec3(0, 1, 0), vec3(0, 0, 1))
local v = q * vec3(1, 0, 0) -- rotation of a vector by a quat
local t = clamp(lerp(0, 10, 0.3), 0, 5)
```

## Notes

- Quaternion convention: BeamNG (and Torque3D) quats use -w; setRotationFromTo and getRotationTo therefore store w = -(1 + dot). quatFromEuler, quatFromAxisAngle and quatFromDir give quats directly usable with the * operator on a vec3.
- The OBBs (oriented boxes) of the overlaps/contains/intersects functions are described by a center c1 and three vectors x1, y1, z1 that are the HALF-axes (length = half-extent; the code compares against squaredLength(), so the axes are not normalized).
- The OBB geometric functions and several LuaVec3 methods use three temporary vec3 shared at module level (tmpv1..3): they are not reentrant between coroutines but OK in normal use.
- push3 / StackVec3: stack of 100 preallocated vec3 for writing vector expressions without allocation, e.g. (push3(a) - push3(b)):length(). Each operation consumes the stacked values; each push3 must be consumed by exactly one terminal method (xyz, copy, dot, length, squaredLength, distance, squaredDistance). An unconsumed push3 makes the stack index drift. Do not use between two calls that push without popping.
- getTmpVec3/resetTmpVec3: pool of temporary vec3 stored in a table supplied by the caller (must contain t[0] = 0). resetTmpVec3(t) to be placed at the start of updateGFX; do not use in a loop.
- Guard epsilon: normalize, resize, cosAngle, etc. add 1e-30 to the denominator, so a zero vector stays zero instead of giving NaN.
- PROBABLE BUG: quat() with no argument returns (x=1, y=0, z=0, w=0), which is NOT the identity (the identity is (0,0,0,1), as quatFromDir/quatFromEuler do). Use quat(0,0,0,1) for the identity.
- Typo in the exported function name: constainsCylinder_Point (instead of containsCylinder_Point).
- smoothmax(a, b, k) has no default value for k (unlike smoothmin, which takes 0.1): k = nil causes an error.
- LuaQuat.__tostring and StackVec3.__tostring pass the result of numSer (a string) to a '%.10g' format: this works through automatic string -> number conversion but '9e999' (infinity) is treated as inf.
- Global variables also created: fsign (= sign), vec3toString (= LuaVec3.__tostring, compat). (The global `i` flagged by the automatic extraction is a false positive: it is the variable of a local for loop.)

## Class `LuaQuat`

Quaternion (x, y, z, w) in double, T3d's -w convention. Created by quat(...), quatFromDir, quatFromAxisAngle, quatFromEuler. Operators: + - (unary and binary), * (quat*quat = composition; quat*vec3 = vector rotation; quat*number), / (quat/number or quat * inverse(quat)), tostring.

| Method | Description | Line |
|---|---|---|
| `LuaQuat.__add(a, b)` | Component-by-component sum. | 1002 |
| `LuaQuat.__div(a, b)` | quat / number: component division; quat / quat: a * b^-1. | 992 |
| `LuaQuat.__mul(a, b)` | quat*number or number*quat: scaling; quat*vec3: rotated vector; quat*quat: Hamilton product. | 971 |
| `LuaQuat.__sub(a, b)` | Component-by-component difference. | 988 |
| `LuaQuat:__tostring()` | Text 'quat(x,y,z,w)'. | 915 |
| `LuaQuat.__unm(a)` | Opposite of all components (represents the same rotation). | 967 |
| `LuaQuat:conjugated()` | Conjugate (-x, -y, -z, w): inverse rotation for a unit quat. | 1028 |
| `LuaQuat:copy()` | Copy of the quat. | 927 |
| `LuaQuat:distance(a)` | 0.5 * \|self - a\|² (a deviation measure, not an angle). | 1010 |
| `LuaQuat:dot(a)` | 4-component dot product. | 1006 |
| `LuaQuat:inverse()` | Inverts in place (-1/\|q\|² applied to x, y, z and w with the code's convention). | 957 |
| `LuaQuat:inversed()` | Inverse copy. | 962 |
| `LuaQuat:nlerp(a, t)` | Normalized linear interpolation toward a (takes the shortest path). | 1014 |
| `LuaQuat:norm()` | Norm of the quat. | 939 |
| `LuaQuat:normalize()` | Normalizes in place. | 947 |
| `LuaQuat:normalized()` | Normalized copy. | 952 |
| `LuaQuat:scale(a)` | Multiplies all components by a, in place, and returns self. | 1032 |
| `LuaQuat:set(x, y, z, w)` | Sets x, y, z, w or copies another quat: set(q) or set(x,y,z,w). | 931 |
| `LuaQuat:setFromAxisAngle(axle, angleRad)` | self = rotation of angle angleRad around the unit axis axle. | 1037 |
| `LuaQuat:setFromDir(dir, up)` | self oriented with the local Y axis toward dir and the up toward up (default Z); see quatFromDir. | 1065 |
| `LuaQuat:setFromEuler(x, y, z)` | self from Euler angles in radians. | 1056 |
| `LuaQuat:setInvMul2(a, b)` | self = a^-1 * b. | 1128 |
| `LuaQuat:setMul2(a, b)` | self = a * b (no allocation). One of the two can be a number (scaling). | 1117 |
| `LuaQuat:setMulInv2(a, b)` | self = a * b^-1. | 1134 |
| `LuaQuat:setMulXYZW(ax, ay, az, aw, bx, by, bz, bw)` | self = Hamilton product (a)*(b) given by the raw components. | 1110 |
| `LuaQuat:setRotationFromTo(fromV, toV)` | self = rotation (-w convention) bringing fromV onto toV (normalized vectors). | 1043 |
| `LuaQuat:slerp(a, t)` | Spherical interpolation toward a; falls back to nlerp if the quats are nearly identical (dot > 0.9995). | 1020 |
| `LuaQuat:squaredNorm()` | Squared norm. | 943 |
| `LuaQuat:toDict()` | Table {x=, y=, z=, w=}. | 923 |
| `LuaQuat:toDirUp()` | Returns the 'forward' (self * (0,1,0)) and 'up' (self * (0,0,1)) vectors. | 1155 |
| `LuaQuat:toEulerYXZ()` | Euler angles (YXZ order, radians) as a vec3, via setEulerYXZ. | 1139 |
| `LuaQuat:toTable()` | Indexed table {x, y, z, w}. | 919 |
| `LuaQuat:toTorqueQuat()` | Converts to Torque format {x,y,z,w} where (x,y,z) is the unit axis and w the angle in degrees (acos(w)*360/pi). | 1145 |
| `LuaQuat:xyz()` | Returns x, y, z. | 907 |
| `LuaQuat:xyzw()` | Returns x, y, z, w. | 911 |

## Class `LuaVec3`

Double-precision 3D vector (fields x, y, z). Created by vec3(...). Operators: +, -, unary -, * (by a number), / (by a number), ==, tostring. Aliases: toPoint3F and toFloat3 (return self), len = length, lenSquared = squaredLength, normalizeSafe = normalize. The `setXxx` methods modify self in place; the others return a new vector or a value. normalize/resize/set* return nothing (unless noted).

| Method | Description | Line |
|---|---|---|
| `LuaVec3.__add(a, b)` | a + b component by component (new vec3). | 128 |
| `LuaVec3.__div(a, b)` | Division by a scalar (multiplies by 1/b). | 148 |
| `LuaVec3.__eq(a, b)` | Exact equality of the three components; false if b is nil. | 153 |
| `LuaVec3.__mul(a, b)` | Product by a scalar (vec3 * number or number * vec3). No vec3*vec3 product: use componentMul, dot or cross. | 140 |
| `LuaVec3.__sub(a, b)` | a - b (new vec3). | 132 |
| `LuaVec3:__tostring()` | Text 'vec3(x,y,z)' (%.10g format, infinities written 9e999). | 95 |
| `LuaVec3.__unm(a)` | Opposite -a. | 136 |
| `LuaVec3:basisCoordinates(c1, c2, c3)` | Coordinates of self in the arbitrary (non-orthogonal) basis (c1, c2, c3). | 409 |
| `LuaVec3:componentMul(b)` | Component-by-component product (new vec3). | 430 |
| `LuaVec3:copy()` | Copy of the vector. | 81 |
| `LuaVec3:cosAngle(a)` | Cosine of the angle between self and a (clamped to [-1,1], safe against a zero vector). | 190 |
| `LuaVec3:cross(a)` | Cross product self x a (new vec3). | 161 |
| `LuaVec3:distance(a)` | Distance between two points. | 222 |
| `LuaVec3:distanceToLine(a, b)` | Distance from self to the line (a, b). | 247 |
| `LuaVec3:distanceToLineSegment(a, b)` | Distance from self to the segment [a, b]. | 257 |
| `LuaVec3:dot(a)` | Dot product. | 157 |
| `LuaVec3:fromString(s)` | Reads three numbers from a string (separated by comma or space) and assigns them to self; 0 if unreadable. | 85 |
| `LuaVec3:getAxis(i)` | Compat: returns component i (1=x, 2=y, 3=z). | 652 |
| `LuaVec3:getBlueNoise2d()` | Advances the 2D blue noise state stored in (x, y) of self (values in [0,1)) and returns self. | 569 |
| `LuaVec3:getBlueNoise3d()` | Advances the 3D blue noise state stored in (x, y, z) and returns self. | 575 |
| `LuaVec3:getBluePointInCircle(radius)` | Same in 2D (XY disc, z = 0). | 636 |
| `LuaVec3:getBluePointInSphere(radius)` | Draws a point in the ball using blue noise: self serves as the (advanced) state, returns a NEW vec3 (centered point, scaled by radius) or (0,0,0) on failure. | 621 |
| `LuaVec3:getRandomPointInCircle(radius)` | Places self at a random point of the XY disc of radius radius (z = 0) and returns self. | 601 |
| `LuaVec3:getRandomPointInSphere(radius)` | Places self at a random point of the ball of radius radius (default 1) around the origin (math.random) and returns self. | 580 |
| `LuaVec3:getRotationTo(toV)` | Quat (-w convention) rotating self toward toV. Both vectors must be normalized. | 541 |
| `LuaVec3:inPolygon(...)` | 2D point-in-polygon test (x, y of self): accepts a table of points having .x/.y, or several points as arguments. Source love2d, Zlib/BSD-2 license. | 366 |
| `LuaVec3:invBilinear2D(a1, a2, b1, b2)` | Inverse of the 2D bilinear interpolation (x, y of self) of the quadrilateral a1,a2,b1,b2: returns u, v such that p = lerp(lerp(a1,a2,u), lerp(b1,b2,u), v). | 302 |
| `LuaVec3:length()` | Euclidean norm. | 113 |
| `LuaVec3:lengthGuarded()` | Norm + 1e-30 (never zero). | 118 |
| `LuaVec3:normalize()` | Normalizes self in place (a zero vector stays zero). | 194 |
| `LuaVec3:normalized()` | Normalized copy. | 212 |
| `LuaVec3:perpendicular()` | A perpendicular vector (same length), chosen by setPerpendicular. | 169 |
| `LuaVec3:perpendicularN()` | Normalized perpendicular. | 175 |
| `LuaVec3:projectToOriginPlane(pnorm)` | Projects self onto the plane through the origin with normal pnorm (unit). | 384 |
| `LuaVec3:resize(a)` | Gives self the length a (in place). | 199 |
| `LuaVec3:resized(m)` | Copy of length m. | 217 |
| `LuaVec3:ropeRock(cutOff)` | Limits the length of self to cutOff in place and returns the original length. Usage cited in the code: p = p + vel*dt; if p:ropeRock(x) < x then stationary end. | 205 |
| `LuaVec3:rotated(q)` | Copy of self rotated by the quat q (-w convention). | 548 |
| `LuaVec3:set(x, y, z)` | Sets the components: set(x, y, z) or set(otherVec3). | 65 |
| `LuaVec3:setAdd(a)` | self += a. | 450 |
| `LuaVec3:setAdd2(a, b)` | self = a + b. | 455 |
| `LuaVec3:setAddScaled(a, b, c)` | self = a + b * c. | 461 |
| `LuaVec3:setAddXYZ(x, y, z)` | self += (x, y, z). | 446 |
| `LuaVec3:setAxis(i, v)` | Compat: sets component i (1=x, 2=y, 3=z). | 656 |
| `LuaVec3:setComponentMul(a)` | self = self * a component by component. | 491 |
| `LuaVec3:setCross(a, b)` | self = a x b. | 503 |
| `LuaVec3:setEulerYXZ(q)` | Sets self to the Euler angles (YXZ order) in radians extracted from the quat q (x = first angle, etc., see code; formula from bediyap.com). | 516 |
| `LuaVec3:setFromTable(t)` | Sets from an indexed table {x, y, z}. | 105 |
| `LuaVec3:setLerp(from, to, t)` | self = interpolation from from to to (fraction t, unclamped). | 496 |
| `LuaVec3:setLinePointFromXnorm(p0, p1, xnorm)` | self = p0 + (p1 - p0) * xnorm. | 536 |
| `LuaVec3:setMax(a)` | self = component-by-component maximum of self and a. | 441 |
| `LuaVec3:setMin(a)` | self = component-by-component minimum of self and a. | 436 |
| `LuaVec3:setNeg()` | self = -self. | 478 |
| `LuaVec3:setPerpendicular(a)` | self = a vector perpendicular to a (or to self). | 529 |
| `LuaVec3:setProjectToOriginPlane(pnorm, a)` | self = projection of a (or of self) onto the plane through the origin with normal pnorm. | 522 |
| `LuaVec3:setRotate(q, a)` | Rotates by the quat q: self = q * a (or q * self if a is omitted). | 509 |
| `LuaVec3:setScaled(b)` | self *= b. | 482 |
| `LuaVec3:setScaled2(a, b)` | self = a * b. | 486 |
| `LuaVec3:setSub(a)` | self -= a. | 467 |
| `LuaVec3:setSub2(a, b)` | self = a - b. | 472 |
| `LuaVec3:setToBase(nx, ny, nz)` | Transforms self (local coordinates) into x*nx + y*ny + z*nz, in place. | 415 |
| `LuaVec3:setTrianglePointFromUV(a, b, c, u, v)` | Places self at the point u*a + v*b + (1-u-v)*c. | 295 |
| `LuaVec3:slerp(b, t)` | Spherical interpolation between two normalized vectors. The output is not normalized. | 183 |
| `LuaVec3:squaredDistance(a)` | Squared distance. | 231 |
| `LuaVec3:squaredDistanceToLine(a, b)` | Distance² from self (point) to the line passing through a and b. | 241 |
| `LuaVec3:squaredDistanceToLineSegment(a, b)` | Distance² from self to the segment [a, b]. | 251 |
| `LuaVec3:squaredLength()` | Squared norm. | 123 |
| `LuaVec3:toBase(nx, ny, nz)` | Non-destructive version of setToBase. | 424 |
| `LuaVec3:toDict()` | Table {x=, y=, z=} (handy for JSON). | 109 |
| `LuaVec3:toFloat3()` | Compat: returns self (alias toPoint3F). | 660 |
| `LuaVec3:toTable()` | Table {x, y, z} indexed from 1 to 3. | 101 |
| `LuaVec3:triangleBarycentricNorm(a, b, c)` | Barycentric coordinates of self relative to the triangle (a,b,c): u*a + v*b + (1-u-v)*c. Also returns the unit normal of the triangle. | 287 |
| `LuaVec3:triangleClosestPoint(a, b, c)` | Triangle point closest to self, then u, v. | 357 |
| `LuaVec3:triangleClosestPointUV(a, b, c)` | Coordinates (u, v) of the triangle point closest to self: u*a + v*b + (1-u-v)*c. | 318 |
| `LuaVec3:xnormDistanceToLineSegment(a, b)` | Like the previous one but with the distance (square root). | 268 |
| `LuaVec3:xnormOnLine(a, b)` | Normalized abscissa of the projection of self onto the line (a, b) (0 at a, 1 at b). | 279 |
| `LuaVec3:xnormOnLinePointVec(p, v)` | Normalized abscissa of the projection of self onto the line {p, direction v} (point = p + v*xnorm). | 273 |
| `LuaVec3:xnormPlaneWithLine(pnorm, a, b)` | self is a point of the plane, pnorm its normal: normalized abscissa where the line (a, b) crosses the plane (clamped to ±1e300 if parallel). | 390 |
| `LuaVec3:xnormSquaredDistanceToLineSegment(a, b)` | Returns the normalized (unclamped) abscissa of the projection onto the line (a,b) then the distance² to the segment. | 261 |
| `LuaVec3:xnormsSphereWithLine(radius, a, b)` | self is the sphere center: normalized abscissas (low, high) of the intersection with the line (a,b). Returns 1, 0 if there is no intersection. | 396 |
| `LuaVec3:xy()` | Returns x and y. | 77 |
| `LuaVec3:xyz()` | Returns the three components. | 73 |
| `LuaVec3:z0()` | Copy with z = 0 (projection onto the XY plane). | 165 |

## Class `StackVec3`

Single object (returned by push3) that operates on the static vec3 stack. The operators modify the top of the stack and return the same object; the terminal methods (xyz, copy, dot, length, squaredLength, distance, squaredDistance, __tostring) pop and return a result. See module notes.

| Method | Description | Line |
|---|---|---|
| `StackVec3.__add(a, b)` | Pops b (read via :xyz()) and adds it to the top. | 778 |
| `StackVec3.__div(a, b)` | Divides the top by a number. | 805 |
| `StackVec3.__mul(a, b)` | Multiplies the top by a number (on the left or right). | 798 |
| `StackVec3.__sub(a, b)` | Subtracts b from the top. | 785 |
| `StackVec3:__tostring()` | Pops and returns 'push3(...)'. | 772 |
| `StackVec3.__unm(a)` | Opposite of the top. | 792 |
| `StackVec3:copy()` | Pops and returns a normal vec3. | 766 |
| `StackVec3:cross(b)` | Cross product top x b; the result stays on the stack. | 819 |
| `StackVec3:distance(a)` | Distance between the top (popped) and a. | 862 |
| `StackVec3:dot(a)` | Dot product top · a (pops). | 812 |
| `StackVec3:length()` | Norm of the top (pops). | 832 |
| `StackVec3:normalized()` | Normalizes the top (stays on the stack). | 846 |
| `StackVec3:resized(m)` | Gives the top the length m (stays on the stack). | 854 |
| `StackVec3:squaredDistance(a)` | Distance² between the top (popped) and a. | 870 |
| `StackVec3:squaredLength()` | Norm² of the top (pops). | 839 |
| `StackVec3:xyz()` | Pops and returns x, y, z. | 760 |
| `StackVec3:z0()` | Sets z of the top to 0. | 827 |

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `OBBsquaredDistance(c1, x1, y1, z1, p)` | Squared distance between a point and an oriented box (0 if the point is inside). | 1426 |
| `altitudeOBB_Plane(c1, x1, y1, z1, plpos, pln)` | Signed altitude of the highest point of the oriented box relative to the plane: dot(c1 - plpos, pln) + sum of \|dot(axis, pln)\|. | 1476 |
| `biQuadratic(p0, p1, p2, p3, t)` | Piecewise quadratic spline that does NOT pass through the points: smooths the signal. t in [0,1] between p1 and p2. | 1388 |
| `biasFun(x, k)` | Bias function (x + xk)/(1 + xk): distorts x in [0,1]; k > 0 raises the curve. | 1277 |
| `biasGainFun(x, t, s)` | Two-parameter bias/gain function (arXiv 2010.09714): passes through (t, t); s sets the slope at the pivot point. Curve viewable on desmos (link in the code). | 1285 |
| `bumpFun(x, peakLeftX, peakRightX, leftSlope, rightSlope, leftY, peakY, rightY, roundness)` | Smooth 'bump' function: rises from leftY to peakY around peakLeftX then falls back to rightY around peakRightX (two sigmoid1 sigmoids). | 1300 |
| `bumpPFun(x, peakX, leftWidth, rightWidth, leftC, rightC, baseY, peakY)` | Polynomial bump with bounded support centered on peakX, with distinct widths and curvature factors on the left and right. Equals baseY outside [peakX-leftWidth, peakX+rightWidth]. | 1306 |
| `cardinalSpline(p0, p1, p2, p3, t, s, d1, d2, d3)` | Cardinal spline between p1 and p2 (p0 and p3 are the neighbors). Works with numbers or vec3. d1, d2, d3 are the parametrization lengths of the three intervals (1 by default = uniform). | 1337 |
| `catmullRom(p0, p1, p2, p3, t, s)` | Uniform Catmull-Rom (cardinalSpline with d1=d2=d3=1). Each component is independent, no distance needed. | 1349 |
| `catmullRomCentripetal(p0, p1, p2, p3, t, s)` | Centripetal Catmull-Rom (square-root distances): the most stable, with no loops or self-intersections. Requires vec3. | 1358 |
| `catmullRomChordal(p0, p1, p2, p3, t, s)` | Chordal Catmull-Rom: parametrization by the distances between points (requires vec3: calls :distance). | 1353 |
| `clamp(x, minValue, maxValue)` | Clamps x to [minValue, maxValue]: min(max(x, minValue), maxValue). Returns minValue if x is NaN. | 1202 |
| `closestLinePoints(l1p1, l1p2, l2p1, l2p2)` | Like closestLinePointsPointVec but the lines are given by two points each. | 699 |
| `closestLinePointsPointVec(l1p, l1Vec, l2p, l2Vec)` | Closest points of two infinite lines defined by point + direction vector. Returns the normalized abscissas (xnorm) on each line; handles parallel and degenerate cases. | 680 |
| `closestLineSegmentPoints(l1p1, l1p2, l2p1, l2p2)` | Normalized abscissas (clamped to [0,1]) of the closest points between two segments. | 706 |
| `conicBezier(p1, p2, p3, t, w)` | Rational conic Bézier (weight w on the control point): can represent hyperbolas, parabolas, ellipses, circles. | 1379 |
| `constainsCylinder_Point(cposa, cposb, cR, p)` | True if p is inside the cylinder (without rounded ends) of axis cposa-cposb and radius cR. The name contains a typo in the game code. | 1471 |
| `containsEllipsoid_Point(c1, x1, y1, z1, p)` | True if the point p is inside the ellipsoid of center c1 and half-axes x1, y1, z1. | 1462 |
| `containsOBB_OBB(c1, x1, y1, z1, c2, x2, y2, z2)` | True if box 2 is entirely contained in box 1. | 1419 |
| `containsOBB_Sphere(c1, x1, y1, z1, c2, r2)` | True if the sphere is entirely inside the oriented box. | 1444 |
| `containsOBB_point(c1, x1, y1, z1, p)` | True if the point p is inside the oriented box. | 1457 |
| `containsSphere_OBB(c1, r1, c2, x2, y2, z2)` | True if the oriented box (c2, x2, y2, z2) is entirely inside the sphere (c1, r1): tests its 8 corners. | 1450 |
| `getBlueNoise1d(x)` | Next value of the 1D blue noise sequence: fractPart(x + 0.618...). | 564 |
| `getTmpVec3(t)` | Returns the next temporary vec3 of the pool `t` (creates it if needed) and increments t[0]. `t` must be initialized with t[0] = 0 at module level. | 728 |
| `guardZero(x)` | Avoids exact zero (branchless computation): returns 1/clamp(1/x, -1e300, 1e300), i.e. x except for 0, which becomes ~1e-300 of the same sign. | 1197 |
| `indexedBlueNoise(i)` | Deterministic blue noise: fractPart(i * 0.618...) (golden ratio sequence), well distributed over [0,1). | 559 |
| `intersectsRay_Capsule(rpos, rdir, cposa, cposb, cR)` | Ray / capsule intersection (from iquilezles.org/articles/intersectors). Returns the first hit (negative if behind the origin), math.huge otherwise. | 1539 |
| `intersectsRay_Cylinder(rpos, rdir, cposa, cposb, cR)` | Ray / finite cylinder intersection with axis cposa-cposb, radius cR. Returns (minhit, maxhit), minhit = math.huge with no hit. | 1524 |
| `intersectsRay_Ellipsoid(rpos, rdir, c1, x1, y1, z1)` | Ray / ellipsoid intersection (center c1, half-axes x1, y1, z1). Returns (smallest, largest) root, or (math.huge, math.huge) with no hit. | 1510 |
| `intersectsRay_OBB(rpos, rdir, c1, x1, y1, z1)` | Ray / oriented box intersection. Returns (minhit, maxhit); minhit = math.huge if there is no hit. Hit if minhit < maxhit and maxhit > 0; ray inside if minhit < 0 and maxhit > 0. | 1488 |
| `intersectsRay_Plane(rpos, rdir, plpos, pln)` | Signed distance (in multiples of rdir) of the ray's intersection point with the plane. Negative if the plane is behind the origin; math.huge if the ray is parallel. | 1482 |
| `intersectsRay_Sphere(rpos, rdir, cpos, cr)` | Ray / sphere intersection. Returns (entry, exit) as a distance along rdir (assumed normalized), or (math.huge, math.huge) with no hit. | 1501 |
| `intersectsRay_Triangle(rpos, rdir, a, b, c)` | Ray / triangle intersection. Returns the hit distance and two barycentric coordinates; with no hit returns math.huge, -1, -1. Note: only hits whose computed parameter is <= 0 are accepted, the returned distance is its opposite. | 1557 |
| `inverseLerp(from, to, value)` | Fraction t such that lerp(from, to, t) = value; returns 0 if from and to are (nearly) equal. | 1248 |
| `isinf(a)` | True if abs(a) == math.huge. | 1223 |
| `isnan(a)` | True if a is NaN (a ~= a). | 1219 |
| `isnaninf(a)` | True if a is NaN or infinite (a*0 ~= 0). | 1227 |
| `lerp(from, to, t)` | Linear interpolation from + (to - from) * t. Also works with vec3/quat (via the operators) thanks to the monotone formula. | 1244 |
| `lineBB2d(x1, y1, x2, y2, radius)` | 2D bounding box of a segment, expanded by radius (0 by default). | 1330 |
| `linePointFromXnorm(p0, p1, xnorm)` | Point p0 + (p1 - p0) * xnorm (linear interpolation between two vec3, without clamping). | 721 |
| `linearScale(v, minValue, maxValue, minOutput, maxOutput)` | Remaps v from [minValue, maxValue] to [minOutput, maxOutput] CLAMPING the fraction to [0,1] (the output stays within the output range). | 1236 |
| `median3(a, b, c)` | Median of three numbers. | 1314 |
| `median4(a, b, c, d)` | Average of the two middle values of four numbers. | 1318 |
| `median5(a, b, c, d, e)` | Median of five numbers. | 1322 |
| `monotonicSteffen(y0, y1, y2, y3, x0, x1, x2, x3, x)` | Steffen monotone 2D interpolation between (x1,y1) and (x2,y2) using the neighbors (x0,y0) and (x3,y3) for the slopes. | 1363 |
| `nanError(x)` | Returns x if it is not NaN, otherwise raises error('NaN found'). Useful for tracing the origin of a NaN. | 1231 |
| `overlapsOBB_OBB(c1, x1, y1, z1, c2, x2, y2, z2)` | Overlap test between two oriented boxes (SAT on 15 axes). Each box = center + three half-axes. | 1405 |
| `overlapsOBB_Plane(c1, x1, y1, z1, plpos, pln)` | True if an oriented box intersects a plane (point + normal). | 1439 |
| `overlapsOBB_Sphere(c1, x1, y1, z1, c2, r2)` | True if an oriented box and a sphere overlap. | 1435 |
| `pointBB2d(x, y, radius)` | 2D bounding box of a point expanded by radius. | 1326 |
| `push3(x, y, z)` | Pushes a vec3 (or x, y, z) onto the static stack of 100 vec3 and returns the StackVec3 object (always the same). Used to chain operations without allocation. See module notes. | 749 |
| `quadraticBezier(p1, p2, p3, t)` | Quadratic Bézier curve (p1, p2 control point, p3). Works with numbers or vec3. | 1373 |
| `quat(x, y, z, w)` | quat constructor (x, y, z, w). Accepts four numbers, a table {x,y,z,w} or {1,2,3,4}, or a quat to copy. With no argument see notes (value (1,0,0,0)). T3d quats use -w. | 893 |
| `quatFromAxisAngle(axle, angleRad)` | Rotation quaternion of angle angleRad around the axis (the axis must be normalized). | 1165 |
| `quatFromDir(dir, up)` | Builds a quat orienting the local +Y axis toward `dir`, with `up` as the up direction (world Z by default). If dir and up are nearly collinear, dir is slightly perturbed. | 1159 |
| `quatFromEuler(x, y, z)` | Quaternion from Euler angles in radians (code formula: sin/cos combination of the half-angles x, y, z). | 1171 |
| `randomGauss3()` | Sum of three math.random(): rough pseudo-Gaussian (the code comment says [0..3]). | 670 |
| `randomState(v)` | Deterministic pseudo-random generator: transforms v into a number in (0,1] (modulo 4294967291). Call by feeding the output value back in. | 675 |
| `rescale(v, minValue, maxValue, minOutput, maxOutput)` | Like linearScale but WITHOUT clamping (extrapolates outside the range). | 1240 |
| `resetTmpVec3(t)` | Resets the pool counter to 0 (to be called at the start of updateGFX or equivalent). Returns the old counter value. | 736 |
| `round(a)` | Rounds to the nearest integer: floor(a + 0.5) (.5 goes up, including for negatives). | 1210 |
| `roundNear(x, m)` | Rounds x to the nearest multiple of m. To round to the N-th decimal: roundNear(x, 1e-N). | 1215 |
| `sigmoid1(x, a)` | Rational sigmoid x / (a + \|x\|), symmetric around 0, tending to ±1. | 1296 |
| `sign(x)` | Sign: -1, 0 or 1. Also exposed under the global name fsign. | 1185 |
| `sign2(x)` | Sign without zero: -1 or 1 (0 gives 1; NaN not handled explicitly). | 1180 |
| `signApply(s, v)` | Returns sign(s) * abs(v). | 1192 |
| `smootherstep(x)` | Perlin curve 6x⁵-15x⁴+10x³, result clamped to [0,1]. | 1258 |
| `smootheststep(x)` | Degree-7 polynomial (35x⁴-84x⁵+70x⁶-20x⁷) with x clamped to [0,1]. | 1262 |
| `smoothmax(a, b, k)` | Smooth maximum = smoothmin(a, b, -k). k has no default here. | 1273 |
| `smoothmin(a, b, k)` | Smooth minimum of a and b over a width k (default 0.1). | 1267 |
| `smoothstep(x)` | Curve 3x²-2x³ with x clamped to [0,1]. | 1253 |
| `square(a)` | a * a. | 1206 |
| `vec3(x, y, z)` | vec3 constructor. With no argument: (0,0,0). With a table: accepts {x=,y=,z=} or {1,2,3}, or another vec3 (copy). With x and y: z defaults to 0. | 49 |

**Globals assigned:** `fsign`, `i`, `vec3toString`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/mathlib.lua`.*
