# `flowgraph_nodes_vehicle_ai_scriptAI_playRecording`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua` · VM: Game Engine (GE) · 130 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording")` (file under extensions/ but not a regular extension)

Node "Play ScriptAI Recording" (color ai, repeat_p_duration). Makes a vehicle replay a ScriptAI recording read from a .track.json file. Inputs: start (pulse), stop (pulse), fileName, vehId (no value = player), loopCount (-1 by default if empty). The file is searched relative to the project then in /replays/scriptai/tracks/. Data renderDebug: draws the path. No output pins.

## Notes

- The file's comment states that the category is technically f_duration but that no callback exists for end pins.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Displays a Load button, the state and the recording info (vehicle, level, number of points, duration); draws the path if renderDebug. | 96 |
| `C:getVeh()` | Returns the vehicle whose id is given as input, or the player's vehicle (getPlayerVehicle(0)) without input. | 44 |
| `C:init()` | Initializes recording=nil, data.renderDebug=false and running=false. | 32 |
| `C:loadRecording()` | Reads the JSON file trying three locations (relative to the project, tracks folder, tracks folder + extension) and stores it. | 76 |
| `C:play()` | Loads the recording, sets loopCount and loopType "firstOnlyTeleport" then sends ai.startFollowing(recording). | 54 |
| `C:postInit()` | Restricts the file picker of fileName to .track.json files. | 38 |
| `C:stop()` | Sets running to false and sends ai.stopFollowing() to the vehicle. | 67 |
| `C:work()` | Calls play on the start pulse, or stop on the stop pulse. | 88 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua`.*
