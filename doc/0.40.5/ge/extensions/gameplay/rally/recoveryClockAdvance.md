# `gameplay_rally_recoveryClockAdvance`

*File: `lua/ge/extensions/gameplay/rally/recoveryClockAdvance.lua` · VM: Game Engine (GE) · 32 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_recoveryClockAdvance`: `extensions.load("gameplay_rally_recoveryClockAdvance")`, then the global `gameplay_rally_recoveryClockAdvance`

Table of the timer penalties applied at each vehicle recovery (reset) in rally. A recovery costs a fixed number of seconds, independent of the stage length. On a special stage: 5 s for a recovery, 0 s for a flip. Off a special stage (road section): 60 s and 10 s. Used by rallyManager:addRecoveryRaceTime.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_recoveryClockAdvance.getSeconds(recoveryType, isSpecialStage)` | Returns the penalty in seconds depending on whether the stage is a special stage or not; 0 if the type is unknown. | 24 |
| `gameplay_rally_recoveryClockAdvance.getSpecialStageSeconds(recoveryType)` | Returns the penalty in seconds for a recovery type on a special stage; 0 if the type is unknown. | 20 |

### Parameter details

#### `gameplay_rally_recoveryClockAdvance.getSeconds(recoveryType, isSpecialStage)`

Returns the penalty in seconds depending on whether the stage is a special stage or not; 0 if the type is unknown.

- `recoveryType` (*string*) : "recovery" or "flip"
- `isSpecialStage` (*boolean*) : true for a special stage, false for a road section / other stage
- **returns**: number Seconds added to the timer

#### `gameplay_rally_recoveryClockAdvance.getSpecialStageSeconds(recoveryType)`

Returns the penalty in seconds for a recovery type on a special stage; 0 if the type is unknown.

- `recoveryType` (*string*) : "recovery" or "flip"
- **returns**: number Seconds added to the timer

## Fields

| Field | Type | Description |
|---|---|---|
| `nonSpecialStageSeconds` | table<string, number> | Penalties off a special stage: recovery = 60, flip = 10. |
| `specialStageSeconds` | table<string, number> | Penalties on a special stage: recovery = 5, flip = 0 (the code path is kept but adds nothing). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/recoveryClockAdvance.lua`.*
