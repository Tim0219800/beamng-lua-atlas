# `flowgraph_nodes_gameplay_race_raceMarkers`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua` · VM: Game Engine (GE) · 175 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/race/raceMarkers")` (file under extensions/ but not a regular extension)

Flowgraph node "Race Markers" (category repeat_instant, tag scenario). Displays in 3D (module scenario/race_marker) the race markers of a vehicle and draws the same points on the minimap. On first flow with raceData, creates one marker per pathnode (position, radius, normal, position of the next one); on each rollingStarted/pathnodeReached/raceStarted event of the vehicle, recomputes the modes (default, next, start, lap, recovery, final, branch, hidden) from state.nextPathnodes and overNextPathnodes. Inputs: clear (pulse that removes the markers), raceData, vehId, ignoreRecovery, minAlpha (0.15), maxAlpha (1), minDistance (5), maxDistance (50), alwaysShowFinal.

## Notes

- The pins minAlpha, maxAlpha, minDistance, maxDistance are declared but never read in this file.
- The old pin 'reset' is redirected to 'clear'.
- A stray "]]" remains in the code (leftover of a commented-out block).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Destroys the markers (markers.onClientEndMission) and empties the route. | 156 |
| `C:destroy()` | Node destruction: calls _executionStopped. | 169 |
| `C:init()` | Initializes markers, minimapMarkers and route. | 45 |
| `C:onClientEndMission()` | Mission end hook: calls _executionStopped. | 164 |
| `C:onDrawOnMinimap(td)` | Minimap hook: draws a line (pathnode with normal) or a circle for each non-hidden marker, with an edge pointer. | 135 |
| `C:onMinimapRouteOverride(routeOverrides)` | Minimap hook: adds to routeOverrides a copy of the race's detailed path aiDetailedPath (closed again if it is closed). | dyn |
| `C:onPreRender(dt, dtSim)` | Render hook: calls markers.render(dt, dtSim). | 149 |
| `C:work()` | Handles clear; creates the markers if needed and updates their modes on race events. | 50 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua`.*
