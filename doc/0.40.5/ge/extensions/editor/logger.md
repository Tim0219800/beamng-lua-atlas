# `editor_logger`

*File: `lua/ge/extensions/editor/logger.lua` · VM: Game Engine (GE) · 18 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_logger`: `extensions.load("editor_logger")`, then the global `editor_logger`

Empty editor extension (skeleton). It declares onEditorGui and onExtensionLoaded without any code: no window or behavior is added.

## Notes

- Both functions in the file are empty shells; the file is loaded as an editor extension because it contains "M.onEditor".

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_logger.onEditorGui()` | Hook called every frame by the editor to draw the interface. Empty body here. *(internal)* *(hook)* | 9 |
| `editor_logger.onExtensionLoaded()` | Hook called when the extension loads. Empty body here. *(internal)* *(hook)* | 12 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/logger.lua`.*
