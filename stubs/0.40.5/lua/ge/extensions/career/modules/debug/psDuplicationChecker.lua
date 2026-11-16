---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/psDuplicationChecker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Parking Spot Duplication Checker" debug tool for level designers: compares the parking spots (parkingSpots) of two .sites.json files (by default city.sites.json and facilities/delivery/mixed.sites.json of west_coast_usa) and lists those whose oriented boxes (OBB) overlap, drawing them in 3D with their name.
--- Access: extension `career_modules_debug_psDuplicationChecker`: `extensions.load("career_modules_debug_psDuplicationChecker")`, then the global `career_modules_debug_psDuplicationChecker`
---@class career_modules_debug_psDuplicationChecker
---@field debugName string 'Parking Spot Duplication Checker'.
---@field debugOrder number Sort order (11).
career_modules_debug_psDuplicationChecker = {}

--- Loads the two sites files (gameplay_sites_sitesManager.loadSites) and fills the result list with each pair of parking spots whose OBBs overlap.
---Source: lua/ge/extensions/career/modules/debug/psDuplicationChecker.lua:24
function career_modules_debug_psDuplicationChecker.compareFiles() end

--- Debug functions submenu; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/psDuplicationChecker.lua:15
function career_modules_debug_psDuplicationChecker.drawDebugFunctions() end

--- Draws the 'PS Duplication Checker' window: file selectors A/B, Compare button and the list of duplicates, drawn in 3D (orange for A, blue for B) with their name.
---Source: lua/ge/extensions/career/modules/debug/psDuplicationChecker.lua:46
function career_modules_debug_psDuplicationChecker.drawDebugMenu() end

--- Opens the tool: M.onUpdate = drawDebugMenu then extensions.hookUpdate('onUpdate').
---Source: lua/ge/extensions/career/modules/debug/psDuplicationChecker.lua:81
function career_modules_debug_psDuplicationChecker.show() end

