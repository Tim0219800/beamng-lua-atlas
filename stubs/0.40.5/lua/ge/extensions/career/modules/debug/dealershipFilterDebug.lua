---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/dealershipFilterDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "General > Filter Debug" debug tool: ImGui window where you paste a dealership filter JSON (filter with whiteList/blackList, subFilters with probability…); the JSON is decoded on every change, the filter is applied (via util/configListGenerator) and the result is shown in a table. Useful for tuning a dealership's vehicle filters.
--- Access: extension `career_modules_debug_dealershipFilterDebug`: `extensions.load("career_modules_debug_dealershipFilterDebug")`, then the global `career_modules_debug_dealershipFilterDebug`
---@class career_modules_debug_dealershipFilterDebug
---@field debugName string 'General > Filter Debug'.
---@field debugOrder number Sort order in the debug window (11).
career_modules_debug_dealershipFilterDebug = {}

--- Draws the 'Filter Debug Input' window (JSON text area, status 'All Good :)' or 'Decoding Error') then the filter results.
---Source: lua/ge/extensions/career/modules/debug/dealershipFilterDebug.lua:101
function career_modules_debug_dealershipFilterDebug.drawDebugMenu() end

--- Shows the tool outside career: M.onUpdate = drawDebugMenu then extensions.hookUpdate('onUpdate').
---Source: lua/ge/extensions/career/modules/debug/dealershipFilterDebug.lua:218
function career_modules_debug_dealershipFilterDebug.show() end

