# `editor_extensionsEditor`

*File: `lua/ge/extensions/editor/extensionsEditor.lua` · VM: Game Engine (GE) · 76 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_extensionsEditor`: `extensions.load("editor_extensionsEditor")`, then the global `editor_extensionsEditor`

"Extensions Editor" window of the editor: lists all editor extensions (editor.allExtensionNames) and lets you enable/disable their loading by clicking the icon. The state is stored in editor.extensionsSettings[name].disabled then saved by editor.saveExtensionsSettings(). A Lua reload (Ctrl+L) is needed to apply the change; the editor's safe mode (Ctrl+F11) lets you disable a faulty extension.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_extensionsEditor.onEditorGui()` | Draws the window: help text and a one-column table with an icon button per extension (check mark = enabled, red "do_not_disturb" icon = disabled). A click toggles the disabled flag and saves the settings. *(internal)* *(hook)* | 15 |
| `editor_extensionsEditor.onEditorInitialized()` | Registers the "extensionsEditor" window (size 915x600) and the "Extensions Editor" menu entry. *(internal)* *(hook)* | 59 |
| `editor_extensionsEditor.onEditorPreferenceValueChanged(path, value)` | Empty hook (no preference handled). *(internal)* *(hook)* | 64 |
| `editor_extensionsEditor.onEditorRegisterPreferences(prefsRegistry)` | Empty hook: registers no preference. *(internal)* *(hook)* | 67 |

### Parameter details

#### `editor_extensionsEditor.onEditorPreferenceValueChanged(path, value)`

Empty hook (no preference handled).

- `path` (*string*) : Path of the modified preference
- `value` (*any*) : New value

#### `editor_extensionsEditor.onEditorRegisterPreferences(prefsRegistry)`

Empty hook: registers no preference.

- `prefsRegistry` (*table*) : Editor preferences registry

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/extensionsEditor.lua`.*
