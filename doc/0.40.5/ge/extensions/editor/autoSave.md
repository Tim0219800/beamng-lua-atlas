# `editor_autoSave`

*File: `lua/ge/extensions/editor/autoSave.lua` · VM: Game Engine (GE) · 174 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_autoSave`: `extensions.load("editor_autoSave")`, then the global `editor_autoSave`

Autosave of the level editor. A timer (preference files.autoSave.interval, 120 s by default) calls editor.autoSaveLevel() when files.autoSave.active is true, with a countdown in the status bar during files.autoSave.noticeInterval seconds. An "AutoSave Restore" modal window lets you restore the scene tree from /temp/level_autosaves/<level>/; it opens by itself if the editor did not close cleanly on that level, or via the windows menu.

## Notes

- The restore copies the autosave folder over the level (editor.copyDirectory) then reopens the level: irreversible (the confirmation dialog says so).
- The preference descriptions mention /settings/editor/autosaves while the code reads /temp/level_autosaves/: apparent inconsistency between help text and the path used.
- Registered preferences (category files > autoSave): active (bool, false), saveBackupCopy (bool, false), interval (int, 120), noticeInterval (int, 10), maxAutoSaveCountPerSession (int, 3), counter (int, 1, hidden).
- If interval is lowered below noticeInterval, noticeInterval is brought down to interval; the reverse is also corrected.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_autoSave.onEditorGui(dtReal, dtSim, dtRaw)` | Called every editor frame: shows the restore window if needed, decrements the timer, displays the warning and triggers editor.autoSaveLevel() when it reaches 0. *(internal)* *(hook)* | 110 |
| `editor_autoSave.onEditorInitialized()` | Initializes the timer with files.autoSave.interval and adds the "AutoSave Restore" entry to the windows menu. *(internal)* *(hook)* | 133 |
| `editor_autoSave.onEditorPreferenceValueChanged(path, value)` | Hook called when a preference changes: resets the timer for files.autoSave.interval and keeps noticeInterval <= interval. *(internal)* *(hook)* | 138 |
| `editor_autoSave.onEditorRegisterPreferences(prefsRegistry)` | Editor preferences registration hook: declares the "files" category and the "autoSave" subcategory. *(internal)* *(hook)* | 153 |

### Parameter details

#### `editor_autoSave.onEditorGui(dtReal, dtSim, dtRaw)`

Called every editor frame: shows the restore window if needed, decrements the timer, displays the warning and triggers editor.autoSaveLevel() when it reaches 0.

- `dtReal` (*number*) : Real frame time (s), used for the timer.
- `dtSim` (*number*) : Simulated time (unused).
- `dtRaw` (*number*) : Raw duration (unused).

#### `editor_autoSave.onEditorPreferenceValueChanged(path, value)`

Hook called when a preference changes: resets the timer for files.autoSave.interval and keeps noticeInterval <= interval.

- `path` (*string*) : Preference path, e.g. "files.autoSave.interval".
- `value` (*any*) : New value.

#### `editor_autoSave.onEditorRegisterPreferences(prefsRegistry)`

Editor preferences registration hook: declares the "files" category and the "autoSave" subcategory.

- `prefsRegistry` (*table*) : Editor preferences registry (registerCategory / registerSubCategory).

## Calls into the engine (C++)

- `FS:` `directoryList`, `stat`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/autoSave.lua`.*
