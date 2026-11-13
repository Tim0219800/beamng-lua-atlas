---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/session.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `telemetry_trackers_session` : `extensions.load("telemetry_trackers_session")`, puis la globale `telemetry_trackers_session`
---@class telemetry_trackers_session
---@field dependencies table
telemetry_trackers_session = {}

--- Lifecycle functions
---Source : lua/ge/extensions/telemetry/trackers/session.lua:59
---@param previousState any
function telemetry_trackers_session.onExtensionLoaded(previousState) end

---Source : lua/ge/extensions/telemetry/trackers/session.lua:95
function telemetry_trackers_session.onExtensionUnloaded() end

--- Fired once the login came back, which is the first moment the server clock is known.
---  utcTimeAdjusted together with the event's own t anchors every other event in this session.
---Source : lua/ge/extensions/telemetry/trackers/session.lua:115
---@param connected any
function telemetry_trackers_session.onOnlineStateChanged(connected) end

---Source : lua/ge/extensions/telemetry/trackers/session.lua:108
---@param reason any
function telemetry_trackers_session.onSerialize(reason) end

