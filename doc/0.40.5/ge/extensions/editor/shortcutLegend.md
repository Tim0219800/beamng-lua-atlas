# `editor_shortcutLegend`

*File: `lua/ge/extensions/editor/shortcutLegend.lua` · VM: Game Engine (GE) · 175 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_shortcutLegend`: `extensions.load("editor_shortcutLegend")`, then the global `editor_shortcutLegend`

World editor window (no title bar) that displays a legend of the shortcuts of the active edit mode. It reads either editor.editMode.getLegendCurrentActionNames(), or the actions of the mode's actionMap (keyboard and mouse bindings from core_input_bindings), plus editor.editMode.auxShortcuts, then sorts them and displays them inline. An editor tool modder fills auxShortcuts or getLegendCurrentActionNames so that their shortcuts appear.

## Notes

- auxShortcuts is a table {editor.AuxControl_xxx flag or string = title}; numeric flags are combined into text (e.g. 'Ctrl + LMB').
- The title goes through _tr() for translation.
- The list is rebuilt only after an edit mode change (onEditorEditModeChanged).
- The 'zaxis' key is displayed as 'MouseWheel'.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_shortcutLegend.onEditorEditModeChanged(oldEditMode, newEditMode)` | Hook called when the edit mode changes: requests a rebuild of the shortcut list. *(internal)* *(hook)* | 165 |
| `editor_shortcutLegend.onEditorGui()` | Hook called every frame of the editor UI: rebuilds the shortcut list if needed and draws the centered legend with key badges. *(internal)* *(hook)* | 22 |
| `editor_shortcutLegend.onEditorInitialized()` | Hook called at editor initialization: fills the modifier name table (Ctrl, Shift, Alt, LMB, MMB, RMB, MouseWheel, Copy, Paste, etc.), registers and shows the shortcutLegend window. *(internal)* *(hook)* | 140 |
| `editor_shortcutLegend.onExtensionLoaded()` | Extension load hook; empty. *(internal)* *(hook)* | 137 |

### Parameter details

#### `editor_shortcutLegend.onEditorEditModeChanged(oldEditMode, newEditMode)`

Hook called when the edit mode changes: requests a rebuild of the shortcut list.

- `oldEditMode` (*table*) : Old edit mode.
- `newEditMode` (*table*) : New edit mode.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/shortcutLegend.lua`.*
