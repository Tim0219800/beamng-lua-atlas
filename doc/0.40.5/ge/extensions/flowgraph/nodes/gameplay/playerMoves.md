# `flowgraph_nodes_gameplay_playerMoves`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/playerMoves.lua` · VM: Game Engine (GE) · 76 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/playerMoves")` (file under extensions/ but not a regular extension)

Flowgraph node "Detect Acceleration At Start" (category repeat_instant, timer icon). Used to start a mission when the player moves rather than after a countdown. Inputs: flow, reset (pulse that resets the initial position), vehId (tracked vehicle, otherwise player vehicle 0). Output: success (flow) true when the vehicle has moved more than 0.1 m away from its initial position. As long as the vehicle has not moved, sends the UI message 'ScenarioRealtimeDisplay' (missions.general.moveToStart, context accelerateToBegin); it is cleared on the first movement.

## Notes

- Option data.useScenarioRealtimeDisplay (true by default): enables the display of the start message.
- The position is read from map.objects[vehId].pos; if the vehicle is not listed there, the node does nothing.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the initial position and msgSent when the graph starts. | 28 |
| `C:init()` | Initializes initialPos to nil, msgSent to true and data.useScenarioRealtimeDisplay to true. | 20 |
| `C:work(args)` | Every frame: handles reset, stores the vehicle's initial position, shows/clears the start message and sets success to true if the vehicle has moved more than 0.1 m. | 33 |

**UI events (guihooks.trigger):** `ScenarioRealtimeDisplay`

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/playerMoves.lua`.*
