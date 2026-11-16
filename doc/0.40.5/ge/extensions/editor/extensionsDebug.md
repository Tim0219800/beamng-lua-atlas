# `editor_extensionsDebug`

*File: `lua/ge/extensions/editor/extensionsDebug.lua` · VM: Game Engine (GE) · 69 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_extensionsDebug`: `extensions.load("editor_extensionsDebug")`, then the global `editor_extensionsDebug`

Editor debug window (Window > Debug > Extensions Debug menu) that lists the loaded Lua extensions (extensions.getLoadedExtensionsNames()) as an imgui tree. Each extension expands to recursively show the content of its table (imguiUtils.addRecursiveTreeTable). Useful to a modder to inspect the state of an extension live.

## Notes

- The "Filters" checkbox is displayed but the filtering by type is commented out in the code: checking the box simply hides the detailed tree of each extension (nothing is displayed inside the nodes).
- The checkboxes funCheck/numCheck/strCheck/cdataCheck/boolCheck/tblCheck are declared but never used.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_extensionsDebug.onEditorGui()` | Draws the "Extensions Debug Window": Filters checkbox then one tree node per loaded extension, with the recursive content of extensions[name] when Filters is unchecked. *(internal)* *(hook)* | 33 |
| `editor_extensionsDebug.onEditorInitialized()` | Called when the editor is initialized: registers the "extensionsDebug" window and the "Extensions Debug" menu entry (Debug group). *(internal)* *(hook)* | 59 |
| `editor_extensionsDebug.onExtensionLoaded()` | Hook called when the extension is loaded; does nothing here. *(internal)* *(hook)* | 56 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/extensionsDebug.lua`.*
