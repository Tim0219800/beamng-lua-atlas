---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/multiseatPlayerLimits.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_multiseatPlayerLimits`: computes the player count limits in local multiplayer (multiseat). Two sources: the 'soft' limit (hardware or level recommendation, multiseat.maxPlayers field of the level's info.json, 4 by default via core_levels) and the 'hard' limit of the current multiseat game mode (gameplay_multiseat_gamemodeManager). It returns a UI-ready state: limit, reached, exceeded, warning.
--- Access: extension `core_multiseatPlayerLimits`: `extensions.load("core_multiseatPlayerLimits")`, then the global `core_multiseatPlayerLimits`
---@class core_multiseatPlayerLimits
core_multiseatPlayerLimits = {}

--- Returns the maximum number of players recommended by the current level (level.multiseat.maxPlayers).
---Source: lua/ge/extensions/core/multiseatPlayerLimits.lua:17
---@return integer|nil  Limit, or nil if no level or invalid value.
function core_multiseatPlayerLimits.getCurrentLevelLimit() end

--- Shortcut: getState with the current level's limit and the current mode's limit.
---Source: lua/ge/extensions/core/multiseatPlayerLimits.lua:51
---@param playerCount number Current number of players.
---@param softIsHard boolean|nil See getState.
---@return table  Same structure as getState.
function core_multiseatPlayerLimits.getCurrentLevelState(playerCount, softIsHard) end

--- Returns the maximum number of players of the active multiseat game mode (gameplay_multiseat_gamemodeManager.getMaxPlayers): hard limit on all platforms.
---Source: lua/ge/extensions/core/multiseatPlayerLimits.lua:24
---@return integer|nil  Limit, or nil.
function core_multiseatPlayerLimits.getCurrentModeLimit() end

--- Computes the player limits state. The effective limit is the mode's, lowered by the soft limit if softIsHard (or simple menu), otherwise the soft limit alone if there is no mode limit.
---Source: lua/ge/extensions/core/multiseatPlayerLimits.lua:31
---@param softLimit number|nil Recommended limit (hardware or level).
---@param playerCount number Current number of players (negative or invalid becomes 0).
---@param modeLimit number|nil Game mode limit.
---@param softIsHard boolean|nil If true, the soft limit is also enforced.
---@return table  { limit = integer|nil, hard = boolean, atLimit = boolean, exceeded = boolean, warning = table|nil }
function core_multiseatPlayerLimits.getState(softLimit, playerCount, modeLimit, softIsHard) end

--- Indicates whether the UI is in simplified menu mode (console/Steam Deck platforms, according to Engine.UI.isSimpleMenu).
---Source: lua/ge/extensions/core/multiseatPlayerLimits.lua:13
---@return boolean  true if simple menu.
function core_multiseatPlayerLimits.isSimpleMenu() end

