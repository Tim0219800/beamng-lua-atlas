# `editor_objectScreenSizeViz`

*File: `lua/ge/extensions/editor/objectScreenSizeViz.lua` · VM: Game Engine (GE) · 268 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_objectScreenSizeViz`: `extensions.load("editor_objectScreenSizeViz")`, then the global `editor_objectScreenSizeViz`

"Object Screen Size" debug tool (Debug menu) of the World Editor. For the selected objects (editor.selection.object) and forest items (editor.selection.forestItem), it computes the distance to the camera and the size in pixels on screen of their world bounding box (projection of the 8 corners with the camera's field of view). It can draw the box (orange lines), a camera-center line (magenta) and an overlay rectangle on screen. Useful to tune LOD distances and the visible size of objects.

## Notes

- worldToScreen01 returns nil for a point behind the camera (depth <= 0); those corners are ignored in the rectangle computation.
- No data is modified: the tool is purely visual.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_objectScreenSizeViz.onEditorGui()` | Editor hook called every frame: draws the "Object Screen Size" window (display checkboxes and results per selected object) and the debug lines. *(internal)* *(hook)* | 160 |
| `editor_objectScreenSizeViz.onEditorInitialized()` | Hook called at editor initialization: registers the window (480x320) and the "Object Screen Size" menu entry (Debug group). *(internal)* *(hook)* | 259 |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`
- `obj:` `getClassName`, `getID`, `getName`, `getWorldBox`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/objectScreenSizeViz.lua`.*
