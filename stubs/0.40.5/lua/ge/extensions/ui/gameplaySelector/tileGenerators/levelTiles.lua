---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_gameplaySelector_tileGenerators_levelTiles` : `extensions.load("ui_gameplaySelector_tileGenerators_levelTiles")`, puis la globale `ui_gameplaySelector_tileGenerators_levelTiles`
---@class ui_gameplaySelector_tileGenerators_levelTiles
ui_gameplaySelector_tileGenerators_levelTiles = {}

---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua:280
---@param item any
---@param searchText any
---@param result any
function ui_gameplaySelector_tileGenerators_levelTiles.onFilterCustomLevelTiles(item, searchText, result) end

--- Hook to handle when freeroam selector is opened with item details
---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua:335
---@param itemDetails any
---@param backend any
function ui_gameplaySelector_tileGenerators_levelTiles.onFreeroamSelectorOpenedWithItemDetails(itemDetails, backend) end

---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua:185
---@param itemDetails any
---@param details any
---@param buttonInstance any
---@param backend any
function ui_gameplaySelector_tileGenerators_levelTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend) end

---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua:43
---@param items any
function ui_gameplaySelector_tileGenerators_levelTiles.onGameplaySelectorGetTiles(items) end

--- Function to open level configuration popup
---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua:330
---@param levelData any
function ui_gameplaySelector_tileGenerators_levelTiles.openLevelConfigurationPopup(levelData) end

---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua:321
---@param backendName any
---@param newValue any
function ui_gameplaySelector_tileGenerators_levelTiles.setAlwaysShowDialogue(backendName, newValue) end

