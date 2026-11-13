---@meta
-- tim19Atlas stub generated from lua/ge/extensions/campaign/campaignsLoader.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `campaign_campaignsLoader` : `extensions.load("campaign_campaignsLoader")`, puis la globale `campaign_campaignsLoader`
---@class campaign_campaignsLoader
---@field campaignModules table
---@field onInit any
campaign_campaignsLoader = {}

---Source : lua/ge/extensions/campaign/campaignsLoader.lua:308
---@param title any
---@param savesEnabled any
function campaign_campaignsLoader.checkSaveExists(title, savesEnabled) end

--- public interface
---Source : lua/ge/extensions/campaign/campaignsLoader.lua:45
function campaign_campaignsLoader.getCampaignFilenames() end

---Source : lua/ge/extensions/campaign/campaignsLoader.lua:85
function campaign_campaignsLoader.getCampaignScenarios() end

---Source : lua/ge/extensions/campaign/campaignsLoader.lua:61
function campaign_campaignsLoader.getList() end

---Source : lua/ge/extensions/campaign/campaignsLoader.lua:12
---@param campaignfile any
function campaign_campaignsLoader.loadCampaign(campaignfile) end

---Source : lua/ge/extensions/campaign/campaignsLoader.lua:364
---@param campaign any
---@param saveFilename any
function campaign_campaignsLoader.resumeSavedCampaign(campaign, saveFilename) end

---Source : lua/ge/extensions/campaign/campaignsLoader.lua:346
---@param campaign any
function campaign_campaignsLoader.saveCampaign(campaign) end

---Source : lua/ge/extensions/campaign/campaignsLoader.lua:134
---@param field any
---@param token any
function campaign_campaignsLoader.splitFieldByToken(field, token) end

--- this function is called when the user selects a campaign to play from the UI
---Source : lua/ge/extensions/campaign/campaignsLoader.lua:249
---@param newCampaign any
---@param endCallback any
function campaign_campaignsLoader.start(newCampaign, endCallback) end

---Source : lua/ge/extensions/campaign/campaignsLoader.lua:279
---@param path any
---@param endCallback any
function campaign_campaignsLoader.startByFolder(path, endCallback) end

