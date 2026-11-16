# `flowgraph_nodes_ui_fadeFromBlack`

*File: `lua/ge/extensions/flowgraph/nodes/ui/fadeFromBlack.lua` · VM: Game Engine (GE) · 69 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/fadeFromBlack")` (file under extensions/ but not a regular extension)

Flowgraph node "Fade From Black" (category once_f_duration): fades the screen in from black. Input "duration" (0.75 s by default). Duration output handled by setDurationState (flow "complete", former name "done"). Uses ui_fadeScreen.fadeFromBlack, or ends the loading screen (server.fadeoutLoadingScreen) if the game is loading.

## Notes

- Depends on ui_fadeScreen and gameplay_missions_missionManager.
- If the screen is already not black or if the fade was stopped, goes directly to the 'finished' state.
- The 'finished' state also arrives through the onScreenFadeState(3) hook.

**Dependencies (loaded first):** `ui_fadeScreen`, `gameplay_missions_missionManager`

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Resets the 'inactive' state and isFadeScreenActive = false. | 38 |
| `C:init()` | Duration state 'inactive'. | 28 |
| `C:onNodeReset()` | Resets the 'inactive' state. | 44 |
| `C:onScreenFadeState(state)` | Hook called by ui_fadeScreen with the fade state; state 3 ends the node. | 63 |
| `C:postInit()` | Duration template: 0.75 (default duration of mission fades). | 32 |
| `C:workOnce()` | Starts the fade from black (or ends loading) and updates the duration state. | 48 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/fadeFromBlack.lua`.*
