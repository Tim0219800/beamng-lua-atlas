# `editor_rallyEditor_missionTab`

*File: `lua/ge/extensions/editor/rallyEditor/missionTab.lua` · VM: Game Engine (GE) · 116 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/rallyEditor/missionTab")` (file under extensions/ but not a regular extension)

"Mission" tab of the rally editor. It displays read-only the current mission's name, identifier and folder (with a button that opens the folder in the file explorer), then lists the mission-local voicepacks found in <missionDir>/rally/voicepacks/<name>/: folder, number of pacenote_*.ogg files and associated notebooks. The currently chosen voicepack is marked with a green star. The module returns a constructor (class C).

## Notes

- Does not modify any data: purely informational tab.
- If the info.json entry does not exist, the button opens the rally/ folder, otherwise the mission folder.
- With no mission loaded, displays a message inviting you to open the editor from the Mission Editor.

## Class `C`

Tab object returned by the constructor (new(rallyEditor)). Fields: rallyEditor, path, windowDescription = 'Mission'.

The module returns a constructor: `local obj = require("editor_rallyEditor_missionTab")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:draw(mouseInfo)` | Draws the tab's imgui interface (mission info, list of local voicepacks). | 45 |
| `C:init(rallyEditor)` | Internal constructor: stores the editor. | 14 |
| `C:selected()` | Called when the tab is selected: emits the hook onEditorEditModeChanged(nil, nil) to leave any edit mode. | 22 |
| `C:setPath(path)` | Stores the current notebook (called by the editor). | 18 |
| `C:unselect()` | Called when the tab is left: emits the hook onEditorEditModeChanged(nil, nil). | 26 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorEditModeChanged` — listened to by 1 module(s)

## Calls into the engine (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/missionTab.lua`.*
