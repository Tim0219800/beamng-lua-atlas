---@meta
-- tim19Atlas stub generated from lua/ge/extensions/campaign/rewards.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Computation and granting of campaign scenario rewards. From scenarioData.onEvent.onSucceed (or onFail), getRewards selects the rewards; processRewards adds them to the inventory (core_inventory.addItem with the key "$$$_"..type) and returns what was won as well as the choices to be made by the player ("choices" key). processUserSelection applies the player's choice and sends the other options to the dealer (campaign_dealer.addToStock).
--- Access: extension `campaign_rewards`: `extensions.load("campaign_rewards")`, then the global `campaign_rewards`
---@class campaign_rewards
---@field pendingUserChoices table<string, table> Pending choices by scenario key, filled by processRewards.
campaign_rewards = {}

--- Returns the scenario's rewards table: onSucceed if the result is not failed, otherwise onFail. Includes the reward for the medal obtained and all keys that are not medals.
---Source: lua/ge/extensions/campaign/rewards.lua:17
---@param scenarioKey string Scenario identifier (not used in the computation).
---@param scenarioData table Scenario data with onEvent.onSucceed / onFail.
---@param scenarioResult table Result; the failed field is read.
---@param medal string|nil Medal obtained.
---@return table|nil  Rewards, or nil if there are none.
function campaign_rewards.getRewards(scenarioKey, scenarioData, scenarioResult, medal) end

--- Function intended to read the rewards of an event; its body is entirely commented out in this version.
---Source: lua/ge/extensions/campaign/rewards.lua:119
---@param scenarioData table Scenario data.
---@param eventName string Event name.
---@return nil  Always nil.
function campaign_rewards.getScenarioReward(scenarioData, eventName) end

--- Calls callback(key, value) for each entry of players[player] (global table not defined in this file).
---Source: lua/ge/extensions/campaign/rewards.lua:10
---@param player any Player key in the global table players.
---@param callback function Receives (key, value).
function campaign_rewards.iterateRewardsConst(player, callback) end

--- Adds the rewards to the inventory, stores the pending choices, and returns a table merging what is won (accumulated numbers or lists) and the proposed choices.
---Source: lua/ge/extensions/campaign/rewards.lua:53
---@param scenarioKey string Scenario identifier.
---@param scenarioData table Scenario data.
---@param scenarioResult table Scenario result.
---@param medal string|nil Medal obtained.
---@return table  Rewards won plus an optional "choices" field.
function campaign_rewards.processRewards(scenarioKey, scenarioData, scenarioResult, medal) end

--- Applies the player's choice: adds the chosen item to the inventory and sends all the other options of the list to the dealer.
---Source: lua/ge/extensions/campaign/rewards.lua:97
---@param scenarioKey string Scenario with pending choices.
---@param selectionIndex integer Index (1-based) of the selected option.
function campaign_rewards.processUserSelection(scenarioKey, selectionIndex) end

