---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/mods.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `telemetry_trackers_mods` : `extensions.load("telemetry_trackers_mods")`, puis la globale `telemetry_trackers_mods`
---@class telemetry_trackers_mods
---@field dependencies table
telemetry_trackers_mods = {}

---Source : lua/ge/extensions/telemetry/trackers/mods.lua:84
function telemetry_trackers_mods.onExtensionLoaded() end

--- The mod database is only filled once the mod manager is up, which is well after
---  telemetry starts, so the survey cannot happen in onExtensionLoaded
---Source : lua/ge/extensions/telemetry/trackers/mods.lua:57
function telemetry_trackers_mods.onModManagerReady() end

