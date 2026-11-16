---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/display.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Display (UI) layer of drift. Every frame, publishes on the "drift" UI stream the state of each tracked vehicle (permanent score, potential score, cached score, combo, remaining combo time, creep, angle, speed, performance factor, confirmed score presentation phase). Reacts to the score, crash, spinout, cascade zone, spot and tier hooks with flash messages (TopCenterAppsFlashMessage) and guihooks events, and shows/hides the drift UI apps (scoreboard, tasks, driftScores, flashMessage) depending on the gameplay_drift_general context. Loaded by general in the contexts inChallenge, inFreeroamChallenge, inFreeroamCruising and inSplitscreen.
--- Access: extension `gameplay_drift_display`: `extensions.load("gameplay_drift_display")`, then the global `gameplay_drift_display`
---@class gameplay_drift_display
---@field dependencies string[] gameplay_drift_general, gameplay_drift_drift, gameplay_drift_scoring, ui_apps_genericMissionData, ui_appContainers.
gameplay_drift_display = {}

--- Returns {default=false, canBeChanged=true} for the drift debug window.
---Source: lua/ge/extensions/gameplay/drift/display.lua:494
---@return table  {default = false, canBeChanged = true}
function gameplay_drift_display.getDriftDebugInfo() end

--- Indicates whether the confirmed score animation is in progress for this vehicle.
---Source: lua/ge/extensions/gameplay/drift/display.lua:70
---@param vehId integer Vehicle id.
---@return boolean  true if the phase is not idle.
function gameplay_drift_display.getIsScorePresentationActive(vehId) end

--- Returns the total duration of the confirmed score presentation (hold + dwindle + linger). Used by driftSpots to wait for the end of the animation.
---Source: lua/ge/extensions/gameplay/drift/display.lua:56
---@return number  Duration in seconds (2.0).
function gameplay_drift_display.getScorePresentationDuration() end

--- Hook: restores driftDebugUILayout.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:453
---@param data table onSerialize table.
function gameplay_drift_display.onDeserialized(data) end

--- Hook: flash message and stuntZoneScored event (donut type).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:171
---@param score number Points earned.
function gameplay_drift_display.onDonutDriftScored(score) end

--- Hook: the cached score was reset; clears the real-time message.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:407
---@param vehId integer Vehicle concerned.
function gameplay_drift_display.onDriftCachedScoreReset(vehId) end

--- Hook: starts the confirmed score presentation, displays "+points" and notifies the UI (setDriftPersistentDriftScored).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:143
---@param data table {vehId, addedScore, combo}.
function gameplay_drift_display.onDriftCompletedScored(data) end

--- Hook: shows or hides the drift UI apps according to the new context.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:463
---@param context string New context of gameplay_drift_general.
function gameplay_drift_display.onDriftContextChanged(context) end

--- Hook: shows the "crashed" failure in the UI and sets the smoother back to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:163
---@param vehId integer Vehicle concerned.
function gameplay_drift_display.onDriftCrash(vehId) end

--- Hook: when debug is disabled, hides the drift interface.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:457
---@param value boolean New debug state.
function gameplay_drift_display.onDriftDebugChanged(value) end

--- Hook: player's vehicle put back in place; resets the smoother, the score presentation and the real-time message.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:401
---@param vehId integer Vehicle concerned.
function gameplay_drift_display.onDriftPlVehReset(vehId) end

--- Hook: sends a quick message to the UI (displayDriftScoreModifier).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:396
---@param data table {msg, displayTime, vehId?}.
function gameplay_drift_display.onDriftQuickMessageDisplay(data) end

--- Hook: the current score is force-validated (end of spot); starts the presentation and shows the bonus points.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:436
---@param score number Validated score.
---@param vehId integer Vehicle concerned.
function gameplay_drift_display.onDriftScoreWrappedUp(score, vehId) end

--- Hook: shows the "spinout" failure in the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:167
---@param vehId integer Vehicle concerned.
function gameplay_drift_display.onDriftSpinout(vehId) end

--- Hook: end-of-spot flash message (new record or zone completed) with the score.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:392
---@param data table {newRecord, score, duration}.
function gameplay_drift_display.onDriftSpotCompleted(data) end

--- Hook: 2 s flash message with the failure reason text.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:432
---@param data table {reason = {msg = translation key}, ...}.
function gameplay_drift_display.onDriftSpotFailed(data) end

--- Hook: immediately applies the UI matching the already active drift context.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:480
function gameplay_drift_display.onExtensionLoaded() end

--- Hook: hides the UI, empties the data and publishes an empty stream.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:411
function gameplay_drift_display.onExtensionUnloaded() end

--- Hook: "new best score" flash message.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:428
function gameplay_drift_display.onFreeroamDriftZoneNewHighscore() end

--- Hook: flash message and stuntZoneScored event (hitPole type).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:186
---@param score number Points earned.
function gameplay_drift_display.onHitPoleScored(score) end

--- Hook: flash message and stuntZoneScored event (nearPole type).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:176
---@param score number Points earned.
function gameplay_drift_display.onNearPoleScored(score) end

--- Hook: shows the name of the new tier as a flash message.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:442
---@param tierData table Tier data (name used).
function gameplay_drift_display.onNewDriftTierReached(tierData) end

--- Hook: saves driftDebugUILayout before Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:447
---@return table  {driftDebugUILayout}
function gameplay_drift_display.onSerialize() end

--- Hook: flash message and stuntZoneScored event (tightDrift type).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:181
---@param score number Points earned.
function gameplay_drift_display.onTightDriftScored(score) end

--- Called every frame (except after unloading): debug window, drift stream publishing, wrong-way, out-of-bounds and remaining distance messages.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:381
---@param dtReal number Real time delta in seconds, used for the animations.
---@param dtSim number Simulated time delta (unused).
---@param dtRaw number Raw time delta (unused).
function gameplay_drift_display.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook: removes the smoother and presentation of the destroyed vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/display.lua:423
---@param vehId integer Destroyed vehicle.
function gameplay_drift_display.onVehicleDestroyed(vehId) end

--- Empties the creep smoothers, the score presentations, the player data pool and the gameplay_ui genericMissionData data.
---Source: lua/ge/extensions/gameplay/drift/display.lua:487
function gameplay_drift_display.reset() end

