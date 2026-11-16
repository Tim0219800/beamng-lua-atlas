---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/attributesDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Attributes" career debug tab. Shows money, BeamXP, vouchers and the XP of each branch with cheat buttons (+/-) that call career_modules_playerAttributes.addAttributes with the 'cheat' tags. The 'Branches > Branch Order' menu lists the sorted branches and opens their file in the explorer.
--- Access: extension `career_modules_debug_attributesDebug`: `extensions.load("career_modules_debug_attributesDebug")`, then the global `career_modules_debug_attributesDebug`
---@class career_modules_debug_attributesDebug
---@field debugName string Tab title: 'Attributes'.
---@field debugOrder number Sort order in the debug window (0).
career_modules_debug_attributesDebug = {}

--- Draws the ImGui submenu 'Branches > Branch Order': for each sorted branch, an Edit button (Engine.Platform.exploreFolder on branch.file) and a clickable line that calls dump(branch).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/attributesDebug.lua:9
function career_modules_debug_attributesDebug.drawDebugFunctions() end

--- Draws the money, beamXP, vouchers counters and those of each branch (with its level) with add/remove buttons (e.g. +100000 money, +1000 XP, +5/+100/+500 per branch).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/attributesDebug.lua:25
function career_modules_debug_attributesDebug.drawDebugMenu() end

