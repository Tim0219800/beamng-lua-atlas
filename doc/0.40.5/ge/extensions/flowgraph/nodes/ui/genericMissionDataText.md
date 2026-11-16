# `flowgraph_nodes_ui_genericMissionDataText`

*File: `lua/ge/extensions/flowgraph/nodes/ui/genericMissionDataText.lua` · VM: Game Engine (GE) · 83 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/genericMissionDataText")` (file under extensions/ but not a regular extension)

Flowgraph node "Generic Mission Text" (category repeat_instant, duration): displays info in the "Generic Mission Data" app. Inputs: "title" (translation key), "txt", "icon" (info), "order", "category" (flowgraph), "style" (text, time or timemillis), "clear". Only one message per category. The time/timemillis styles convert seconds to MM:SS or MM:SS.mmm.

## Notes

- If title and txt are nil or if 'clear' is true, the info is cleared (the whole list if category is nil).
- The 'icon' pin is declared but never sent to the UI.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:init()` | Creates the reused uiData table. | 29 |
| `C:postInit()` | Templates: styles and titles (time, pickups). | 33 |
| `C:work()` | Sends or clears the data via ui_apps_genericMissionData.setData and signals genericMissionDataChanged to the ui module. | 46 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/genericMissionDataText.lua`.*
