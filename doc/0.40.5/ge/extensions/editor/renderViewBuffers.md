# `editor_renderViewBuffers`

*File: `lua/ge/extensions/editor/renderViewBuffers.lua` · VM: Game Engine (GE) · 306 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_renderViewBuffers`: `extensions.load("editor_renderViewBuffers")`, then the global `editor_renderViewBuffers`

Editor debug tool (menu Debug > "NamedTextureTarget Viewer") to preview render buffers (NamedTexTargets) with imgui: filterable list on the left, preview on the right with zoom/pan (wheel, drag), channel choice (RGBA, R, G, B) and view reset by double-click. Useful to inspect render targets, for example shadow maps.

## Notes

- The list of available textures is refreshed when the window goes from hidden to visible.
- onWindowMenuItem is local (not exported).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_renderViewBuffers.onEditorGui()` | Hook: draws the window (list + preview) and refreshes the target list on opening. *(internal)* *(hook)* | 274 |
| `editor_renderViewBuffers.onEditorInitialized()` | Hook: adds the Debug menu entry and registers the window (1100x700). *(internal)* *(hook)* | 297 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/renderViewBuffers.lua`.*
