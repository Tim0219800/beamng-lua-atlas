# `gameplay_rally_loop_rallyLoopStars`

*File: `lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua` · VM: Game Engine (GE) · 127 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_loop_rallyLoopStars`: `extensions.load("gameplay_rally_loop_rallyLoopStars")`, then the global `gameplay_rally_loop_rallyLoopStars`

Manages the stars (bronze, silver, gold) of a rally loop. The loop's thresholds are the sum of the thresholds of the linked stages (up to 4: stage1_rallyStage...stage4_rallyStage). The module also grades an attempt (stars unlocked if the total time is less than or equal to the threshold) and picks the matching mission outro text.

## Notes

- The star keys are bronzeTime, silverTime, goldTime (time in seconds, smaller = better).
- deriveThresholds returns nil (with a W log) if a stage is not found, if a star is not active (careerSetup.starsActive) or has no value > 0, or if the order gold <= silver <= bronze is not respected.
- The totals are rounded to the tenth of a second.
- applyThresholds clears bronzeTime/silverTime/goldTime from the table if the computation fails.
- In deriveThresholds the order comparison uses stageData.goldTime directly (raw value, no tonumber): a string value would cause a comparison error (inferred from code).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_loop_rallyLoopStars.applyThresholds(loopMissionTypeData)` | Computes the thresholds and writes them into loopMissionTypeData; sets them to nil if the computation fails. | 68 |
| `gameplay_rally_loop_rallyLoopStars.deriveThresholds(loopMissionTypeData)` | Adds up the bronze/silver/gold thresholds of the stages linked to the loop. All configured stages must provide the three values. | 29 |
| `gameplay_rally_loop_rallyLoopStars.extractMissionId(value)` | Extracts the mission id from a field value: returns what is between the trailing parentheses ("Name (id)" gives "id"), otherwise the string as is; nil if the value is not a string, is empty or is '<none>'. | 10 |
| `gameplay_rally_loop_rallyLoopStars.getOutroText(mission, attempt)` | Returns the outro text: that of 'noStarUnlocked' then that of the best unlocked star (bronze, then silver, then gold), taken from careerSetup.starOutroTexts or else defaultStarOutroTexts. nil if the mission has no goldTime or no active star. | 108 |
| `gameplay_rally_loop_rallyLoopStars.gradeAttempt(mission, attempt)` | Fills attempt.unlockedStars[key] = (total time <= threshold) for each active star. Does nothing for a DNF, a mission without missionTypeData or an invalid time (<= 0). | 82 |

### Parameter details

#### `gameplay_rally_loop_rallyLoopStars.applyThresholds(loopMissionTypeData)`

Computes the thresholds and writes them into loopMissionTypeData; sets them to nil if the computation fails.

- `loopMissionTypeData` (*table*) : Loop's missionTypeData, modified in place.
- **returns**: table|nil The totals, or nil.

#### `gameplay_rally_loop_rallyLoopStars.deriveThresholds(loopMissionTypeData)`

Adds up the bronze/silver/gold thresholds of the stages linked to the loop. All configured stages must provide the three values.

- `loopMissionTypeData` (*table*) : Loop's missionTypeData (fields stage1_rallyStage...stage4_rallyStage).
- **returns**: table|nil {bronzeTime, silverTime, goldTime, stageCount} or nil.

#### `gameplay_rally_loop_rallyLoopStars.extractMissionId(value)`

Extracts the mission id from a field value: returns what is between the trailing parentheses ("Name (id)" gives "id"), otherwise the string as is; nil if the value is not a string, is empty or is '<none>'.

- `value` (*any*) : Value of the stageN_rallyStage field.
- **returns**: string|nil Mission id.

#### `gameplay_rally_loop_rallyLoopStars.getOutroText(mission, attempt)`

Returns the outro text: that of 'noStarUnlocked' then that of the best unlocked star (bronze, then silver, then gold), taken from careerSetup.starOutroTexts or else defaultStarOutroTexts. nil if the mission has no goldTime or no active star.

- `mission` (*table|nil*) : Loop mission.
- `attempt` (*table|nil*) : Graded attempt (unlockedStars).
- **returns**: string|nil Outro text.

#### `gameplay_rally_loop_rallyLoopStars.gradeAttempt(mission, attempt)`

Fills attempt.unlockedStars[key] = (total time <= threshold) for each active star. Does nothing for a DNF, a mission without missionTypeData or an invalid time (<= 0).

- `mission` (*table|nil*) : Loop mission (missionTypeData, careerSetup.starsActive).
- `attempt` (*table*) : Attempt; reads attempt.data.totalTime and attempt.dnf.
- **returns**: table The same attempt.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua`.*
