---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/tileSorting.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_vehicleSelector_tileSorting` : `extensions.load("ui_vehicleSelector_tileSorting")`, puis la globale `ui_vehicleSelector_tileSorting`
---@class ui_vehicleSelector_tileSorting
ui_vehicleSelector_tileSorting = {}

--- Public API
---Source : lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:150
---@param sortMode any
function ui_vehicleSelector_tileSorting.getSortFunction(sortMode) end

---Source : lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:171
---@param a any
---@param b any
function ui_vehicleSelector_tileSorting.sortByConfigTypeName(a, b) end

---Source : lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:159
---@param a any
---@param b any
function ui_vehicleSelector_tileSorting.sortByNameButOtherAlwaysLast(a, b) end

---Source : lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:163
---@param a any
---@param b any
function ui_vehicleSelector_tileSorting.sortByValue(a, b) end

---Source : lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:167
---@param a any
---@param b any
function ui_vehicleSelector_tileSorting.sortByYears(a, b) end

--- Group-level sorting function for general sorting cases
---Source : lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:176
---@param group any
---@param sortMode any
function ui_vehicleSelector_tileSorting.sortGroup(group, sortMode) end

---Source : lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:154
---@param tiles any
---@param sortMode any
function ui_vehicleSelector_tileSorting.sortTiles(tiles, sortMode) end

