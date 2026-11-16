# `flowgraph_nodes_recording_recordReplay`

*File: `lua/ge/extensions/flowgraph/nodes/recording/recordReplay.lua` · VM: Game Engine (GE) · 71 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/recording/recordReplay")` (file under extensions/ but not a regular extension)

Flowgraph node 'Record Replay' (repeat_f_duration category). Meant to record a replay of the current vehicle: the impulse 'start' then 'stop' call core_replay.toggleRecording(false). Output 'filename' updated by onReplayStateChanged when the state becomes 'recording'.

## Notes

- The C.todo field in the code notes that the replay system does not allow choosing other vehicles.
- start and stop both call toggleRecording(false) (toggle); the 'prefix' pin is only used in saveFile, which is never called.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Duration state 'inactive'. | 28 |
| `C:drawMiddle(builder, style)` | Displays the duration state. | 63 |
| `C:init()` | state = 'none'. | 24 |
| `C:onReplayStateChanged(state)` | Hook called by the replay system when its state changes; while recording, stores the loaded file in 'filename'. | 32 |
| `C:saveFile()` | Builds a file name (prefix or 'Recording_<id>' followed by a number) but does not use it: the function does nothing useful. | 38 |
| `C:work()` | State inactive: 'start' launches toggleRecording and goes to 'started'. State started: 'stop' launches toggleRecording again and goes to 'finished'. | 45 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/recording/recordReplay.lua`.*
