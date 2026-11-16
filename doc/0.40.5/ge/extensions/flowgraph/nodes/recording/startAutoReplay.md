# `flowgraph_nodes_recording_startAutoReplay`

*File: `lua/ge/extensions/flowgraph/nodes/recording/startAutoReplay.lua` · VM: Game Engine (GE) · 27 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/recording/startAutoReplay")` (file under extensions/ but not a regular extension)

Flowgraph node 'Start Auto Replay'. On the 'startNewRec' impulse, stops the current recording and starts a new one via the manager's missionReplay module; if the aiRecording module exists, also starts the AI recording and replay.

## Notes

- No C.category defined.
- work runs every frame, without testing the input impulse 'startNewRec'.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Calls missionReplay:startNewRec() then, if aiRecording exists, startAiRecording() and startAiReplay(). | 16 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/recording/startAutoReplay.lua`.*
