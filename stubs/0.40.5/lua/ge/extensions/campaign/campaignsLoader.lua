---@meta
-- tim19Atlas stub generated from lua/ge/extensions/campaign/campaignsLoader.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Campaign loader: finds the /campaigns/*.json files whose header.type is "campaign", loads them (with mod info and preview image), validates and prepares a campaign, starts it (or resumes a save) and manages saves in /saves/campaigns/ (slotN.json files with header.type "campaignSave"). The campaign modules are campaign_campaigns, campaign_comics, campaign_rewards, campaign_dealer and campaign_photoSafari (M.campaignModules).
--- Access: extension `campaign_campaignsLoader`: `extensions.load("campaign_campaignsLoader")`, then the global `campaign_campaignsLoader`
---@class campaign_campaignsLoader
---@field campaignModules string[] Extension modules loaded for a campaign.
---@field onInit nil Always nil: reference to a variable not defined in the file.
campaign_campaignsLoader = {}

--- Returns the save file name matching a campaign title, or nil.
---Source: lua/ge/extensions/campaign/campaignsLoader.lua:308
---@param title string Campaign title.
---@param savesEnabled boolean If false, returns nil without searching anything.
---@return string|nil  Path of the save.
function campaign_campaignsLoader.checkSaveExists(title, savesEnabled) end

--- Lists the JSON files in /campaigns/ (1 level) whose header.type == 'campaign'. Returns {} if the folder does not exist.
---Source: lua/ge/extensions/campaign/campaignsLoader.lua:45
---@return string[]  Paths of the campaign files.
function campaign_campaignsLoader.getCampaignFilenames() end

--- Returns the cached list scenariosInAllCampaigns (empty in this file: never filled here; generateCampaignScenariosList exists but is not called).
---Source: lua/ge/extensions/campaign/campaignsLoader.lua:85
---@return string[]  Scenario paths.
function campaign_campaignsLoader.getCampaignScenarios() end

--- Loads all the campaigns found with loadCampaign and returns them; cooperates with util_asyncBulkLoader if a bulk load is in progress.
---Source: lua/ge/extensions/campaign/campaignsLoader.lua:61
---@return table[]  List of campaigns.
function campaign_campaignsLoader.getList() end

--- Reads a campaign's JSON and adds sourceFile, sourcePath, official, modID/modName/modTitle ("BeamNG" / "BeamNG.drive" values if it is not a mod) and previews (.jpg image from the campaign folder).
---Source: lua/ge/extensions/campaign/campaignsLoader.lua:12
---@param campaignfile string Path of the campaign's JSON file.
---@return table  Enriched campaign data.
function campaign_campaignsLoader.loadCampaign(campaignfile) end

--- Rereads a save file, calls onResumeCampaign of each module concerned again, then campaign_campaigns.resumeCampaign.
---Source: lua/ge/extensions/campaign/campaignsLoader.lua:364
---@param campaign table Processed campaign to resume.
---@param saveFilename string Path of the save file.
function campaign_campaignsLoader.resumeSavedCampaign(campaign, saveFilename) end

--- Saves the campaign state (see notes) in /saves/campaigns/; reuses the existing file with the same title, otherwise takes the next "slotN.json".
---Source: lua/ge/extensions/campaign/campaignsLoader.lua:346
---@param campaign table Processed campaign ({meta, state}); meta.enableSaves and meta.title are read.
function campaign_campaignsLoader.saveCampaign(campaign) end

--- Splits a string by a token character (also excluding the dot) and returns the pieces.
---Source: lua/ge/extensions/campaign/campaignsLoader.lua:134
---@param field string String to split.
---@param token string Separator token.
---@return string[]  Pieces.
function campaign_campaignsLoader.splitFieldByToken(field, token) end

--- Starts a campaign chosen in the interface. If a level is loaded, waits for it to close; otherwise unloads the automatic extensions, loads those of the scenario, the quick race and the campaign, prepares the campaign, then resumes an existing save or calls campaign_campaigns.startCampaign.
---Source: lua/ge/extensions/campaign/campaignsLoader.lua:249
---@param newCampaign table Campaign (from loadCampaign).
---@param endCallback function|nil Stored as endCampaignCallback.
function campaign_campaignsLoader.start(newCampaign, endCallback) end

--- Finds the campaign whose sourcePath is path and starts it.
---Source: lua/ge/extensions/campaign/campaignsLoader.lua:279
---@param path string Source folder of the campaign.
---@param endCallback function|nil End callback.
function campaign_campaignsLoader.startByFolder(path, endCallback) end

