# `editor_imguiCDemo`

*File: `lua/ge/extensions/editor/imguiCDemo.lua` · VM: Game Engine (GE) · 26 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_imguiCDemo`: `extensions.load("editor_imguiCDemo")`, then the global `editor_imguiCDemo`

Editor extension that adds the "ImGui Demo" menu entry (Debug group of the Window menu). It opens the built-in Dear ImGui demo window (ui_imgui.ShowDemoWindow), useful to a modder to see all the available ImGui widgets. It writes no data.

## Notes

- The open state is a local BoolPtr (windowOpen); the demo window sets the value to false when the user closes it.
- onWindowMenuItem is local (not exported): it cannot be called from another module.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_imguiCDemo.onEditorGui()` | Called every frame by the editor; if the window is open, displays the ImGui demo window. *(internal)* *(hook)* | 9 |
| `editor_imguiCDemo.onEditorInitialized()` | Called at editor initialization; registers the "ImGui Demo" menu in the Debug group via editor.addWindowMenuItem. *(internal)* *(hook)* | 19 |

## Calls into the engine (C++)

- `ui_imgui.` `BoolPtr`, `ShowDemoWindow`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/imguiCDemo.lua`.*
