# `flowgraph_nodes_recording_stopReplay`

*File: `lua/ge/extensions/flowgraph/nodes/recording/stopReplay.lua` · VM: Game Engine (GE) · 23 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/recording/stopReplay")` (file under extensions/ but not a regular extension)

Flowgraph node 'Stop Replay' (repeat_instant category). Stops the current playback: if core_replay.state.state is 'playback', calls core_replay.stop(). No pins.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Stops the replay if it is playing. | 15 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/recording/stopReplay.lua`.*
