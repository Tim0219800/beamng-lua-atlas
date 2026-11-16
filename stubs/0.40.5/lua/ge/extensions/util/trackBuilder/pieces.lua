---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/pieces.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Geometric catalog of the Track Builder "pieces" (hex, square, free). Each function receives a piece's parameters and returns, from the previous piece (the 'tipPiece' stored by toSegment), a table describing the new end: position, origin, hdg (heading in radians), polyMult (point density) and pointsType ('bezier', 'arc' or 'custom'), with control points (controlPointA/B), radius/angle or custom points. toSegment is the entry point: it chooses the function according to piece.piece (init, hexForward, hexCurve, freeBezier, hexLoop, etc.).
--- Access: extension `util_trackBuilder_pieces`: `extensions.load("util_trackBuilder_pieces")`, then the global `util_trackBuilder_pieces`
---@class util_trackBuilder_pieces
---@field splineTrack table|nil Reference to the splineTrack module, nil in this file; must provide getTrackPosition() for absolute-positioned pieces.
util_trackBuilder_pieces = {}

--- Bézier curve approximating an arc (constant 0.5523); hardness changes the length of the tangents (negative: reduces, positive: increases).
---Source: lua/ge/extensions/util/trackBuilder/pieces.lua:118
---@param radius number Base radius.
---@param angle number Turn angle (rad).
---@param direction number Turn direction: 1 or -1.
---@param hardness number Curve hardness.
---@param radiusMult number Radius multiplier (sqrt(3) in hex, 1 otherwise).
---@return table  Piece of type 'bezier'.
function util_trackBuilder_pieces.bezierCurve(radius, angle, direction, hardness, radiusMult) end

--- Turn of given radius and angle. If hardness is non-zero, goes through bezierCurve; otherwise returns an arc ('arc') with radius, angle and direction.
---Source: lua/ge/extensions/util/trackBuilder/pieces.lua:142
---@param radius number Radius.
---@param angle number Angle (rad).
---@param direction number 1 or -1 (left/right).
---@param hardness number|nil Hardness; 0 or nil for a pure arc.
---@param radiusMult number Radius multiplier.
---@return table  Piece of type 'arc' or 'bezier'.
function util_trackBuilder_pieces.curve(radius, angle, direction, hardness, radiusMult) end

--- Free Bézier: offset (xOff, yOff), heading change dirOff and forward/backward tangent lengths. In absolute mode, the offset is computed from the current position of the track cursor (splineTrack.getTrackPosition()). Also returns local and global positions/headings.
---Source: lua/ge/extensions/util/trackBuilder/pieces.lua:193
---@param xOff number Lateral offset.
---@param yOff number Forward offset.
---@param dirOff number Heading change (rad).
---@param forwardLen number Length of the start tangent.
---@param backwardLen number Length of the end tangent.
---@param isHex boolean Hexagonal grid.
---@param absolute boolean|nil Position relative to the track cursor rather than to the last piece.
---@param empty boolean|nil If true, no geometry is generated (noPoints).
---@return table  Piece of type 'bezier' (with globalPosition, localPosition, globalHdg, localHdg).
function util_trackBuilder_pieces.customBezier(xOff, yOff, dirOff, forwardLen, backwardLen, isHex, absolute, empty) end

--- Moves the track cursor without generating geometry (noPoints). Can also change the heading (dirOff in steps of pi/3 in hex, pi/2 otherwise) and the height (zOff).
---Source: lua/ge/extensions/util/trackBuilder/pieces.lua:510
---@param xOff number Lateral offset.
---@param yOff number Forward offset.
---@param zOff number Vertical offset.
---@param dirOff number Number of rotation steps.
---@param absolute boolean|nil Starts from the position of the track cursor.
---@param isHex boolean Hexagonal grid.
---@return table  Empty piece.
function util_trackBuilder_pieces.emptyOffset(xOff, yOff, zOff, dirOff, absolute, isHex) end

--- Straight line of the given length in the direction of the tipPiece (control points at 25% of the length).
---Source: lua/ge/extensions/util/trackBuilder/pieces.lua:101
---@param length number Length in meters.
---@return table  Piece of type 'bezier'.
function util_trackBuilder_pieces.forward(length) end

--- Free-angle spiral; the tangent lengths are chosen in 15° increments up to 75°.
---Source: lua/ge/extensions/util/trackBuilder/pieces.lua:314
---@param size number Size.
---@param inside boolean Inward spiral.
---@param dir number Direction: 1 or -1.
---@param angle number Angle in radians (at most 75° = 1.309 rad, otherwise error).
---@return table  Piece of type 'bezier'.
function util_trackBuilder_pieces.freeSpiral(size, inside, dir, angle) end

--- Helper function for loops: numerically integrates the Euler spiral (clothoid, Fresnel integrals cos/sin(t²·pi/2)) from 0 to d.
---Source: lua/ge/extensions/util/trackBuilder/pieces.lua:375
---@param d number Upper integration bound.
---@return table  {x, y} of the clothoid point.
function util_trackBuilder_pieces.fresnelSC(d) end

--- Returns the horizontal unit vector of the heading: (sin hdg, cos hdg, 0).
---Source: lua/ge/extensions/util/trackBuilder/pieces.lua:87
---@param hdg number Heading in radians.
---@return vec3  Direction.
function util_trackBuilder_pieces.getHdgVector(hdg) end

--- Hexagonal spiral (60° turn) inward or outward, described by a Bézier.
---Source: lua/ge/extensions/util/trackBuilder/pieces.lua:249
---@param size number Spiral size.
---@param inside boolean Inward spiral.
---@param dir number Direction: 1 or -1.
---@return table  Piece of type 'bezier'.
function util_trackBuilder_pieces.hexSpiral(size, inside, dir) end

--- Initial piece: position (0,0,0) and heading 0 by default, with no points.
---Source: lua/ge/extensions/util/trackBuilder/pieces.lua:91
---@param p table|nil Optional table with position (vec3) and hdg (rad).
---@return table  Piece with noPoints = true.
function util_trackBuilder_pieces.initialTrackPiece(p) end

--- Vertical loop built with a clothoid, with lateral offset xOffset spread out as a gentle slope; returns up to 300 custom points (position, rot).
---Source: lua/ge/extensions/util/trackBuilder/pieces.lua:403
---@param xOffset number Lateral offset between entry and exit.
---@param radius number Radius (minimum 1).
---@param isHex boolean Hexagonal grid (offset × sqrt(3)).
---@return table  Piece of type 'custom' with customPoints.
function util_trackBuilder_pieces.loop(xOffset, radius, isHex) end

--- S-curve of given length offset laterally by xOffset; in hex, adds 0.5 to the length if xOffset is odd to stay on the triangular grid.
---Source: lua/ge/extensions/util/trackBuilder/pieces.lua:165
---@param length number Forward length.
---@param xOffset number Lateral offset (positive toward the right of the heading).
---@param hardness number|nil Hardness (0 by default).
---@param isHex boolean Hexagonal grid.
---@return table  Piece of type 'bezier'.
function util_trackBuilder_pieces.offsetCurve(length, xOffset, hardness, isHex) end

--- Helper function: returns q * v.
---Source: lua/ge/extensions/util/trackBuilder/pieces.lua:539
---@param v vec3 Vector.
---@param q quat Rotation.
---@return vec3  Rotated vector.
function util_trackBuilder_pieces.rotateVectorByQuat(v, q) end

--- Square spiral (90° turn), same principle as hexSpiral.
---Source: lua/ge/extensions/util/trackBuilder/pieces.lua:282
---@param size number Size.
---@param inside boolean Inward spiral.
---@param dir number Direction: 1 or -1.
---@return table  Piece of type 'bezier'.
function util_trackBuilder_pieces.squareSpiral(size, inside, dir) end

--- Converts the piece description into a segment table. Stores tip as the previous piece then delegates to initialTrackPiece, forward, curve, offsetCurve, customBezier, hexSpiral, squareSpiral, freeSpiral, loop or emptyOffset according to piece.piece. Returns nil if the type is unknown.
---Source: lua/ge/extensions/util/trackBuilder/pieces.lua:12
---@param piece table Piece description (field piece = type name, plus length, direction, hardness, radius, xOffset, xOff, yOff, zOff, dirOff, size, inside, angle, absolute, empty… depending on the type).
---@param tip table Previous piece (position, hdg).
---@return table|nil  Segment table.
function util_trackBuilder_pieces.toSegment(piece, tip) end

