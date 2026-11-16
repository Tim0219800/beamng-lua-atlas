# `editor_rallyEditor_voicepacksTab`

*File: `lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua` · VM: Game Engine (GE) · 291 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/rallyEditor/voicepacksTab")` (file under extensions/ but not a regular extension)

"Voicepacks" tab of the rally editor. It lets you choose the voicepack and the associated notebook (dropdowns), and lists the global voicepacks (game/mods) and the mission-local ones (<mission>/rally/voicepacks/<name>/) with persona, language, dialect, style, composer style, folder, notebook precedence and the notebooks that exist in this mission. The name is green if all required audio files are present, red otherwise (result cached). The module returns a class C constructor.

## Notes

- No exported function: you get an instance with require(...)(rallyEditor).
- The "Refresh voicepacks" button invalidates the voicepack.lua caches and the audio validation cache.
- Uses rallyEditor.getCurrentMissionDir, getCurrentVoicepackPick, setVoicepackPick, getCurrentPath and loadNotebook.

## Class `C`

Tab instance (windowDescription = 'Voicepacks').

The module returns a constructor: `local obj = require("editor_rallyEditor_voicepacksTab")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:draw(mouseInfo)` | Draws the tab; message if no mission is loaded. | 255 |
| `C:drawGlobalVoicepacks(missionDir)` | Draws the list of global voicepacks (voicepack.scan()). | 241 |
| `C:drawMissionLocalVoicepacks(missionDir)` | Draws the list of the mission's voicepacks (voicepack.scanMission). | 248 |
| `C:drawPickers(missionDir)` | Draws the "Voicepack" and "Notebook" menus; changing the selection calls the editor's setVoicepackPick or loadNotebook. | 130 |
| `C:init(rallyEditor)` | Constructor: stores rallyEditor and creates the audio validation cache. | 20 |
| `C:selected()` | Called when the tab is selected: emits onEditorEditModeChanged(nil, nil). | 29 |
| `C:setPath(path)` | Sets the current notebook. | 25 |
| `C:unselect()` | Called when the tab is left: emits onEditorEditModeChanged(nil, nil). | 33 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorEditModeChanged` — listened to by 1 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua`.*
