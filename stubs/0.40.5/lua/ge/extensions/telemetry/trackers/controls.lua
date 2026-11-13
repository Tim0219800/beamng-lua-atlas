---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/controls.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `telemetry_trackers_controls` : `extensions.load("telemetry_trackers_controls")`, puis la globale `telemetry_trackers_controls`
---@class telemetry_trackers_controls
---@field dependencies table
telemetry_trackers_controls = {}

---Source : lua/ge/extensions/telemetry/trackers/controls.lua:45
function telemetry_trackers_controls.onExtensionLoaded() end

--- core unloads the trackers before it flushes the buffer, so this still reaches the file
---Source : lua/ge/extensions/telemetry/trackers/controls.lua:50
function telemetry_trackers_controls.onExtensionUnloaded() end

---Source : lua/ge/extensions/telemetry/trackers/controls.lua:56
---@param reason any
function telemetry_trackers_controls.onSerialize(reason) end

---Source : lua/ge/extensions/telemetry/trackers/controls.lua:22
---@param method any
function telemetry_trackers_controls.onSteeringFilterChanged(method) end

