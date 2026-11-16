# `editor_flowgraph_execution`

*File: `lua/ge/extensions/editor/flowgraph/execution.lua` · VM: Game Engine (GE) · 201 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/flowgraph/execution")` (file under extensions/ but not a regular extension)

"Task Manager" window (fg_execution) of the Flowgraph editor: lists all loaded flowgraph projects (core_flowgraphManager.getAllManagers) with their state (running/stopped, hidden, transient) and lets you start or stop them all at once. On global start, applies the Mission Editor's mission variables via missionVariableHelper before setRunning(true). Hidden/transient projects are only visible with the flowgraph.debug.editorDebug preference.

## Notes

- Can be displayed alone (drawAlone, title with ##alone suffix) or inside the editor (draw).
- The global restart button is commented out in the code.

## Class `C`

Task Manager window class (windowName = 'fg_execution').

| Method | Description | Line |
|---|---|---|
| `C:ExecutionView()` | Draws the content: Projects header, Start All / Stop All buttons, then each project. | 132 |
| `C:draw()` | Draws the window if it is visible. | 189 |
| `C:drawAlone()` | Displays the window outside a project's context (self.mgr = nil). | 181 |
| `C:drawManager(mgr)` | Draws a project's row: state icon, visibility, transient, name and buttons. | 22 |
| `C:init()` | Gets core_flowgraphManager and registers the window. | 16 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/flowgraph/execution.lua`.*
