---@meta
-- tim19Atlas stub generated from lua/ge/extensions/campaign/dealer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `campaign_dealer` : `extensions.load("campaign_dealer")`, puis la globale `campaign_dealer`
---@class campaign_dealer
---@field state table
campaign_dealer = {}

---Source : lua/ge/extensions/campaign/dealer.lua:32
---@param itemType any
---@param valueObj any
function campaign_dealer.addToStock(itemType, valueObj) end

---Source : lua/ge/extensions/campaign/dealer.lua:98
---@param itemType any
---@param index any
function campaign_dealer.buy(itemType, index) end

---Source : lua/ge/extensions/campaign/dealer.lua:61
---@param itemType any
function campaign_dealer.getStock(itemType) end

---Source : lua/ge/extensions/campaign/dealer.lua:108
---@param data any
function campaign_dealer.onDeserialized(data) end

---Source : lua/ge/extensions/campaign/dealer.lua:118
---@param campaignInProgress any
---@param data any
function campaign_dealer.onResumeCampaign(campaignInProgress, data) end

---Source : lua/ge/extensions/campaign/dealer.lua:113
---@param saveCallback any
function campaign_dealer.onSaveCampaign(saveCallback) end

---Source : lua/ge/extensions/campaign/dealer.lua:102
function campaign_dealer.onSerialize() end

---Source : lua/ge/extensions/campaign/dealer.lua:68
---@param itemType any
---@param valueObj any
function campaign_dealer.removeFromStock(itemType, valueObj) end

