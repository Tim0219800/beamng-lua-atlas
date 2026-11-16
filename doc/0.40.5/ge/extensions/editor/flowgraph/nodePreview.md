# `editor_flowgraph_nodePreview`

*File: `lua/ge/extensions/editor/flowgraph/nodePreview.lua` · VM: Game Engine (GE) · 147 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/flowgraph/nodePreview")` (file under extensions/ but not a regular extension)

Tooltip preview of the Flowgraph editor: displays, in a small dedicated node editor (200x200), a library node, a macro or a hovered graph. It creates its own editor context, instantiates the node in a dummy graph ("nodePreview") or redraws the nodes and links of the graph, frames the content, then displays the name (and path) under the preview.

## Notes

- The mode (node, macro, graph) is chosen by setNode / setMacro / setGraph; draw only draws for the node and graph modes (the macro mode is not drawn).
- In graph mode, the position of each node is read from the main editor (self.fgEditor.ectx) then copied into the preview.
- An error while drawing a node is caught (xpcall) and flagged as a node error.

## Class `C`

Preview class (windowKind = 'nodePreview').

| Method | Description | Line |
|---|---|---|
| `C:attach(mgr)` | Associates the manager and creates the dummy 'nodePreview' graph. | 13 |
| `C:draw()` | Draws the preview tooltip if an element is hovered, saving/restoring the current editor. | 47 |
| `C:init()` | Initializes the state (hover, "node" mode, preview size 200x200). | 20 |
| `C:setGraph(graph)` | Sets the hovered element as a graph (graph mode). | 41 |
| `C:setMacro(macro)` | Sets the hovered element as a macro (macro mode). | 36 |
| `C:setNode(node)` | Sets the hovered element as a library node (node mode). | 30 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/flowgraph/nodePreview.lua`.*
