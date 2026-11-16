# `editor_ffiptrleaktest`

*File: `lua/ge/extensions/editor/ffiptrleaktest.lua` · VM: Game Engine (GE) · 75 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ffiptrleaktest`: `extensions.load("editor_ffiptrleaktest")`, then the global `editor_ffiptrleaktest`

Internal editor test extension (FFI pointer leaks with ImGui). It opens a "ffi ptr leak test" window with test widgets (checkbox, sliders, text field, image) and the ImGui demo window. It is disabled in this version: the file runs `do return M end` right after `local M = {}`, so the hooks are never exported.

## Notes

- Disabled: `do return M end` at the top of the file. The code that follows (and the export of M.onEditorGui / M.onEditorInitialized) is never executed.
- If it were enabled, onEditorGui would use `image.tex` while `image` is only created in onEditorInitialized (texture /art/dynamicDecals/textures/00_color_palette_test.png).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ffiptrleaktest.onEditorGui()` | Editor hook called every GUI frame: draws the ImGui test window. Not exported while the file is disabled. *(internal)* *(hook)* | 22 |
| `editor_ffiptrleaktest.onEditorInitialized()` | Hook called at editor initialization: registers the "ffi ptr leak test" window, its Window menu entry and loads the test texture. Not exported while the file is disabled. *(internal)* *(hook)* | 48 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ffiptrleaktest.lua`.*
