# `gameplay_drift_statistics`

*File: `lua/ge/extensions/gameplay/drift/statistics.lua` · VM: Game Engine (GE) · 51 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drift_statistics`: `extensions.load("gameplay_drift_statistics")`, then the global `gameplay_drift_statistics`

Records drift statistics in gameplay_statistic (drift/... keys) and unlocks drift achievements. Listens to the drift end, score, spinout and crash hooks; contains no detection logic.

## Notes

- Keys written: drift/rightDrifts, drift/leftDrifts, drift/maxDriftDistance.length, drift/maxDriftTime.time, drift/maxChainedDrifts, drift/totalScore, drift/maxDriftScore, drift/spinOuts, drift/crashes.
- Achievements: DRIFT_SINGLE if a single drift earns >= 20000 points; DRIFT_TOTAL if drift/totalScore reaches 1,000,000 (only if gameplay_achievement is loaded).
- Maxima are only updated if the new value strictly exceeds the old one (setNewMaxStat).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drift_statistics.onDriftCompleted(data)` | Hook: at the end of a drift chain, adds the right/left drifts and updates the records for distance, duration and number of chained drifts. Does nothing without data.chainDriftData. *(internal)* *(hook)* | 15 |
| `gameplay_drift_statistics.onDriftCompletedScored(data)` | Hook: adds the earned score to the total, updates the score record and triggers the DRIFT_SINGLE and DRIFT_TOTAL achievements. *(internal)* *(hook)* | 26 |
| `gameplay_drift_statistics.onDriftCrash()` | Hook: increments drift/crashes. *(internal)* *(hook)* | 42 |
| `gameplay_drift_statistics.onDriftSpinout()` | Hook: increments drift/spinOuts. *(internal)* *(hook)* | 38 |

### Parameter details

#### `gameplay_drift_statistics.onDriftCompleted(data)`

Hook: at the end of a drift chain, adds the right/left drifts and updates the records for distance, duration and number of chained drifts. Does nothing without data.chainDriftData.

- `data` (*table*) : Contains chainDriftData {rightDrifts, leftDrifts, totalDriftDistance, totalDriftTime, chainedDrifts}.

#### `gameplay_drift_statistics.onDriftCompletedScored(data)`

Hook: adds the earned score to the total, updates the score record and triggers the DRIFT_SINGLE and DRIFT_TOTAL achievements.

- `data` (*table*) : Contains addedScore (number, points added by this drift).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drift/statistics.lua`.*
