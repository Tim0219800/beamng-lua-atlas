# `flowgraph_nodes_recording_recordCamera`

*File: `lua/ge/extensions/flowgraph/nodes/recording/recordCamera.lua` · VM: Game Engine (GE) · 97 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/recording/recordCamera")` (file under extensions/ but not a regular extension)

Flowgraph node 'Record Camera' (repeat_f_duration category). Records a camera path with keyframes: the first 'snap' impulse starts the recording, each following 'snap' adds a key (pos, rot, os.clock time). The 'stop' impulse ends it and creates in MissionGroup a SimPath object with a Marker per key (position, rotation, timeToNext). Output 'filename': generated name (prefix + os.time()).

## Notes

- The first snap starts the recording and also adds the first key (both tests are evaluated in the same frame).
- The marker names are 'maker_N' (typo for marker).

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets to the inactive state, empties the path and stores the start time. | 30 |
| `C:drawMiddle(builder, style)` | Displays the state and the number of keys. | 88 |
| `C:finishUp()` | Creates the SimPath and the Markers (maker_N) from the recorded path, sets timeToNext and writes filename. | 36 |
| `C:init()` | Duration state 'inactive' and empty path. | 25 |
| `C:work()` | State inactive: snap starts the recording. State started: snap adds a key; stop goes to 'finished' and calls finishUp. | 69 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/recording/recordCamera.lua`.*
