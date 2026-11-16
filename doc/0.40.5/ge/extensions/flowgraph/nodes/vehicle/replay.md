# `flowgraph_nodes_vehicle_replay`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/replay.lua` · VM: Game Engine (GE) · 91 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/replay")` (file under extensions/ but not a regular extension)

Node "Timeline Replay" (`duration` behavior). Starts a replay file (`core_replay.loadFile`) at the start of its timeline segment and stops it (`core_replay.stop`) at the end. Input pins: `flow`, `filename` (string), `vehId`. The replays are listed in the editor (`core_replay.getRecordings`).

## Notes

- `C.todo`: prototype node, does not work in all cases.
- `init` calls `_setupTimeline(5, 10)`: timeline segment from 5 to 10 (timeline units).
- The `vehId` pin is not used in the code.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Stops the current replay. | 46 |
| `C:drawCustomProperties()` | "Load Replays" button and dropdown list to choose a recording. | 50 |
| `C:drawMiddle(builder, style)` | Displays the replay name and the internal flags. | 82 |
| `C:init()` | Constructor; configures the timeline (5 to 10) and `replayName`. | 28 |
| `C:onTimelineBegin(globalTime, localTime)` | Called at the start of the timeline segment; requests the replay start. | 72 |
| `C:onTimelineEnd(globalTime, localTime)` | Called at the end of the segment; requests the replay stop. | 77 |
| `C:work()` | Loads the replay (relative path of `filename`) if `startReplay`, or stops it if `stopReplay`. | 33 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/replay.lua`.*
