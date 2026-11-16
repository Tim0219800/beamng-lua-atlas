---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/missionDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Missions" career debug tab. Two entries: '> Reload Missions' (gameplay_missions_missions.reloadCompleteMissionSystem) and '> Make All Missions Startable' (forces startable and visible on all missions via gameplay_missions_unlocks.overrideStartable/overrideVisible then clears gameplay_rawPois).
--- Access: extension `career_modules_debug_missionDebug`: `extensions.load("career_modules_debug_missionDebug")`, then the global `career_modules_debug_missionDebug`
---@class career_modules_debug_missionDebug
---@field debugName string 'Missions'.
---@field debugOrder number Sort order (3).
career_modules_debug_missionDebug = {}

--- Draws the two mission debug menu entries (reload, unlock all missions).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/missionDebug.lua:9
function career_modules_debug_missionDebug.drawDebugFunctions() end

