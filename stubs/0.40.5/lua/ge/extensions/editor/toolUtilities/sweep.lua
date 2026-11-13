---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/sweep.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_sweep` : `extensions.load("editor_toolUtilities_sweep")`, puis la globale `editor_toolUtilities_sweep`
---@class editor_toolUtilities_sweep
editor_toolUtilities_sweep = {}

--- Public interface.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:23
---@param x any
---@param y any
---@param z any
function editor_toolUtilities_sweep.P(x, y, z) end

--- A run along +X carrying a section laid in (y, z).
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:121
---@param x0 any
---@param x1 any
function editor_toolUtilities_sweep.alongX(x0, x1) end

--- A run along +Y carrying a section laid in (x, z).
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:126
---@param y0 any
---@param y1 any
function editor_toolUtilities_sweep.alongY(y0, y1) end

--- A run up +Z carrying a section laid in (x, y), optionally off the axis.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:131
---@param z0 any
---@param z1 any
---@param cx any
---@param cy any
function editor_toolUtilities_sweep.alongZ(z0, z1, cx, cy) end

---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:30
---@param f any
---@param s any
---@param t any
function editor_toolUtilities_sweep.at(f, s, t) end

--- A square section about the origin, or a rectangle when handed a second half-size.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:165
---@param hx any
---@param hy any
function editor_toolUtilities_sweep.boxSection(hx, hy) end

---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:136
---@param p any
---@param x0 any
---@param x1 any
---@param y0 any
---@param y1 any
---@param z0 any
---@param z1 any
---@param uv any
function editor_toolUtilities_sweep.boxX(p, x0, x1, y0, y1, z0, z1, uv) end

--- The same box, stood up and swept on Z instead of run along X. A loft takes U round its section and V along its path, so
---  the two lay a face's texture at right angles to each other: this is the one to cut anything whose material has a WAY UP,
---  like brick, whose courses come out on end off boxX.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:147
---@param p any
---@param x0 any
---@param x1 any
---@param y0 any
---@param y1 any
---@param z0 any
---@param z1 any
---@param uv any
function editor_toolUtilities_sweep.boxZ(p, x0, x1, y0, y1, z0, z1, uv) end

--- Close one end of a loft, facing along the path (`sgn` 1) or back down it. Fanned, so the section has to be convex:
---  a section that is not is always butted into the next piece instead.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:73
---@param p any
---@param sect any
---@param f any
---@param sgn any
---@param uv any
function editor_toolUtilities_sweep.cap(p, sect, f, sgn, uv) end

---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:155
---@param r any
---@param n any
function editor_toolUtilities_sweep.circleSection(r, n) end

--- One frame of a swept path: the section's own (s, t) lands at o + a*s + b*t.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:26
---@param ox any
---@param oy any
---@param oz any
---@param ax any
---@param ay any
---@param az any
---@param bx any
---@param by any
---@param bz any
function editor_toolUtilities_sweep.fr(ox, oy, oz, ax, ay, az, bx, by, bz) end

--- A turn in the vertical plane: in along +Z at the origin, out leaning onto -Y, which is outward off the wall.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:213
---@param R any
---@param ang any
---@param segs any
function editor_toolUtilities_sweep.kinkPath(R, ang, segs) end

--- Sweep a closed section along a path of frames, one quad per section edge per step. UVs run the section's arc length
---  across and the distance travelled along, so a piece the placer stretches still tiles.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:47
---@param p any
---@param sect any
---@param path any
---@param uv any
function editor_toolUtilities_sweep.loft(p, sect, path, uv) end

--- An octagonal post standing up +Z between two heights, capped at both ends: the shape above, swept, since every caller
---  that wants one wants exactly this and none of them want the three calls it takes.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:178
---@param p any
---@param m any
---@param z0 any
---@param z1 any
---@param uv any
function editor_toolUtilities_sweep.octPost(p, m, z0, z1, uv) end

--- A regular OCTAGON about the origin, `m` from the centre out to each of its eight flats.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:171
---@param m any
function editor_toolUtilities_sweep.octSection(m) end

--- A rectangle written as EIGHT points rather than four, taken round at the same angles a circle of the same count is,
---  so a flat plate can be closed from one onto the other.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:194
---@param hx any
---@param hy any
---@param cy any
function editor_toolUtilities_sweep.rect8(hx, hy, cy) end

---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:186
---@param sect any
function editor_toolUtilities_sweep.reversed(sect) end

--- The flat band between two sections of the same count, at one frame: the mouth of an open pipe.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:86
---@param p any
---@param inner any
---@param outer any
---@param f any
---@param sgn any
---@param uv any
function editor_toolUtilities_sweep.ring(p, inner, outer, f, sgn, uv) end

--- Sweep BETWEEN two sections of the same count, one frame each: how a head narrows from its mouth down to its spigot.
---  The same quad per section edge the straight loft lays, only with both ends free to be their own shape.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:102
---@param p any
---@param s0 any
---@param s1 any
---@param f0 any
---@param f1 any
---@param uv any
function editor_toolUtilities_sweep.taper(p, s0, s1, f0, f1, uv) end

--- A quarter turn in plan: in along +X at the origin, out toward `sy` on Y. The section is carried round unrolled, so a
---  trough stays upright through the turn the way a pressed angle does.
---Source : lua/ge/extensions/editor/toolUtilities/sweep.lua:202
---@param R any
---@param sy any
---@param ang any
---@param segs any
function editor_toolUtilities_sweep.turnPath(R, sy, ang, segs) end

