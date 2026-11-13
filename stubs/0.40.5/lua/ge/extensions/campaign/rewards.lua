---@meta
-- tim19Atlas stub generated from lua/ge/extensions/campaign/rewards.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `campaign_rewards` : `extensions.load("campaign_rewards")`, puis la globale `campaign_rewards`
---@class campaign_rewards
---@field pendingUserChoices table
campaign_rewards = {}

---Source : lua/ge/extensions/campaign/rewards.lua:17
---@param scenarioKey any
---@param scenarioData any
---@param scenarioResult any
---@param medal any
function campaign_rewards.getRewards(scenarioKey, scenarioData, scenarioResult, medal) end

---Source : lua/ge/extensions/campaign/rewards.lua:119
---@param scenarioData any
---@param eventName any
function campaign_rewards.getScenarioReward(scenarioData, eventName) end

---Source : lua/ge/extensions/campaign/rewards.lua:10
---@param player any
---@param callback any
function campaign_rewards.iterateRewardsConst(player, callback) end

--- TODO(AK): Make rewards.lua have a validation step on the campaign json information
---Source : lua/ge/extensions/campaign/rewards.lua:53
---@param scenarioKey any
---@param scenarioData any
---@param scenarioResult any
---@param medal any
function campaign_rewards.processRewards(scenarioKey, scenarioData, scenarioResult, medal) end

---Source : lua/ge/extensions/campaign/rewards.lua:97
---@param scenarioKey any
---@param selectionIndex any
function campaign_rewards.processUserSelection(scenarioKey, selectionIndex) end

