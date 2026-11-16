---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "First Drive" tutorial telemetry tracker: the session (activity "firstDriveActive"), its lessons (started, stopped, completed, with duration) and the vehicle recoveries made during the session. Outside a session, only a "firstDriveProgress" snapshot (completed lessons, read from settings/firstDriveLearning.json) is sent, at most once per survey interval or when the progress changes.
--- Access: extension `telemetry_trackers_gameplay_firstDrive`: `extensions.load("telemetry_trackers_gameplay_firstDrive")`, then the global `telemetry_trackers_gameplay_firstDrive`
---@class telemetry_trackers_gameplay_firstDrive
---@field dependencies string[] telemetry_core.
telemetry_trackers_gameplay_firstDrive = {}

--- Hook called on load: manual unload, then possible send of the progress snapshot.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:171
function telemetry_trackers_gameplay_firstDrive.onExtensionLoaded() end

--- Hook called on unload (game close, Lua reload or tracker disabled): ends the session with the reason trackerUnloaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:179
function telemetry_trackers_gameplay_firstDrive.onExtensionUnloaded() end

--- Hook called when First Drive ends: ends the activity; if reason is completed, also emits firstDriveCompleted with the duration.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:120
---@param reason string completed, skipToFreeroam, mainMenu, startFailed or clientEndMission.
function telemetry_trackers_gameplay_firstDrive.onFirstDriveEnded(reason) end

--- Hook called when a lesson is passed: emits firstDriveLessonCompleted with duration.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:153
---@param id string Lesson identifier.
function telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonCompleted(id) end

--- Hook called at the start of a lesson: emits firstDriveLessonStarted (ignored outside a session).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:124
---@param id string Lesson identifier.
function telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonStarted(id) end

--- Hook called when a lesson is interrupted: emits firstDriveLessonStopped with reason and duration.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:149
---@param id string Lesson identifier.
---@param reason string Reason for the stop.
function telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonStopped(id, reason) end

--- Hook called when First Drive starts (also on a restart from the pause menu, which closes the previous session): starts the firstDriveActive activity with completed lessons.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:104
---@param startAtLookout boolean true if the start is at the viewpoint.
function telemetry_trackers_gameplay_firstDrive.onFirstDriveStarted(startAtLookout) end

--- Hook called when vehicle recovery stops: emits firstDriveVehicleRecovered with the hold duration, the phase and the lesson (ignored during the recovery preview).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:157
---@param timer number Hold duration in seconds.
function telemetry_trackers_gameplay_firstDrive.onStopRecovering(timer) end

