# `editor_missionEditor_progressMulti`

*File: `lua/ge/extensions/editor/missionEditor/progressMulti.lua` · VM: Game Engine (GE) · 95 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/missionEditor/progressMulti")` (file under extensions/ but not a regular extension)

"Progress Multi" tab of the mission editor: displays the saved progress of a multi-progress mission. It reads gameplay_missions_progress.formatSaveDataForUi(mission.id), offers a progress key combo and a table of the mission's aggregates (ownAggregate: labels and rows). Read-only. The module returns a constructor: require(...)(missionEditor).

## Notes

- The pushStyle/popStyle functions and the Raw checkbox are declared but not used in this file (code inherited from progressSingle).
- draw raises an error if formattedProgressByKey[currentProgressKey] is nil (no test before accessing ownAggregate).
- The code comment states that only the current mission is displayed since a change to formatSaveDataForUi.

## Class `C`

Instance of the tab. Fields: missionEditor, tabName = 'Progress Multi', mission, missionInstance, formattedSaveData, currentProgressKey.

The module returns a constructor: `local obj = require("editor_missionEditor_progressMulti")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:draw()` | Displays the progress key combo and the aggregates table. | 46 |
| `C:init(missionEditor)` | Constructor. | 25 |
| `C:setMission(mission)` | Sets the current mission, reloads the formatted progress data and chooses the progress key (currentProgressKey, defaultProgressKey or 'default'). | 34 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionEditor/progressMulti.lua`.*
