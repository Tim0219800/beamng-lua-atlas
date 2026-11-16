# `flowgraph_nodes_gameplay_race_fileRace`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua` · VM: Game Engine (GE) · 180 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/race/fileRace")` (file under extensions/ but not a regular extension)

Flowgraph node "File Race" (tag scenario, no category defined). Manages a complete race from a pathData (File Path node): creates a gameplay/race/race object on first flow, gives it the path, the rolling start, the number of laps (only if the path is closed, otherwise 1), the automatic AI mode, the hotlapping app, the debug draw and the waypoint sound, then calls race:onUpdate(dtSim) every frame (unless the idle pin has flow). The number of vehicles is adjustable in the editor (pins vehId_1...vehId_N). Outputs: flow, active, complete, vehicleChanged, raceData, aiPath (navgraphPath for Follow Waypoints) and time (total duration at the end, for vehId_1).

## Notes

- Data options: useHotlappingApp (true), useDebugDraw (false), useWaypointAudio (true).
- Only existing vehicles (getObjectByID) are passed to race:setVehicleIds.
- The complete, active and time pins only reflect the state of vehicle vehId_1.
- Pins hasSecVeh/changeVeh/primVehId/secVehId: allow switching only once to a secondary vehicle via race:changeRaceVehicle.
- The old pins vehID, vehId and vehID_1 are redirected to vehId_1 (legacyPins).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets race, started and vehicleChanged. | 103 |
| `C:_executionStopped()` | Calls race:stopRace() if a race exists, then forgets it. | 109 |
| `C:_onDeserialized(res)` | Rereads count (default 1) and recreates the pins. | 99 |
| `C:_onSerialize(res)` | Saves count in the serialization table. | 95 |
| `C:drawCustomProperties()` | Editor field "Vehicle Count" that adds or removes vehId_i pins. | 59 |
| `C:drawMiddle(builder, style)` | Displays "Started" or "Stopped" in the node. | 115 |
| `C:init(mgr, ...)` | Initializes the state (started, race, count = 1) and the data options. | 45 |
| `C:postInit()` | Creates the vehId_i pins according to self.count. | 55 |
| `C:updatePins(old, new)` | Changes the number of vehId_i pins from old to new: removes the extra pins (and their links) or creates new ones. | 77 |
| `C:work(args)` | Handles reset, starts the race on first flow, updates it every frame and fills the output pins. | 120 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua`.*
