# `editor_flowgraph_legend`

*File: `lua/ge/extensions/editor/flowgraph/legend.lua` · VM: Game Engine (GE) · 57 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/flowgraph/legend")` (file under extensions/ but not a regular extension)

"Legend Test" window (fg_legend) of the Flowgraph editor. It is a test skeleton: four reorderable and closable tabs A, B, C, D (ImGui TabBar) with a display of the list of open tabs. Unrelated to the actual graph.

## Class `C`

Legend window class (windowName = 'fg_legend').

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(data)` | Deserialization (empty). | 52 |
| `C:_onSerialize(data)` | Serialization (empty). | 48 |
| `C:attach(mgr)` | Associates the flowgraph manager. | 11 |
| `C:draw()` | Draws the test tab bar if the window is visible. | 25 |
| `C:init()` | Registers the window and creates the 4 test items. | 15 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/flowgraph/legend.lua`.*
