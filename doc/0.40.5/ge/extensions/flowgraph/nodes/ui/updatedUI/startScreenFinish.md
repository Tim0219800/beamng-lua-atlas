# `flowgraph_nodes_ui_updatedUI_startScreenFinish`

*File: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenFinish.lua` · VM: Game Engine (GE) · 27 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/updatedUI/startScreenFinish")` (file under extensions/ but not a regular extension)

Node "Screen Finish" (repeat_instant, color ui). Ends the building of a screen (start or end) and sends it to the UI. Input flow (chainFlow), output flow. To be placed at the end of the chain after StartScreen Begin / EndScreen Begin and the panel nodes.

## Notes

- The output flow pin is never written by work.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Emits the onStartScreenFinishedBuilding hook then calls modules.ui:finishUIBuilding(). | 21 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onStartScreenFinishedBuilding` — listened to by 1 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenFinish.lua`.*
