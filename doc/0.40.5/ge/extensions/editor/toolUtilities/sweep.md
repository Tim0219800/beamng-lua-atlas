# `editor_toolUtilities_sweep`

*Fichier : `lua/ge/extensions/editor/toolUtilities/sweep.lua` · VM : Game Engine (GE) · 246 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_sweep` : `extensions.load("editor_toolUtilities_sweep")`, puis la globale `editor_toolUtilities_sweep`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_sweep.P(x, y, z)` | Public interface. | 23 |
| `editor_toolUtilities_sweep.alongX(x0, x1)` | A run along +X carrying a section laid in (y, z). | 121 |
| `editor_toolUtilities_sweep.alongY(y0, y1)` | A run along +Y carrying a section laid in (x, z). | 126 |
| `editor_toolUtilities_sweep.alongZ(z0, z1, cx, cy)` | A run up +Z carrying a section laid in (x, y), optionally off the axis. | 131 |
| `editor_toolUtilities_sweep.at(f, s, t)` |  | 30 |
| `editor_toolUtilities_sweep.boxSection(hx, hy)` | A square section about the origin, or a rectangle when handed a second half-size. | 165 |
| `editor_toolUtilities_sweep.boxX(p, x0, x1, y0, y1, z0, z1, uv)` |  | 136 |
| `editor_toolUtilities_sweep.boxZ(p, x0, x1, y0, y1, z0, z1, uv)` | The same box, stood up and swept on Z instead of run along X. A loft takes U round its section and V along its path, so<br> the two lay a face's texture at right angles to each other: this is the one to cut anything whose material has a WAY UP,<br> like brick, whose courses come out on end off boxX. | 147 |
| `editor_toolUtilities_sweep.cap(p, sect, f, sgn, uv)` | Close one end of a loft, facing along the path (`sgn` 1) or back down it. Fanned, so the section has to be convex:<br> a section that is not is always butted into the next piece instead. | 73 |
| `editor_toolUtilities_sweep.circleSection(r, n)` |  | 155 |
| `editor_toolUtilities_sweep.fr(ox, oy, oz, ax, ay, az, bx, by, bz)` | One frame of a swept path: the section's own (s, t) lands at o + a*s + b*t. | 26 |
| `editor_toolUtilities_sweep.kinkPath(R, ang, segs)` | A turn in the vertical plane: in along +Z at the origin, out leaning onto -Y, which is outward off the wall. | 213 |
| `editor_toolUtilities_sweep.loft(p, sect, path, uv)` | Sweep a closed section along a path of frames, one quad per section edge per step. UVs run the section's arc length<br> across and the distance travelled along, so a piece the placer stretches still tiles. | 47 |
| `editor_toolUtilities_sweep.octPost(p, m, z0, z1, uv)` | An octagonal post standing up +Z between two heights, capped at both ends: the shape above, swept, since every caller<br> that wants one wants exactly this and none of them want the three calls it takes. | 178 |
| `editor_toolUtilities_sweep.octSection(m)` | A regular OCTAGON about the origin, `m` from the centre out to each of its eight flats. | 171 |
| `editor_toolUtilities_sweep.rect8(hx, hy, cy)` | A rectangle written as EIGHT points rather than four, taken round at the same angles a circle of the same count is,<br> so a flat plate can be closed from one onto the other. | 194 |
| `editor_toolUtilities_sweep.reversed(sect)` |  | 186 |
| `editor_toolUtilities_sweep.ring(p, inner, outer, f, sgn, uv)` | The flat band between two sections of the same count, at one frame: the mouth of an open pipe. | 86 |
| `editor_toolUtilities_sweep.taper(p, s0, s1, f0, f1, uv)` | Sweep BETWEEN two sections of the same count, one frame each: how a head narrows from its mouth down to its spigot.<br> The same quad per section edge the straight loft lays, only with both ends free to be their own shape. | 102 |
| `editor_toolUtilities_sweep.turnPath(R, sy, ang, segs)` | A quarter turn in plan: in along +X at the origin, out toward `sy` on Y. The section is carried round unrolled, so a<br> trough stays upright through the turn the way a pressed angle does. | 202 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/sweep.lua`.*
