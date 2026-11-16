---@meta
-- tim19Atlas stub generated from lua/ge/extensions/campaign/dealer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Campaign dealer: holds a stock (M.state.stock) keyed by uppercase item type. A stock is either a list of tables (vehicles {model, config}) or an accumulated number. Saved and restored with the campaign (onSaveCampaign / onResumeCampaign). The buy function is empty (not implemented).
--- Access: extension `campaign_dealer`: `extensions.load("campaign_dealer")`, then the global `campaign_dealer`
---@class campaign_dealer
---@field state table Saved state: {stock = table<string, table|number>}.
campaign_dealer = {}

--- Adds an object (table, no duplicates according to existItem) or a quantity (number) to the stock of the given type. Creates the entry if needed.
---Source: lua/ge/extensions/campaign/dealer.lua:32
---@param itemType string Stock type (converted to uppercase).
---@param valueObj table|number Object to add or quantity.
function campaign_dealer.addToStock(itemType, valueObj) end

--- Intended to buy an object from the stock; the body is empty in this version.
---Source: lua/ge/extensions/campaign/dealer.lua:98
---@param itemType string Stock type.
---@param index integer Position of the object (inferred from the name).
function campaign_dealer.buy(itemType, index) end

--- Returns a deep copy of the stock of a type (creates an empty list if absent).
---Source: lua/ge/extensions/campaign/dealer.lua:61
---@param itemType string Stock type, as registered (uppercase).
---@return table|number  Copy of the stock.
function campaign_dealer.getStock(itemType) end

--- Hook called after deserialization; only logs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/campaign/dealer.lua:108
---@param data table Deserialized data (not used).
function campaign_dealer.onDeserialized(data) end

--- Campaign resume hook: replaces M.state with data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/campaign/dealer.lua:118
---@param campaignInProgress any Current campaign (not used).
---@param data table Saved state.
function campaign_dealer.onResumeCampaign(campaignInProgress, data) end

--- Campaign save hook: calls saveCallback(M.__globalAlias__, copy of the state).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/campaign/dealer.lua:113
---@param saveCallback function Receives (module global alias, data).
function campaign_dealer.onSaveCampaign(saveCallback) end

--- Serialization hook: returns a deep copy of M.state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/campaign/dealer.lua:102
---@return table  Copy of the state.
function campaign_dealer.onSerialize() end

--- Removes from the stock the first entry whose model and config match (table value) or subtracts the quantity (number value).
---Source: lua/ge/extensions/campaign/dealer.lua:68
---@param itemType string Stock type (converted to uppercase).
---@param valueObj table|number Object {model, config} to remove or quantity.
function campaign_dealer.removeFromStock(itemType, valueObj) end

