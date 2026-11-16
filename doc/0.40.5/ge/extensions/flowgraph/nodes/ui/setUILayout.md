# `flowgraph_nodes_ui_setUILayout`

*File: `lua/ge/extensions/flowgraph/nodes/ui/setUILayout.lua` · VM: Game Engine (GE) · 106 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/setUILayout")` (file under extensions/ but not a regular extension)

Flowgraph node "Set UI Layout" (category once_instant): changes the layout of the UI apps via self.mgr.modules.ui:setGameState. Inputs: flow, "reset" (allows retriggering), "layout" (name or layoutData table), "menu", "keepLayout" (keeps the layout after the graph stops), "gameStateName" (hidden), "appContainerContext" (topCenter container app to display, hidden). Output: flow.

## Notes

- If the 'restrictScenarios' setting is disabled, the 'freeroam' menu is forced (warning message).
- The layout/menu template lists are empty (call to ui_apps.getLayouts commented out).
- afterTrigger is written without an underscore, so it is never called by the engine: active (used by onUiChangedState) never becomes true.
- In onClientPostStartMission, 'menuState' is not defined in this function (nil global variable).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:afterTrigger()` | Sets active according to the input flow (name without underscore: probably never called). | 63 |
| `C:drawMiddle(builder, style)` | Empty central area. | 59 |
| `C:init()` | useFreeroamMenuWhenUnrestricted = true. | 29 |
| `C:onClientPostStartMission()` | Hook: reapplies the layout after the level starts. | 87 |
| `C:onUiChangedState(cur, prev)` | Hook: UI state change (cur, prev); in 'quickraceScenario' mode in the menu, triggers setQuickRaceMode and HotlappingResetApp. | 96 |
| `C:postInit()` | Fills the layout, menu and appContainerContext templates. | 33 |
| `C:workOnce()` | Applies the game state (layout/menu) and displays the requested container app. | 71 |

**UI events (guihooks.trigger):** `HotlappingResetApp`, `setQuickRaceMode`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/setUILayout.lua`.*
