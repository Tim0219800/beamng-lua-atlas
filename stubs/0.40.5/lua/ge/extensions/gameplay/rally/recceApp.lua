---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/recceApp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- The rally "Recce" app in freeroam: lets you load a rally mission (rallyStage, rallyStageLoop or rallyRoadSection of the current level), display the upcoming pacenotes, teleport the vehicle along the pacenotes, to the start or to the mission trigger, and record a recce (vehicle driveline and voice "cuts"). Also provides a "Recce Toolbox" imgui window drawn in onUpdate. Relies on gameplay_rally (loadMission, getRallyManager, canManageMission), RecceSettings, VehicleCapture and CutCapture. Does nothing in onUpdate until setEnabled(true) has been called.
--- Access: extension `gameplay_rally_recceApp`: `extensions.load("gameplay_rally_recceApp")`, then the global `gameplay_rally_recceApp`
---@class gameplay_rally_recceApp
gameplay_rally_recceApp = {}

--- Closes the imgui window (without disabling the app).
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:522
function gameplay_rally_recceApp.closeWindow() end

--- Indicates whether the app is enabled.
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:80
---@return boolean  enabled state
function gameplay_rally_recceApp.isEnabled() end

--- Indicates whether a driveline recording is in progress.
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:764
---@return boolean  true during recording
function gameplay_rally_recceApp.isRecording() end

--- Indicates whether the imgui window is open.
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:770
---@return boolean  true if open
function gameplay_rally_recceApp.isWindowVisible() end

--- Loads a mission via gameplay_rally.loadMission (owner 'recce'), builds the kd-tree index of the notebook's corner starts, stores the mission and the load state, then sends rally.recceApp.missionLoaded.
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:113
---@param missionId string Mission identifier
---@param missionDir string Mission folder
---@return boolean  true if the mission is loaded
---@return string|nil  Error message on failure
function gameplay_rally_recceApp.loadMission(missionId, missionDir) end

--- Teleports the player vehicle to the previous pacenote (or the closest if far from any pacenote), then resyncs the rally manager.
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:301
function gameplay_rally_recceApp.moveVehicleBackward() end

--- Teleports the player vehicle to the next pacenote (or the closest if far from any pacenote), then resyncs the rally manager.
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:297
function gameplay_rally_recceApp.moveVehicleForward() end

--- Teleports the player vehicle to the mission's start trigger (pos, rot), then resyncs the rally manager.
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:305
function gameplay_rally_recceApp.moveVehicleToMission() end

--- Teleports the player vehicle to the race path's default start position (orientation flipped by 180°), then resyncs the rally manager.
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:212
function gameplay_rally_recceApp.moveVehicleToStart() end

--- Extension hook called every frame: if the app is enabled, draws the pacenotes (or the short route), the imgui window if open, and captures the vehicle position during driveline recording.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:329
---@param dtReal number Real time elapsed (s)
---@param dtSim number Simulation time elapsed (s)
---@param dtRaw number Raw time elapsed (s)
function gameplay_rally_recceApp.onUpdate(dtReal, dtSim, dtRaw) end

--- Enables the app, opens the "Recce Toolbox" imgui window and refreshes the mission list.
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:516
function gameplay_rally_recceApp.openWindow() end

--- Clears the mission's recording files: driveline, cuts and transcripts (file truncation).
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:397
function gameplay_rally_recceApp.recordDrivelineClearAll() end

--- Records a cut at the vehicle's current position (CutCapture) and, if voice recording is enabled, requests the transcription from the rally client.
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:354
function gameplay_rally_recceApp.recordDrivelineCut() end

--- Starts the driveline recording: initializes the captures (recce folders created if needed) and enables per-frame capture.
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:372
---@param recordVoice boolean true to also transcribe the voice at each cut
function gameplay_rally_recceApp.recordDrivelineStart(recordVoice) end

--- Stops the recording: writes the vehicle captures to disk then forgets the captures.
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:382
function gameplay_rally_recceApp.recordDrivelineStop() end

--- Disables the app, closes the window, forgets the captures and unloads the mission if it belongs to 'recce'.
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:178
function gameplay_rally_recceApp.release() end

--- Reloads the RecceSettings, rebuilds the level's list of rally missions and sends the UI hook rally.recceApp.refreshed with {missions, last_mission_id, last_load_state, can_auto_load, corner_angles_style}.
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:492
---@param rallyExt any Not used in the function body
function gameplay_rally_recceApp.reload(rallyExt) end

--- Enables or disables the app; onUpdate does nothing if it is disabled.
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:76
---@param val boolean true to enable
function gameplay_rally_recceApp.setEnabled(val) end

--- Stores in the settings the last load state (true/false) for the current level.
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:107
---@param state boolean true if a mission was loaded
function gameplay_rally_recceApp.setLastLoadState(state) end

--- Stores in the settings the last mission id for the current level.
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:101
---@param mid string Mission identifier
function gameplay_rally_recceApp.setLastMissionId(mid) end

--- Enables or disables the display of the next pacenotes while driving (outside the active editor and when the rally toolbox is not visible).
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:342
---@param val boolean true to show
function gameplay_rally_recceApp.setShowNotes(val) end

--- Toggles gameplay_rally's debug mode (gameplay_rally.toggleDebug).
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:416
function gameplay_rally_recceApp.toggleDebug() end

--- Toggles the rally toolbox's move-vehicle-with-mouse checkbox, if it exists.
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:633
function gameplay_rally_recceApp.toggleMouseLikeVehicle() end

--- Opens the window if it is closed, closes it otherwise.
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:526
function gameplay_rally_recceApp.toggleWindow() end

--- Unloads the mission of the 'recce' owner and stores the load state as false.
---Source: lua/ge/extensions/gameplay/rally/recceApp.lua:167
---@return boolean  false if the unload is refused
---@return string|nil  Error message on refusal
function gameplay_rally_recceApp.unloadMission() end

