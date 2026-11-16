---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/crashCamMode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Crash camera (automatic slow motion) of freeroam mode. Every frame, it predicts (0.2 s ahead) whether the player's vehicle will hit a traffic/parked vehicle, a wall (static rays) or suffers a sudden speed change; if the speed difference exceeds 13 m/s, it switches to slow motion (simTimeAuthority 0.15), hides the UI and switches to the 'crash' camera or to a camera path. It then restores the previous speed, UI and camera and emits onCrashCamEnded. Loaded by freeroam_crashCamModeLoader according to the enableCrashCam setting.
--- Access: extension `freeroam_crashCamMode`: `extensions.load("freeroam_crashCamMode")`, then the global `freeroam_crashCamMode`
---@class freeroam_crashCamMode
freeroam_crashCamMode = {}

--- Returns the current tracking mode.
---Source: lua/ge/extensions/freeroam/crashCamMode.lua:707
---@return integer  1 (traffic and walls) or 2 (all active vehicles and walls).
function freeroam_crashCamMode.getTrackingMode() end

--- Hook called when a mission changes state: disables the crash camera on start ('started'), re-enables it on stop ('stopped').
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/crashCamMode.lua:691
---@param state string Mission state: 'started' or 'stopped' (other values are ignored).
function freeroam_crashCamMode.onAnyMissionChanged(state) end

--- Hook called just before the big map opens: stops the crash camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/crashCamMode.lua:668
function freeroam_crashCamMode.onBeforeBigMapActivated() end

--- Hook called before a menu opens: stops the crash camera if it is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/crashCamMode.lua:678
function freeroam_crashCamMode.onBeforeMenuOpened() end

--- Hook called at the end of the level: disables the crash camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/crashCamMode.lua:643
---@param levelPath string Path of the level being left (unused).
function freeroam_crashCamMode.onClientEndMission(levelPath) end

--- Hook called when the level starts: enables the crash camera if the game state is 'freeroam'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/crashCamMode.lua:647
function freeroam_crashCamMode.onClientStartMission() end

--- Hook called on load: returns false if the enableCrashCam setting is disabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/crashCamMode.lua:653
---@return boolean|nil  false if disabled, nil otherwise.
function freeroam_crashCamMode.onExtensionLoaded() end

--- Hook called on unload: cleanly stops the crash camera (restores speed, UI and camera).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/crashCamMode.lua:657
function freeroam_crashCamMode.onExtensionUnloaded() end

--- Hook called when the replay state changes: stops the crash camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/crashCamMode.lua:635
---@param state string New replay state (unused).
function freeroam_crashCamMode.onReplayStateChanged(state) end

--- Hook called before an extension reload: stops the crash camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/crashCamMode.lua:639
function freeroam_crashCamMode.onSerialize() end

--- Hook called when the game is paused or resumed: stops the crash camera if it is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/crashCamMode.lua:672
function freeroam_crashCamMode.onTogglePause() end

--- Hook called every frame: detects imminent crashes (traffic, wall, speed change) when the crash camera is inactive; when it is active, tracks its duration, checks the impact between vehicles, starts the camera path in mode 3 and stops it after 4 s or on teleportation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/crashCamMode.lua:535
---@param dtReal number Elapsed real time (s).
---@param dtSim number Simulation elapsed time (s).
function freeroam_crashCamMode.onUpdate(dtReal, dtSim) end

--- Hook called when a vehicle is put back in place: stops the crash camera if it is the player's vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/crashCamMode.lua:629
---@param vehId integer Id of the reset vehicle.
function freeroam_crashCamMode.onVehicleResetted(vehId) end

--- Hook called when the player vehicle changes: if the crash camera is active, puts the previous camera back on the old vehicle, then stops the crash camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/crashCamMode.lua:684
---@param oldVehId integer Id of the player's old vehicle.
function freeroam_crashCamMode.onVehicleSwitched(oldVehId) end

--- Forces the detection to run even outside freeroam or if the crash camera is disabled.
---Source: lua/ge/extensions/freeroam/crashCamMode.lua:711
---@param enabled boolean true to force.
function freeroam_crashCamMode.setForcedEnabled(enabled) end

--- Chooses the tracking mode (1 or 2, see notes).
---Source: lua/ge/extensions/freeroam/crashCamMode.lua:703
---@param mode integer 1 or 2.
function freeroam_crashCamMode.setTrackingMode(mode) end

--- To be called when the user changes camera mode: stops the crash camera if it is active (no caller in this file).
---Source: lua/ge/extensions/freeroam/crashCamMode.lua:662
function freeroam_crashCamMode.trackCamMode() end

--- Stops the crash camera (called on vehicle reset; unlike onVehicleResetted, does not check which vehicle).
---Source: lua/ge/extensions/freeroam/crashCamMode.lua:699
function freeroam_crashCamMode.trackVehReset() end

