# `editor_renderTest`

*File: `lua/ge/extensions/editor/renderTest.lua` · VM: Game Engine (GE) · 133 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_renderTest`: `extensions.load("editor_renderTest")`, then the global `editor_renderTest`

Editor debug tool ("Render test" window) intended to display a view of the scene rendered into a texture (top/bottom/left/right/front/back/3d views, ortho, near/far clip, fov, player vehicle tracking) via renderCameraToTexture. It is disabled: the module exports an empty table.

## Notes

- The exports M.onEditorInitialized and M.onEditorGui are commented out in the code ("renderCameraToTexture does not exist"): the extension therefore does nothing.
- In onEditorGui, the local variable "rot" is redefined (quatFromEuler(pi/2, 0, 0)) and shadows the one computed before; the view is therefore always the same.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/renderTest.lua`.*
