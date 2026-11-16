# `editor_flowgraph_history`

*File: `lua/ge/extensions/editor/flowgraph/history.lua` · VM: Game Engine (GE) · 90 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/flowgraph/history")` (file under extensions/ but not a regular extension)

"History" window (fg_history) of the Flowgraph editor: Undo/Redo buttons and list of actions (mgr.history) from most recent to oldest. The current entry (mgr.currentHistoryIndex) is marked "> ", undone entries are grayed out; clicking an entry calls mgr:goToHistory(index).

## Class `C`

History window class (windowName = 'fg_history').

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(data)` | Deserialization (empty). | 85 |
| `C:_onSerialize(data)` | Serialization (empty). | 81 |
| `C:attach(mgr)` | Associates the flowgraph manager. | 12 |
| `C:draw()` | Draws the window if visible: Undo, Redo and clickable Idx/Action table. | 20 |
| `C:init()` | Registers the editor window. | 16 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/flowgraph/history.lua`.*
