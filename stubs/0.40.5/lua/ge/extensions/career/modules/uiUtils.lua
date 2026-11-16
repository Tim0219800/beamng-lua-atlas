---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/uiUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utility functions for the career interface: status bar data (money, beamXP, vouchers, insurance score), simple per-branch statistics, contextual buttons of the career pause menu, and current level (map). Called by the Vue components (CareerStatus, CareerSimpleStats, pause menu).
--- Access: extension `career_modules_uiUtils`: `extensions.load("career_modules_uiUtils")`, then the global `career_modules_uiUtils`
---@class career_modules_uiUtils
---@field dependencies string[] {"career_career"}.
career_modules_uiUtils = {}

--- Runs the pause button function with index functionId, if it exists.
---Source: lua/ge/extensions/career/modules/uiUtils.lua:58
---@param functionId integer Index provided by getCareerPauseContextButtons.
function career_modules_uiUtils.callCareerPauseContextButtons(functionId) end

--- Returns the core_levels.getList() entry matching the loaded level (lowercase comparison with getCurrentLevelIdentifier()).
---Source: lua/ge/extensions/career/modules/uiUtils.lua:130
---@return table|nil  Level info, nil if not found.
function career_modules_uiUtils.getCareerCurrentLevelName() end

--- Builds the list of contextual buttons of the career pause menu (depending on delivery, tutorial, certification, test drive) and stores them.
---Source: lua/ge/extensions/career/modules/uiUtils.lua:62
---@return table  {buttons = {...}}.
function career_modules_uiUtils.getCareerPauseContextButtons() end

--- Data for the CareerSimpleStats Vue component: save name and, for each non-skill branch, name, level label, value and min/max bounds of the level.
---Source: lua/ge/extensions/career/modules/uiUtils.lua:21
---@return table  {saveSlotName, branches = {{name, levelLabel, min, value, max}, ...}}.
function career_modules_uiUtils.getCareerSimpleStats() end

--- Data for the CareerStatus Vue component: money, beamXP, vouchers and insurance driving score.
---Source: lua/ge/extensions/career/modules/uiUtils.lua:10
---@return table  {money, beamXP, vouchers, insuranceScore}.
function career_modules_uiUtils.getCareerStatusData() end

--- Stores the pause button functions and assigns each a functionId (index); clears the old table.
---Source: lua/ge/extensions/career/modules/uiUtils.lua:51
---@param data table Table with buttons (list of {label, icon, fun, showIndicator}); each button receives functionId.
function career_modules_uiUtils.storeCareerPauseContextButtons(data) end

