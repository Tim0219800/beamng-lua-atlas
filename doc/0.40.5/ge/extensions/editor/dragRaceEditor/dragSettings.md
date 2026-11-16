# `editor_dragRaceEditor_dragSettings`

*File: `lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua` · VM: Game Engine (GE) · 1167 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dragRaceEditor_dragSettings`: `extensions.load("editor_dragRaceEditor_dragSettings")`, then the global `editor_dragRaceEditor_dragSettings`

Manages the drag settings files (*.dragSettings.json) in the drag race editor. A settings entry describes a race: id, stripId, dragType (headsUpRace/bracketRace), context (freeroam/activity), phases (stage, countdown, race, stop), timers and prefabs (starting tree, display board, paths, decorations). The module keeps in memory a single dragSettings object (the displayed settings) and the list of files found, lists, loads, creates, renames and saves these files, and draws the corresponding ImGui panels.

## Notes

- loadAllSettings searches in /levels/<level>/dragstrips/*.dragSettings.json then in /gameplay/missions/<level>/dragStripRace/*/dragSettings.json and dragStripAPM/*/dragSettings.json. It tries the level name as is, in lowercase, with spaces replaced by "_", and both.
- A file in the list is {type, path, name, _dirty, _fileExists?, _cachedData?}. The type is level, dragStripRace, dragStripAPM (or mission via the Add button).
- Selection indices start at 1, -1 = none.
- Only the current dragSettings object is editable: changing the selection caches (_cachedData) the modified unsaved settings and reloads the other one from disk.
- facilityId is added in memory by facilities.selectFacility but removed on load and on save (never written to the file).
- Save: validation (dragType and stripId non-empty), then if the file is in the level's dragstrips folder and id has changed, the file is renamed to <id>.dragSettings.json (fails if that name exists).
- On read, if timers is missing or empty, dragSaveSystem.DEFAULT_TIMERS is used.
- In loadAllSettings, the loop that resets _dirty to false runs on a list that has just been emptied (no effect).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dragRaceEditor_dragSettings.drawDragSettingsSection()` | Draws an ImGui "Drag Settings" panel (old presentation in a fixed 200 px high block). *(internal)* | 957 |
| `editor_dragRaceEditor_dragSettings.drawPhasesSection()` | Draws the race phase editing. *(internal)* | 1108 |
| `editor_dragRaceEditor_dragSettings.drawPrefabsSection()` | Draws the prefab editing (tree, board, paths, decorations). *(internal)* | 1041 |
| `editor_dragRaceEditor_dragSettings.drawSettingsDetails()` | Draws the detail of the selected settings: Basics, Phases, Timers, Prefabs. Modifications call markDirty. *(internal)* | 402 |
| `editor_dragRaceEditor_dragSettings.drawSettingsList()` | Draws the "Drag Settings" section (list, Add button via save dialog, etc.). The buttons are disabled if there is no saved strip. *(internal)* | 236 |
| `editor_dragRaceEditor_dragSettings.getAllSettings()` | Returns the list of settings files. | 189 |
| `editor_dragRaceEditor_dragSettings.getDragSettings()` | Returns the dragSettings object being edited. | 834 |
| `editor_dragRaceEditor_dragSettings.getSelectedSettings()` | Returns the selected file entry. | 201 |
| `editor_dragRaceEditor_dragSettings.getSelectedSettingsIndex()` | Index (1-based) of the selected file, -1 if none. | 193 |
| `editor_dragRaceEditor_dragSettings.loadAllSettings()` | Empties the list then fills it with the settings files of the current level and its dragStripRace / dragStripAPM missions. The displayed name is json.id if it exists, otherwise the file or folder name. Does nothing without a loaded level. | 68 |
| `editor_dragRaceEditor_dragSettings.loadDragSettings(filePath)` | Reads a JSON file into dragSettings, removes facilityId, fills in id (file name) and default timers, and resets _dirty to false for the corresponding file. | 850 |
| `editor_dragRaceEditor_dragSettings.markDirty()` | Marks the selected file as modified and copies dragSettings into its cache. | 842 |
| `editor_dragRaceEditor_dragSettings.saveDragSettings(filePath)` | Validates then writes dragSettings (without facilityId) as JSON. Fixes the extension to .dragSettings.json, removes the characters *?<>\|", renames the file if the id changed (level folder), creates the folder if needed and updates the selected entry. | 876 |
| `editor_dragRaceEditor_dragSettings.selectSettings(index)` | Selects a file: caches the previous settings if modified, deselects the strip, then restores the cache, or loads the file from disk, or for a nonexistent file takes the name as id. | 208 |
| `editor_dragRaceEditor_dragSettings.setDragSettings(settings)` | Replaces the current dragSettings object (unchanged if nil). | 838 |
| `editor_dragRaceEditor_dragSettings.setSelectedSettingsIndex(index)` | Sets the selected index without loading data. | 197 |
| `editor_dragRaceEditor_dragSettings.validateDragSettings(settings)` | Checks that a settings entry has a non-empty dragType and stripId. | 946 |

### Parameter details

#### `editor_dragRaceEditor_dragSettings.getAllSettings()`

Returns the list of settings files.

- **returns**: table array of {type, path, name, _dirty...}

#### `editor_dragRaceEditor_dragSettings.getDragSettings()`

Returns the dragSettings object being edited.

- **returns**: table current settings

#### `editor_dragRaceEditor_dragSettings.getSelectedSettings()`

Returns the selected file entry.

- **returns**: table|nil entry or nil

#### `editor_dragRaceEditor_dragSettings.getSelectedSettingsIndex()`

Index (1-based) of the selected file, -1 if none.

- **returns**: integer index

#### `editor_dragRaceEditor_dragSettings.loadDragSettings(filePath)`

Reads a JSON file into dragSettings, removes facilityId, fills in id (file name) and default timers, and resets _dirty to false for the corresponding file.

- `filePath` (*string*) : path of the .dragSettings.json file
- **returns**: boolean false and error displayed if reading fails

#### `editor_dragRaceEditor_dragSettings.saveDragSettings(filePath)`

Validates then writes dragSettings (without facilityId) as JSON. Fixes the extension to .dragSettings.json, removes the characters *?<>|", renames the file if the id changed (level folder), creates the folder if needed and updates the selected entry.

- `filePath` (*string|nil*) : target path; path of the selected entry if nil
- **returns**: boolean success

#### `editor_dragRaceEditor_dragSettings.selectSettings(index)`

Selects a file: caches the previous settings if modified, deselects the strip, then restores the cache, or loads the file from disk, or for a nonexistent file takes the name as id.

- `index` (*integer*) : 1-based index

#### `editor_dragRaceEditor_dragSettings.setDragSettings(settings)`

Replaces the current dragSettings object (unchanged if nil).

- `settings` (*table|nil*) : new settings

#### `editor_dragRaceEditor_dragSettings.setSelectedSettingsIndex(index)`

Sets the selected index without loading data.

- `index` (*integer*) : 1-based index or -1

#### `editor_dragRaceEditor_dragSettings.validateDragSettings(settings)`

Checks that a settings entry has a non-empty dragType and stripId.

- `settings` (*table|nil*) : settings
- **returns**: boolean validity
- **returns**: string|nil error message

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `findFiles`, `renameFile`, `stat`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua`.*
