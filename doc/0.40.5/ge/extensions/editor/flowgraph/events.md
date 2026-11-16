# `editor_flowgraph_events`

*File: `lua/ge/extensions/editor/flowgraph/events.lua` · VM: Game Engine (GE) · 156 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/flowgraph/events")` (file under extensions/ but not a regular extension)

"Event Log" window (fg_events) of the Flowgraph editor: log of the project's events (levels Debug, Info, Warning, Error, States) with colors, "Hide Duplicates" options, time format (Project Time, Global Time, Frame) and auto scroll (flowgraph.general.* preferences). Double-clicking an entry linked to a node or graph navigates to it. Returns _flowgraph_createMgrWindow(C).

## Notes

- In handleMeta, the meta.type == 'graph' branch reads e.meta.node.graph while only e.meta.graph is tested: if meta.node is nil, this path would raise an error (inconsistency in the game code).
- Used via require, not as a regular extension.

## Class `C`

Event Log window class (windowName = 'fg_events').

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(data)` | Deserialization (empty). | 151 |
| `C:_onSerialize(data)` | Serialization (empty). | 147 |
| `C:attach(mgr)` | Associates the flowgraph manager. | 17 |
| `C:draw()` | Draws the "Event Log" window if it is visible. | 116 |
| `C:drawContent()` | Draws the controls (Hide Duplicates, Time Format, Auto Scroll) and the columned list of events. | 29 |
| `C:handleMeta(e)` | Handles the tooltip and double-click of an entry that has metadata (node or graph): selects the graph and centers the view. | 123 |
| `C:init()` | Registers the editor window (150x300). | 21 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/flowgraph/events.lua`.*
