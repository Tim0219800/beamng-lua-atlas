# `editor_ezObjectSelect_selectionLabelOverlay`

*File: `lua/ge/extensions/editor/ezObjectSelect/selectionLabelOverlay.lua` · VM: Game Engine (GE) · 105 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_selectionLabelOverlay`: `extensions.load("editor_ezObjectSelect_selectionLabelOverlay")`, then the global `editor_ezObjectSelect_selectionLabelOverlay`

Draws the labels (dark panels with colored border) of the Easy Select tool with the imgui drawList. "followMouse" labels are stacked near the cursor (18 px offset, left side if they exit the viewport); the others are anchored above their screen position. Priority labels (label.priority == true) come first.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_selectionLabelOverlay.draw(drawList, labels, mouse, viewport)` | Draws all labels of the list. | 68 |

### Parameter details

#### `editor_ezObjectSelect_selectionLabelOverlay.draw(drawList, labels, mouse, viewport)`

Draws all labels of the list.

- `drawList` (*ImDrawList**) : imgui draw list
- `labels` (*table*) : List of labels {text, color (U32), followMouse, priority, position (ImVec2, if not followMouse)}
- `mouse` (*ImVec2*) : Mouse position
- `viewport` (*ImGuiViewport*) : Viewport (Pos and Size) used to keep labels visible

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/selectionLabelOverlay.lua`.*
