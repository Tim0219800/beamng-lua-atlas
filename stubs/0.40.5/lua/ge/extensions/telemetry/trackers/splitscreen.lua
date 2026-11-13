---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/splitscreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `telemetry_trackers_splitscreen` : `extensions.load("telemetry_trackers_splitscreen")`, puis la globale `telemetry_trackers_splitscreen`
---@class telemetry_trackers_splitscreen
---@field dependencies table
telemetry_trackers_splitscreen = {}

---Source : lua/ge/extensions/telemetry/trackers/splitscreen.lua:160
function telemetry_trackers_splitscreen.onClientEndMission() end

---Source : lua/ge/extensions/telemetry/trackers/splitscreen.lua:156
function telemetry_trackers_splitscreen.onClientStartMission() end

---Source : lua/ge/extensions/telemetry/trackers/splitscreen.lua:166
function telemetry_trackers_splitscreen.onExit() end

---Source : lua/ge/extensions/telemetry/trackers/splitscreen.lua:151
function telemetry_trackers_splitscreen.onExtensionLoaded() end

---Source : lua/ge/extensions/telemetry/trackers/splitscreen.lua:166
function telemetry_trackers_splitscreen.onExtensionUnloaded() end

--- The end screen of a round. Player indices are not reported, only the kind of result.
---Source : lua/ge/extensions/telemetry/trackers/splitscreen.lua:132
---@param gamemodeId any
---@param result any
function telemetry_trackers_splitscreen.onMultiseatGamemodeFinished(gamemodeId, result) end

--- Fires for every round, a restart from the end screen or the pause menu included
---Source : lua/ge/extensions/telemetry/trackers/splitscreen.lua:121
---@param gamemodeId any
function telemetry_trackers_splitscreen.onMultiseatGamemodeLaunched(gamemodeId) end

---Source : lua/ge/extensions/telemetry/trackers/splitscreen.lua:142
function telemetry_trackers_splitscreen.onMultiseatGamemodeStopped() end

---Source : lua/ge/extensions/telemetry/trackers/splitscreen.lua:96
---@param enabled any
---@param playerCount any
---@param layout any
---@param mode any
function telemetry_trackers_splitscreen.onSplitScreenChanged(enabled, playerCount, layout, mode) end

--- entry is discover or multiseatSettings, activity is the gamemode id or freeroam
---Source : lua/ge/extensions/telemetry/trackers/splitscreen.lua:54
---@param entry any
---@param activity any
function telemetry_trackers_splitscreen.onSplitScreenStartRequested(entry, activity) end

