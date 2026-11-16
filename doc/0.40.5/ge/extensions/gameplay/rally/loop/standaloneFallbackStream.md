# `gameplay_rally_loop_standaloneFallbackStream`

*File: `lua/ge/extensions/gameplay/rally/loop/standaloneFallbackStream.lua` · VM: Game Engine (GE) · 344 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_loop_standaloneFallbackStream`: `extensions.load("gameplay_rally_loop_standaloneFallbackStream")`, then the global `gameplay_rally_loop_standaloneFallbackStream`

Fallback data stream for the rally stage UI apps when no rally loop feeds them (stage launched on its own, "standalone"). It keeps the latest data received from a countdown node (active state, countdown, vehicle proximity, clock) and completes it with the stage data from the rally manager (gameplay_rally.getRallyManager():getActiveStageData()), the environment clock, the theme colors and the rallyShowStageApps setting. getStreamData returns the table to send to the UI.

## Notes

- A received stream stays "fresh" for 0.75 s (fallbackFreshTime); beyond that it is only used if the stage is present or active.
- The countdown is protected for 0.75 s after each update (0.1 s for the GO display, countdown == 0): an incoming non-countdown state is ignored during that delay.
- data.resetFallbackStreamData = true clears the state then creates a reset stream with fallbackStageResetActive.
- NGRC mode is inferred from gameplay_rally.getRecoveryRepairVehicle() (NGRC = no vehicle repair).
- The theme is colored with uiColors.updateForStage.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_loop_standaloneFallbackStream.clear()` | Clears the whole fallback stream state (data, delays, clock, reset flag). | 191 |
| `gameplay_rally_loop_standaloneFallbackStream.getStreamData(now)` | Builds the stream table for the UI: activeState, rallyClock, stageData, scheduleData, vehicleProximity, countdownData, showStageApps, uiColors. Chooses between the updated fallback stream, the stand-alone stage data (stageActive state) or an inactive state with reset data. | 211 |
| `gameplay_rally_loop_standaloneFallbackStream.isActive()` | Indicates whether the stream should be used: fallback data exists or a stage is active on the rally manager side. | 201 |
| `gameplay_rally_loop_standaloneFallbackStream.onSettingsChanged()` | Hook called when settings change: rereads rallyShowStageApps (true by default). *(internal)* *(hook)* | 54 |
| `gameplay_rally_loop_standaloneFallbackStream.updateClock(dtSim)` | Advances the local wall clock (fallbackClockSecs) by dtSim seconds, modulo 86400, if it was initialized by a node. | 205 |
| `gameplay_rally_loop_standaloneFallbackStream.updateStreamData(data)` | Records a data packet coming from a node (activeState, vehicleProximity, countdownData, rallyClock, resetFallbackStreamData) and manages the countdown protection delays and the GO display delay. | 279 |

### Parameter details

#### `gameplay_rally_loop_standaloneFallbackStream.getStreamData(now)`

Builds the stream table for the UI: activeState, rallyClock, stageData, scheduleData, vehicleProximity, countdownData, showStageApps, uiColors. Chooses between the updated fallback stream, the stand-alone stage data (stageActive state) or an inactive state with reset data.

- `now` (*number|nil*) : Current time (RallyUtil.getTime() or os.clockhp() by default).
- **returns**: table Stream data.

#### `gameplay_rally_loop_standaloneFallbackStream.isActive()`

Indicates whether the stream should be used: fallback data exists or a stage is active on the rally manager side.

- **returns**: boolean true if active.

#### `gameplay_rally_loop_standaloneFallbackStream.updateClock(dtSim)`

Advances the local wall clock (fallbackClockSecs) by dtSim seconds, modulo 86400, if it was initialized by a node.

- `dtSim` (*number*) : Elapsed simulation time, in seconds.

#### `gameplay_rally_loop_standaloneFallbackStream.updateStreamData(data)`

Records a data packet coming from a node (activeState, vehicleProximity, countdownData, rallyClock, resetFallbackStreamData) and manages the countdown protection delays and the GO display delay.

- `data` (*table|nil*) : Node packet; ignored if nil.

## Calls into the engine (C++)

- `core_environment.` `getTimeOfDay`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/loop/standaloneFallbackStream.lua`.*
