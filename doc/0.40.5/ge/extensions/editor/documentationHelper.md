# `editor_documentationHelper`

*File: `lua/ge/extensions/editor/documentationHelper.lua` · VM: Game Engine (GE) · 23 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_documentationHelper`: `extensions.load("editor_documentationHelper")`, then the global `editor_documentationHelper`

Small editor extension that adds to the global `editor` table two functions to open BeamNG's online documentation in the browser. The other editor tools use it for their help buttons.

## Example

```lua
editor.openHelp("terrain_editor")  -- opens https://documentation.beamng.com/world_editor/terrain_editor.html
```

## Notes

- The functions are only installed in `editor` at the onEditorInitialized hook; before that editor.openHelp is nil.
- Without an argument, the "index" page is opened.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_documentationHelper.onEditorInitialized()` | Hook called by the editor when it is initialized. Installs editor.openHelp and editor.openCodingHelp. *(internal)* *(hook)* | 16 |

## Class `editor`

Functions added to the global `editor` table by onEditorInitialized.

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.openCodingHelp(contextPageName)` | Opens the editor API reference in the browser: https://documentation.beamng.com/world_editor/api_reference/<page>.html. | 12 |
| `editor.openHelp(contextPageName)` | Opens https://documentation.beamng.com/world_editor/<page>.html in the browser. | 8 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/documentationHelper.lua`.*
