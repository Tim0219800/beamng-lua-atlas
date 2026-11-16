# `editor_gizmoHelper`

*File: `lua/ge/extensions/editor/gizmoHelper.lua` · VM: Game Engine (GE) · 29 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_gizmoHelper`: `extensions.load("editor_gizmoHelper")`, then the global `editor_gizmoHelper`

Small utility to know whether the editor's axis gizmo is drawn. A tool calls gizmoDrawCalled() every frame it draws the gizmo; on the next frame, if nobody drew it any more, the module deselects the gizmo element on the engine side (setAxisGizmoSelectedElement(-1)).

## Example

```lua
-- in the onEditorGui of a tool that draws the gizmo
editor_gizmoHelper.gizmoDrawCalled()
if editor_gizmoHelper.isGizmoVisible() then ... end
```

## Notes

- isGizmoVisible reflects the previous frame (gizmoDrawnLastFrame), not the current frame.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_gizmoHelper.gizmoDrawCalled()` | To be called from a tool every frame it draws the axis gizmo; marks the gizmo as drawn for the current frame. | 17 |
| `editor_gizmoHelper.isGizmoVisible()` | Indicates whether the gizmo was drawn in the previous frame. | 21 |
| `editor_gizmoHelper.onEditorGui()` | Hook called every frame by the editor: if the gizmo was drawn in the previous frame but not in this one, deselects the gizmo element (-1); then shifts the frame flag and resets it to false. *(internal)* *(hook)* | 9 |

### Parameter details

#### `editor_gizmoHelper.isGizmoVisible()`

Indicates whether the gizmo was drawn in the previous frame.

- **returns**: boolean true if gizmoDrawCalled was called in the previous frame

## Calls into the engine (C++)

- `worldEditorCppApi.` `setAxisGizmoSelectedElement`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/gizmoHelper.lua`.*
