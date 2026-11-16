---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/session.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Session telemetry tracker: marks the start and end of the session. It loads first and unloads last, so it brackets all other events. A game engine Lua reload continues the current session. At the start: "session" event (type start) with facts about the client, languages, telemetry version, tech license, timezone, anonymous ID, Big Picture mode, power and VR. At the end: "session" (type end) with the duration.
--- Access: extension `telemetry_trackers_session`: `extensions.load("telemetry_trackers_session")`, then the global `telemetry_trackers_session`
---@class telemetry_trackers_session
---@field dependencies string[] telemetry_core.
telemetry_trackers_session = {}

--- Hook called on load: emits the session start event (except for a continued session), tries to emit the login and switches to manual unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/session.lua:59
---@param previousState table|nil State returned by onSerialize ({loginLogged}) during a reload.
function telemetry_trackers_session.onExtensionLoaded(previousState) end

--- Hook called on unload: emits the session end event with the duration (except on a Lua reload).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/session.lua:95
function telemetry_trackers_session.onExtensionUnloaded() end

--- Hook called when the online connection state changes: once the connection is back (first moment the server clock is known), emits the login event.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/session.lua:115
---@param connected boolean true if connected.
function telemetry_trackers_session.onOnlineStateChanged(connected) end

--- Hook called before unload: remembers whether it is a Lua reload and returns {loginLogged}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/session.lua:108
---@param reason string Reason ("reload" for a reload).
---@return table  {loginLogged}
function telemetry_trackers_session.onSerialize(reason) end

