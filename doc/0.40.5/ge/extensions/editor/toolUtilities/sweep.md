# `editor_toolUtilities_sweep`

*File: `lua/ge/extensions/editor/toolUtilities/sweep.lua` · VM: Game Engine (GE) · 246 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_sweep`: `extensions.load("editor_toolUtilities_sweep")`, then the global `editor_toolUtilities_sweep`

Sweep geometry (loft) for the editor's building tools: a piece is a section (2D polygon in (s, t) coordinates) and a path of frames. Used to cut gutters, pipes, elbows, ducts, risers. Writes faces into an accumulator `p` via meshPart.face4 and meshPart.face3. A frame is an origin and two axes: the section point (s, t) lands at o + a*s + b*t, so the same section swept along +X, +Z or a turn comes out correctly oriented without being rewritten.

## Example

```lua
local sweep = require('editor/toolUtilities/sweep')
local sect = sweep.circleSection(0.05, 12)
local path = sweep.alongZ(0, 3)
sweep.loft(p, sect, path, 1.0)
sweep.cap(p, sect, path[1], -1, 1.0)
sweep.cap(p, sect, path[2], 1, 1.0)
```

## Notes

- A frame is a table { ox, oy, oz, ax, ay, az, bx, by, bz }; a section point is { s, t }.
- The winding direction of the section determines the face normals: providing the same section reversed (reversed) turns the faces inward, useful for a bore.
- cap uses a triangle fan: the section must be convex, otherwise it must be butted against the next piece.
- The uv parameter is the texture coordinate scale (U follows the arc length of the section, V the distance traveled).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_sweep.P(x, y, z)` | Creates a point { x, y, z }. | 23 |
| `editor_toolUtilities_sweep.alongX(x0, x1)` | Run along +X carrying a section laid out in (y, z). | 121 |
| `editor_toolUtilities_sweep.alongY(y0, y1)` | Run along +Y carrying a section laid out in (x, z). | 126 |
| `editor_toolUtilities_sweep.alongZ(z0, z1, cx, cy)` | Upward run along +Z carrying a section laid out in (x, y), optionally offset from the axis. | 131 |
| `editor_toolUtilities_sweep.at(f, s, t)` | World point corresponding to the section point (s, t) in frame f. | 30 |
| `editor_toolUtilities_sweep.boxSection(hx, hy)` | Square section around the origin, or rectangular if a second half-size is given. | 165 |
| `editor_toolUtilities_sweep.boxX(p, x0, x1, y0, y1, z0, z1, uv)` | Closed box (loft plus two caps) extended along X, section in (y, z). | 136 |
| `editor_toolUtilities_sweep.boxZ(p, x0, x1, y0, y1, z0, z1, uv)` | The same box, stood upright and swept on Z. A loft lays U around the section and V along the path: the two lay a face's texture at right angles to each other. Use it for a material that has a DIRECTION (such as brick, whose courses come out upright with boxX). | 147 |
| `editor_toolUtilities_sweep.cap(p, sect, f, sgn, uv)` | Closes one end of a loft, oriented in the path direction (sgn 1) or the opposite direction. Fan triangulation, so convex section only. | 73 |
| `editor_toolUtilities_sweep.circleSection(r, n)` | Circular section of radius r with n points, around the origin. | 155 |
| `editor_toolUtilities_sweep.fr(ox, oy, oz, ax, ay, az, bx, by, bz)` | A frame of a swept path: the section's (s, t) lands at o + a*s + b*t. | 26 |
| `editor_toolUtilities_sweep.kinkPath(R, ang, segs)` | An elbow in the vertical plane: enters along +Z at the origin, exits leaning toward -Y (toward the outside of the wall). | 213 |
| `editor_toolUtilities_sweep.loft(p, sect, path, uv)` | Sweeps a closed section along a path of frames: one quad per section edge and per step. The UVs follow the section's arc length across and the distance traveled lengthwise, so a piece stretched by the placer stays tiled-textured. | 47 |
| `editor_toolUtilities_sweep.octPost(p, m, z0, z1, uv)` | Octagonal post standing on +Z between two heights, closed at both ends (loft plus two caps). | 178 |
| `editor_toolUtilities_sweep.octSection(m)` | Regular OCTAGON around the origin; `m` goes from the center to each of the eight flats. | 171 |
| `editor_toolUtilities_sweep.rect8(hx, hy, cy)` | Rectangle written as EIGHT points (not four), taken at the same angles as a circle with the same count, to close a flat plate from one section to the other. Centered at (0, cy). | 194 |
| `editor_toolUtilities_sweep.reversed(sect)` | Returns the section traversed in the opposite direction (the faces will look inward). | 186 |
| `editor_toolUtilities_sweep.ring(p, inner, outer, f, sgn, uv)` | The flat strip between two sections with the same number of points, at one frame: the mouth of an open pipe. | 86 |
| `editor_toolUtilities_sweep.taper(p, s0, s1, f0, f1, uv)` | Sweeps BETWEEN two sections with the same number of points, one frame each: a taper from the mouth to the throat. Same quad per edge as the straight loft, but each end has its own shape. | 102 |
| `editor_toolUtilities_sweep.turnPath(R, sy, ang, segs)` | Quarter turn in plan: enters along +X at the origin, exits toward `sy` on Y. The section is carried without unrolling, so a gutter stays straight in the turn. | 202 |

### Parameter details

#### `editor_toolUtilities_sweep.P(x, y, z)`

Creates a point { x, y, z }.

- `x` (*number*) : X.
- `y` (*number*) : Y.
- `z` (*number*) : Z.
- **returns**: table Point { x, y, z }.

#### `editor_toolUtilities_sweep.alongX(x0, x1)`

Run along +X carrying a section laid out in (y, z).

- `x0` (*number*) : Start X.
- `x1` (*number*) : End X.
- **returns**: table Two frames.

#### `editor_toolUtilities_sweep.alongY(y0, y1)`

Run along +Y carrying a section laid out in (x, z).

- `y0` (*number*) : Start Y.
- `y1` (*number*) : End Y.
- **returns**: table Two frames.

#### `editor_toolUtilities_sweep.alongZ(z0, z1, cx, cy)`

Upward run along +Z carrying a section laid out in (x, y), optionally offset from the axis.

- `z0` (*number*) : Start Z.
- `z1` (*number*) : End Z.
- `cx` (*number|nil*) : X offset (0 by default).
- `cy` (*number|nil*) : Y offset (0 by default).
- **returns**: table Two frames.

#### `editor_toolUtilities_sweep.at(f, s, t)`

World point corresponding to the section point (s, t) in frame f.

- `f` (*table*) : Frame.
- `s` (*number*) : Coordinate s.
- `t` (*number*) : Coordinate t.
- **returns**: table Point { x, y, z }.

#### `editor_toolUtilities_sweep.boxSection(hx, hy)`

Square section around the origin, or rectangular if a second half-size is given.

- `hx` (*number*) : Half-size in s.
- `hy` (*number|nil*) : Half-size in t (= hx by default).
- **returns**: table 4 points.

#### `editor_toolUtilities_sweep.boxX(p, x0, x1, y0, y1, z0, z1, uv)`

Closed box (loft plus two caps) extended along X, section in (y, z).

- `p` (*table*) : Face accumulator.
- `x0` (*number*) : X min.
- `x1` (*number*) : X max.
- `y0` (*number*) : Y min.
- `y1` (*number*) : Y max.
- `z0` (*number*) : Min Z.
- `z1` (*number*) : Max Z.
- `uv` (*number*) : UV scale.

#### `editor_toolUtilities_sweep.boxZ(p, x0, x1, y0, y1, z0, z1, uv)`

The same box, stood upright and swept on Z. A loft lays U around the section and V along the path: the two lay a face's texture at right angles to each other. Use it for a material that has a DIRECTION (such as brick, whose courses come out upright with boxX).

- `p` (*table*) : Face accumulator.
- `x0` (*number*) : X min.
- `x1` (*number*) : X max.
- `y0` (*number*) : Y min.
- `y1` (*number*) : Y max.
- `z0` (*number*) : Min Z.
- `z1` (*number*) : Max Z.
- `uv` (*number*) : UV scale.

#### `editor_toolUtilities_sweep.cap(p, sect, f, sgn, uv)`

Closes one end of a loft, oriented in the path direction (sgn 1) or the opposite direction. Fan triangulation, so convex section only.

- `p` (*table*) : Face accumulator.
- `sect` (*table*) : Convex section.
- `f` (*table*) : Frame of the end.
- `sgn` (*integer*) : 1 or -1: normal direction.
- `uv` (*number*) : UV scale.

#### `editor_toolUtilities_sweep.circleSection(r, n)`

Circular section of radius r with n points, around the origin.

- `r` (*number*) : Radius.
- `n` (*integer*) : Number of points.
- **returns**: table List of { s, t }.

#### `editor_toolUtilities_sweep.fr(ox, oy, oz, ax, ay, az, bx, by, bz)`

A frame of a swept path: the section's (s, t) lands at o + a*s + b*t.

- `ox` (*number*) : Origin X.
- `oy` (*number*) : Origin Y.
- `oz` (*number*) : Origin Z.
- `ax` (*number*) : Axis a, X.
- `ay` (*number*) : Axis a, Y.
- `az` (*number*) : Axis a, Z.
- `bx` (*number*) : Axis b, X.
- `by` (*number*) : Axis b, Y.
- `bz` (*number*) : Axis b, Z.
- **returns**: table Frame.

#### `editor_toolUtilities_sweep.kinkPath(R, ang, segs)`

An elbow in the vertical plane: enters along +Z at the origin, exits leaning toward -Y (toward the outside of the wall).

- `R` (*number*) : Elbow radius.
- `ang` (*number*) : Total angle in radians.
- `segs` (*integer*) : Number of segments.
- **returns**: table segs + 1 frames.

#### `editor_toolUtilities_sweep.loft(p, sect, path, uv)`

Sweeps a closed section along a path of frames: one quad per section edge and per step. The UVs follow the section's arc length across and the distance traveled lengthwise, so a piece stretched by the placer stays tiled-textured.

- `p` (*table*) : Face accumulator (meshPart).
- `sect` (*table*) : Closed section, list of { s, t }.
- `path` (*table*) : List of frames.
- `uv` (*number*) : UV scale.

#### `editor_toolUtilities_sweep.octPost(p, m, z0, z1, uv)`

Octagonal post standing on +Z between two heights, closed at both ends (loft plus two caps).

- `p` (*table*) : Face accumulator.
- `m` (*number*) : Distance from the center to a flat.
- `z0` (*number*) : Start height.
- `z1` (*number*) : End height.
- `uv` (*number*) : UV scale.

#### `editor_toolUtilities_sweep.octSection(m)`

Regular OCTAGON around the origin; `m` goes from the center to each of the eight flats.

- `m` (*number*) : Distance from the center to a flat.
- **returns**: table 8 points.

#### `editor_toolUtilities_sweep.rect8(hx, hy, cy)`

Rectangle written as EIGHT points (not four), taken at the same angles as a circle with the same count, to close a flat plate from one section to the other. Centered at (0, cy).

- `hx` (*number*) : Half-width.
- `hy` (*number*) : Half-height.
- `cy` (*number|nil*) : Center offset in t (0 by default).
- **returns**: table 8 points.

#### `editor_toolUtilities_sweep.reversed(sect)`

Returns the section traversed in the opposite direction (the faces will look inward).

- `sect` (*table*) : Section.
- **returns**: table New reversed section.

#### `editor_toolUtilities_sweep.ring(p, inner, outer, f, sgn, uv)`

The flat strip between two sections with the same number of points, at one frame: the mouth of an open pipe.

- `p` (*table*) : Face accumulator.
- `inner` (*table*) : Inner section.
- `outer` (*table*) : Outer section.
- `f` (*table*) : Frame.
- `sgn` (*integer*) : Normal direction (1 or -1).
- `uv` (*number*) : UV scale.

#### `editor_toolUtilities_sweep.taper(p, s0, s1, f0, f1, uv)`

Sweeps BETWEEN two sections with the same number of points, one frame each: a taper from the mouth to the throat. Same quad per edge as the straight loft, but each end has its own shape.

- `p` (*table*) : Face accumulator.
- `s0` (*table*) : Start section.
- `s1` (*table*) : End section (same number of points).
- `f0` (*table*) : Start frame.
- `f1` (*table*) : End frame.
- `uv` (*number*) : UV scale.

#### `editor_toolUtilities_sweep.turnPath(R, sy, ang, segs)`

Quarter turn in plan: enters along +X at the origin, exits toward `sy` on Y. The section is carried without unrolling, so a gutter stays straight in the turn.

- `R` (*number*) : Turn radius.
- `sy` (*number*) : Side of the turn on Y (sign).
- `ang` (*number*) : Total angle in radians.
- `segs` (*integer*) : Number of segments.
- **returns**: table segs + 1 frames.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/sweep.lua`.*
