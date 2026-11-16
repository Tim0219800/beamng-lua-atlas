# `editor_toolUtilities_deckSweep`

*File: `lua/ge/extensions/editor/toolUtilities/deckSweep.lua` · VM: Game Engine (GE) · 180 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_deckSweep`: `extensions.load("editor_toolUtilities_deckSweep")`, then the global `editor_toolUtilities_deckSweep`

'Deck sweep': sweeps a cambered slab along an arbitrary centerline to produce ONE single mesh. The section (cambered roadway at the line, flat sidewalks on the outside, vertical sides, flat underside) is placed at each station of the dense line; the stations are decimated according to a chord tolerance (plan and vertical separate); each end can taper into a skirt (sloped top, underside raised into a thin lip) to blend into the ground. Widths can vary per station. Depends on editor/toolUtilities/meshPart and editor/heroRoadEditor/meshRefine.

## Notes

- The tolerance opts.tol is required (used by meshRefine.decimateStations); opts.tolZ nil = tol also bounds the vertical.
- chamfer.atStart / chamfer.atEnd = false leave the end square (the slab butts against another one).
- If sec.topMat == sec.bodyMat a single part is returned, otherwise two (body then top).
- UVs are metric: u = abscissa along the deck, v = lateral offset (top/soffit) or height (sides).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_deckSweep.build(dp, sec, opts)` | Sweeps the deck along the dense line `dp`. Returns the mesh parts and the indices of the kept dense stations, or nil if the line is degenerate (fewer than 2 points or length < 1 mm). | 126 |

### Parameter details

#### `editor_toolUtilities_deckSweep.build(dp, sec, opts)`

Sweeps the deck along the dense line `dp`. Returns the mesh parts and the indices of the kept dense stations, or nil if the line is degenerate (fewer than 2 points or length < 1 mm).

- `dp` (*table*) : Dense line of vec3 or tables {x,y,z}.
- `sec` (*table*) : { extL, extR, fwL, fwR (numbers or per-station arrays: left/right roadway half-width and sidewalk width), crown (crown dip), flatEnd (m over which the crown fades to flat at each end; nil/0 = none), slabT (slab thickness), topMat, bodyMat, chamfer = { len, drop, lipT, atStart?, atEnd? } | nil }
- `opts` (*table*) : { tol (plan chord tolerance, m), tolZ (vertical tolerance, m; nil = tol), maxSeg (largest kept interval, m) }
- **returns**: table|nil List of mesh parts ({ bodyPart[, topPart] }).
- **returns**: integer[] Indices of kept dense stations.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/deckSweep.lua`.*
