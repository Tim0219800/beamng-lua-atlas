---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/deckSweep.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 'Deck sweep': sweeps a cambered slab along an arbitrary centerline to produce ONE single mesh. The section (cambered roadway at the line, flat sidewalks on the outside, vertical sides, flat underside) is placed at each station of the dense line; the stations are decimated according to a chord tolerance (plan and vertical separate); each end can taper into a skirt (sloped top, underside raised into a thin lip) to blend into the ground. Widths can vary per station. Depends on editor/toolUtilities/meshPart and editor/heroRoadEditor/meshRefine.
--- Access: extension `editor_toolUtilities_deckSweep`: `extensions.load("editor_toolUtilities_deckSweep")`, then the global `editor_toolUtilities_deckSweep`
---@class editor_toolUtilities_deckSweep
editor_toolUtilities_deckSweep = {}

--- Sweeps the deck along the dense line `dp`. Returns the mesh parts and the indices of the kept dense stations, or nil if the line is degenerate (fewer than 2 points or length < 1 mm).
---Source: lua/ge/extensions/editor/toolUtilities/deckSweep.lua:126
---@param dp table Dense line of vec3 or tables {x,y,z}.
---@param sec table { extL, extR, fwL, fwR (numbers or per-station arrays: left/right roadway half-width and sidewalk width), crown (crown dip), flatEnd (m over which the crown fades to flat at each end; nil/0 = none), slabT (slab thickness), topMat, bodyMat, chamfer = { len, drop, lipT, atStart?, atEnd? } | nil }
---@param opts table { tol (plan chord tolerance, m), tolZ (vertical tolerance, m; nil = tol), maxSeg (largest kept interval, m) }
---@return table|nil  List of mesh parts ({ bodyPart[, topPart] }).
---@return integer[]  Indices of kept dense stations.
function editor_toolUtilities_deckSweep.build(dp, sec, opts) end

