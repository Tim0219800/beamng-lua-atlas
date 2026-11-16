---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/sweep.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sweep geometry (loft) for the editor's building tools: a piece is a section (2D polygon in (s, t) coordinates) and a path of frames. Used to cut gutters, pipes, elbows, ducts, risers. Writes faces into an accumulator `p` via meshPart.face4 and meshPart.face3. A frame is an origin and two axes: the section point (s, t) lands at o + a*s + b*t, so the same section swept along +X, +Z or a turn comes out correctly oriented without being rewritten.
--- Access: extension `editor_toolUtilities_sweep`: `extensions.load("editor_toolUtilities_sweep")`, then the global `editor_toolUtilities_sweep`
---@class editor_toolUtilities_sweep
editor_toolUtilities_sweep = {}

--- Creates a point { x, y, z }.
---Source: lua/ge/extensions/editor/toolUtilities/sweep.lua:23
---@param x number X.
---@param y number Y.
---@param z number Z.
---@return table  Point { x, y, z }.
function editor_toolUtilities_sweep.P(x, y, z) end

--- Run along +X carrying a section laid out in (y, z).
---Source: lua/ge/extensions/editor/toolUtilities/sweep.lua:121
---@param x0 number Start X.
---@param x1 number End X.
---@return table  Two frames.
function editor_toolUtilities_sweep.alongX(x0, x1) end

--- Run along +Y carrying a section laid out in (x, z).
---Source: lua/ge/extensions/editor/toolUtilities/sweep.lua:126
---@param y0 number Start Y.
---@param y1 number End Y.
---@return table  Two frames.
function editor_toolUtilities_sweep.alongY(y0, y1) end

--- Upward run along +Z carrying a section laid out in (x, y), optionally offset from the axis.
---Source: lua/ge/extensions/editor/toolUtilities/sweep.lua:131
---@param z0 number Start Z.
---@param z1 number End Z.
---@param cx number|nil X offset (0 by default).
---@param cy number|nil Y offset (0 by default).
---@return table  Two frames.
function editor_toolUtilities_sweep.alongZ(z0, z1, cx, cy) end

--- World point corresponding to the section point (s, t) in frame f.
---Source: lua/ge/extensions/editor/toolUtilities/sweep.lua:30
---@param f table Frame.
---@param s number Coordinate s.
---@param t number Coordinate t.
---@return table  Point { x, y, z }.
function editor_toolUtilities_sweep.at(f, s, t) end

--- Square section around the origin, or rectangular if a second half-size is given.
---Source: lua/ge/extensions/editor/toolUtilities/sweep.lua:165
---@param hx number Half-size in s.
---@param hy number|nil Half-size in t (= hx by default).
---@return table  4 points.
function editor_toolUtilities_sweep.boxSection(hx, hy) end

--- Closed box (loft plus two caps) extended along X, section in (y, z).
---Source: lua/ge/extensions/editor/toolUtilities/sweep.lua:136
---@param p table Face accumulator.
---@param x0 number X min.
---@param x1 number X max.
---@param y0 number Y min.
---@param y1 number Y max.
---@param z0 number Min Z.
---@param z1 number Max Z.
---@param uv number UV scale.
function editor_toolUtilities_sweep.boxX(p, x0, x1, y0, y1, z0, z1, uv) end

--- The same box, stood upright and swept on Z. A loft lays U around the section and V along the path: the two lay a face's texture at right angles to each other. Use it for a material that has a DIRECTION (such as brick, whose courses come out upright with boxX).
---Source: lua/ge/extensions/editor/toolUtilities/sweep.lua:147
---@param p table Face accumulator.
---@param x0 number X min.
---@param x1 number X max.
---@param y0 number Y min.
---@param y1 number Y max.
---@param z0 number Min Z.
---@param z1 number Max Z.
---@param uv number UV scale.
function editor_toolUtilities_sweep.boxZ(p, x0, x1, y0, y1, z0, z1, uv) end

--- Closes one end of a loft, oriented in the path direction (sgn 1) or the opposite direction. Fan triangulation, so convex section only.
---Source: lua/ge/extensions/editor/toolUtilities/sweep.lua:73
---@param p table Face accumulator.
---@param sect table Convex section.
---@param f table Frame of the end.
---@param sgn integer 1 or -1: normal direction.
---@param uv number UV scale.
function editor_toolUtilities_sweep.cap(p, sect, f, sgn, uv) end

--- Circular section of radius r with n points, around the origin.
---Source: lua/ge/extensions/editor/toolUtilities/sweep.lua:155
---@param r number Radius.
---@param n integer Number of points.
---@return table  List of { s, t }.
function editor_toolUtilities_sweep.circleSection(r, n) end

--- A frame of a swept path: the section's (s, t) lands at o + a*s + b*t.
---Source: lua/ge/extensions/editor/toolUtilities/sweep.lua:26
---@param ox number Origin X.
---@param oy number Origin Y.
---@param oz number Origin Z.
---@param ax number Axis a, X.
---@param ay number Axis a, Y.
---@param az number Axis a, Z.
---@param bx number Axis b, X.
---@param by number Axis b, Y.
---@param bz number Axis b, Z.
---@return table  Frame.
function editor_toolUtilities_sweep.fr(ox, oy, oz, ax, ay, az, bx, by, bz) end

--- An elbow in the vertical plane: enters along +Z at the origin, exits leaning toward -Y (toward the outside of the wall).
---Source: lua/ge/extensions/editor/toolUtilities/sweep.lua:213
---@param R number Elbow radius.
---@param ang number Total angle in radians.
---@param segs integer Number of segments.
---@return table  segs + 1 frames.
function editor_toolUtilities_sweep.kinkPath(R, ang, segs) end

--- Sweeps a closed section along a path of frames: one quad per section edge and per step. The UVs follow the section's arc length across and the distance traveled lengthwise, so a piece stretched by the placer stays tiled-textured.
---Source: lua/ge/extensions/editor/toolUtilities/sweep.lua:47
---@param p table Face accumulator (meshPart).
---@param sect table Closed section, list of { s, t }.
---@param path table List of frames.
---@param uv number UV scale.
function editor_toolUtilities_sweep.loft(p, sect, path, uv) end

--- Octagonal post standing on +Z between two heights, closed at both ends (loft plus two caps).
---Source: lua/ge/extensions/editor/toolUtilities/sweep.lua:178
---@param p table Face accumulator.
---@param m number Distance from the center to a flat.
---@param z0 number Start height.
---@param z1 number End height.
---@param uv number UV scale.
function editor_toolUtilities_sweep.octPost(p, m, z0, z1, uv) end

--- Regular OCTAGON around the origin; `m` goes from the center to each of the eight flats.
---Source: lua/ge/extensions/editor/toolUtilities/sweep.lua:171
---@param m number Distance from the center to a flat.
---@return table  8 points.
function editor_toolUtilities_sweep.octSection(m) end

--- Rectangle written as EIGHT points (not four), taken at the same angles as a circle with the same count, to close a flat plate from one section to the other. Centered at (0, cy).
---Source: lua/ge/extensions/editor/toolUtilities/sweep.lua:194
---@param hx number Half-width.
---@param hy number Half-height.
---@param cy number|nil Center offset in t (0 by default).
---@return table  8 points.
function editor_toolUtilities_sweep.rect8(hx, hy, cy) end

--- Returns the section traversed in the opposite direction (the faces will look inward).
---Source: lua/ge/extensions/editor/toolUtilities/sweep.lua:186
---@param sect table Section.
---@return table  New reversed section.
function editor_toolUtilities_sweep.reversed(sect) end

--- The flat strip between two sections with the same number of points, at one frame: the mouth of an open pipe.
---Source: lua/ge/extensions/editor/toolUtilities/sweep.lua:86
---@param p table Face accumulator.
---@param inner table Inner section.
---@param outer table Outer section.
---@param f table Frame.
---@param sgn integer Normal direction (1 or -1).
---@param uv number UV scale.
function editor_toolUtilities_sweep.ring(p, inner, outer, f, sgn, uv) end

--- Sweeps BETWEEN two sections with the same number of points, one frame each: a taper from the mouth to the throat. Same quad per edge as the straight loft, but each end has its own shape.
---Source: lua/ge/extensions/editor/toolUtilities/sweep.lua:102
---@param p table Face accumulator.
---@param s0 table Start section.
---@param s1 table End section (same number of points).
---@param f0 table Start frame.
---@param f1 table End frame.
---@param uv number UV scale.
function editor_toolUtilities_sweep.taper(p, s0, s1, f0, f1, uv) end

--- Quarter turn in plan: enters along +X at the origin, exits toward `sy` on Y. The section is carried without unrolling, so a gutter stays straight in the turn.
---Source: lua/ge/extensions/editor/toolUtilities/sweep.lua:202
---@param R number Turn radius.
---@param sy number Side of the turn on Y (sign).
---@param ang number Total angle in radians.
---@param segs integer Number of segments.
---@return table  segs + 1 frames.
function editor_toolUtilities_sweep.turnPath(R, sy, ang, segs) end

