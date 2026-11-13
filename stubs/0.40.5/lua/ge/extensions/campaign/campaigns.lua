---@meta
-- tim19Atlas stub generated from lua/ge/extensions/campaign/campaigns.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `campaign_campaigns` : `extensions.load("campaign_campaigns")`, puis la globale `campaign_campaigns`
---@class campaign_campaigns
---@field dependencies table
---@field onDeserialized any
campaign_campaigns = {}

---Source : lua/ge/extensions/campaign/campaigns.lua:182
---@param locationKey any
function campaign_campaigns.canImproveResult(locationKey) end

---Source : lua/ge/extensions/campaign/campaigns.lua:155
---@param scenarioKey any
function campaign_campaigns.canStartScenario(scenarioKey) end

---Source : lua/ge/extensions/campaign/campaigns.lua:189
function campaign_campaigns.execEndCallback() end

---Source : lua/ge/extensions/campaign/campaigns.lua:540
function campaign_campaigns.getActiveSubsection() end

---Source : lua/ge/extensions/campaign/campaigns.lua:551
---@param locationKey any
function campaign_campaigns.getActiveSubsectionLocationData(locationKey) end

---Source : lua/ge/extensions/campaign/campaigns.lua:529
function campaign_campaigns.getCampaign() end

---Source : lua/ge/extensions/campaign/campaigns.lua:525
function campaign_campaigns.getCampaignActive() end

---Source : lua/ge/extensions/campaign/campaigns.lua:54
function campaign_campaigns.getCampaignTitle() end

---Source : lua/ge/extensions/campaign/campaigns.lua:555
function campaign_campaigns.getCurrentLocation() end

---Source : lua/ge/extensions/campaign/campaigns.lua:544
---@param subsectionKey any
---@param locationKey any
function campaign_campaigns.getLocationData(subsectionKey, locationKey) end

---Source : lua/ge/extensions/campaign/campaigns.lua:721
function campaign_campaigns.getLocationStatusTable() end

---Source : lua/ge/extensions/campaign/campaigns.lua:28
---@param locationKey any
function campaign_campaigns.getOwningSubsection(locationKey) end

---Source : lua/ge/extensions/campaign/campaigns.lua:533
---@param subsectionKey any
function campaign_campaigns.getSubsection(subsectionKey) end

---Source : lua/ge/extensions/campaign/campaigns.lua:45
---@param scenario any
function campaign_campaigns.isCampaignOver(scenario) end

---Source : lua/ge/extensions/campaign/campaigns.lua:175
---@param locationKey any
function campaign_campaigns.isLocationCompleted(locationKey) end

---Source : lua/ge/extensions/campaign/campaigns.lua:618
---@param subsectionKey any
---@param locationKey any
function campaign_campaigns.isMissionGiver(subsectionKey, locationKey) end

---Source : lua/ge/extensions/campaign/campaigns.lua:613
---@param subsectionKey any
---@param locationKey any
function campaign_campaigns.isPlayerHQ(subsectionKey, locationKey) end

---Source : lua/ge/extensions/campaign/campaigns.lua:628
---@param subsectionKey any
---@param locationKey any
function campaign_campaigns.isScenarioLocation(subsectionKey, locationKey) end

---Source : lua/ge/extensions/campaign/campaigns.lua:623
---@param subsectionKey any
---@param locationKey any
function campaign_campaigns.isSiteLocation(subsectionKey, locationKey) end

---Source : lua/ge/extensions/campaign/campaigns.lua:638
---@param subsectionKey any
---@param markerName any
function campaign_campaigns.isSubsectionMarker(subsectionKey, markerName) end

---Source : lua/ge/extensions/campaign/campaigns.lua:608
---@param subsectionKey any
---@param locationKey any
function campaign_campaigns.isTransitionPoint(subsectionKey, locationKey) end

--- public interface
---Source : lua/ge/extensions/campaign/campaigns.lua:445
---@param subsection any
---@param locationKey any
function campaign_campaigns.markCompleted(subsection, locationKey) end

---Source : lua/ge/extensions/campaign/campaigns.lua:701
function campaign_campaigns.onExtensionUnloaded() end

---Source : lua/ge/extensions/campaign/campaigns.lua:732
---@param playerID any
function campaign_campaigns.onResetGameplay(playerID) end

---Source : lua/ge/extensions/campaign/campaigns.lua:725
---@param saveCallback any
function campaign_campaigns.onSaveCampaign(saveCallback) end

---Source : lua/ge/extensions/campaign/campaigns.lua:705
---@param scenario any
function campaign_campaigns.onScenarioChange(scenario) end

---Source : lua/ge/extensions/campaign/campaigns.lua:562
function campaign_campaigns.onSerialize() end

---Source : lua/ge/extensions/campaign/campaigns.lua:711
---@param campaignInProgress any
---@param data any
function campaign_campaigns.resumeCampaign(campaignInProgress, data) end

---Source : lua/ge/extensions/campaign/campaigns.lua:496
---@param itemIndex any
function campaign_campaigns.rewardSelectionCallback(itemIndex) end

---Source : lua/ge/extensions/campaign/campaigns.lua:453
---@param scenario any
function campaign_campaigns.scenarioFinished(scenario) end

---Source : lua/ge/extensions/campaign/campaigns.lua:382
---@param scenario any
function campaign_campaigns.scenarioStarted(scenario) end

---Source : lua/ge/extensions/campaign/campaigns.lua:686
---@param newCampaign any
function campaign_campaigns.startCampaign(newCampaign) end

---Source : lua/ge/extensions/campaign/campaigns.lua:61
---@param key any
---@param processedScenario any
function campaign_campaigns.startScenarioFromKey(key, processedScenario) end

---Source : lua/ge/extensions/campaign/campaigns.lua:113
function campaign_campaigns.stop() end

---Source : lua/ge/extensions/campaign/campaigns.lua:504
function campaign_campaigns.uiEventCancel() end

---Source : lua/ge/extensions/campaign/campaigns.lua:512
function campaign_campaigns.uiEventNext() end

