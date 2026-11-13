---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/pieces.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_trackBuilder_pieces` : `extensions.load("util_trackBuilder_pieces")`, puis la globale `util_trackBuilder_pieces`
---@class util_trackBuilder_pieces
---@field splineTrack any
util_trackBuilder_pieces = {}

---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:118
---@param radius any
---@param angle any
---@param direction any
---@param hardness any
---@param radiusMult any
function util_trackBuilder_pieces.bezierCurve(radius, angle, direction, hardness, radiusMult) end

--- creates a track fo specified length. direction allows for turning in 60?-steps
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:142
---@param radius any
---@param angle any
---@param direction any
---@param hardness any
---@param radiusMult any
function util_trackBuilder_pieces.curve(radius, angle, direction, hardness, radiusMult) end

---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:193
---@param xOff any
---@param yOff any
---@param dirOff any
---@param forwardLen any
---@param backwardLen any
---@param isHex any
---@param absolute any
---@param empty any
function util_trackBuilder_pieces.customBezier(xOff, yOff, dirOff, forwardLen, backwardLen, isHex, absolute, empty) end

---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:510
---@param xOff any
---@param yOff any
---@param zOff any
---@param dirOff any
---@param absolute any
---@param isHex any
function util_trackBuilder_pieces.emptyOffset(xOff, yOff, zOff, dirOff, absolute, isHex) end

--- creates a hexForward piece of the specified length.
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:101
---@param length any
function util_trackBuilder_pieces.forward(length) end

---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:314
---@param size any
---@param inside any
---@param dir any
---@param angle any
function util_trackBuilder_pieces.freeSpiral(size, inside, dir, angle) end

--- helper function for the hexLoop calculation. returns point from an euler hexSpiral.
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:375
---@param d any
function util_trackBuilder_pieces.fresnelSC(d) end

---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:87
---@param hdg any
function util_trackBuilder_pieces.getHdgVector(hdg) end

--- this creates a hexSpiral piece, leading into a hexCurve.
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:249
---@param size any
---@param inside any
---@param dir any
function util_trackBuilder_pieces.hexSpiral(size, inside, dir) end

--- Hex Pieces
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:91
---@param p any
function util_trackBuilder_pieces.initialTrackPiece(p) end

--- creates a hexLooping.
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:403
---@param xOffset any
---@param radius any
---@param isHex any
function util_trackBuilder_pieces.loop(xOffset, radius, isHex) end

--- this creates an S-hexCurve of specified length and offset to the left or right.
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:165
---@param length any
---@param xOffset any
---@param hardness any
---@param isHex any
function util_trackBuilder_pieces.offsetCurve(length, xOffset, hardness, isHex) end

--- helper function to rotate a vector by a quat.
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:539
---@param v any
---@param q any
function util_trackBuilder_pieces.rotateVectorByQuat(v, q) end

--- this creates a hexSpiral piece, leading into a hexCurve.
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:282
---@param size any
---@param inside any
---@param dir any
function util_trackBuilder_pieces.squareSpiral(size, inside, dir) end

---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:12
---@param piece any
---@param tip any
function util_trackBuilder_pieces.toSegment(piece, tip) end

