---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/curveWiden.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_curveWiden` : `extensions.load("editor_toolUtilities_curveWiden")`, puis la globale `editor_toolUtilities_curveWiden`
---@class editor_toolUtilities_curveWiden
---@field DEFAULT_MAX number
---@field DEFAULT_RUNOFF number
editor_toolUtilities_curveWiden = {}

--- Bakes the per-station curve widening into group.divWidths in place (call once per dirty pass, right after the base widths are
---  sampled). For tools whose mesh is built symmetrically from divWidths this widens the tarmac itself; heroRoad widens its mesh
---  carriageway separately and uses this only to move markings/ribbon out to the widened edge. No-op when nothing widens.
---Source : lua/ge/extensions/editor/toolUtilities/curveWiden.lua:161
---@param group any
function editor_toolUtilities_curveWiden.applyDivWidthWiden(group) end

--- Cumulative arc-length along the divPoints (s[1] = 0). Used so runoff is a real distance, not a station count
---  (Catmull-Rom clusters stations at corners, so an index-space window physically collapses exactly at the node).
---Source : lua/ge/extensions/editor/toolUtilities/curveWiden.lua:44
---@param div any
---@param n any
function editor_toolUtilities_curveWiden.arcLengths(div, n) end

--- Real-world corner widening (m) per station on each edge, travel-left and travel-right: every lane takes the design
---  vehicle's offtracking on the bend's sustained radius, R - sqrt(R^2 - L^2), dropped under minLaneWidenM, the whole capped
---  at the road's Corner Widening. It goes on the inside edge of the bend; a divided road widens each carriageway on its outer
---  edge, the median having no room for it. Engineered roads only (their curvature is exact).
---Source : lua/ge/extensions/editor/toolUtilities/curveWiden.lua:175
---@param group any
---@param div any
---@param s any
---@param n any
---@param lanesL any
---@param lanesR any
---@param divided any
function editor_toolUtilities_curveWiden.edgeWiden(group, div, s, n, lanesL, lanesR, divided) end

--- Signed horizontal curvature at station i (0 at endpoints / degenerate). +ve = left turn, -ve = right turn.
---Source : lua/ge/extensions/editor/toolUtilities/curveWiden.lua:28
---@param div any
---@param i any
---@param n any
function editor_toolUtilities_curveWiden.signedCurvatureAt(div, i, n) end

--- Box-smooths a signed array in place over a PHYSICAL half-window hw (meters), using the arc-length table s.
---  Each sample is weighted by the arc length it stands for, never counted. The window was already made physical so it
---  couldn't collapse at a node, but an unweighted mean over it is still whatever the DENSE side says: the engineered
---  sampler steps curves at R*MAX_CURVE_STEP_RAD (sub-metre, ~0.2 m round a hairpin) and straights at up to 5 m, so a
---  window straddling a tangent point holds tens of corner stations against one or two straight ones and hands the
---  corner ~95% of the average. The runoff that is supposed to ease the width in over curveWidenRunoffM then collapses
---  into a step at the corner boundary -- a lateral kink where the straight meets the arc. Weighting by run length is
---  what engineeredGeom's grade smoothers already do for the same reason.
---Source : lua/ge/extensions/editor/toolUtilities/curveWiden.lua:62
---@param arr any
---@param s any
---@param n any
---@param hw any
function editor_toolUtilities_curveWiden.smoothByDistance(arr, s, n, hw) end

--- Per-station TOTAL curve widening (m, split both sides): the auto curvature widening plus any engineered per-corner extraWidenM,
---  arc-length smoothed. Zero on straights / when curveWidenMaxM = 0 with no corner overrides, and zero unless engineered mode.
---Source : lua/ge/extensions/editor/toolUtilities/curveWiden.lua:125
---@param group any
---@param div any
---@param s any
---@param n any
function editor_toolUtilities_curveWiden.stationWiden(group, div, s, n) end

