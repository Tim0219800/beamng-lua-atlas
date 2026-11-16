# `editor_cefHelper`

*File: `lua/ge/extensions/editor/cefHelper.lua` · VM: Game Engine (GE) · 23 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_cefHelper`: `extensions.load("editor_cefHelper")`, then the global `editor_cefHelper`

Small tool intended to hide the CEF interface (scenetree.maincef) when the imgui editor is active. In version 0.40.5 the code is commented out ("disabled for release due to bugs with the track editor"), so the module does nothing.

## Notes

- Both hooks are empty: the lines scenetree.maincef.visible = true/false are commented out.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_cefHelper.onEditorActivated()` | Called when the editor is activated. Should hide the CEF UI but is disabled (body commented out). *(internal)* *(hook)* | 14 |
| `editor_cefHelper.onEditorDeactivated()` | Called when the editor is deactivated. Should show the CEF UI again but is disabled (body commented out). *(internal)* *(hook)* | 9 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/cefHelper.lua`.*
