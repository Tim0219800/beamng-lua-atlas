# `flowgraph_nodes_ui_fadeToBlack`

*File: `lua/ge/extensions/flowgraph/nodes/ui/fadeToBlack.lua` · VM: Game Engine (GE) · 64 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/fadeToBlack")` (file under extensions/ but not a regular extension)

Flowgraph node "Fade To Black" (category once_f_duration): fades the screen to black. Input "duration" (0.75 s). Duration output via setDurationState (flow "complete", former name "done"). Goes directly to 'finished' if the screen is already black (ui_fadeScreen.isBlack).

## Notes

- Sets self.mgr.modules.ui.isFadeScreenActive = true so that Fade From Black knows a fade is active.

**Dependencies (loaded first):** `ui_fadeScreen`, `gameplay_missions_missionManager`

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Resets the 'inactive' state and isFadeScreenActive = false. | 38 |
| `C:init()` | Duration state 'inactive'. | 28 |
| `C:onNodeReset()` | Resets the 'inactive' state. | 44 |
| `C:onScreenFadeState(state)` | Hook: state 1 (black reached) -> finished. | 58 |
| `C:postInit()` | Duration template at 0.75. | 32 |
| `C:workOnce()` | Starts ui_fadeScreen.fadeToBlack (unless already black). | 48 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/fadeToBlack.lua`.*
