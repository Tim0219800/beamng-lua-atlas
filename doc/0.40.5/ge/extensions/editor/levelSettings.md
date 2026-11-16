# `editor_levelSettings`

*File: `lua/ge/extensions/editor/levelSettings.lua` · VM: Game Engine (GE) · 34 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_levelSettings`: `extensions.load("editor_levelSettings")`, then the global `editor_levelSettings`

Minimal editor extension: registers an inspector handler for the "level_settings" selection type (which only displays the text "Level Settings") and adds editor.showLevelSettings() to select this pseudo-object.

## Example

```lua
editor.showLevelSettings() -- opens the "Level Settings" panel in the inspector
```

## Notes

- The panel only contains text: no setting is actually exposed by this file.
- showLevelSettings replaces editor.selection with an empty table then sets editor.selection.level_settings = {1}.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_levelSettings.onEditorActivated()` | Called when the editor is activated: registers the "level_settings" inspector type and defines editor.showLevelSettings. *(internal)* *(hook)* | 21 |
| `editor_levelSettings.onEditorDeactivated()` | Called when the editor is deactivated: removes the "level_settings" inspector type. *(internal)* *(hook)* | 26 |
| `editor_levelSettings.onExtensionLoaded()` | Hook called when the extension loads. Empty body. *(internal)* *(hook)* | 13 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/levelSettings.lua`.*
