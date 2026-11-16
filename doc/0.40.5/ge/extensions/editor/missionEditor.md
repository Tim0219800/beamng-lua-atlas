# `editor_missionEditor`

*File: `lua/ge/extensions/editor/missionEditor.lua` · VM: Game Engine (GE) · 1791 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_missionEditor`: `extensions.load("editor_missionEditor")`, then the global `editor_missionEditor`

World editor "Mission Editor" window to create and edit the game's missions (info.json of each mission folder). It lists the missions with filters (current level, procedural, career, freeroam), search and grouping (level, type, date, branch), and offers the File menu (new mission, save, delete). It instantiates the sub-windows of the missionEditor/ folder (general, conditions, careerSetup, additionalAttributes, startTrigger, layers, setupModules, genericTypeData, objectives, progressSingle, progressMulti, playbookUtils, issues, previewChecker) and delegates the editing of each section. Depends on gameplay_missions_missions.

## Example

```lua
extensions.load('editor_missionEditor')
editor_missionEditor.show()
editor_missionEditor.setMissionById('west_coast_usa/arrive/mission1')
```

## Notes

- A mission's modifications are flagged by mission._dirty = true; "Save" calls gameplay_missions_missions.saveMission(mission, mission.missionFolder).
- Deleting a mission really erases files (FS:removeFile and FS:directoryRemove on the mission folder): handle with care.
- The missionEditor.general preferences store groupFilter, showWindows, shortIds (short identifiers) and alwaysShowScreenshots.
- The dev editor (missionEditor/dev.lua) is commented out in loadWindows and is therefore not used.
- Bug: getSelectedMissionId returns clickedMission, that is the table of the clicked mission (or nil), and not its identifier.
- onConsoleLog only does print(timer): it prints neither the level nor the line of the message.
- onSerialize/onDeserialized keep the last selected mission and the last tab across a Lua reload.

**Dependencies (loaded first):** `gameplay_missions_missions`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_missionEditor.clickMission(m)` | Simulates a click on a mission: it will be selected on the next frame. | 1730 |
| `editor_missionEditor.getCurrentEditorHelperWhenActive()` | Returns the edit helper of the current mission type, only if the window is visible and a mission is loaded; otherwise nil. | 1752 |
| `editor_missionEditor.getMissionList()` | Returns the list of mission data loaded by the editor (gameplay_missions_missions.getFilesData), or nil if it has not been loaded yet. | 1729 |
| `editor_missionEditor.getMissionTypeWindow()` | Returns the sub-window for the mission type's own data (genericTypeData). | 1733 |
| `editor_missionEditor.getSelectedMissionId()` | Returns the mission currently clicked. Despite the name, it is the mission table (clickedMission) and not its id. | 1786 |
| `editor_missionEditor.getStartTriggerWindow()` | Returns the start trigger editor sub-window (startTrigger). | 1732 |
| `editor_missionEditor.onConsoleLog(timer, lvl, origin, line)` | Hook called for each line of the game console; only prints print(timer). *(internal)* *(hook)* | 1782 |
| `editor_missionEditor.onDeserialized(data)` | Deserialization hook: reselects the last mission (setMissionById) and forces the opening of the remembered tree and tab. *(internal)* *(hook)* | 1711 |
| `editor_missionEditor.onEditorGui()` | Hook called every frame by the world editor: draws the Mission Editor window (menu bar, list, mission tabs, issues window) and handles clicks. *(internal)* *(hook)* | 1074 |
| `editor_missionEditor.onEditorInitialized()` | World editor initialization hook: registers the windows mission_editor (1500x700) and mission_issues (700x700), the "Mission Editor" menu entry (Missions group), loads the filter and restores showWindows from the preferences. *(internal)* *(hook)* | 1673 |
| `editor_missionEditor.onEditorRegisterPreferences(prefsRegistry)` | Hook: registers the missionEditor.general preferences category (groupFilter, showWindows, shortIds, alwaysShowScreenshots). *(internal)* *(hook)* | 1689 |
| `editor_missionEditor.onSerialize()` | Extension serialization hook: remembers the id of the last displayed mission and the last tab. *(internal)* *(hook)* | 1703 |
| `editor_missionEditor.reloadMissionSystem()` | Reloads the whole missions system (gameplay_missions_missions.reloadCompleteMissionSystem), rereads the list, finds the previously displayed mission, updates the sub-windows again and reapplies filter, search and grouping. | 1758 |
| `editor_missionEditor.setMissionById(id, instant)` | Selects the mission with the given id and opens the tree. Loads the list if needed. With instant, the sub-windows are updated right away (setMission). Does nothing if the id does not exist. | 1734 |
| `editor_missionEditor.show()` | Opens the "mission_editor" window (editor.showWindow) and reloads the saved grouping filter. | 1668 |

### Parameter details

#### `editor_missionEditor.clickMission(m)`

Simulates a click on a mission: it will be selected on the next frame.

- `m` (*table*) : Mission data (element of getMissionList).

#### `editor_missionEditor.getCurrentEditorHelperWhenActive()`

Returns the edit helper of the current mission type, only if the window is visible and a mission is loaded; otherwise nil.

- **returns**: table|nil Result of missionTypeWindow:getCurrentEditorHelper().

#### `editor_missionEditor.getMissionList()`

Returns the list of mission data loaded by the editor (gameplay_missions_missions.getFilesData), or nil if it has not been loaded yet.

- **returns**: table[]|nil Missions, each with id, name, missionFolder, _dirty, etc.

#### `editor_missionEditor.getMissionTypeWindow()`

Returns the sub-window for the mission type's own data (genericTypeData).

- **returns**: table Window object, empty table before the first display.

#### `editor_missionEditor.getSelectedMissionId()`

Returns the mission currently clicked. Despite the name, it is the mission table (clickedMission) and not its id.

- **returns**: table|nil Data of the clicked mission.

#### `editor_missionEditor.getStartTriggerWindow()`

Returns the start trigger editor sub-window (startTrigger).

- **returns**: table|nil Window object, nil before the first display.

#### `editor_missionEditor.onConsoleLog(timer, lvl, origin, line)`

Hook called for each line of the game console; only prints print(timer).

- `timer` (*number*) : Timestamp of the message.
- `lvl` (*string*) : Level (unused).
- `origin` (*string*) : Origin (unused).
- `line` (*string*) : Text (unused).

#### `editor_missionEditor.onDeserialized(data)`

Deserialization hook: reselects the last mission (setMissionById) and forces the opening of the remembered tree and tab.

- `data` (*table|nil*) : Data from onSerialize.

#### `editor_missionEditor.onEditorRegisterPreferences(prefsRegistry)`

Hook: registers the missionEditor.general preferences category (groupFilter, showWindows, shortIds, alwaysShowScreenshots).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_missionEditor.onSerialize()`

Extension serialization hook: remembers the id of the last displayed mission and the last tab.

- **returns**: table {lastSelectedMissionId, lastTabItemShown}.

#### `editor_missionEditor.setMissionById(id, instant)`

Selects the mission with the given id and opens the tree. Loads the list if needed. With instant, the sub-windows are updated right away (setMission). Does nothing if the id does not exist.

- `id` (*string*) : Mission identifier.
- `instant` (*boolean|nil*) : true to apply immediately to the sub-windows.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'gameplay_missions_missions'}: extension loaded before this one. |

**UI events (guihooks.trigger):** `MenuOpenModule`

## Calls into the engine (C++)

- `FS:` `directoryRemove`, `fileExists`, `findFiles`, `removeFile`

**Loads extensions:** `career_modules_branches_leagues`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionEditor.lua`.*
