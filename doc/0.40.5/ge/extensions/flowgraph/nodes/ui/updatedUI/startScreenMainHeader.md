# `flowgraph_nodes_ui_updatedUI_startScreenMainHeader`

*File: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenMainHeader.lua` · VM: Game Engine (GE) · 29 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/updatedUI/startScreenMainHeader")` (file under extensions/ but not a regular extension)

Node "Screen Main Header" (repeat_instant, color ui). Adds a large header to the screen (usually the mission name). Inputs: flow, header (string), preHeader (string, e.g. the mission type). Output: flow (chainFlow).

## Notes

- The preHeader pin has "Header" as its default value (same as header).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Copies flow then calls modules.ui:addHeader({header=..., preHeader=...}). | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenMainHeader.lua`.*
