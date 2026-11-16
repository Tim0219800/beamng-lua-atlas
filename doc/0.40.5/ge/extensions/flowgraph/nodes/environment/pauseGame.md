# `flowgraph_nodes_environment_pauseGame`

*File: `lua/ge/extensions/flowgraph/nodes/environment/pauseGame.lua` · VM: Game Engine (GE) · 42 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/environment/pauseGame")` (file under extensions/ but not a regular extension)

Flowgraph node "Pause Game" (category once_p_duration, author BeamNG, tags pause/freeze/halt/stop/interrupt). Pauses the simulation via simTimeAuthority.pause. The action is deferred to _afterTrigger (after all nodes have triggered in the frame).

## Notes

- Bug: the input pin "value" ("whether the game should be paused") is never read. workOnce always sets _pauseGame to true, so the node only pauses, never resumes.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | If requested and the game is not already paused, calls simTimeAuthority.pause(true), then resets the flag to false. | 31 |
| `C:_executionStarted()` | Resets the internal flag to false. | 23 |
| `C:workOnce()` | Requests the pause (flag set to true). | 27 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/environment/pauseGame.lua`.*
