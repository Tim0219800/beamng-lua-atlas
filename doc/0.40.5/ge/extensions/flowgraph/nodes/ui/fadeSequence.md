# `flowgraph_nodes_ui_fadeSequence`

*File: `lua/ge/extensions/flowgraph/nodes/ui/fadeSequence.lua` · VM: Game Engine (GE) · 81 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/fadeSequence")` (file under extensions/ but not a regular extension)

Flowgraph node "Fade Sequence" (category once_f_duration, obsolete): chains fade to black, pause and fade from black via ui_fadeScreen.fadeSequence. Inputs: "startDuration" (0.75), "pauseDuration" (0), "endDuration" (0.75). Output "faded" (pulse when the screen is black). The code recommends Fade To Black + Fade From Black instead.

## Notes

- C.todo: "Obsolete; use Fade To Black and Fade From Black nodes instead."

**Dependencies (loaded first):** `ui_fadeScreen`, `gameplay_missions_missionManager`

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Resets the state and the faded pin. | 47 |
| `C:init()` | Duration state 'inactive', fadedTriggered = false. | 33 |
| `C:onNodeReset()` | Resets the state and the faded pin. | 54 |
| `C:onScreenFadeState(state)` | Hook: state 1 -> faded = true; state 3 -> finished. | 73 |
| `C:postInit()` | Duration templates at 0.75 for startDuration and endDuration. | 38 |
| `C:work()` | Turns 'faded' into a pulse (reset to false on the next frame). | 65 |
| `C:workOnce()` | Starts the sequence with the three durations (defaults 1, 0, 1 if nil). | 60 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/fadeSequence.lua`.*
