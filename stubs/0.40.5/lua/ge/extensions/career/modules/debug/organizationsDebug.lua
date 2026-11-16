---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/organizationsDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Organizations" career debug tab. Two cheat entries: give a random reputation (-50 to 150) to about 30% of organizations (via career_modules_playerAttributes.addAttributes) and mark about 30% of delivery facilities as 'interacted'.
--- Access: extension `career_modules_debug_organizationsDebug`: `extensions.load("career_modules_debug_organizationsDebug")`, then the global `career_modules_debug_organizationsDebug`
---@class career_modules_debug_organizationsDebug
---@field debugName string 'Organizations'.
---@field debugOrder number Sort order (3).
career_modules_debug_organizationsDebug = {}

--- Draws the entries '> Give random reputation to 30% of organizations' and 'Interact with random facilities'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/organizationsDebug.lua:9
function career_modules_debug_organizationsDebug.drawDebugFunctions() end

