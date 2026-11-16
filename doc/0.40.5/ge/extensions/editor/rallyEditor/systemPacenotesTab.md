# `editor_rallyEditor_systemPacenotesTab`

*File: `lua/ge/extensions/editor/rallyEditor/systemPacenotesTab.lua` · VM: Game Engine (GE) · 204 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/rallyEditor/systemPacenotesTab")` (file under extensions/ but not a regular extension)

"System Pacenotes" tab of the rally editor: read-only table of the notebook's system pacenotes (internal use, e.g. countdown), with name, weight, text and an audio playback button. Only available for rallyStage missions. The "Refresh System Pacenotes" button empties the cached composers, reloads the composer style module, saves the notebook then re-reads the pacenotes. The module returns a class C constructor.

## Notes

- No exported function: you get an instance with require(...)(rallyEditor).
- The required pacenotes (systemPacenotes.required) are displayed first, the others sorted by name.
- Audio button color: green if custom audio is present, red if custom audio is missing, gray if the standard file is absent.

## Class `C`

Tab instance (windowDescription = 'System Pacenotes').

The module returns a constructor: `local obj = require("editor_rallyEditor_systemPacenotesTab")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:clearState()` | Forgets the notebook and the displayed system pacenotes. | 18 |
| `C:draw(mouseInfo)` | Draws the tab (message if the mission is not rallyStage, otherwise refresh button and 4-column table). | 122 |
| `C:init(rallyEditor)` | Constructor: stores rallyEditor, empty list of system pacenotes. | 11 |
| `C:selected()` | Called when the tab is selected: loads path:getSystemPacenotesForAudioMode() then emits onEditorEditModeChanged(nil, nil). | 36 |
| `C:setPath(path)` | Sets the current notebook (the code comment specifies that "path" refers to the notebook); enables the display only if path:getMissionType() == 'rallyStage'. | 25 |
| `C:unselect()` | Called when the tab is left: emits onEditorEditModeChanged(nil, nil). | 50 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorEditModeChanged` — listened to by 1 module(s)

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/systemPacenotesTab.lua`.*
