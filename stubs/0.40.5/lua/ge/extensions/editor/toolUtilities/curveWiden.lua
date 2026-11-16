---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/curveWiden.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Road widening in turns for the 'engineered' roads of the editor's road tools. Computes, per centerline station (group.divPoints), an automatic widening based on the sustained curvature (the tighter the turn relative to the design radius group.engRadiusM, the wider the road gets, up to curveWidenMaxM) to which the extraWidenM per turn are added. Everything is smoothed over a physical distance (arc length), not over a number of stations.
--- Access: extension `editor_toolUtilities_curveWiden`: `extensions.load("editor_toolUtilities_curveWiden")`, then the global `editor_toolUtilities_curveWiden`
---@class editor_toolUtilities_curveWiden
---@field DEFAULT_MAX number Default maximum widening (2.5 m in total, split over both sides).
---@field DEFAULT_RUNOFF number Default length (20 m) over which the widening enters/exits.
editor_toolUtilities_curveWiden = {}

--- Adds the per-station widening to group.divWidths in place (to be called once per 'dirty' pass, right after sampling the base widths). For tools whose mesh is symmetric according to divWidths, this widens the asphalt itself; heroRoad widens its mesh separately and only uses it to shift markings/ribbon. No effect if nothing widens.
---Source: lua/ge/extensions/editor/toolUtilities/curveWiden.lua:161
---@param group table Group with divPoints and divWidths.
function editor_toolUtilities_curveWiden.applyDivWidthWiden(group) end

--- Cumulative arc length along the divPoints (s[1] = 0), in 3D. Used to express the runoff as a true distance.
---Source: lua/ge/extensions/editor/toolUtilities/curveWiden.lua:44
---@param div table Points {x,y,z}
---@param n integer Number of points
---@return number[]  Array s of cumulative lengths (m).
function editor_toolUtilities_curveWiden.arcLengths(div, n) end

--- Actual widening per station on each edge (left and right relative to the direction of travel): each lane takes the design vehicle's 'offtracking' over the sustained radius, R - sqrt(R^2 - L^2) with L = 6 m, suppressed below 0.3 m, all capped at curveWidenMaxM. Goes on the inner edge of the turn; a divided road widens each carriageway on its outer edge (the median has no room).
---Source: lua/ge/extensions/editor/toolUtilities/curveWiden.lua:175
---@param group table Group/road.
---@param div table divPoints
---@param s number[] Arc lengths
---@param n integer Number of stations
---@param lanesL number Number of lanes on the left
---@param lanesR number Number of lanes on the right
---@param divided boolean true if divided carriageways
---@return number[]  Left edge widening per station (m)
---@return number[]  Right edge widening per station (m)
function editor_toolUtilities_curveWiden.edgeWiden(group, div, s, n, lanesL, lanesR, divided) end

--- Signed horizontal curvature at station i (0 at the ends or if degenerate). Positive = left turn, negative = right.
---Source: lua/ge/extensions/editor/toolUtilities/curveWiden.lua:28
---@param div table Centerline points {x,y,z}
---@param i integer Station index
---@param n integer Number of stations
---@return number  Curvature in 1/m.
function editor_toolUtilities_curveWiden.signedCurvatureAt(div, i, n) end

--- Smooths in place a signed array by box averaging over a physical half-window hw (m), each sample being weighted by the arc length it represents. Prevents the dense area of a turn from dominating the average and creating a lateral step at the straight/arc junction.
---Source: lua/ge/extensions/editor/toolUtilities/curveWiden.lua:62
---@param arr number[] Values to smooth (modified in place)
---@param s number[] Arc length table
---@param n integer Number of samples
---@param hw number Half-window in meters; no effect if <= 0 or n < 3
function editor_toolUtilities_curveWiden.smoothByDistance(arr, s, n, hw) end

--- TOTAL widening per station (m, split over both sides): automatic curvature widening plus extraWidenM per turn, smoothed over arc length. Zero on a straight line, if curveWidenMaxM = 0 without a turn override, and outside engineered mode.
---Source: lua/ge/extensions/editor/toolUtilities/curveWiden.lua:125
---@param group table Group/road (geometryMode, curveWidenMaxM, curveWidenRunoffM, engRadiusM, divCurv, discMap, corners).
---@param div table divPoints
---@param s number[] Result of arcLengths
---@param n integer Number of stations
---@return number[]  Widening per station (m).
function editor_toolUtilities_curveWiden.stationWiden(group, div, s, n) end

