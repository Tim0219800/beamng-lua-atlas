# `flowgraph_nodes_debug_comment`

*File: `lua/ge/extensions/flowgraph/nodes/debug/comment.lua` · VM: Game Engine (GE) · 284 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/debug/comment")` (file under extensions/ but not a regular extension)

Flowgraph node "Comment" (category logic, tag group, no pins). Places a comment in the graph, as a resizable group frame that can visually group nodes. Editable properties: title, text (2048 characters max), alpha, background/border/text colors, "Simple" mode (no group, just text) and move mode (With Nodes: the nodes inside move with the frame; Without Nodes). Editor only, no effect at runtime. Serializes size, colors, alpha, title, text (line breaks are escaped as \n), simple and moveMode.

## Notes

- In _onDeserialized, the test to load borderColor checks nodeData.backgroundColor (not borderColor): crashes if borderColor is absent while backgroundColor exists.
- drawCustomProperties calls dump(self.te) if a text editor exists, but self.te is never created (commented-out code).

## Class `C`

Node class (editor only).

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Restores the fields from the loaded data. | 167 |
| `C:_onSerialize(res)` | Adds the comment-specific fields to the result. | 155 |
| `C:draw()` | Draws the frame, the title, the resizable group and the group hint in the editor. | 208 |
| `C:drawCustomProperties()` | Draws the properties panel (title, alpha, colors, simple, move mode, text) and returns the change reason for the undo history. | 70 |
| `C:hideProperties()` | Called when the properties panel closes; no effect (commented-out code). | 65 |
| `C:init()` | Initializes size 200x200, title "Comment", colors (background gray 0.5, border 0.8, text white), alpha 0.75, moveMode 'withoutNodes', simple false. | 23 |
| `C:refreshColors()` | Recomputes the background, border and text ImVec4 from the float arrays. | 149 |
| `C:showProperties()` | Called when the properties panel opens; no effect (commented-out code). | 60 |
| `C:updateEditorPosition()` | Repositions the node in the editor when the manager opens (if the position is within valid bounds) and forces the size. | 198 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/debug/comment.lua`.*
