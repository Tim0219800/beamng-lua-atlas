---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/mods.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mods telemetry tracker: reports which mods are installed and active, to distinguish crashes and performance between modded and clean installations. Only the name, type, repository identifier (modID), active state and whether the mod is unpacked are sent, never file paths (event "modSurvey" with the mod manager's counts).
--- Access: extension `telemetry_trackers_mods`: `extensions.load("telemetry_trackers_mods")`, then the global `telemetry_trackers_mods`
---@class telemetry_trackers_mods
---@field dependencies string[] telemetry_core.
telemetry_trackers_mods = {}

--- Hook called on load: manual unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/mods.lua:84
function telemetry_trackers_mods.onExtensionLoaded() end

--- Hook called when the mod manager is ready: collects the sorted list of mods and sends the survey if needed (once per session).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/mods.lua:57
function telemetry_trackers_mods.onModManagerReady() end

