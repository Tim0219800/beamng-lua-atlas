---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Entry point of rally mode (gameplay_rally extension). It owns the rally manager (RallyManager) loaded for a mission, relays updates to the recce app (RecceApp) and to the manager, provides the debug toolbox (ImGui), places a dummy co-driver in the driver's mirror seat, forwards input actions (recce, co-driver pacing) and handles the theme color of the UI streams. A rally modder uses it to load/unload a rally, read its state or adjust the co-driver pacing.
--- Access: extension `gameplay_rally`: `extensions.load("gameplay_rally")`, then the global `gameplay_rally`
---@class gameplay_rally
---@field dependencies string[] {'gameplay_seatOccupants'}, extension loaded beforehand.
---@field recceApp table RecceApp module (rally recce app) exposed as is.
gameplay_rally = {}

--- Input action: advances the co-driver's calls by 0.1 s (shifts the delay range) and shows a message.
---Source: lua/ge/extensions/gameplay/rally.lua:307
function gameplay_rally.actionCodriverCallsEarlier() end

--- Input action: delays the co-driver's calls by 0.1 s and shows a message.
---Source: lua/ge/extensions/gameplay/rally.lua:311
function gameplay_rally.actionCodriverCallsLater() end

--- Input action: if the recce is active, sends rallyInputActionRecceMoveVehicleBackward to the UI.
---Source: lua/ge/extensions/gameplay/rally.lua:266
function gameplay_rally.actionRecceMoveVehicleBackward() end

--- Input action: if the recce is active, sends rallyInputActionRecceMoveVehicleForward to the UI.
---Source: lua/ge/extensions/gameplay/rally.lua:261
function gameplay_rally.actionRecceMoveVehicleForward() end

--- Input action: toggles the mouse like a vehicle in the recce (if RecceApp is enabled).
---Source: lua/ge/extensions/gameplay/rally.lua:252
function gameplay_rally.actionToggleMouseLikeVehicle() end

--- Input action: sends rallyInputActionCutRecording to the UI (cuts the transcription recording).
---Source: lua/ge/extensions/gameplay/rally.lua:257
function gameplay_rally.actionTranscribeRecordingCut() end

--- Indicates whether the given owner is allowed to manage the rally manager.
---Source: lua/ge/extensions/gameplay/rally.lua:79
---@param owner string|nil 'mission', 'recce' or 'external' (default).
---@return boolean  true if allowed.
---@return string|nil  Reason for the refusal.
function gameplay_rally.canManageMission(owner) end

--- Enables or disables the recce app (RecceApp.setEnabled).
---Source: lua/ge/extensions/gameplay/rally.lua:179
---@param val boolean true to enable.
function gameplay_rally.enableRecceApp(val) end

--- Indicates whether the rally debug logs are active.
---Source: lua/ge/extensions/gameplay/rally.lua:457
---@return boolean  true if active.
function gameplay_rally.getDebugLogging() end

--- Last user-facing error message (load failure).
---Source: lua/ge/extensions/gameplay/rally.lua:432
---@return string|nil  Message.
function gameplay_rally.getErrorMsgForUser() end

--- Race data recorded by the onRallyRegisterRace hook.
---Source: lua/ge/extensions/gameplay/rally.lua:498
---@return table|nil  raceData.
function gameplay_rally.getRace() end

--- Current rally manager.
---Source: lua/ge/extensions/gameplay/rally.lua:430
---@return table|nil  RallyManager or nil.
function gameplay_rally.getRallyManager() end

--- Owner of the current manager.
---Source: lua/ge/extensions/gameplay/rally.lua:431
---@return string|nil  'mission', 'recce', 'external' or nil.
function gameplay_rally.getRallyManagerOwner() end

--- Debug toolbox object (nil until toggleDebug has been called).
---Source: lua/ge/extensions/gameplay/rally.lua:303
---@return table|nil  RallyToolbox.
function gameplay_rally.getRallyToolbox() end

--- Indicates whether the vehicle must be repaired on recovery: asks the loop manager (gameplay_rallyLoop) if it exists, otherwise reads rallyRepairVehicleOnRecovery (mission setting, then game setting, default true).
---Source: lua/ge/extensions/gameplay/rally.lua:433
---@return boolean  true if repair.
function gameplay_rally.getRecoveryRepairVehicle() end

--- State of the manager's stage observer.
---Source: lua/ge/extensions/gameplay/rally.lua:452
---@return table|nil  State, nil without a manager.
function gameplay_rally.getStageObserverState() end

--- Stage runtime authority mode of the manager, or 'shadow' without a manager.
---Source: lua/ge/extensions/gameplay/rally.lua:449
---@return string  Mode.
function gameplay_rally.getStageRuntimeAuthorityMode() end

--- Current theme color: override if set, otherwise the loop manager's color (gameplay_rallyLoop), otherwise the standalone stream's, otherwise '#009a1a'.
---Source: lua/ge/extensions/gameplay/rally.lua:487
---@return string  Hexadecimal color.
function gameplay_rally.getUiColor() end

--- Color override set by setUiColor.
---Source: lua/ge/extensions/gameplay/rally.lua:490
---@return string|nil  Color or nil.
function gameplay_rally.getUiColorOverride() end

--- Indicates whether the Rally Toolbox window is open.
---Source: lua/ge/extensions/gameplay/rally.lua:496
---@return boolean  true if visible.
function gameplay_rally.isRallyToolboxVisible() end

--- Indicates whether a rally manager is loaded.
---Source: lua/ge/extensions/gameplay/rally.lua:171
---@return boolean  true if loaded.
function gameplay_rally.isReady() end

--- Creates a RallyManager for the mission folder, sets the voicepack, rebuilds the assets and, on success, installs it and places the co-driver. Does not replace the old manager on failure.
---Source: lua/ge/extensions/gameplay/rally.lua:130
---@param missionId string Mission id.
---@param missionDir string Rally mission folder.
---@param drivelineMode any Not used (commented-out code).
---@param voicepackPick any Voicepack; nil = choice read from the mission's user settings (rallyVoicepackPick).
---@param options table|nil owner: 'mission', 'recce' or 'external'.
---@return boolean  true if loaded.
---@return string|nil  Error message on failure.
function gameplay_rally.loadMission(missionId, missionDir, drivelineMode, voicepackPick, options) end

--- Load hook: loads ExtHelper and sends rally.onExtensionLoaded to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally.lua:233
function gameplay_rally.onExtensionLoaded() end

--- Unload hook: removes the dummy co-driver and unloads ExtHelper.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally.lua:240
function gameplay_rally.onExtensionUnloaded() end

--- Race hook: records a split time (recordSplit) for the pathnode reached; logs a warning if event.pathnode is missing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally.lua:320
---@param event table {pathnode, time, race}
function gameplay_rally.onRacePathnodeReached(event) end

--- Hook: stores the race data and passes it to the manager (setRaceData).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally.lua:380
---@param raceData table Race data.
function gameplay_rally.onRallyRegisterRace(raceData) end

--- Hook: adds the recovery time to the manager (addRecoveryRaceTime).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally.lua:388
---@param recoveryType string Recovery type.
function gameplay_rally.onRallyVehicleRecovery(recoveryType) end

--- Seat hook: replaces the dummy co-driver (alias of the internal function seatCodriver).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally.lua:111
function gameplay_rally.onSeatOccupantEnter() end

--- Seat hook: replaces the dummy co-driver after an occupant leaves (the seat system removes dummy occupants on configuration respawns).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally.lua:111
function gameplay_rally.onSeatOccupantExit() end

--- Settings change hook: notifies the rally manager.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally.lua:417
function gameplay_rally.onSettingsChanged() end

--- Called every frame: updates RecceApp and the rally manager (except during the recce recording) and draws the Rally Toolbox if visible.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally.lua:183
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
---@param dtRaw number Raw time delta (s).
function gameplay_rally.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook: when player 0's vehicle is reset, notifies the rally manager.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally.lua:210
---@param vehicleID integer Vehicle reset.
function gameplay_rally.onVehicleResetted(vehicleID) end

--- Enables or disables the rally debug logs.
---Source: lua/ge/extensions/gameplay/rally.lua:458
---@param val boolean New state.
function gameplay_rally.setDebugLogging(val) end

--- Passes the stage runtime authority mode to the manager.
---Source: lua/ge/extensions/gameplay/rally.lua:444
---@param mode string Mode (default value 'shadow'; other values defined by the manager).
function gameplay_rally.setStageRuntimeAuthorityMode(mode) end

--- Overrides the theme color of the Stage Timing / Progress streams. nil or an empty string clears the override.
---Source: lua/ge/extensions/gameplay/rally.lua:484
---@param hex string|nil Hexadecimal color, e.g. '#ff0000'.
function gameplay_rally.setUiColor(hex) end

--- Shows or hides the "Rally Toolbox" ImGui window (created on the first call).
---Source: lua/ge/extensions/gameplay/rally.lua:291
function gameplay_rally.toggleDebug() end

--- Unloads the rally manager if the owner matches.
---Source: lua/ge/extensions/gameplay/rally.lua:156
---@param options table|nil owner (default 'external').
---@return boolean  true if unloaded.
---@return string|nil  Reason for the refusal.
function gameplay_rally.unloadMission(options) end

