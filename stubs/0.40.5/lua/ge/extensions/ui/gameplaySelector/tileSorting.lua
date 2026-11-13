---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/tileSorting.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tile Sorting Module for Gameplay Selector
---
---   This module provides centralized sorting functionality for gameplay tiles.
---   It supports multiple sort modes and handles complex sorting rules for different
---   gameplay systems.
---
---   Sort Modes:
---   - Name: Alphabetical sorting with "Other..." items last
---   - System: Sort by gameplay system (Freeroam, Challenges, etc.)
---   - GameplayAutomatic: Complex multi-criteria sorting for gameplay items
---   - Date: Sort by date (newest first)
---
---   UI Integration:
---   - Maps UI display values to internal sort modes
---   - Provides validation and error handling
---   - Supports fallback to default sorting
--- Accès : extension `ui_gameplaySelector_tileSorting` : `extensions.load("ui_gameplaySelector_tileSorting")`, puis la globale `ui_gameplaySelector_tileSorting`
---@class ui_gameplaySelector_tileSorting
---@field SORT_MODE_TO_UI table
---@field SYSTEM_ORDER table
---@field UI_TO_SORT_MODE table
---@field VALID_SORT_MODES table
ui_gameplaySelector_tileSorting = {}

---Source : lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:246
---@param uiValue any
function ui_gameplaySelector_tileSorting.convertUIValueToSortMode(uiValue) end

--- Public API
---Source : lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:227
---@param sortMode any
function ui_gameplaySelector_tileSorting.getSortFunction(sortMode) end

---Source : lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:242
---@param sortMode any
function ui_gameplaySelector_tileSorting.isValidSortMode(sortMode) end

---Source : lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:282
---@param a any
---@param b any
function ui_gameplaySelector_tileSorting.sortByDate(a, b) end

---Source : lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:278
---@param a any
---@param b any
function ui_gameplaySelector_tileSorting.sortByGameplayAutomatic(a, b) end

---Source : lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:270
---@param a any
---@param b any
function ui_gameplaySelector_tileSorting.sortByNameButOtherAlwaysLast(a, b) end

---Source : lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:274
---@param a any
---@param b any
function ui_gameplaySelector_tileSorting.sortBySystem(a, b) end

--- Group-level sorting function for general sorting cases
---Source : lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:287
---@param group any
---@param sortMode any
function ui_gameplaySelector_tileSorting.sortGroup(group, sortMode) end

---Source : lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:265
---@param tiles any
---@param sortMode any
function ui_gameplaySelector_tileSorting.sortTiles(tiles, sortMode) end

---Source : lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:260
---@param tiles any
---@param uiSortValue any
function ui_gameplaySelector_tileSorting.sortTilesFromUIValue(tiles, uiSortValue) end

