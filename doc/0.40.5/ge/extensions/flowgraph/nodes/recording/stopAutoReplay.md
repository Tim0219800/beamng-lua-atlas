# `flowgraph_nodes_recording_stopAutoReplay`

*File: `lua/ge/extensions/flowgraph/nodes/recording/stopAutoReplay.lua` · VM: Game Engine (GE) · 30 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/recording/stopAutoReplay")` (file under extensions/ but not a regular extension)

Flowgraph node 'Stop Auto Replay'. Stops the current recording if there is one (missionReplay module). If 'attemptNotCompleted' is true (mission attempt not completed), first saves the meta information without attempt.

## Notes

- work runs every frame, without testing the input impulse 'stopRec'.
- No C.category defined.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:work()` | If attemptNotCompleted: missionReplay:saveMetaInfoWithoutAttempt(); then missionReplay:stopIfRec(). | 20 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/recording/stopAutoReplay.lua`.*
