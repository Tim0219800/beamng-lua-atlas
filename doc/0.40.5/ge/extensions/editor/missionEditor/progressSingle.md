# `editor_missionEditor_progressSingle`

*File: `lua/ge/extensions/editor/missionEditor/progressSingle.lua` · VM: Game Engine (GE) · 171 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/missionEditor/progressSingle")` (file under extensions/ but not a regular extension)

"Progress Single" tab of the mission editor: shows a mission's saved progress (stars unlocked by default and in total, default progress key, table of attempts per key). The data comes from gameplay_missions_progress.formatSaveDataForUi(mission.id). A "Raw" mode lets you edit the saveData JSON, and a "Reload" button rereads the data. The module returns a constructor: require(...)(missionEditor).

## Notes

- Raw mode displays missionInstance.saveData but writes the validated JSON into mission.saveData.
- In Raw mode, pushStyle/popStyle are defined locally here (unlike objectives.lua).
- The star checkboxes are created with a copy (im.BoolPtr): clicking them does not modify the save.

## Class `C`

Instance of the tab. Fields: missionEditor, tabName = 'Progress Single', mission, missionInstance, formattedSaveData, currentProgressKey.

The module returns a constructor: `local obj = require("editor_missionEditor_progressSingle")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:draw()` | Draws the header (Raw checkbox, Reload button) then drawProgress or the raw JSON editor. | 105 |
| `C:drawProgress()` | Displays the number of unlocked stars, the default progress key, a key combo and the attempts table (or a raw dump if no attempt is available). | 46 |
| `C:init(missionEditor)` | Constructor. | 25 |
| `C:setMission(mission)` | Sets the current mission, its instance and the formatted progress data. | 34 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionEditor/progressSingle.lua`.*
