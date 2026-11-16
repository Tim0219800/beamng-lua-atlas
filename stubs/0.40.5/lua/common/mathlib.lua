---@meta
-- tim19Atlas stub generated from lua/common/mathlib.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Quaternion (x, y, z, w) in double, T3d's -w convention. Created by quat(...), quatFromDir, quatFromAxisAngle, quatFromEuler. Operators: + - (unary and binary), * (quat*quat = composition; quat*vec3 = vector rotation; quat*number), / (quat/number or quat * inverse(quat)), tostring.
---@class mathlib_LuaQuat
local mathlib_LuaQuat = {}

--- Component-by-component sum.
---Source: lua/common/mathlib.lua:1002
---@param a quat operand
---@param b quat operand
---@return quat  sum
function mathlib_LuaQuat.__add(a, b) end

--- quat / number: component division; quat / quat: a * b^-1.
---Source: lua/common/mathlib.lua:992
---@param a quat numerator
---@param b quat|number denominator
---@return quat  result
function mathlib_LuaQuat.__div(a, b) end

--- quat*number or number*quat: scaling; quat*vec3: rotated vector; quat*quat: Hamilton product.
---Source: lua/common/mathlib.lua:971
---@param a quat|number operand
---@param b quat|vec3|number operand
---@return quat|vec3  result
function mathlib_LuaQuat.__mul(a, b) end

--- Component-by-component difference.
---Source: lua/common/mathlib.lua:988
---@param a quat operand
---@param b quat operand
---@return quat  difference
function mathlib_LuaQuat.__sub(a, b) end

--- Text 'quat(x,y,z,w)'.
---Source: lua/common/mathlib.lua:915
---@return string  text
function mathlib_LuaQuat:__tostring() end

--- Opposite of all components (represents the same rotation).
---Source: lua/common/mathlib.lua:967
---@param a quat operand
---@return quat  opposite
function mathlib_LuaQuat.__unm(a) end

--- Conjugate (-x, -y, -z, w): inverse rotation for a unit quat.
---Source: lua/common/mathlib.lua:1028
---@return quat  conjugate
function mathlib_LuaQuat:conjugated() end

--- Copy of the quat.
---Source: lua/common/mathlib.lua:927
---@return quat  copy
function mathlib_LuaQuat:copy() end

--- 0.5 * |self - a|² (a deviation measure, not an angle).
---Source: lua/common/mathlib.lua:1010
---@param a quat other quat
---@return number  deviation
function mathlib_LuaQuat:distance(a) end

--- 4-component dot product.
---Source: lua/common/mathlib.lua:1006
---@param a quat other quat
---@return number  self·a
function mathlib_LuaQuat:dot(a) end

--- Inverts in place (-1/|q|² applied to x, y, z and w with the code's convention).
---Source: lua/common/mathlib.lua:957
function mathlib_LuaQuat:inverse() end

--- Inverse copy.
---Source: lua/common/mathlib.lua:962
---@return quat  inverse
function mathlib_LuaQuat:inversed() end

--- Normalized linear interpolation toward a (takes the shortest path).
---Source: lua/common/mathlib.lua:1014
---@param a quat target
---@param t number fraction [0,1]
---@return quat  interpolated quat
function mathlib_LuaQuat:nlerp(a, t) end

--- Norm of the quat.
---Source: lua/common/mathlib.lua:939
---@return number  norm
function mathlib_LuaQuat:norm() end

--- Normalizes in place.
---Source: lua/common/mathlib.lua:947
function mathlib_LuaQuat:normalize() end

--- Normalized copy.
---Source: lua/common/mathlib.lua:952
---@return quat  unit quat
function mathlib_LuaQuat:normalized() end

--- Multiplies all components by a, in place, and returns self.
---Source: lua/common/mathlib.lua:1032
---@param a number factor
---@return quat  self
function mathlib_LuaQuat:scale(a) end

--- Sets x, y, z, w or copies another quat: set(q) or set(x,y,z,w).
---Source: lua/common/mathlib.lua:931
---@param x number|quat x or source quat
---@param y number|nil y
---@param z number|nil z
---@param w number|nil w
function mathlib_LuaQuat:set(x, y, z, w) end

--- self = rotation of angle angleRad around the unit axis axle.
---Source: lua/common/mathlib.lua:1037
---@param axle vec3 unit axis
---@param angleRad number angle in radians
function mathlib_LuaQuat:setFromAxisAngle(axle, angleRad) end

--- self oriented with the local Y axis toward dir and the up toward up (default Z); see quatFromDir.
---Source: lua/common/mathlib.lua:1065
---@param dir vec3 direction
---@param up vec3|nil up, default (0,0,1)
function mathlib_LuaQuat:setFromDir(dir, up) end

--- self from Euler angles in radians.
---Source: lua/common/mathlib.lua:1056
---@param x number x angle (rad)
---@param y number y angle (rad)
---@param z number z angle (rad)
function mathlib_LuaQuat:setFromEuler(x, y, z) end

--- self = a^-1 * b.
---Source: lua/common/mathlib.lua:1128
---@param a quat quat to invert
---@param b quat quat
function mathlib_LuaQuat:setInvMul2(a, b) end

--- self = a * b (no allocation). One of the two can be a number (scaling).
---Source: lua/common/mathlib.lua:1117
---@param a quat|number operand
---@param b quat|number operand
function mathlib_LuaQuat:setMul2(a, b) end

--- self = a * b^-1.
---Source: lua/common/mathlib.lua:1134
---@param a quat quat
---@param b quat quat to invert
function mathlib_LuaQuat:setMulInv2(a, b) end

--- self = Hamilton product (a)*(b) given by the raw components.
---Source: lua/common/mathlib.lua:1110
---@param ax number a.x
---@param ay number a.y
---@param az number a.z
---@param aw number a.w
---@param bx number b.x
---@param by number b.y
---@param bz number b.z
---@param bw number b.w
function mathlib_LuaQuat:setMulXYZW(ax, ay, az, aw, bx, by, bz, bw) end

--- self = rotation (-w convention) bringing fromV onto toV (normalized vectors).
---Source: lua/common/mathlib.lua:1043
---@param fromV vec3 start direction
---@param toV vec3 end direction
function mathlib_LuaQuat:setRotationFromTo(fromV, toV) end

--- Spherical interpolation toward a; falls back to nlerp if the quats are nearly identical (dot > 0.9995).
---Source: lua/common/mathlib.lua:1020
---@param a quat target
---@param t number fraction [0,1]
---@return quat  interpolated quat
function mathlib_LuaQuat:slerp(a, t) end

--- Squared norm.
---Source: lua/common/mathlib.lua:943
---@return number  norm²
function mathlib_LuaQuat:squaredNorm() end

--- Table {x=, y=, z=, w=}.
---Source: lua/common/mathlib.lua:923
---@return table<string, number>  dictionary
function mathlib_LuaQuat:toDict() end

--- Returns the 'forward' (self * (0,1,0)) and 'up' (self * (0,0,1)) vectors.
---Source: lua/common/mathlib.lua:1155
---@return vec3  forward direction
---@return vec3  up direction
function mathlib_LuaQuat:toDirUp() end

--- Euler angles (YXZ order, radians) as a vec3, via setEulerYXZ.
---Source: lua/common/mathlib.lua:1139
---@return vec3  angles
function mathlib_LuaQuat:toEulerYXZ() end

--- Indexed table {x, y, z, w}.
---Source: lua/common/mathlib.lua:919
---@return table  array of 4 numbers
function mathlib_LuaQuat:toTable() end

--- Converts to Torque format {x,y,z,w} where (x,y,z) is the unit axis and w the angle in degrees (acos(w)*360/pi).
---Source: lua/common/mathlib.lua:1145
---@return table<string, number>  {x,y,z,w=angle in degrees}
function mathlib_LuaQuat:toTorqueQuat() end

--- Returns x, y, z.
---Source: lua/common/mathlib.lua:907
---@return number  x
---@return number  y
---@return number  z
function mathlib_LuaQuat:xyz() end

--- Returns x, y, z, w.
---Source: lua/common/mathlib.lua:911
---@return number  x
---@return number  y
---@return number  z
---@return number  w
function mathlib_LuaQuat:xyzw() end

--- Double-precision 3D vector (fields x, y, z). Created by vec3(...). Operators: +, -, unary -, * (by a number), / (by a number), ==, tostring. Aliases: toPoint3F and toFloat3 (return self), len = length, lenSquared = squaredLength, normalizeSafe = normalize. The `setXxx` methods modify self in place; the others return a new vector or a value. normalize/resize/set* return nothing (unless noted).
---@class mathlib_LuaVec3
local mathlib_LuaVec3 = {}

--- a + b component by component (new vec3).
---Source: lua/common/mathlib.lua:128
---@param a vec3 operand
---@param b vec3 operand
---@return vec3  sum
function mathlib_LuaVec3.__add(a, b) end

--- Division by a scalar (multiplies by 1/b).
---Source: lua/common/mathlib.lua:148
---@param a vec3 vector
---@param b number divisor
---@return vec3  result
function mathlib_LuaVec3.__div(a, b) end

--- Exact equality of the three components; false if b is nil.
---Source: lua/common/mathlib.lua:153
---@param a vec3 operand
---@param b vec3|nil operand
---@return boolean  equal
function mathlib_LuaVec3.__eq(a, b) end

--- Product by a scalar (vec3 * number or number * vec3). No vec3*vec3 product: use componentMul, dot or cross.
---Source: lua/common/mathlib.lua:140
---@param a vec3|number operand
---@param b vec3|number operand
---@return vec3  result
function mathlib_LuaVec3.__mul(a, b) end

--- a - b (new vec3).
---Source: lua/common/mathlib.lua:132
---@param a vec3 operand
---@param b vec3 operand
---@return vec3  difference
function mathlib_LuaVec3.__sub(a, b) end

--- Text 'vec3(x,y,z)' (%.10g format, infinities written 9e999).
---Source: lua/common/mathlib.lua:95
---@return string  text
function mathlib_LuaVec3:__tostring() end

--- Opposite -a.
---Source: lua/common/mathlib.lua:136
---@param a vec3 operand
---@return vec3  opposite
function mathlib_LuaVec3.__unm(a) end

--- Coordinates of self in the arbitrary (non-orthogonal) basis (c1, c2, c3).
---Source: lua/common/mathlib.lua:409
---@param c1 vec3 basis vector 1
---@param c2 vec3 basis vector 2
---@param c3 vec3 basis vector 3
---@return vec3  coordinates
function mathlib_LuaVec3:basisCoordinates(c1, c2, c3) end

--- Component-by-component product (new vec3).
---Source: lua/common/mathlib.lua:430
---@param b vec3 other vector
---@return vec3  result
function mathlib_LuaVec3:componentMul(b) end

--- Copy of the vector.
---Source: lua/common/mathlib.lua:81
---@return vec3  copy
function mathlib_LuaVec3:copy() end

--- Cosine of the angle between self and a (clamped to [-1,1], safe against a zero vector).
---Source: lua/common/mathlib.lua:190
---@param a vec3 other vector
---@return number  cosine
function mathlib_LuaVec3:cosAngle(a) end

--- Cross product self x a (new vec3).
---Source: lua/common/mathlib.lua:161
---@param a vec3 other vector
---@return vec3  self x a
function mathlib_LuaVec3:cross(a) end

--- Distance between two points.
---Source: lua/common/mathlib.lua:222
---@param a vec3 other point
---@return number  distance
function mathlib_LuaVec3:distance(a) end

--- Distance from self to the line (a, b).
---Source: lua/common/mathlib.lua:247
---@param a vec3 point on the line
---@param b vec3 point on the line
---@return number  distance
function mathlib_LuaVec3:distanceToLine(a, b) end

--- Distance from self to the segment [a, b].
---Source: lua/common/mathlib.lua:257
---@param a vec3 start
---@param b vec3 end
---@return number  distance
function mathlib_LuaVec3:distanceToLineSegment(a, b) end

--- Dot product.
---Source: lua/common/mathlib.lua:157
---@param a vec3 other vector
---@return number  self·a
function mathlib_LuaVec3:dot(a) end

--- Reads three numbers from a string (separated by comma or space) and assigns them to self; 0 if unreadable.
---Source: lua/common/mathlib.lua:85
---@param s string text 'x, y, z'
---@return vec3  self
function mathlib_LuaVec3:fromString(s) end

--- Compat: returns component i (1=x, 2=y, 3=z).
---Source: lua/common/mathlib.lua:652
---@param i integer index 1..3
---@return number  component
function mathlib_LuaVec3:getAxis(i) end

--- Advances the 2D blue noise state stored in (x, y) of self (values in [0,1)) and returns self.
---Source: lua/common/mathlib.lua:569
---@return vec3  self
function mathlib_LuaVec3:getBlueNoise2d() end

--- Advances the 3D blue noise state stored in (x, y, z) and returns self.
---Source: lua/common/mathlib.lua:575
---@return vec3  self
function mathlib_LuaVec3:getBlueNoise3d() end

--- Same in 2D (XY disc, z = 0).
---Source: lua/common/mathlib.lua:636
---@param radius number|nil radius, default 1
---@return vec3  point
function mathlib_LuaVec3:getBluePointInCircle(radius) end

--- Draws a point in the ball using blue noise: self serves as the (advanced) state, returns a NEW vec3 (centered point, scaled by radius) or (0,0,0) on failure.
---Source: lua/common/mathlib.lua:621
---@param radius number|nil radius, default 1
---@return vec3  point
function mathlib_LuaVec3:getBluePointInSphere(radius) end

--- Places self at a random point of the XY disc of radius radius (z = 0) and returns self.
---Source: lua/common/mathlib.lua:601
---@param radius number|nil radius, default 1
---@return vec3  self
function mathlib_LuaVec3:getRandomPointInCircle(radius) end

--- Places self at a random point of the ball of radius radius (default 1) around the origin (math.random) and returns self.
---Source: lua/common/mathlib.lua:580
---@param radius number|nil radius, default 1
---@return vec3  self
function mathlib_LuaVec3:getRandomPointInSphere(radius) end

--- Quat (-w convention) rotating self toward toV. Both vectors must be normalized.
---Source: lua/common/mathlib.lua:541
---@param toV vec3 target direction
---@return quat  rotation
function mathlib_LuaVec3:getRotationTo(toV) end

--- 2D point-in-polygon test (x, y of self): accepts a table of points having .x/.y, or several points as arguments. Source love2d, Zlib/BSD-2 license.
---Source: lua/common/mathlib.lua:366
---@param ... table|vec3 a table of points or a list of points
---@return boolean  inside
function mathlib_LuaVec3:inPolygon(...) end

--- Inverse of the 2D bilinear interpolation (x, y of self) of the quadrilateral a1,a2,b1,b2: returns u, v such that p = lerp(lerp(a1,a2,u), lerp(b1,b2,u), v).
---Source: lua/common/mathlib.lua:302
---@param a1 vec3 corner a1
---@param a2 vec3 corner a2
---@param b1 vec3 corner b1
---@param b2 vec3 corner b2
---@return number  u
---@return number  v
function mathlib_LuaVec3:invBilinear2D(a1, a2, b1, b2) end

--- Euclidean norm.
---Source: lua/common/mathlib.lua:113
---@return number  length
function mathlib_LuaVec3:length() end

--- Norm + 1e-30 (never zero).
---Source: lua/common/mathlib.lua:118
---@return number  length guaranteed > 0
function mathlib_LuaVec3:lengthGuarded() end

--- Normalizes self in place (a zero vector stays zero).
---Source: lua/common/mathlib.lua:194
function mathlib_LuaVec3:normalize() end

--- Normalized copy.
---Source: lua/common/mathlib.lua:212
---@return vec3  unit vector
function mathlib_LuaVec3:normalized() end

--- A perpendicular vector (same length), chosen by setPerpendicular.
---Source: lua/common/mathlib.lua:169
---@return vec3  perpendicular
function mathlib_LuaVec3:perpendicular() end

--- Normalized perpendicular.
---Source: lua/common/mathlib.lua:175
---@return vec3  unit perpendicular
function mathlib_LuaVec3:perpendicularN() end

--- Projects self onto the plane through the origin with normal pnorm (unit).
---Source: lua/common/mathlib.lua:384
---@param pnorm vec3 plane normal
---@return vec3  projection
function mathlib_LuaVec3:projectToOriginPlane(pnorm) end

--- Gives self the length a (in place).
---Source: lua/common/mathlib.lua:199
---@param a number new length
function mathlib_LuaVec3:resize(a) end

--- Copy of length m.
---Source: lua/common/mathlib.lua:217
---@param m number length
---@return vec3  resized vector
function mathlib_LuaVec3:resized(m) end

--- Limits the length of self to cutOff in place and returns the original length. Usage cited in the code: p = p + vel*dt; if p:ropeRock(x) < x then stationary end.
---Source: lua/common/mathlib.lua:205
---@param cutOff number max length
---@return number  length before limiting
function mathlib_LuaVec3:ropeRock(cutOff) end

--- Copy of self rotated by the quat q (-w convention).
---Source: lua/common/mathlib.lua:548
---@param q quat rotation
---@return vec3  rotated vector
function mathlib_LuaVec3:rotated(q) end

--- Sets the components: set(x, y, z) or set(otherVec3).
---Source: lua/common/mathlib.lua:65
---@param x number|vec3 x or source vec3
---@param y number|nil y
---@param z number|nil z
function mathlib_LuaVec3:set(x, y, z) end

--- self += a.
---Source: lua/common/mathlib.lua:450
---@param a vec3 vector to add
function mathlib_LuaVec3:setAdd(a) end

--- self = a + b.
---Source: lua/common/mathlib.lua:455
---@param a vec3 operand
---@param b vec3 operand
function mathlib_LuaVec3:setAdd2(a, b) end

--- self = a + b * c.
---Source: lua/common/mathlib.lua:461
---@param a vec3 base
---@param b vec3 vector
---@param c number factor
function mathlib_LuaVec3:setAddScaled(a, b, c) end

--- self += (x, y, z).
---Source: lua/common/mathlib.lua:446
---@param x number dx
---@param y number dy
---@param z number dz
function mathlib_LuaVec3:setAddXYZ(x, y, z) end

--- Compat: sets component i (1=x, 2=y, 3=z).
---Source: lua/common/mathlib.lua:656
---@param i integer index 1..3
---@param v number value
function mathlib_LuaVec3:setAxis(i, v) end

--- self = self * a component by component.
---Source: lua/common/mathlib.lua:491
---@param a vec3 other vector
function mathlib_LuaVec3:setComponentMul(a) end

--- self = a x b.
---Source: lua/common/mathlib.lua:503
---@param a vec3 operand
---@param b vec3 operand
function mathlib_LuaVec3:setCross(a, b) end

--- Sets self to the Euler angles (YXZ order) in radians extracted from the quat q (x = first angle, etc., see code; formula from bediyap.com).
---Source: lua/common/mathlib.lua:516
---@param q quat orientation
function mathlib_LuaVec3:setEulerYXZ(q) end

--- Sets from an indexed table {x, y, z}.
---Source: lua/common/mathlib.lua:105
---@param t table array of 3 numbers
function mathlib_LuaVec3:setFromTable(t) end

--- self = interpolation from from to to (fraction t, unclamped).
---Source: lua/common/mathlib.lua:496
---@param from vec3 start
---@param to vec3 end
---@param t number fraction
function mathlib_LuaVec3:setLerp(from, to, t) end

--- self = p0 + (p1 - p0) * xnorm.
---Source: lua/common/mathlib.lua:536
---@param p0 vec3 start
---@param p1 vec3 end
---@param xnorm number abscissa
function mathlib_LuaVec3:setLinePointFromXnorm(p0, p1, xnorm) end

--- self = component-by-component maximum of self and a.
---Source: lua/common/mathlib.lua:441
---@param a vec3 other vector
function mathlib_LuaVec3:setMax(a) end

--- self = component-by-component minimum of self and a.
---Source: lua/common/mathlib.lua:436
---@param a vec3 other vector
function mathlib_LuaVec3:setMin(a) end

--- self = -self.
---Source: lua/common/mathlib.lua:478
function mathlib_LuaVec3:setNeg() end

--- self = a vector perpendicular to a (or to self).
---Source: lua/common/mathlib.lua:529
---@param a vec3|nil source, default self
function mathlib_LuaVec3:setPerpendicular(a) end

--- self = projection of a (or of self) onto the plane through the origin with normal pnorm.
---Source: lua/common/mathlib.lua:522
---@param pnorm vec3 normal
---@param a vec3|nil source, default self
function mathlib_LuaVec3:setProjectToOriginPlane(pnorm, a) end

--- Rotates by the quat q: self = q * a (or q * self if a is omitted).
---Source: lua/common/mathlib.lua:509
---@param q quat rotation
---@param a vec3|nil source vector, default self
function mathlib_LuaVec3:setRotate(q, a) end

--- self *= b.
---Source: lua/common/mathlib.lua:482
---@param b number factor
function mathlib_LuaVec3:setScaled(b) end

--- self = a * b.
---Source: lua/common/mathlib.lua:486
---@param a vec3 vector
---@param b number factor
function mathlib_LuaVec3:setScaled2(a, b) end

--- self -= a.
---Source: lua/common/mathlib.lua:467
---@param a vec3 vector to subtract
function mathlib_LuaVec3:setSub(a) end

--- self = a - b.
---Source: lua/common/mathlib.lua:472
---@param a vec3 operand
---@param b vec3 operand
function mathlib_LuaVec3:setSub2(a, b) end

--- Transforms self (local coordinates) into x*nx + y*ny + z*nz, in place.
---Source: lua/common/mathlib.lua:415
---@param nx vec3 x axis of the basis
---@param ny vec3 y axis
---@param nz vec3 z axis
function mathlib_LuaVec3:setToBase(nx, ny, nz) end

--- Places self at the point u*a + v*b + (1-u-v)*c.
---Source: lua/common/mathlib.lua:295
---@param a vec3 vertex a
---@param b vec3 vertex b
---@param c vec3 vertex c
---@param u number weight of a
---@param v number weight of b
function mathlib_LuaVec3:setTrianglePointFromUV(a, b, c, u, v) end

--- Spherical interpolation between two normalized vectors. The output is not normalized.
---Source: lua/common/mathlib.lua:183
---@param b vec3 normalized target
---@param t number fraction [0,1]
---@return vec3  interpolated vector
function mathlib_LuaVec3:slerp(b, t) end

--- Squared distance.
---Source: lua/common/mathlib.lua:231
---@param a vec3 other point
---@return number  distance²
function mathlib_LuaVec3:squaredDistance(a) end

--- Distance² from self (point) to the line passing through a and b.
---Source: lua/common/mathlib.lua:241
---@param a vec3 point on the line
---@param b vec3 other point on the line
---@return number  distance²
function mathlib_LuaVec3:squaredDistanceToLine(a, b) end

--- Distance² from self to the segment [a, b].
---Source: lua/common/mathlib.lua:251
---@param a vec3 start
---@param b vec3 end
---@return number  distance²
function mathlib_LuaVec3:squaredDistanceToLineSegment(a, b) end

--- Squared norm.
---Source: lua/common/mathlib.lua:123
---@return number  length²
function mathlib_LuaVec3:squaredLength() end

--- Non-destructive version of setToBase.
---Source: lua/common/mathlib.lua:424
---@param nx vec3 x axis
---@param ny vec3 y axis
---@param nz vec3 z axis
---@return vec3  result
function mathlib_LuaVec3:toBase(nx, ny, nz) end

--- Table {x=, y=, z=} (handy for JSON).
---Source: lua/common/mathlib.lua:109
---@return table<string, number>  dictionary
function mathlib_LuaVec3:toDict() end

--- Compat: returns self (alias toPoint3F).
---Source: lua/common/mathlib.lua:660
---@return vec3  self
function mathlib_LuaVec3:toFloat3() end

--- Table {x, y, z} indexed from 1 to 3.
---Source: lua/common/mathlib.lua:101
---@return table  {x,y,z} as an array
function mathlib_LuaVec3:toTable() end

--- Barycentric coordinates of self relative to the triangle (a,b,c): u*a + v*b + (1-u-v)*c. Also returns the unit normal of the triangle.
---Source: lua/common/mathlib.lua:287
---@param a vec3 vertex a
---@param b vec3 vertex b
---@param c vec3 vertex c
---@return number  u
---@return number  v
---@return vec3  unit normal
function mathlib_LuaVec3:triangleBarycentricNorm(a, b, c) end

--- Triangle point closest to self, then u, v.
---Source: lua/common/mathlib.lua:357
---@param a vec3 vertex a
---@param b vec3 vertex b
---@param c vec3 vertex c
---@return vec3  closest point
---@return number  u
---@return number  v
function mathlib_LuaVec3:triangleClosestPoint(a, b, c) end

--- Coordinates (u, v) of the triangle point closest to self: u*a + v*b + (1-u-v)*c.
---Source: lua/common/mathlib.lua:318
---@param a vec3 vertex a
---@param b vec3 vertex b
---@param c vec3 vertex c
---@return number  u
---@return number  v
function mathlib_LuaVec3:triangleClosestPointUV(a, b, c) end

--- Like the previous one but with the distance (square root).
---Source: lua/common/mathlib.lua:268
---@param a vec3 start
---@param b vec3 end
---@return number  xnorm
---@return number  distance
function mathlib_LuaVec3:xnormDistanceToLineSegment(a, b) end

--- Normalized abscissa of the projection of self onto the line (a, b) (0 at a, 1 at b).
---Source: lua/common/mathlib.lua:279
---@param a vec3 start
---@param b vec3 end
---@return number  xnorm
function mathlib_LuaVec3:xnormOnLine(a, b) end

--- Normalized abscissa of the projection of self onto the line {p, direction v} (point = p + v*xnorm).
---Source: lua/common/mathlib.lua:273
---@param p vec3 point on the line
---@param v vec3 direction vector
---@return number  xnorm
function mathlib_LuaVec3:xnormOnLinePointVec(p, v) end

--- self is a point of the plane, pnorm its normal: normalized abscissa where the line (a, b) crosses the plane (clamped to ±1e300 if parallel).
---Source: lua/common/mathlib.lua:390
---@param pnorm vec3 plane normal
---@param a vec3 start
---@param b vec3 end
---@return number  xnorm
function mathlib_LuaVec3:xnormPlaneWithLine(pnorm, a, b) end

--- Returns the normalized (unclamped) abscissa of the projection onto the line (a,b) then the distance² to the segment.
---Source: lua/common/mathlib.lua:261
---@param a vec3 start
---@param b vec3 end
---@return number  unclamped xnorm
---@return number  distance² to the segment
function mathlib_LuaVec3:xnormSquaredDistanceToLineSegment(a, b) end

--- self is the sphere center: normalized abscissas (low, high) of the intersection with the line (a,b). Returns 1, 0 if there is no intersection.
---Source: lua/common/mathlib.lua:396
---@param radius number radius
---@param a vec3 start
---@param b vec3 end
---@return number  low xnorm
---@return number  high xnorm
function mathlib_LuaVec3:xnormsSphereWithLine(radius, a, b) end

--- Returns x and y.
---Source: lua/common/mathlib.lua:77
---@return number  x
---@return number  y
function mathlib_LuaVec3:xy() end

--- Returns the three components.
---Source: lua/common/mathlib.lua:73
---@return number  x
---@return number  y
---@return number  z
function mathlib_LuaVec3:xyz() end

--- Copy with z = 0 (projection onto the XY plane).
---Source: lua/common/mathlib.lua:165
---@return vec3  vector (x, y, 0)
function mathlib_LuaVec3:z0() end

--- Single object (returned by push3) that operates on the static vec3 stack. The operators modify the top of the stack and return the same object; the terminal methods (xyz, copy, dot, length, squaredLength, distance, squaredDistance, __tostring) pop and return a result. See module notes.
---@class mathlib_StackVec3
local mathlib_StackVec3 = {}

--- Pops b (read via :xyz()) and adds it to the top.
---Source: lua/common/mathlib.lua:778
---@param a StackVec3 stack
---@param b vec3|StackVec3 operand
---@return StackVec3  stack
function mathlib_StackVec3.__add(a, b) end

--- Divides the top by a number.
---Source: lua/common/mathlib.lua:805
---@param a StackVec3 stack
---@param b number divisor
---@return StackVec3  stack
function mathlib_StackVec3.__div(a, b) end

--- Multiplies the top by a number (on the left or right).
---Source: lua/common/mathlib.lua:798
---@param a StackVec3|number operand
---@param b StackVec3|number operand
---@return StackVec3  stack
function mathlib_StackVec3.__mul(a, b) end

--- Subtracts b from the top.
---Source: lua/common/mathlib.lua:785
---@param a StackVec3 stack
---@param b vec3|StackVec3 operand
---@return StackVec3  stack
function mathlib_StackVec3.__sub(a, b) end

--- Pops and returns 'push3(...)'.
---Source: lua/common/mathlib.lua:772
---@return string  text
function mathlib_StackVec3:__tostring() end

--- Opposite of the top.
---Source: lua/common/mathlib.lua:792
---@param a StackVec3 stack
---@return StackVec3  stack
function mathlib_StackVec3.__unm(a) end

--- Pops and returns a normal vec3.
---Source: lua/common/mathlib.lua:766
---@return vec3  copy
function mathlib_StackVec3:copy() end

--- Cross product top x b; the result stays on the stack.
---Source: lua/common/mathlib.lua:819
---@param b vec3|StackVec3 other vector
---@return StackVec3  stack
function mathlib_StackVec3:cross(b) end

--- Distance between the top (popped) and a.
---Source: lua/common/mathlib.lua:862
---@param a vec3|StackVec3 other point
---@return number  distance
function mathlib_StackVec3:distance(a) end

--- Dot product top · a (pops).
---Source: lua/common/mathlib.lua:812
---@param a vec3|StackVec3 other vector
---@return number  result
function mathlib_StackVec3:dot(a) end

--- Norm of the top (pops).
---Source: lua/common/mathlib.lua:832
---@return number  length
function mathlib_StackVec3:length() end

--- Normalizes the top (stays on the stack).
---Source: lua/common/mathlib.lua:846
---@return StackVec3  stack
function mathlib_StackVec3:normalized() end

--- Gives the top the length m (stays on the stack).
---Source: lua/common/mathlib.lua:854
---@param m number length
---@return StackVec3  stack
function mathlib_StackVec3:resized(m) end

--- Distance² between the top (popped) and a.
---Source: lua/common/mathlib.lua:870
---@param a vec3|StackVec3 other point
---@return number  distance²
function mathlib_StackVec3:squaredDistance(a) end

--- Norm² of the top (pops).
---Source: lua/common/mathlib.lua:839
---@return number  length²
function mathlib_StackVec3:squaredLength() end

--- Pops and returns x, y, z.
---Source: lua/common/mathlib.lua:760
---@return number  x
---@return number  y
---@return number  z
function mathlib_StackVec3:xyz() end

--- Sets z of the top to 0.
---Source: lua/common/mathlib.lua:827
---@return StackVec3  stack
function mathlib_StackVec3:z0() end

--- Squared distance between a point and an oriented box (0 if the point is inside).
---Source: lua/common/mathlib.lua:1426
---@param c1 vec3 center
---@param x1 vec3 x half-axis
---@param y1 vec3 y half-axis
---@param z1 vec3 z half-axis
---@param p vec3 point
---@return number  squared distance
function OBBsquaredDistance(c1, x1, y1, z1, p) end

--- Signed altitude of the highest point of the oriented box relative to the plane: dot(c1 - plpos, pln) + sum of |dot(axis, pln)|.
---Source: lua/common/mathlib.lua:1476
---@param c1 vec3 center
---@param x1 vec3 x half-axis
---@param y1 vec3 y half-axis
---@param z1 vec3 z half-axis
---@param plpos vec3 plane point
---@param pln vec3 plane normal
---@return number  max altitude of the box above the plane
function altitudeOBB_Plane(c1, x1, y1, z1, plpos, pln) end

--- Piecewise quadratic spline that does NOT pass through the points: smooths the signal. t in [0,1] between p1 and p2.
---Source: lua/common/mathlib.lua:1388
---@param p0 number|vec3 previous
---@param p1 number|vec3 start
---@param p2 number|vec3 end
---@param p3 number|vec3 next
---@param t number parameter [0,1]
---@return number|vec3  smoothed point
function biQuadratic(p0, p1, p2, p3, t) end

--- Bias function _anon(x + xk)/(1 + xk): distorts x in [0,1]; k > 0 raises the curve.
---Source: lua/common/mathlib.lua:1277
---@param x number input in [0,1]
---@param k number intensity
---@return number  distorted value
function biasFun(x, k) end

--- Two-parameter bias/gain function _anon(arXiv 2010.09714): passes through (t, t); s sets the slope at the pivot point. Curve viewable on desmos (link in the code).
---Source: lua/common/mathlib.lua:1285
---@param x number input in [0,1]
---@param t number|nil pivot, default 0.5
---@param s number|nil slope, default 0.25
---@return number  value in [0,1]
function biasGainFun(x, t, s) end

--- Smooth 'bump' function: rises from leftY to peakY around peakLeftX then falls back to rightY around peakRightX (two sigmoid1 sigmoids).
---Source: lua/common/mathlib.lua:1300
---@param x number input
---@param peakLeftX number x of the rising edge
---@param peakRightX number x of the falling edge
---@param leftSlope number|nil parameter a of the left edge, default 1
---@param rightSlope number|nil parameter a of the right edge, default 1
---@param leftY number|nil value on the left, default 0
---@param peakY number|nil value at the peak, default 1
---@param rightY number|nil value on the right, default 0
---@param roundness number|nil edge steepness, default 10
---@return number  value
function bumpFun(x, peakLeftX, peakRightX, leftSlope, rightSlope, leftY, peakY, rightY, roundness) end

--- Polynomial bump with bounded support centered on peakX, with distinct widths and curvature factors on the left and right. Equals baseY outside [peakX-leftWidth, peakX+rightWidth].
---Source: lua/common/mathlib.lua:1306
---@param x number input
---@param peakX number peak position
---@param leftWidth number left half-width
---@param rightWidth number right half-width
---@param leftC number left-side shape factor
---@param rightC number right-side shape factor
---@param baseY number|nil base value, default 0
---@param peakY number|nil value at the peak, default 1
---@return number  value
function bumpPFun(x, peakX, leftWidth, rightWidth, leftC, rightC, baseY, peakY) end

--- Cardinal spline between p1 and p2 (p0 and p3 are the neighbors). Works with numbers or vec3. d1, d2, d3 are the parametrization lengths of the three intervals (1 by default = uniform).
---Source: lua/common/mathlib.lua:1337
---@param p0 number|vec3 previous point
---@param p1 number|vec3 start of the interval
---@param p2 number|vec3 end of the interval
---@param p3 number|vec3 next point
---@param t number parameter in [0,1] between p1 and p2
---@param s number|nil tension, default 0.5
---@param d1 number|nil length of interval p0-p1, default 1
---@param d2 number|nil length p1-p2, default 1
---@param d3 number|nil length p2-p3, default 1
---@return number|vec3  interpolated point
function cardinalSpline(p0, p1, p2, p3, t, s, d1, d2, d3) end

--- Uniform Catmull-Rom (cardinalSpline with d1=d2=d3=1). Each component is independent, no distance needed.
---Source: lua/common/mathlib.lua:1349
---@param p0 number|vec3 previous
---@param p1 number|vec3 start
---@param p2 number|vec3 end
---@param p3 number|vec3 next
---@param t number parameter [0,1]
---@param s number|nil tension, default 0.5
---@return number|vec3  point
function catmullRom(p0, p1, p2, p3, t, s) end

--- Centripetal Catmull-Rom (square-root distances): the most stable, with no loops or self-intersections. Requires vec3.
---Source: lua/common/mathlib.lua:1358
---@param p0 vec3 previous
---@param p1 vec3 start
---@param p2 vec3 end
---@param p3 vec3 next
---@param t number parameter [0,1]
---@param s number|nil tension, default 0.5
---@return vec3  point
function catmullRomCentripetal(p0, p1, p2, p3, t, s) end

--- Chordal Catmull-Rom: parametrization by the distances between points (requires vec3: calls :distance).
---Source: lua/common/mathlib.lua:1353
---@param p0 vec3 previous
---@param p1 vec3 start
---@param p2 vec3 end
---@param p3 vec3 next
---@param t number parameter [0,1]
---@param s number|nil tension, default 0.5
---@return vec3  point
function catmullRomChordal(p0, p1, p2, p3, t, s) end

--- Clamps x to [minValue, maxValue]: min(max(x, minValue), maxValue). Returns minValue if x is NaN.
---Source: lua/common/mathlib.lua:1202
---@param x number value
---@param minValue number lower bound
---@param maxValue number upper bound
---@return number  clamped value
function clamp(x, minValue, maxValue) end

--- Like closestLinePointsPointVec but the lines are given by two points each.
---Source: lua/common/mathlib.lua:699
---@param l1p1 vec3 start of line 1
---@param l1p2 vec3 end of line 1
---@param l2p1 vec3 start of line 2
---@param l2p2 vec3 end of line 2
---@return number  xnorm on line 1
---@return number  xnorm on line 2
function closestLinePoints(l1p1, l1p2, l2p1, l2p2) end

--- Closest points of two infinite lines defined by point + direction vector. Returns the normalized abscissas (xnorm) on each line; handles parallel and degenerate cases.
---Source: lua/common/mathlib.lua:680
---@param l1p vec3 point of line 1
---@param l1Vec vec3 vector of line 1
---@param l2p vec3 point of line 2
---@param l2Vec vec3 vector of line 2
---@return number  xnorm on line 1 (point = l1p + l1Vec*xnorm)
---@return number  xnorm on line 2
function closestLinePointsPointVec(l1p, l1Vec, l2p, l2Vec) end

--- Normalized abscissas (clamped to [0,1]) of the closest points between two segments.
---Source: lua/common/mathlib.lua:706
---@param l1p1 vec3 start of segment 1
---@param l1p2 vec3 end of segment 1
---@param l2p1 vec3 start of segment 2
---@param l2p2 vec3 end of segment 2
---@return number  xnorm in [0,1] on segment 1
---@return number  xnorm in [0,1] on segment 2
function closestLineSegmentPoints(l1p1, l1p2, l2p1, l2p2) end

--- Rational conic Bézier (weight w on the control point): can represent hyperbolas, parabolas, ellipses, circles.
---Source: lua/common/mathlib.lua:1379
---@param p1 number|vec3 start
---@param p2 number|vec3 control point
---@param p3 number|vec3 end
---@param t number parameter [0,1]
---@param w number|nil weight, default 1 (parabola)
---@return number|vec3  point
function conicBezier(p1, p2, p3, t, w) end

--- True if p is inside the cylinder (without rounded ends) of axis cposa-cposb and radius cR. The name contains a typo in the game code.
---Source: lua/common/mathlib.lua:1471
---@param cposa vec3 center of base A
---@param cposb vec3 center of base B
---@param cR number radius
---@param p vec3 point
---@return boolean  contained
function constainsCylinder_Point(cposa, cposb, cR, p) end

--- True if the point p is inside the ellipsoid of center c1 and half-axes x1, y1, z1.
---Source: lua/common/mathlib.lua:1462
---@param c1 vec3 center
---@param x1 vec3 x half-axis
---@param y1 vec3 y half-axis
---@param z1 vec3 z half-axis
---@param p vec3 point
---@return boolean  contained
function containsEllipsoid_Point(c1, x1, y1, z1, p) end

--- True if box 2 is entirely contained in box 1.
---Source: lua/common/mathlib.lua:1419
---@param c1 vec3 bounding box center
---@param x1 vec3 x half-axis
---@param y1 vec3 y half-axis
---@param z1 vec3 z half-axis
---@param c2 vec3 contained box center
---@param x2 vec3 x half-axis
---@param y2 vec3 y half-axis
---@param z2 vec3 z half-axis
---@return boolean  contained
function containsOBB_OBB(c1, x1, y1, z1, c2, x2, y2, z2) end

--- True if the sphere is entirely inside the oriented box.
---Source: lua/common/mathlib.lua:1444
---@param c1 vec3 box center
---@param x1 vec3 x half-axis
---@param y1 vec3 y half-axis
---@param z1 vec3 z half-axis
---@param c2 vec3 sphere center
---@param r2 number sphere radius
---@return boolean  contained
function containsOBB_Sphere(c1, x1, y1, z1, c2, r2) end

--- True if the point p is inside the oriented box.
---Source: lua/common/mathlib.lua:1457
---@param c1 vec3 center
---@param x1 vec3 x half-axis
---@param y1 vec3 y half-axis
---@param z1 vec3 z half-axis
---@param p vec3 point
---@return boolean  contained
function containsOBB_point(c1, x1, y1, z1, p) end

--- True if the oriented box (c2, x2, y2, z2) is entirely inside the sphere (c1, r1): tests its 8 corners.
---Source: lua/common/mathlib.lua:1450
---@param c1 vec3 sphere center
---@param r1 number sphere radius
---@param c2 vec3 box center
---@param x2 vec3 x half-axis
---@param y2 vec3 y half-axis
---@param z2 vec3 z half-axis
---@return boolean  box contained in the sphere
function containsSphere_OBB(c1, r1, c2, x2, y2, z2) end

--- Next value of the 1D blue noise sequence: fractPart(x + 0.618...).
---Source: lua/common/mathlib.lua:564
---@param x number previous value
---@return number  value in [0,1)
function getBlueNoise1d(x) end

--- Returns the next temporary vec3 of the pool `t` (creates it if needed) and increments t[0]. `t` must be initialized with t[0] = 0 at module level.
---Source: lua/common/mathlib.lua:728
---@param t table pool, with t[0] = counter
---@return vec3  reusable temporary vector
function getTmpVec3(t) end

--- Avoids exact zero (branchless computation): returns 1/clamp(1/x, -1e300, 1e300), i.e. x except for 0, which becomes ~1e-300 of the same sign.
---Source: lua/common/mathlib.lua:1197
---@param x number value
---@return number  never-zero value
function guardZero(x) end

--- Deterministic blue noise: fractPart(i * 0.618...) (golden ratio sequence), well distributed over [0,1).
---Source: lua/common/mathlib.lua:559
---@param i number index
---@return number  value in [0,1)
function indexedBlueNoise(i) end

--- Ray / capsule intersection (from iquilezles.org/articles/intersectors). Returns the first hit (negative if behind the origin), math.huge otherwise.
---Source: lua/common/mathlib.lua:1539
---@param rpos vec3 origin
---@param rdir vec3 normalized direction
---@param cposa vec3 end A
---@param cposb vec3 end B
---@param cR number radius
---@return number  distance of the first hit or math.huge
function intersectsRay_Capsule(rpos, rdir, cposa, cposb, cR) end

--- Ray / finite cylinder intersection with axis cposa-cposb, radius cR. Returns (minhit, maxhit), minhit = math.huge with no hit.
---Source: lua/common/mathlib.lua:1524
---@param rpos vec3 origin
---@param rdir vec3 direction
---@param cposa vec3 base A
---@param cposb vec3 base B
---@param cR number radius
---@return number  minhit
---@return number  maxhit
function intersectsRay_Cylinder(rpos, rdir, cposa, cposb, cR) end

--- Ray / ellipsoid intersection (center c1, half-axes x1, y1, z1). Returns (smallest, largest) root, or (math.huge, math.huge) with no hit.
---Source: lua/common/mathlib.lua:1510
---@param rpos vec3 origin
---@param rdir vec3 direction
---@param c1 vec3 center
---@param x1 vec3 x half-axis
---@param y1 vec3 y half-axis
---@param z1 vec3 z half-axis
---@return number  entry t
---@return number  exit t
function intersectsRay_Ellipsoid(rpos, rdir, c1, x1, y1, z1) end

--- Ray / oriented box intersection. Returns (minhit, maxhit); minhit = math.huge if there is no hit. Hit if minhit < maxhit and maxhit > 0; ray inside if minhit < 0 and maxhit > 0.
---Source: lua/common/mathlib.lua:1488
---@param rpos vec3 origin
---@param rdir vec3 direction
---@param c1 vec3 center
---@param x1 vec3 x half-axis
---@param y1 vec3 y half-axis
---@param z1 vec3 z half-axis
---@return number  minhit (entry) or math.huge
---@return number  maxhit (exit)
function intersectsRay_OBB(rpos, rdir, c1, x1, y1, z1) end

--- Signed distance (in multiples of rdir) of the ray's intersection point with the plane. Negative if the plane is behind the origin; math.huge if the ray is parallel.
---Source: lua/common/mathlib.lua:1482
---@param rpos vec3 ray origin
---@param rdir vec3 ray direction
---@param plpos vec3 plane point
---@param pln vec3 plane normal
---@return number  parameter t, point = rpos + rdir*t
function intersectsRay_Plane(rpos, rdir, plpos, pln) end

--- Ray / sphere intersection. Returns (entry, exit) as a distance along rdir (assumed normalized), or (math.huge, math.huge) with no hit.
---Source: lua/common/mathlib.lua:1501
---@param rpos vec3 origin
---@param rdir vec3 normalized direction
---@param cpos vec3 center
---@param cr number radius
---@return number  entry distance
---@return number  exit distance
function intersectsRay_Sphere(rpos, rdir, cpos, cr) end

--- Ray / triangle intersection. Returns the hit distance and two barycentric coordinates; with no hit returns math.huge, -1, -1. Note: only hits whose computed parameter is <= 0 are accepted, the returned distance is its opposite.
---Source: lua/common/mathlib.lua:1557
---@param rpos vec3 origin
---@param rdir vec3 direction
---@param a vec3 vertex a
---@param b vec3 vertex b
---@param c vec3 vertex c
---@return number  distance or math.huge
---@return number  barycentric u (weight of a)
---@return number  barycentric v (weight of b)
function intersectsRay_Triangle(rpos, rdir, a, b, c) end

--- Fraction t such that lerp(from, to, t) = value; returns 0 if from and to are (nearly) equal.
---Source: lua/common/mathlib.lua:1248
---@param from number start
---@param to number end
---@param value number value
---@return number  fraction (unclamped)
function inverseLerp(from, to, value) end

--- True if abs(a) == math.huge.
---Source: lua/common/mathlib.lua:1223
---@param a number value
---@return boolean  is infinite
function isinf(a) end

--- True if a is NaN (a ~= a).
---Source: lua/common/mathlib.lua:1219
---@param a number value
---@return boolean  is NaN
function isnan(a) end

--- True if a is NaN or infinite (a*0 ~= 0).
---Source: lua/common/mathlib.lua:1227
---@param a number value
---@return boolean  NaN or infinite
function isnaninf(a) end

--- Linear interpolation from + (to - from) * t. Also works with vec3/quat (via the operators) thanks to the monotone formula.
---Source: lua/common/mathlib.lua:1244
---@param from number|vec3 value at t=0
---@param to number|vec3 value at t=1
---@param t number fraction (unclamped)
---@return number|vec3  interpolated value
function lerp(from, to, t) end

--- 2D bounding box of a segment, expanded by radius (0 by default).
---Source: lua/common/mathlib.lua:1330
---@param x1 number start x
---@param y1 number start y
---@param x2 number end x
---@param y2 number end y
---@param radius number|nil expansion
---@return number  xmin
---@return number  ymin
---@return number  xmax
---@return number  ymax
function lineBB2d(x1, y1, x2, y2, radius) end

--- Point p0 + (p1 - p0) * xnorm (linear interpolation between two vec3, without clamping).
---Source: lua/common/mathlib.lua:721
---@param p0 vec3 start
---@param p1 vec3 end
---@param xnorm number normalized abscissa
---@return vec3  new point
function linePointFromXnorm(p0, p1, xnorm) end

--- Remaps v from [minValue, maxValue] to [minOutput, maxOutput] CLAMPING the fraction to [0,1] (the output stays within the output range).
---Source: lua/common/mathlib.lua:1236
---@param v number value
---@param minValue number low input
---@param maxValue number high input
---@param minOutput number output for minValue
---@param maxOutput number output for maxValue
---@return number  remapped and clamped value
function linearScale(v, minValue, maxValue, minOutput, maxOutput) end

--- Median of three numbers.
---Source: lua/common/mathlib.lua:1314
---@param a number a
---@param b number b
---@param c number c
---@return number  median
function median3(a, b, c) end

--- Average of the two middle values of four numbers.
---Source: lua/common/mathlib.lua:1318
---@param a number a
---@param b number b
---@param c number c
---@param d number d
---@return number  median
function median4(a, b, c, d) end

--- Median of five numbers.
---Source: lua/common/mathlib.lua:1322
---@param a number a
---@param b number b
---@param c number c
---@param d number d
---@param e number e
---@return number  median
function median5(a, b, c, d, e) end

--- Steffen monotone 2D interpolation between (x1,y1) and (x2,y2) using the neighbors (x0,y0) and (x3,y3) for the slopes.
---Source: lua/common/mathlib.lua:1363
---@param y0 number y of point 0
---@param y1 number y of point 1
---@param y2 number y of point 2
---@param y3 number y of point 3
---@param x0 number x of point 0
---@param x1 number x of point 1
---@param x2 number x of point 2
---@param x3 number x of point 3
---@param x number abscissa to evaluate (between x1 and x2)
---@return number  interpolated y
function monotonicSteffen(y0, y1, y2, y3, x0, x1, x2, x3, x) end

--- Returns x if it is not NaN, otherwise raises error('NaN found'). Useful for tracing the origin of a NaN.
---Source: lua/common/mathlib.lua:1231
---@param x number value
---@return number  x
function nanError(x) end

--- Overlap test between two oriented boxes (SAT on 15 axes). Each box = center + three half-axes.
---Source: lua/common/mathlib.lua:1405
---@param c1 vec3 center of box 1
---@param x1 vec3 x half-axis of box 1
---@param y1 vec3 y half-axis of box 1
---@param z1 vec3 z half-axis of box 1
---@param c2 vec3 center of box 2
---@param x2 vec3 x half-axis of box 2
---@param y2 vec3 y half-axis of box 2
---@param z2 vec3 z half-axis of box 2
---@return boolean  true if the boxes touch or overlap
function overlapsOBB_OBB(c1, x1, y1, z1, c2, x2, y2, z2) end

--- True if an oriented box intersects a plane (point + normal).
---Source: lua/common/mathlib.lua:1439
---@param c1 vec3 box center
---@param x1 vec3 x half-axis
---@param y1 vec3 y half-axis
---@param z1 vec3 z half-axis
---@param plpos vec3 plane point
---@param pln vec3 plane normal
---@return boolean  intersection
function overlapsOBB_Plane(c1, x1, y1, z1, plpos, pln) end

--- True if an oriented box and a sphere overlap.
---Source: lua/common/mathlib.lua:1435
---@param c1 vec3 box center
---@param x1 vec3 x half-axis
---@param y1 vec3 y half-axis
---@param z1 vec3 z half-axis
---@param c2 vec3 sphere center
---@param r2 number sphere radius
---@return boolean  overlap
function overlapsOBB_Sphere(c1, x1, y1, z1, c2, r2) end

--- 2D bounding box of a point expanded by radius.
---Source: lua/common/mathlib.lua:1326
---@param x number x
---@param y number y
---@param radius number radius
---@return number  xmin
---@return number  ymin
---@return number  xmax
---@return number  ymax
function pointBB2d(x, y, radius) end

--- Pushes a vec3 (or x, y, z) onto the static stack of 100 vec3 and returns the StackVec3 object (always the same). Used to chain operations without allocation. See module notes.
---Source: lua/common/mathlib.lua:749
---@param x number|vec3 x component or source vec3 / StackVec3 (read via :xyz())
---@param y number|nil y component
---@param z number|nil z component
---@return StackVec3  single stack object
function push3(x, y, z) end

--- Quadratic Bézier curve (p1, p2 control point, p3). Works with numbers or vec3.
---Source: lua/common/mathlib.lua:1373
---@param p1 number|vec3 start
---@param p2 number|vec3 control point
---@param p3 number|vec3 end
---@param t number parameter [0,1]
---@return number|vec3  point
function quadraticBezier(p1, p2, p3, t) end

--- quat constructor (x, y, z, w). Accepts four numbers, a table {x,y,z,w} or {1,2,3,4}, or a quat to copy. With no argument see notes (value (1,0,0,0)). T3d quats use -w.
---Source: lua/common/mathlib.lua:893
---@param x number|table|quat|nil x component or source
---@param y number|nil y component
---@param z number|nil z component
---@param w number|nil w component
---@return quat  new quaternion
function quat(x, y, z, w) end

--- Rotation quaternion of angle angleRad around the axis (the axis must be normalized).
---Source: lua/common/mathlib.lua:1165
---@param axle vec3 normalized rotation axis
---@param angleRad number angle in radians
---@return quat  quaternion
function quatFromAxisAngle(axle, angleRad) end

--- Builds a quat orienting the local +Y axis toward `dir`, with `up` as the up direction (world Z by default). If dir and up are nearly collinear, dir is slightly perturbed.
---Source: lua/common/mathlib.lua:1159
---@param dir vec3 forward direction (normalized internally)
---@param up vec3|nil up direction, default (0,0,1)
---@return quat  normalized orientation
function quatFromDir(dir, up) end

--- Quaternion from Euler angles in radians (code formula: sin/cos combination of the half-angles x, y, z).
---Source: lua/common/mathlib.lua:1171
---@param x number angle around x (rad)
---@param y number angle around y (rad)
---@param z number angle around z (rad)
---@return quat  quaternion
function quatFromEuler(x, y, z) end

--- Sum of three math.random(): rough pseudo-Gaussian (the code comment says [0..3]).
---Source: lua/common/mathlib.lua:670
---@return number  value in [0,3]
function randomGauss3() end

--- Deterministic pseudo-random generator: transforms v into a number in (0,1] (modulo 4294967291). Call by feeding the output value back in.
---Source: lua/common/mathlib.lua:675
---@param v number previous state in [0,1]
---@return number  new state in (0,1]
function randomState(v) end

--- Like linearScale but WITHOUT clamping (extrapolates outside the range).
---Source: lua/common/mathlib.lua:1240
---@param v number value
---@param minValue number low input
---@param maxValue number high input
---@param minOutput number output for minValue
---@param maxOutput number output for maxValue
---@return number  remapped value
function rescale(v, minValue, maxValue, minOutput, maxOutput) end

--- Resets the pool counter to 0 (to be called at the start of updateGFX or equivalent). Returns the old counter value.
---Source: lua/common/mathlib.lua:736
---@param t table getTmpVec3 pool
---@return integer  number of vec3 used before reset
function resetTmpVec3(t) end

--- Rounds to the nearest integer: floor(a + 0.5) (.5 goes up, including for negatives).
---Source: lua/common/mathlib.lua:1210
---@param a number value
---@return number  integer (as a Lua number)
function round(a) end

--- Rounds x to the nearest multiple of m. To round to the N-th decimal: roundNear(x, 1e-N).
---Source: lua/common/mathlib.lua:1215
---@param x number value
---@param m number rounding step
---@return number  rounded value
function roundNear(x, m) end

--- Rational sigmoid x / (a + |x|), symmetric around 0, tending to ±1.
---Source: lua/common/mathlib.lua:1296
---@param x number input
---@param a number|nil inverse steepness, default 1
---@return number  value in (-1,1)
function sigmoid1(x, a) end

--- Sign: -1, 0 or 1. Also exposed under the global name fsign.
---Source: lua/common/mathlib.lua:1185
---@param x number value
---@return number  -1, 0 or 1
function sign(x) end

--- Sign without zero: -1 or 1 (0 gives 1; NaN not handled explicitly).
---Source: lua/common/mathlib.lua:1180
---@param x number value
---@return number  -1 or 1
function sign2(x) end

--- Returns sign(s) * abs(v).
---Source: lua/common/mathlib.lua:1192
---@param s number value whose sign is taken
---@param v number value whose absolute value is taken
---@return number  sign(s)*abs(v)
function signApply(s, v) end

--- Perlin curve 6x⁵-15x⁴+10x³, result clamped to [0,1].
---Source: lua/common/mathlib.lua:1258
---@param x number input
---@return number  value in [0,1]
function smootherstep(x) end

--- Degree-7 polynomial (35x⁴-84x⁵+70x⁶-20x⁷) with x clamped to [0,1].
---Source: lua/common/mathlib.lua:1262
---@param x number input
---@return number  value in [0,1]
function smootheststep(x) end

--- Smooth maximum = smoothmin(a, b, -k). k has no default here.
---Source: lua/common/mathlib.lua:1273
---@param a number value a
---@param b number value b
---@param k number smoothing width (required)
---@return number  smooth maximum
function smoothmax(a, b, k) end

--- Smooth minimum of a and b over a width k (default 0.1).
---Source: lua/common/mathlib.lua:1267
---@param a number value a
---@param b number value b
---@param k number|nil smoothing width, default 0.1
---@return number  smooth minimum
function smoothmin(a, b, k) end

--- Curve 3x²-2x³ with x clamped to [0,1].
---Source: lua/common/mathlib.lua:1253
---@param x number input
---@return number  value in [0,1]
function smoothstep(x) end

--- a * a.
---Source: lua/common/mathlib.lua:1206
---@param a number value
---@return number  square
function square(a) end

--- vec3 constructor. With no argument: (0,0,0). With a table: accepts {x=,y=,z=} or {1,2,3}, or another vec3 (copy). With x and y: z defaults to 0.
---Source: lua/common/mathlib.lua:49
---@param x number|table|vec3|nil x component, or source table / vec3
---@param y number|nil y component
---@param z number|nil z component (0 if omitted)
---@return vec3  new vector
function vec3(x, y, z) end

---@type any
fsign = nil
---@type number
i = nil
---@type any
vec3toString = nil
