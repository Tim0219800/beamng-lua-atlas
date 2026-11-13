---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `telemetry_trackers_gameplay_firstDrive` : `extensions.load("telemetry_trackers_gameplay_firstDrive")`, puis la globale `telemetry_trackers_gameplay_firstDrive`
---@class telemetry_trackers_gameplay_firstDrive
---@field dependencies table
telemetry_trackers_gameplay_firstDrive = {}

---Source : lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:171
function telemetry_trackers_gameplay_firstDrive.onExtensionLoaded() end

--- game exit, a lua reload and disabling the tracker all unload it, the core unloads the
---  trackers before their onExit would run
---Source : lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:179
function telemetry_trackers_gameplay_firstDrive.onExtensionUnloaded() end

--- reason: completed, skipToFreeroam, mainMenu, startFailed or clientEndMission
---Source : lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:120
---@param reason any
function telemetry_trackers_gameplay_firstDrive.onFirstDriveEnded(reason) end

---Source : lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:153
---@param id any
function telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonCompleted(id) end

---Source : lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:124
---@param id any
function telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonStarted(id) end

--- reason: pauseMenu when the player stops it, otherwise leftArea, leftStartArea, sessionEnded,
---  completionFailed or a lesson specific one like vehicleChanged
---Source : lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:149
---@param id any
---@param reason any
function telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonStopped(id, reason) end

--- Also fires for a restart from the pause menu, which closes the previous session
---Source : lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:104
---@param startAtLookout any
function telemetry_trackers_gameplay_firstDrive.onFirstDriveStarted(startAtLookout) end

---Source : lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:157
---@param timer any
function telemetry_trackers_gameplay_firstDrive.onStopRecovering(timer) end

