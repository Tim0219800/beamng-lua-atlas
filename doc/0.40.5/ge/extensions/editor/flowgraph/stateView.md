# `editor_flowgraph_stateView`

*File: `lua/ge/extensions/editor/flowgraph/stateView.lua` · VM: Game Engine (GE) · 80 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/flowgraph/stateView")` (file under extensions/ but not a regular extension)

"State View" window (fg_stateView) of the Flowgraph editor. It lists, graph by graph (recursively from mgr.stateGraph), the states ('states/stateNode' nodes whose target graph is not a stategraph) with a play/pause icon depending on whether they are running. Pure display: nothing is modified in the project. Created via _flowgraph_createMgrWindow, so instantiated by flowgraphEditor for each manager.

## Notes

- A state is displayed as "running" only if mgr.runningState == 'running' and mgr.states:isRunning(state.id) returns true.
- States and child graphs are sorted by increasing id.

## Class `C`

Window class (windowName 'fg_stateView', windowDescription 'State View'). The methods are those called by flowgraphEditor via basewindow.

| Method | Description | Line |
|---|---|---|
| `C:attach(mgr)` | Stores the current flowgraph manager in self.mgr. Called on each manager change. | 18 |
| `C:draw()` | Draws the "States View" window if it is visible, from self.mgr.stateGraph. Called every frame by drawEditor. | 63 |
| `C:drawStategraphRecursive(graph, depth)` | Draws in two columns the graph name (in brackets, preceded by ' - ' per depth level) then its states with the play_circle_filled icon (running) or pause_circle_outline (stopped), then descends into the child graphs. | 22 |
| `C:init()` | Creates the ImGui text filter and registers the window in the editor (size 150x300, hidden by default). | 13 |
| `C:selectNode(node, append)` | Selects a node in the graph editor (fge.SelectNode). | 75 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/flowgraph/stateView.lua`.*
