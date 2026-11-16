# `gameplay_missions_unlocks_conditions_missionConditions`

*File: `lua/ge/extensions/gameplay/missions/unlocks/conditions/missionConditions.lua` · VM: Game Engine (GE) · 66 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_missions_unlocks_conditions_missionConditions`: `extensions.load("gameplay_missions_unlocks_conditions_missionConditions")`, then the global `gameplay_missions_unlocks_conditions_missionConditions`

Mission unlock condition types based on the progress of other missions: missionPassed (passed) and missionCompleted (completed). They read mission.saveData.progress[key].aggregate. The progress key can be 'default' (or empty), 'any' (any of them) or a specific key.

## Notes

- If the referenced mission does not exist, an error log is emitted and the condition is false.
- The local function F is not exported: checkAggregateWithKey and getTargetLabel are not accessible from outside.
- The missionFunction block is commented out in the code (inactive).

## Fields

| Field | Type | Description |
|---|---|---|
| `missionCompleted` | table | Condition {type='missionCompleted', missionId, progressKey}: true if aggregate.completed is true. editorFunction 'displayMissionConditionWithProgressKey'. |
| `missionPassed` | table | Condition {type='missionPassed', missionId, progressKey}: true if aggregate.passed is true. editorFunction 'displayMissionCondition'. |

## Class `F`

Local helper table (not exported) used by missionPassed and missionCompleted.

| Method | Description | Line |
|---|---|---|
| `F.checkAggregateWithKey(id, progressKey, field)` | Checks whether, for the given mission, at least one of the progress keys has the aggregate[field] field true. | 8 |
| `F.getTargetLabel(id, progressKey, verb)` | Builds the condition's translatable label (keys missions.missions.unlock.<verb>.default\|any\|custom). | 28 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/missions/unlocks/conditions/missionConditions.lua`.*
