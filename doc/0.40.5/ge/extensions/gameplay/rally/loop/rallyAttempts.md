# `gameplay_rally_loop_rallyAttempts`

*File: `lua/ge/extensions/gameplay/rally/loop/rallyAttempts.lua` · VM: Game Engine (GE) · 106 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_loop_rallyAttempts`: `extensions.load("gameplay_rally_loop_rallyAttempts")`, then the global `gameplay_rally_loop_rallyAttempts`

Creates and records a mission attempt for a rally loop through the mission progress system (gameplay_missions_progress). A normal-finish attempt receives the total time, the penalty, the time of each stage (timeSS1, timeSS2...), the vehicle data and the stars earned; a DNF attempt (abandon or restart) receives only the DNF type and the vehicle. Called by the loop manager (rallyLoopManager) via the mgr object.

## Example

```lua
local attempt, totalChange = gameplay_rally_loop_rallyAttempts.createRallyLoopAttemptForFinish(mgr)
```

## Notes

- Both public functions return (attempt, totalChange) in this order, whereas the code comment only mentions totalChange (and, for the normal finish, the order stated in the comment is reversed).
- If mgr:getRallyLoopMissionId() returns nil, an error log is emitted and the function returns nil without recording anything.
- addVehicleData calls dump(vData): the vehicle table is printed to the console on every attempt.
- The module loads rallyLoopStars via require('/lua/ge/extensions/gameplay/rally/loop/rallyLoopStars').

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_loop_rallyAttempts.createRallyLoopAttemptForDnf(mgr, dnfType)` | Creates an abandoned (DNF) attempt: sets attempt.dnf = true, records the dnfType and the current mission id, adds the vehicle, aggregates and saves. No stars or times are recorded. | 85 |
| `gameplay_rally_loop_rallyAttempts.createRallyLoopAttemptForFinish(mgr)` | Creates a normal-finish attempt: time and penalties from mgr, time of each stage, player vehicle, star rating (RallyLoopStars.gradeAttempt), aggregation into the mission progress, then save. | 66 |

### Parameter details

#### `gameplay_rally_loop_rallyAttempts.createRallyLoopAttemptForDnf(mgr, dnfType)`

Creates an abandoned (DNF) attempt: sets attempt.dnf = true, records the dnfType and the current mission id, adds the vehicle, aggregates and saves. No stars or times are recorded.

- `mgr` (*table*) : Loop manager (rallyLoopManager): must provide getRallyLoopMissionId and getCurrentMissionId.
- `dnfType` (*string*) : DNF type: "restart" or "abandon".
- **returns**: table|nil The attempt object created (nil if the mission id is not found).
- **returns**: table|nil Aggregation result (totalChange).

#### `gameplay_rally_loop_rallyAttempts.createRallyLoopAttemptForFinish(mgr)`

Creates a normal-finish attempt: time and penalties from mgr, time of each stage, player vehicle, star rating (RallyLoopStars.gradeAttempt), aggregation into the mission progress, then save.

- `mgr` (*table*) : Loop manager (rallyLoopManager): must provide getRallyLoopMissionId, getTotalPenalty, getTotalTime, getEventLog and optionally getRallyLoopMission.
- **returns**: table|nil The attempt object created (nil if the mission id is not found).
- **returns**: table|nil Aggregation result (totalChange) returned by gameplay_missions_progress.aggregateAttempt.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/loop/rallyAttempts.lua`.*
