# `util_trackBuilder_pieces`

*File: `lua/ge/extensions/util/trackBuilder/pieces.lua` · VM: Game Engine (GE) · 564 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_trackBuilder_pieces`: `extensions.load("util_trackBuilder_pieces")`, then the global `util_trackBuilder_pieces`

Geometric catalog of the Track Builder "pieces" (hex, square, free). Each function receives a piece's parameters and returns, from the previous piece (the 'tipPiece' stored by toSegment), a table describing the new end: position, origin, hdg (heading in radians), polyMult (point density) and pointsType ('bezier', 'arc' or 'custom'), with control points (controlPointA/B), radius/angle or custom points. toSegment is the entry point: it chooses the function according to piece.piece (init, hexForward, hexCurve, freeBezier, hexLoop, etc.).

## Example

```lua
local seg = util_trackBuilder_pieces.toSegment({piece = 'hexCurve', length = 4, direction = 1, hardness = 0}, tip)
```

## Notes

- The heading hdg is in radians; getHdgVector(hdg) = (sin hdg, cos hdg, 0): heading 0 points toward +Y.
- Hex scale: lateral offset multiplied by sqrt(3)/2; hex curves use radiusMult = sqrt(3), square 1. Hex angles are steps of pi/3, square pi/2, free in degrees (converted).
- toSegment stores tip in a local variable (tipPiece) used by all the other functions: they are usable only after a call to toSegment (unless tipPiece was set by a previous call).
- Probable bug: customBezier always calls M.splineTrack.getTrackPosition(), even without absolute, but M.splineTrack is nil in this file (the field must be set from outside by splineTrack); emptyOffset with absolute uses it too.
- Bug: freeSpiral leaves forwardCPLength and backwardCPLength as nil if angle > 75° (pi*75/180), which causes an arithmetic error.
- fresnelSC references an undefined global variable 'subs' (nil, no effect).
- emptyOffset with absolute modifies tipPiece.position and tipPiece.hdg (side effect).

## Functions

| Function | Description | Line |
|---|---|---|
| `util_trackBuilder_pieces.bezierCurve(radius, angle, direction, hardness, radiusMult)` | Bézier curve approximating an arc (constant 0.5523); hardness changes the length of the tangents (negative: reduces, positive: increases). | 118 |
| `util_trackBuilder_pieces.curve(radius, angle, direction, hardness, radiusMult)` | Turn of given radius and angle. If hardness is non-zero, goes through bezierCurve; otherwise returns an arc ('arc') with radius, angle and direction. | 142 |
| `util_trackBuilder_pieces.customBezier(xOff, yOff, dirOff, forwardLen, backwardLen, isHex, absolute, empty)` | Free Bézier: offset (xOff, yOff), heading change dirOff and forward/backward tangent lengths. In absolute mode, the offset is computed from the current position of the track cursor (splineTrack.getTrackPosition()). Also returns local and global positions/headings. | 193 |
| `util_trackBuilder_pieces.emptyOffset(xOff, yOff, zOff, dirOff, absolute, isHex)` | Moves the track cursor without generating geometry (noPoints). Can also change the heading (dirOff in steps of pi/3 in hex, pi/2 otherwise) and the height (zOff). | 510 |
| `util_trackBuilder_pieces.forward(length)` | Straight line of the given length in the direction of the tipPiece (control points at 25% of the length). | 101 |
| `util_trackBuilder_pieces.freeSpiral(size, inside, dir, angle)` | Free-angle spiral; the tangent lengths are chosen in 15° increments up to 75°. | 314 |
| `util_trackBuilder_pieces.fresnelSC(d)` | Helper function for loops: numerically integrates the Euler spiral (clothoid, Fresnel integrals cos/sin(t²·pi/2)) from 0 to d. | 375 |
| `util_trackBuilder_pieces.getHdgVector(hdg)` | Returns the horizontal unit vector of the heading: (sin hdg, cos hdg, 0). | 87 |
| `util_trackBuilder_pieces.hexSpiral(size, inside, dir)` | Hexagonal spiral (60° turn) inward or outward, described by a Bézier. | 249 |
| `util_trackBuilder_pieces.initialTrackPiece(p)` | Initial piece: position (0,0,0) and heading 0 by default, with no points. | 91 |
| `util_trackBuilder_pieces.loop(xOffset, radius, isHex)` | Vertical loop built with a clothoid, with lateral offset xOffset spread out as a gentle slope; returns up to 300 custom points (position, rot). | 403 |
| `util_trackBuilder_pieces.offsetCurve(length, xOffset, hardness, isHex)` | S-curve of given length offset laterally by xOffset; in hex, adds 0.5 to the length if xOffset is odd to stay on the triangular grid. | 165 |
| `util_trackBuilder_pieces.rotateVectorByQuat(v, q)` | Helper function: returns q * v. | 539 |
| `util_trackBuilder_pieces.squareSpiral(size, inside, dir)` | Square spiral (90° turn), same principle as hexSpiral. | 282 |
| `util_trackBuilder_pieces.toSegment(piece, tip)` | Converts the piece description into a segment table. Stores tip as the previous piece then delegates to initialTrackPiece, forward, curve, offsetCurve, customBezier, hexSpiral, squareSpiral, freeSpiral, loop or emptyOffset according to piece.piece. Returns nil if the type is unknown. | 12 |

### Parameter details

#### `util_trackBuilder_pieces.bezierCurve(radius, angle, direction, hardness, radiusMult)`

Bézier curve approximating an arc (constant 0.5523); hardness changes the length of the tangents (negative: reduces, positive: increases).

- `radius` (*number*) : Base radius.
- `angle` (*number*) : Turn angle (rad).
- `direction` (*number*) : Turn direction: 1 or -1.
- `hardness` (*number*) : Curve hardness.
- `radiusMult` (*number*) : Radius multiplier (sqrt(3) in hex, 1 otherwise).
- **returns**: table Piece of type 'bezier'.

#### `util_trackBuilder_pieces.curve(radius, angle, direction, hardness, radiusMult)`

Turn of given radius and angle. If hardness is non-zero, goes through bezierCurve; otherwise returns an arc ('arc') with radius, angle and direction.

- `radius` (*number*) : Radius.
- `angle` (*number*) : Angle (rad).
- `direction` (*number*) : 1 or -1 (left/right).
- `hardness` (*number|nil*) : Hardness; 0 or nil for a pure arc.
- `radiusMult` (*number*) : Radius multiplier.
- **returns**: table Piece of type 'arc' or 'bezier'.

#### `util_trackBuilder_pieces.customBezier(xOff, yOff, dirOff, forwardLen, backwardLen, isHex, absolute, empty)`

Free Bézier: offset (xOff, yOff), heading change dirOff and forward/backward tangent lengths. In absolute mode, the offset is computed from the current position of the track cursor (splineTrack.getTrackPosition()). Also returns local and global positions/headings.

- `xOff` (*number*) : Lateral offset.
- `yOff` (*number*) : Forward offset.
- `dirOff` (*number*) : Heading change (rad).
- `forwardLen` (*number*) : Length of the start tangent.
- `backwardLen` (*number*) : Length of the end tangent.
- `isHex` (*boolean*) : Hexagonal grid.
- `absolute` (*boolean|nil*) : Position relative to the track cursor rather than to the last piece.
- `empty` (*boolean|nil*) : If true, no geometry is generated (noPoints).
- **returns**: table Piece of type 'bezier' (with globalPosition, localPosition, globalHdg, localHdg).

#### `util_trackBuilder_pieces.emptyOffset(xOff, yOff, zOff, dirOff, absolute, isHex)`

Moves the track cursor without generating geometry (noPoints). Can also change the heading (dirOff in steps of pi/3 in hex, pi/2 otherwise) and the height (zOff).

- `xOff` (*number*) : Lateral offset.
- `yOff` (*number*) : Forward offset.
- `zOff` (*number*) : Vertical offset.
- `dirOff` (*number*) : Number of rotation steps.
- `absolute` (*boolean|nil*) : Starts from the position of the track cursor.
- `isHex` (*boolean*) : Hexagonal grid.
- **returns**: table Empty piece.

#### `util_trackBuilder_pieces.forward(length)`

Straight line of the given length in the direction of the tipPiece (control points at 25% of the length).

- `length` (*number*) : Length in meters.
- **returns**: table Piece of type 'bezier'.

#### `util_trackBuilder_pieces.freeSpiral(size, inside, dir, angle)`

Free-angle spiral; the tangent lengths are chosen in 15° increments up to 75°.

- `size` (*number*) : Size.
- `inside` (*boolean*) : Inward spiral.
- `dir` (*number*) : Direction: 1 or -1.
- `angle` (*number*) : Angle in radians (at most 75° = 1.309 rad, otherwise error).
- **returns**: table Piece of type 'bezier'.

#### `util_trackBuilder_pieces.fresnelSC(d)`

Helper function for loops: numerically integrates the Euler spiral (clothoid, Fresnel integrals cos/sin(t²·pi/2)) from 0 to d.

- `d` (*number*) : Upper integration bound.
- **returns**: table {x, y} of the clothoid point.

#### `util_trackBuilder_pieces.getHdgVector(hdg)`

Returns the horizontal unit vector of the heading: (sin hdg, cos hdg, 0).

- `hdg` (*number*) : Heading in radians.
- **returns**: vec3 Direction.

#### `util_trackBuilder_pieces.hexSpiral(size, inside, dir)`

Hexagonal spiral (60° turn) inward or outward, described by a Bézier.

- `size` (*number*) : Spiral size.
- `inside` (*boolean*) : Inward spiral.
- `dir` (*number*) : Direction: 1 or -1.
- **returns**: table Piece of type 'bezier'.

#### `util_trackBuilder_pieces.initialTrackPiece(p)`

Initial piece: position (0,0,0) and heading 0 by default, with no points.

- `p` (*table|nil*) : Optional table with position (vec3) and hdg (rad).
- **returns**: table Piece with noPoints = true.

#### `util_trackBuilder_pieces.loop(xOffset, radius, isHex)`

Vertical loop built with a clothoid, with lateral offset xOffset spread out as a gentle slope; returns up to 300 custom points (position, rot).

- `xOffset` (*number*) : Lateral offset between entry and exit.
- `radius` (*number*) : Radius (minimum 1).
- `isHex` (*boolean*) : Hexagonal grid (offset × sqrt(3)).
- **returns**: table Piece of type 'custom' with customPoints.

#### `util_trackBuilder_pieces.offsetCurve(length, xOffset, hardness, isHex)`

S-curve of given length offset laterally by xOffset; in hex, adds 0.5 to the length if xOffset is odd to stay on the triangular grid.

- `length` (*number*) : Forward length.
- `xOffset` (*number*) : Lateral offset (positive toward the right of the heading).
- `hardness` (*number|nil*) : Hardness (0 by default).
- `isHex` (*boolean*) : Hexagonal grid.
- **returns**: table Piece of type 'bezier'.

#### `util_trackBuilder_pieces.rotateVectorByQuat(v, q)`

Helper function: returns q * v.

- `v` (*vec3*) : Vector.
- `q` (*quat*) : Rotation.
- **returns**: vec3 Rotated vector.

#### `util_trackBuilder_pieces.squareSpiral(size, inside, dir)`

Square spiral (90° turn), same principle as hexSpiral.

- `size` (*number*) : Size.
- `inside` (*boolean*) : Inward spiral.
- `dir` (*number*) : Direction: 1 or -1.
- **returns**: table Piece of type 'bezier'.

#### `util_trackBuilder_pieces.toSegment(piece, tip)`

Converts the piece description into a segment table. Stores tip as the previous piece then delegates to initialTrackPiece, forward, curve, offsetCurve, customBezier, hexSpiral, squareSpiral, freeSpiral, loop or emptyOffset according to piece.piece. Returns nil if the type is unknown.

- `piece` (*table*) : Piece description (field piece = type name, plus length, direction, hardness, radius, xOffset, xOff, yOff, zOff, dirOff, size, inside, angle, absolute, empty… depending on the type).
- `tip` (*table*) : Previous piece (position, hdg).
- **returns**: table|nil Segment table.

## Fields

| Field | Type | Description |
|---|---|---|
| `splineTrack` | table|nil | Reference to the splineTrack module, nil in this file; must provide getTrackPosition() for absolute-positioned pieces. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/trackBuilder/pieces.lua`.*
