# `editor_missionPlaybook_unlockedMissionsViewer`

*File: `lua/ge/extensions/editor/missionPlaybook/unlockedMissionsViewer.lua` · VM: Game Engine (GE) · 90 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_missionPlaybook_unlockedMissionsViewer`: `extensions.load("editor_missionPlaybook_unlockedMissionsViewer")`, then the global `editor_missionPlaybook_unlockedMissionsViewer`

"Playbook Unlocked Missions Viewer" window associated with editor_missionPlaybook. After each playbook step, it sorts the career missions into three lists (startable, visible, invisible) according to gameplay_missions_unlocks.isMissionStartable / isMissionVisible and stores them in resultData.unlockedMissions. The window displays three columns for the current page and colors green the missions that became startable at this step (unlockChange.byId).

## Notes

- The window is only drawn if "Mission Playbook" is visible.
- Bug: M.onEditorRegisterPreferences is assigned to an undefined global variable (nil).
- A mission that is "visible" but not startable goes in visible; a mission that is startable but not visible goes in invisible.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_missionPlaybook_unlockedMissionsViewer.onEditorGui()` | Editor hook called every frame: draws the three mission columns for book.results[book.page]. *(internal)* *(hook)* | 13 |
| `editor_missionPlaybook_unlockedMissionsViewer.onEditorInitialized()` | Hook called at editor initialization: registers the window (500x500) and the "Missions" menu entry. *(internal)* *(hook)* | 54 |
| `editor_missionPlaybook_unlockedMissionsViewer.onPlaybookLogAfterStep(resultData)` | Hook emitted after each playbook instruction: adds resultData.unlockedMissions = {startable, visible, invisible} (lists of ids). *(internal)* *(hook)* | 59 |
| `editor_missionPlaybook_unlockedMissionsViewer.show()` | Shows the "Mission Playbook" and "Playbook Unlocked Missions Viewer" windows. | 49 |

### Parameter details

#### `editor_missionPlaybook_unlockedMissionsViewer.onPlaybookLogAfterStep(resultData)`

Hook emitted after each playbook instruction: adds resultData.unlockedMissions = {startable, visible, invisible} (lists of ids).

- `resultData` (*table*) : Result of the step, modified in place.

## Fields

| Field | Type | Description |
|---|---|---|
| `onEditorRegisterPreferences` | any |  ⚠ reference `onEditorRegisterPreferences` not defined in the file (probably nil) |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionPlaybook/unlockedMissionsViewer.lua`.*
