# `flowgraph_nodes_recording_playReplay`

*File: `lua/ge/extensions/flowgraph/nodes/recording/playReplay.lua` · VM: Game Engine (GE) · 30 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/recording/playReplay")` (file under extensions/ but not a regular extension)

Flowgraph node 'Play Replay' (repeat_instant category). On the 'play' impulse, loads and starts a replay with core_replay.loadFile. The path is resolved relative to the flowgraph project via mgr:getRelativeAbsolutePath({filename}).

## Notes

- The description of the 'filename' pin ('The prefix for the generated filename') is copied from the Record Replay node: here it is the name of the file to read.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:work()` | If 'play' is active and the path exists, calls core_replay.loadFile(path). | 19 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/recording/playReplay.lua`.*
