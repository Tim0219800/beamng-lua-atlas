---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/core.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- BeamNG's telemetry core (GE extension telemetry_core, depends on telemetry_configManager). It decides whether telemetry is active (consent in the settings, launch arguments, server config), buffers the events sent by the trackers (addEvent), writes them as JSON Lines in /telemetry/sessions/<id>.jsonl, automatically loads the trackers from the telemetry/trackers/ folder enabled by the config and the jsonFileReporter reporter that sends the sessions of previous runs. A modder normally does not need to call it; they can only observe the onTelemetryEventAdded hook.
--- Access: extension `telemetry_core`: `extensions.load("telemetry_core")`, then the global `telemetry_core`
---@class telemetry_core
---@field dependencies string[] {'telemetry_configManager'}: declared but not called on demand, so that the trackers do not start before the config is initialized.
telemetry_core = {}

--- Adds an event to the session buffer. The event must be a table with a name field (non-empty string). Adds t = os.clockhp() to it, calls the hook onTelemetryEventAdded(event), encodes it as JSON on one line and flushes the buffer to disk every 100 events.
---Source: lua/ge/extensions/telemetry/core.lua:75
---@param event table Event: name required, other fields free, t forbidden.
---@return boolean  true if the event was stored, false if it was refused (telemetry inactive, invalid table, missing name).
function telemetry_core.addEvent(event) end

--- Adds the event {name = activityName, type = 'end'} merged with data.
---Source: lua/ge/extensions/telemetry/core.lua:479
---@param activityName string Name of the started activity.
---@param data table|nil Additional fields of the event.
function telemetry_core.endActivity(activityName, data) end

--- Telemetry data folder: '/telemetry/local/' in -telemetryLocal mode (separate sessions and surveys, never sent by a normal run's reporter), otherwise '/telemetry/'.
---Source: lua/ge/extensions/telemetry/core.lua:30
---@return string  Folder path.
function telemetry_core.getDataFolder() end

--- List of telemetry runs (runIds from the server config) for which the session collects. Set before the trackers are loaded.
---Source: lua/ge/extensions/telemetry/core.lua:457
---@return string[]|nil  Run identifiers.
function telemetry_core.getRunIds() end

--- Elapsed time in seconds (os.clockhp()), used by the trackers to measure durations.
---Source: lua/ge/extensions/telemetry/core.lua:452
---@return number  Seconds.
function telemetry_core.getRunTime() end

--- .jsonl file of the current session. The reporter must neither send nor delete it.
---Source: lua/ge/extensions/telemetry/core.lua:40
---@return string|nil  Path, or nil if there is no session.
function telemetry_core.getSessionFile() end

--- Session identifier: timestamp plus random bytes, unrelated to the account token or an identity. Used to recognize a duplicate resend after a lost response.
---Source: lua/ge/extensions/telemetry/core.lua:47
---@return string|nil  Session identifier.
function telemetry_core.getSessionId() end

--- Returns false for the 'ps5' and 'ps5pro' platforms, true otherwise.
---Source: lua/ge/extensions/telemetry/core.lua:123
---@param platform string Value of Engine.Platform.getPlatform() ('' on PC).
---@return boolean  true if telemetry can run.
function telemetry_core.isPlatformSupported(platform) end

--- Indicates whether the current session resumes the one from before a Lua reload.
---Source: lua/ge/extensions/telemetry/core.lua:461
---@return boolean  true if the session is resumed.
function telemetry_core.isSessionContinued() end

--- Hook called when the game closes; same function as onExtensionUnloaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/core.lua:436
function telemetry_core.onExit() end

--- Load hook: sets the unload mode to manual, enables telemetry if shouldTelemetryBeActive(); otherwise closes the previous session and stays in no-effect mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/core.lua:403
---@param previousSession table|nil Data returned by onSerialize before a Lua reload (sessionId, runIds).
---@return boolean  Always true (stays loaded).
function telemetry_core.onExtensionLoaded(previousSession) end

--- Unload hook: disables telemetry (writes the remaining events, unloads trackers and reporter) and turns off the config polling.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/core.lua:436
function telemetry_core.onExtensionUnloaded() end

--- Serialization hook: on a Lua reload (reason == 'reload') with a valid session, returns {sessionId, runIds} to resume the session afterwards.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/core.lua:443
---@param reason string Reason for the serialization ('reload'...).
---@return table|nil  Resume data.
function telemetry_core.onSerialize(reason) end

--- Hook called when the settings change: enables or disables telemetry according to consent, and turns off config polling if it is inactive.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/core.lua:421
function telemetry_core.onSettingsChanged() end

--- Adds the event {name = activityName, type = 'start'} merged with data, to measure a duration with endActivity.
---Source: lua/ge/extensions/telemetry/core.lua:473
---@param activityName string Activity name.
---@param data table|nil Additional fields of the event.
function telemetry_core.startActivity(activityName, data) end

--- Immediately writes the buffered events to the session file, so they survive a crash.
---Source: lua/ge/extensions/telemetry/core.lua:466
function telemetry_core.triggerReportWrite() end

