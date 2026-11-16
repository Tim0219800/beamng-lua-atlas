# `editor_toolUtilities_curveWiden`

*File: `lua/ge/extensions/editor/toolUtilities/curveWiden.lua` · VM: Game Engine (GE) · 226 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_curveWiden`: `extensions.load("editor_toolUtilities_curveWiden")`, then the global `editor_toolUtilities_curveWiden`

Road widening in turns for the 'engineered' roads of the editor's road tools. Computes, per centerline station (group.divPoints), an automatic widening based on the sustained curvature (the tighter the turn relative to the design radius group.engRadiusM, the wider the road gets, up to curveWidenMaxM) to which the extraWidenM per turn are added. Everything is smoothed over a physical distance (arc length), not over a number of stations.

## Notes

- Active only if group.geometryMode == 'engineered'; smooth roads (Catmull-Rom) do not widen.
- Fields read from the group: curveWidenMaxM (default 2.5 m, total of both sides), curveWidenRunoffM (default 20 m, entry/exit length), engRadiusM (default 40 m), divCurv (exact curvature if of length n), discMap, corners[i].extraWidenM, divWidths.
- Widening starts at the design radius, full widening at 0.35 x that radius (floor 6 m); smoothstep ramp.
- edgeWiden: 6 m design vehicle (offtrackLenM), minimum threshold per lane 0.3 m.
- smoothByDistance modifies the array in place.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_curveWiden.applyDivWidthWiden(group)` | Adds the per-station widening to group.divWidths in place (to be called once per 'dirty' pass, right after sampling the base widths). For tools whose mesh is symmetric according to divWidths, this widens the asphalt itself; heroRoad widens its mesh separately and only uses it to shift markings/ribbon. No effect if nothing widens. | 161 |
| `editor_toolUtilities_curveWiden.arcLengths(div, n)` | Cumulative arc length along the divPoints (s[1] = 0), in 3D. Used to express the runoff as a true distance. | 44 |
| `editor_toolUtilities_curveWiden.edgeWiden(group, div, s, n, lanesL, lanesR, divided)` | Actual widening per station on each edge (left and right relative to the direction of travel): each lane takes the design vehicle's 'offtracking' over the sustained radius, R - sqrt(R^2 - L^2) with L = 6 m, suppressed below 0.3 m, all capped at curveWidenMaxM. Goes on the inner edge of the turn; a divided road widens each carriageway on its outer edge (the median has no room). | 175 |
| `editor_toolUtilities_curveWiden.signedCurvatureAt(div, i, n)` | Signed horizontal curvature at station i (0 at the ends or if degenerate). Positive = left turn, negative = right. | 28 |
| `editor_toolUtilities_curveWiden.smoothByDistance(arr, s, n, hw)` | Smooths in place a signed array by box averaging over a physical half-window hw (m), each sample being weighted by the arc length it represents. Prevents the dense area of a turn from dominating the average and creating a lateral step at the straight/arc junction. | 62 |
| `editor_toolUtilities_curveWiden.stationWiden(group, div, s, n)` | TOTAL widening per station (m, split over both sides): automatic curvature widening plus extraWidenM per turn, smoothed over arc length. Zero on a straight line, if curveWidenMaxM = 0 without a turn override, and outside engineered mode. | 125 |

### Parameter details

#### `editor_toolUtilities_curveWiden.applyDivWidthWiden(group)`

Adds the per-station widening to group.divWidths in place (to be called once per 'dirty' pass, right after sampling the base widths). For tools whose mesh is symmetric according to divWidths, this widens the asphalt itself; heroRoad widens its mesh separately and only uses it to shift markings/ribbon. No effect if nothing widens.

- `group` (*table*) : Group with divPoints and divWidths.

#### `editor_toolUtilities_curveWiden.arcLengths(div, n)`

Cumulative arc length along the divPoints (s[1] = 0), in 3D. Used to express the runoff as a true distance.

- `div` (*table*) : Points {x,y,z}
- `n` (*integer*) : Number of points
- **returns**: number[] Array s of cumulative lengths (m).

#### `editor_toolUtilities_curveWiden.edgeWiden(group, div, s, n, lanesL, lanesR, divided)`

Actual widening per station on each edge (left and right relative to the direction of travel): each lane takes the design vehicle's 'offtracking' over the sustained radius, R - sqrt(R^2 - L^2) with L = 6 m, suppressed below 0.3 m, all capped at curveWidenMaxM. Goes on the inner edge of the turn; a divided road widens each carriageway on its outer edge (the median has no room).

- `group` (*table*) : Group/road.
- `div` (*table*) : divPoints
- `s` (*number[]*) : Arc lengths
- `n` (*integer*) : Number of stations
- `lanesL` (*number*) : Number of lanes on the left
- `lanesR` (*number*) : Number of lanes on the right
- `divided` (*boolean*) : true if divided carriageways
- **returns**: number[] Left edge widening per station (m)
- **returns**: number[] Right edge widening per station (m)

#### `editor_toolUtilities_curveWiden.signedCurvatureAt(div, i, n)`

Signed horizontal curvature at station i (0 at the ends or if degenerate). Positive = left turn, negative = right.

- `div` (*table*) : Centerline points {x,y,z}
- `i` (*integer*) : Station index
- `n` (*integer*) : Number of stations
- **returns**: number Curvature in 1/m.

#### `editor_toolUtilities_curveWiden.smoothByDistance(arr, s, n, hw)`

Smooths in place a signed array by box averaging over a physical half-window hw (m), each sample being weighted by the arc length it represents. Prevents the dense area of a turn from dominating the average and creating a lateral step at the straight/arc junction.

- `arr` (*number[]*) : Values to smooth (modified in place)
- `s` (*number[]*) : Arc length table
- `n` (*integer*) : Number of samples
- `hw` (*number*) : Half-window in meters; no effect if <= 0 or n < 3

#### `editor_toolUtilities_curveWiden.stationWiden(group, div, s, n)`

TOTAL widening per station (m, split over both sides): automatic curvature widening plus extraWidenM per turn, smoothed over arc length. Zero on a straight line, if curveWidenMaxM = 0 without a turn override, and outside engineered mode.

- `group` (*table*) : Group/road (geometryMode, curveWidenMaxM, curveWidenRunoffM, engRadiusM, divCurv, discMap, corners).
- `div` (*table*) : divPoints
- `s` (*number[]*) : Result of arcLengths
- `n` (*integer*) : Number of stations
- **returns**: number[] Widening per station (m).

## Fields

| Field | Type | Description |
|---|---|---|
| `DEFAULT_MAX` | number | Default maximum widening (2.5 m in total, split over both sides). |
| `DEFAULT_RUNOFF` | number | Default length (20 m) over which the widening enters/exits. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/curveWiden.lua`.*
