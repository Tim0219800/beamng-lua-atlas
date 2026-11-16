# `gameplay_rally_geometry`

*File: `lua/ge/extensions/gameplay/rally/geometry.lua` · VM: Game Engine (GE) · 544 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_geometry`: `extensions.load("gameplay_rally_geometry")`, then the global `gameplay_rally_geometry`

Prototype for automatic generation of rally notes from the road geometry. When a ground marker is active, it computes an optimized path between start and finish (map.optimizePath), saves it to temp/, then estimates for each node the curvature radius, the cornering speed (slick tires, friction 1.7) and a severity (Hairpin, Medium, Fast, Easy, Flat, Straight), groups the nodes into notes (e.g. 'Medium left long tightens') and draws them with debugDrawer. While driving, it displays the upcoming notes and sends the text to the UI via the guihooks 'ScenarioRealtimeDisplay'. Without a marker, it reloads the last saved route.

## Notes

- Only the onUpdate hook is exported; everything else is local.
- BUG: getRouteJsonPath calls string.format with the variables `level` and `map` which are not defined locally (the local variable is named levelName). The format only contains one %s: the file is therefore always temp/rally_route_nil.json, whatever the level.
- BUG: renderNode reads `currentVelocity`, a nonexistent global variable (nil): the displayed speed is always the node's.
- Two 'severities' tables are declared; the second (Hairpin, 2 to 6, max speeds 50/80/110/150/200/300 km/h) shadows the first and only it is used.
- Node speeds are in km/h, lengths in m, angles in degrees (positive = right).
- The 'debug = true' threshold makes all notes be drawn when the vehicle is stopped (speed < 1 m/s); when moving, only nearby notes are drawn.
- Development tool: it does not produce a notebook usable by the main rally system.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_geometry.onUpdate(dt, dtSim)` | Hook called every frame. (Re)generates the notes if the source changes (active ground marker or file cache), then reads the player vehicle's position and speed and draws the notes: all of them if the vehicle is stopped, otherwise the notes for the next 4 seconds (at least 2), and sends the 2nd note (if it is not a straight) to the ScenarioRealtimeDisplay UI message. *(internal)* *(hook)* | 502 |

### Parameter details

#### `gameplay_rally_geometry.onUpdate(dt, dtSim)`

Hook called every frame. (Re)generates the notes if the source changes (active ground marker or file cache), then reads the player vehicle's position and speed and draws the notes: all of them if the vehicle is stopped, otherwise the notes for the next 4 seconds (at least 2), and sends the 2nd note (if it is not a straight) to the ScenarioRealtimeDisplay UI message.

- `dt` (*number*) : Real-time delta (s).
- `dtSim` (*number*) : Simulation time delta (s); below 0.001 = game paused (then shows the node details).

**UI events (guihooks.trigger):** `ScenarioRealtimeDisplay`

## Calls into the engine (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/geometry.lua`.*
