# `gameplay_drift_display`

*File: `lua/ge/extensions/gameplay/drift/display.lua` · VM: Game Engine (GE) · 532 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drift_display`: `extensions.load("gameplay_drift_display")`, then the global `gameplay_drift_display`

Display (UI) layer of drift. Every frame, publishes on the "drift" UI stream the state of each tracked vehicle (permanent score, potential score, cached score, combo, remaining combo time, creep, angle, speed, performance factor, confirmed score presentation phase). Reacts to the score, crash, spinout, cascade zone, spot and tier hooks with flash messages (TopCenterAppsFlashMessage) and guihooks events, and shows/hides the drift UI apps (scoreboard, tasks, driftScores, flashMessage) depending on the gameplay_drift_general context. Loaded by general in the contexts inChallenge, inFreeroamChallenge, inFreeroamCruising and inSplitscreen.

## Notes

- "drift" stream: { context, players = { ["<playerId>"] = {permanentScore, potentialScore, realtimePerformanceFactor, realtimeCachedScoreFloored, realtimeCombo, realtimeRemainingComboTime, realtimeCreep, realtimeAngle, realtimeAirSpeed, scorePhase, scorePhaseProgress, confirmedScore, confirmedScoreId} } }. The players keys are strings so that the stream is always serialized as an object.
- Confirmed score presentation: phase machine hold (0.9 s) -> dwindle (0.6 s) -> linger (0.5 s) -> idle; total duration 2.0 s (getScorePresentationDuration). Durations are counted in real time (dtReal).
- Flash messages are ignored in the inFreeroam context and if the message is empty; default duration 1.5 s (2 s for a spot failure).
- realtimeAngle is only filled if |angle| < maxAngle, vehicle oversteering, above the min drift speed, not airborne and not in walking mode.
- Emitted guihooks events: ScenarioRealtimeDisplay, ClearTasklist, TopCenterAppsFlashMessage, displayDriftScoreModifier, setDriftPersistentDriftScored, setDriftRealtimeFail (single table {reason, playerId}), stuntZoneScored ({type, score}).
- Contexts -> apps: inChallenge = enableDriftMissionUI (driftMission game state, tasks app); inFreeroamChallenge = scoreboard if multiplayer otherwise driftScores, plus tasks; inFreeroamCruising = driftScores; inFreeroam = hide everything.
- After onExtensionUnloaded, isUnloaded is true and onUpdate no longer publishes anything: the variable is never set back to false (the module is reloaded as a new instance).

**Dependencies (loaded first):** `gameplay_drift_general`, `gameplay_drift_drift`, `gameplay_drift_scoring`, `ui_apps_genericMissionData`, `ui_appContainers`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drift_display.getDriftDebugInfo()` | Returns {default=false, canBeChanged=true} for the drift debug window. | 494 |
| `gameplay_drift_display.getIsScorePresentationActive(vehId)` | Indicates whether the confirmed score animation is in progress for this vehicle. | 70 |
| `gameplay_drift_display.getScorePresentationDuration()` | Returns the total duration of the confirmed score presentation (hold + dwindle + linger). Used by driftSpots to wait for the end of the animation. | 56 |
| `gameplay_drift_display.onDeserialized(data)` | Hook: restores driftDebugUILayout. *(internal)* *(hook)* | 453 |
| `gameplay_drift_display.onDonutDriftScored(score)` | Hook: flash message and stuntZoneScored event (donut type). *(internal)* *(hook)* | 171 |
| `gameplay_drift_display.onDriftCachedScoreReset(vehId)` | Hook: the cached score was reset; clears the real-time message. *(internal)* *(hook)* | 407 |
| `gameplay_drift_display.onDriftCompletedScored(data)` | Hook: starts the confirmed score presentation, displays "+points" and notifies the UI (setDriftPersistentDriftScored). *(internal)* *(hook)* | 143 |
| `gameplay_drift_display.onDriftContextChanged(context)` | Hook: shows or hides the drift UI apps according to the new context. *(internal)* *(hook)* | 463 |
| `gameplay_drift_display.onDriftCrash(vehId)` | Hook: shows the "crashed" failure in the UI and sets the smoother back to zero. *(internal)* *(hook)* | 163 |
| `gameplay_drift_display.onDriftDebugChanged(value)` | Hook: when debug is disabled, hides the drift interface. *(internal)* *(hook)* | 457 |
| `gameplay_drift_display.onDriftPlVehReset(vehId)` | Hook: player's vehicle put back in place; resets the smoother, the score presentation and the real-time message. *(internal)* *(hook)* | 401 |
| `gameplay_drift_display.onDriftQuickMessageDisplay(data)` | Hook: sends a quick message to the UI (displayDriftScoreModifier). *(internal)* *(hook)* | 396 |
| `gameplay_drift_display.onDriftScoreWrappedUp(score, vehId)` | Hook: the current score is force-validated (end of spot); starts the presentation and shows the bonus points. *(internal)* *(hook)* | 436 |
| `gameplay_drift_display.onDriftSpinout(vehId)` | Hook: shows the "spinout" failure in the UI. *(internal)* *(hook)* | 167 |
| `gameplay_drift_display.onDriftSpotCompleted(data)` | Hook: end-of-spot flash message (new record or zone completed) with the score. *(internal)* *(hook)* | 392 |
| `gameplay_drift_display.onDriftSpotFailed(data)` | Hook: 2 s flash message with the failure reason text. *(internal)* *(hook)* | 432 |
| `gameplay_drift_display.onExtensionLoaded()` | Hook: immediately applies the UI matching the already active drift context. *(internal)* *(hook)* | 480 |
| `gameplay_drift_display.onExtensionUnloaded()` | Hook: hides the UI, empties the data and publishes an empty stream. *(internal)* *(hook)* | 411 |
| `gameplay_drift_display.onFreeroamDriftZoneNewHighscore()` | Hook: "new best score" flash message. *(internal)* *(hook)* | 428 |
| `gameplay_drift_display.onHitPoleScored(score)` | Hook: flash message and stuntZoneScored event (hitPole type). *(internal)* *(hook)* | 186 |
| `gameplay_drift_display.onNearPoleScored(score)` | Hook: flash message and stuntZoneScored event (nearPole type). *(internal)* *(hook)* | 176 |
| `gameplay_drift_display.onNewDriftTierReached(tierData)` | Hook: shows the name of the new tier as a flash message. *(internal)* *(hook)* | 442 |
| `gameplay_drift_display.onSerialize()` | Hook: saves driftDebugUILayout before Lua reload. *(internal)* *(hook)* | 447 |
| `gameplay_drift_display.onTightDriftScored(score)` | Hook: flash message and stuntZoneScored event (tightDrift type). *(internal)* *(hook)* | 181 |
| `gameplay_drift_display.onUpdate(dtReal, dtSim, dtRaw)` | Called every frame (except after unloading): debug window, drift stream publishing, wrong-way, out-of-bounds and remaining distance messages. *(internal)* *(hook)* | 381 |
| `gameplay_drift_display.onVehicleDestroyed(vehId)` | Hook: removes the smoother and presentation of the destroyed vehicle. *(internal)* *(hook)* | 423 |
| `gameplay_drift_display.reset()` | Empties the creep smoothers, the score presentations, the player data pool and the gameplay_ui genericMissionData data. | 487 |

### Parameter details

#### `gameplay_drift_display.getDriftDebugInfo()`

Returns {default=false, canBeChanged=true} for the drift debug window.

- **returns**: table {default = false, canBeChanged = true}

#### `gameplay_drift_display.getIsScorePresentationActive(vehId)`

Indicates whether the confirmed score animation is in progress for this vehicle.

- `vehId` (*integer*) : Vehicle id.
- **returns**: boolean true if the phase is not idle.

#### `gameplay_drift_display.getScorePresentationDuration()`

Returns the total duration of the confirmed score presentation (hold + dwindle + linger). Used by driftSpots to wait for the end of the animation.

- **returns**: number Duration in seconds (2.0).

#### `gameplay_drift_display.onDeserialized(data)`

Hook: restores driftDebugUILayout.

- `data` (*table*) : onSerialize table.

#### `gameplay_drift_display.onDonutDriftScored(score)`

Hook: flash message and stuntZoneScored event (donut type).

- `score` (*number*) : Points earned.

#### `gameplay_drift_display.onDriftCachedScoreReset(vehId)`

Hook: the cached score was reset; clears the real-time message.

- `vehId` (*integer*) : Vehicle concerned.

#### `gameplay_drift_display.onDriftCompletedScored(data)`

Hook: starts the confirmed score presentation, displays "+points" and notifies the UI (setDriftPersistentDriftScored).

- `data` (*table*) : {vehId, addedScore, combo}.

#### `gameplay_drift_display.onDriftContextChanged(context)`

Hook: shows or hides the drift UI apps according to the new context.

- `context` (*string*) : New context of gameplay_drift_general.

#### `gameplay_drift_display.onDriftCrash(vehId)`

Hook: shows the "crashed" failure in the UI and sets the smoother back to zero.

- `vehId` (*integer*) : Vehicle concerned.

#### `gameplay_drift_display.onDriftDebugChanged(value)`

Hook: when debug is disabled, hides the drift interface.

- `value` (*boolean*) : New debug state.

#### `gameplay_drift_display.onDriftPlVehReset(vehId)`

Hook: player's vehicle put back in place; resets the smoother, the score presentation and the real-time message.

- `vehId` (*integer*) : Vehicle concerned.

#### `gameplay_drift_display.onDriftQuickMessageDisplay(data)`

Hook: sends a quick message to the UI (displayDriftScoreModifier).

- `data` (*table*) : {msg, displayTime, vehId?}.

#### `gameplay_drift_display.onDriftScoreWrappedUp(score, vehId)`

Hook: the current score is force-validated (end of spot); starts the presentation and shows the bonus points.

- `score` (*number*) : Validated score.
- `vehId` (*integer*) : Vehicle concerned.

#### `gameplay_drift_display.onDriftSpinout(vehId)`

Hook: shows the "spinout" failure in the UI.

- `vehId` (*integer*) : Vehicle concerned.

#### `gameplay_drift_display.onDriftSpotCompleted(data)`

Hook: end-of-spot flash message (new record or zone completed) with the score.

- `data` (*table*) : {newRecord, score, duration}.

#### `gameplay_drift_display.onDriftSpotFailed(data)`

Hook: 2 s flash message with the failure reason text.

- `data` (*table*) : {reason = {msg = translation key}, ...}.

#### `gameplay_drift_display.onHitPoleScored(score)`

Hook: flash message and stuntZoneScored event (hitPole type).

- `score` (*number*) : Points earned.

#### `gameplay_drift_display.onNearPoleScored(score)`

Hook: flash message and stuntZoneScored event (nearPole type).

- `score` (*number*) : Points earned.

#### `gameplay_drift_display.onNewDriftTierReached(tierData)`

Hook: shows the name of the new tier as a flash message.

- `tierData` (*table*) : Tier data (name used).

#### `gameplay_drift_display.onSerialize()`

Hook: saves driftDebugUILayout before Lua reload.

- **returns**: table {driftDebugUILayout}

#### `gameplay_drift_display.onTightDriftScored(score)`

Hook: flash message and stuntZoneScored event (tightDrift type).

- `score` (*number*) : Points earned.

#### `gameplay_drift_display.onUpdate(dtReal, dtSim, dtRaw)`

Called every frame (except after unloading): debug window, drift stream publishing, wrong-way, out-of-bounds and remaining distance messages.

- `dtReal` (*number*) : Real time delta in seconds, used for the animations.
- `dtSim` (*number*) : Simulated time delta (unused).
- `dtRaw` (*number*) : Raw time delta (unused).

#### `gameplay_drift_display.onVehicleDestroyed(vehId)`

Hook: removes the smoother and presentation of the destroyed vehicle.

- `vehId` (*integer*) : Destroyed vehicle.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drift_general, gameplay_drift_drift, gameplay_drift_scoring, ui_apps_genericMissionData, ui_appContainers. |

**UI events (guihooks.trigger):** `ClearTasklist`, `ScenarioRealtimeDisplay`, `TopCenterAppsFlashMessage`, `displayDriftScoreModifier`, `setDriftPersistentDriftScored`, `setDriftRealtimeFail`, `stuntZoneScored`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drift/display.lua`.*
