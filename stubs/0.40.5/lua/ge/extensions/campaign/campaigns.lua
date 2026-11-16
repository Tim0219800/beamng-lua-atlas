---@meta
-- tim19Atlas stub generated from lua/ge/extensions/campaign/campaigns.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Execution engine of a running campaign. It holds the active campaign (local variable campaign = {meta, state}), chains scenarios based on the "nextScenario" key or the onSucceed/onFail events, holds the status of each location (state ready/failed/completed, medal, attempts), checks prerequisites (completed scenarios, required vehicle), handles rewards, comics, achievements (OnlineServiceProvider.unlockAchievement), the end screen (retry/next/cancel/menu/freeroam/finish buttons) and serialization. Locations are in meta.subsections[s].locations[l]; a location's key in state.locationStatus is "subsection.location".
--- Access: extension `campaign_campaigns`: `extensions.load("campaign_campaigns")`, then the global `campaign_campaigns`
---@class campaign_campaigns
---@field dependencies string[] {'scenario_scenarios'}
---@field onDeserialized nil Always nil: reference to a variable not defined in the file.
campaign_campaigns = {}

--- True if the medal obtained for this location is not already "gold".
---Source: lua/ge/extensions/campaign/campaigns.lua:182
---@param locationKey string Location key.
---@return boolean|nil  Result.
function campaign_campaigns.canImproveResult(locationKey) end

--- Checks a location's prerequisites (requires field): all the listed scenarios "completed" in the same subsection, and/or the player's vehicle in the required list.
---Source: lua/ge/extensions/campaign/campaigns.lua:155
---@param scenarioKey string Location key.
---@return boolean  true if the scenario can start.
function campaign_campaigns.canStartScenario(scenarioKey) end

--- Calls the end-of-campaign callback (meta.endCampaignCallback) only once, if it exists.
---Source: lua/ge/extensions/campaign/campaigns.lua:189
function campaign_campaigns.execEndCallback() end

--- Returns the active subsection (state.activeSubsection).
---Source: lua/ge/extensions/campaign/campaigns.lua:540
---@return table|nil  Active subsection.
function campaign_campaigns.getActiveSubsection() end

--- Like getLocationData but in the active subsection.
---Source: lua/ge/extensions/campaign/campaigns.lua:551
---@param locationKey string Location key.
---@return table|nil  Location data.
function campaign_campaigns.getActiveSubsectionLocationData(locationKey) end

--- Returns the current campaign ({meta, state}).
---Source: lua/ge/extensions/campaign/campaigns.lua:529
---@return table|nil  Campaign.
function campaign_campaigns.getCampaign() end

--- Indicates whether a campaign is active (state.campaignActive).
---Source: lua/ge/extensions/campaign/campaigns.lua:525
---@return boolean|nil  True if active.
function campaign_campaigns.getCampaignActive() end

--- Title of the active campaign (meta.title).
---Source: lua/ge/extensions/campaign/campaigns.lua:54
---@return string|nil  Title.
function campaign_campaigns.getCampaignTitle() end

--- Returns state.currentLocation (format "subsection.location") if a campaign is active.
---Source: lua/ge/extensions/campaign/campaigns.lua:555
---@return string|nil  Current location.
function campaign_campaigns.getCurrentLocation() end

--- Returns a location's data in a subsection.
---Source: lua/ge/extensions/campaign/campaigns.lua:544
---@param subsectionKey string Subsection key.
---@param locationKey string Location key.
---@return table|nil  Location data.
function campaign_campaigns.getLocationData(subsectionKey, locationKey) end

--- Returns state.locationStatus ("subsection.location" to {attempts, state, medal}).
---Source: lua/ge/extensions/campaign/campaigns.lua:721
---@return table  Status table.
function campaign_campaigns.getLocationStatusTable() end

--- Returns the campaign subsection that contains the given location.
---Source: lua/ge/extensions/campaign/campaigns.lua:28
---@param locationKey string Location key.
---@return table|nil  The subsection or nil.
function campaign_campaigns.getOwningSubsection(locationKey) end

--- Returns a subsection by key (nil if no campaign is active).
---Source: lua/ge/extensions/campaign/campaigns.lua:533
---@param subsectionKey string Subsection key.
---@return table|nil  Subsection.
function campaign_campaigns.getSubsection(subsectionKey) end

--- True if the scenario has no next scenario (key "END" or absent); false as long as it has no result.
---Source: lua/ge/extensions/campaign/campaigns.lua:45
---@param scenario table Scenario with scenarioKey and result.
---@return boolean  Campaign over or not.
function campaign_campaigns.isCampaignOver(scenario) end

--- True if the location has the "completed" state.
---Source: lua/ge/extensions/campaign/campaigns.lua:175
---@param locationKey string Location key.
---@return boolean|nil  Result, or nil/false if unknown.
function campaign_campaigns.isLocationCompleted(locationKey) end

--- True if the location is a site of subtype missionGiver.
---Source: lua/ge/extensions/campaign/campaigns.lua:618
---@param subsectionKey string Subsection.
---@param locationKey string Location.
---@return boolean|nil  Result.
function campaign_campaigns.isMissionGiver(subsectionKey, locationKey) end

--- True if the location is a site of subtype playerHQ.
---Source: lua/ge/extensions/campaign/campaigns.lua:613
---@param subsectionKey string Subsection.
---@param locationKey string Location.
---@return boolean|nil  Result.
function campaign_campaigns.isPlayerHQ(subsectionKey, locationKey) end

--- True if the location is neither a "site" nor a time trial (subtype timeTrial).
---Source: lua/ge/extensions/campaign/campaigns.lua:628
---@param subsectionKey string Subsection.
---@param locationKey string Location.
---@return boolean|nil  Result.
function campaign_campaigns.isScenarioLocation(subsectionKey, locationKey) end

--- True if the location is of type "site".
---Source: lua/ge/extensions/campaign/campaigns.lua:623
---@param subsectionKey string Subsection.
---@param locationKey string Location.
---@return boolean|nil  Result.
function campaign_campaigns.isSiteLocation(subsectionKey, locationKey) end

--- True if a location in the subsection has entryMarker or exitLocation equal to the given marker name.
---Source: lua/ge/extensions/campaign/campaigns.lua:638
---@param subsectionKey string Subsection.
---@param markerName string Marker name.
---@return boolean  Result.
function campaign_campaigns.isSubsectionMarker(subsectionKey, markerName) end

--- True if the location is a site of subtype transitionPoint.
---Source: lua/ge/extensions/campaign/campaigns.lua:608
---@param subsectionKey string Subsection.
---@param locationKey string Location.
---@return boolean|nil  Result.
function campaign_campaigns.isTransitionPoint(subsectionKey, locationKey) end

--- Marks a location as "completed" in locationStatus.
---Source: lua/ge/extensions/campaign/campaigns.lua:445
---@param subsection table Subsection (key key used).
---@param locationKey string Location key.
function campaign_campaigns.markCompleted(subsection, locationKey) end

--- Hook called when the extension is unloaded: stops the campaign.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/campaign/campaigns.lua:701
function campaign_campaigns.onExtensionUnloaded() end

--- Gameplay reset hook; does nothing in this version.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/campaign/campaigns.lua:732
---@param playerID integer Player concerned.
function campaign_campaigns.onResetGameplay(playerID) end

--- Save hook: calls saveCallback(M.__globalAlias__, campaign.state + sourceFile).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/campaign/campaigns.lua:725
---@param saveCallback function Provided by campaign_campaignsLoader.
function campaign_campaigns.onSaveCampaign(saveCallback) end

--- Scenario change hook: unloads this extension if no campaign is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/campaign/campaigns.lua:705
---@param scenario table|nil Current scenario (not used).
function campaign_campaigns.onScenarioChange(scenario) end

--- Serialization hook: returns campaign.state with sourceFile, or {} if no campaign is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/campaign/campaigns.lua:562
---@return table  Data.
function campaign_campaigns.onSerialize() end

--- Resumes a saved campaign: replaces campaign.state with data and restarts execution at the current location.
---Source: lua/ge/extensions/campaign/campaigns.lua:711
---@param campaignInProgress table Processed campaign.
---@param data table Saved state.
function campaign_campaigns.resumeCampaign(campaignInProgress, data) end

--- Callback called by the UI when the player chooses a vehicle reward; stores the index in state.selectedRewardIndex.
---Source: lua/ge/extensions/campaign/campaigns.lua:496
---@param itemIndex integer Index (1-based) of the chosen vehicle.
function campaign_campaigns.rewardSelectionCallback(itemIndex) end

--- Called at the end of a scenario ("post" state): updates the location's status and medal, computes the rewards (campaign_rewards.processRewards), builds the end screen buttons, unlocks achievements and plays the onSucceed/onFail events.
---Source: lua/ge/extensions/campaign/campaigns.lua:453
---@param scenario table Finished scenario with result and stats.
function campaign_campaigns.scenarioFinished(scenario) end

--- Called by the scenario system at startup: in the "pre-start" state plays the location's onIntro event (comic, inventory) and increments the location's attempts counter.
---Source: lua/ge/extensions/campaign/campaigns.lua:382
---@param scenario table Scenario that is starting.
function campaign_campaigns.scenarioStarted(scenario) end

--- Activates the prepared campaign (state.campaignActive = true), sets currentLocation to meta.startingLocation, plays onStart then starts execution (first scenario). Does nothing without meta.startingLocation.
---Source: lua/ge/extensions/campaign/campaigns.lua:686
---@param newCampaign table Processed campaign {meta, state}.
function campaign_campaigns.startCampaign(newCampaign) end

--- Loads (if not provided) and launches a location's scenario: updates currentLocation, scenarioKey, activeSubsection, saves the campaign then calls scenario_scenarios.executeScenario. Logs an error if the location is unknown.
---Source: lua/ge/extensions/campaign/campaigns.lua:61
---@param key string Location/scenario key.
---@param processedScenario table|nil Scenario already loaded; otherwise loaded via scenario_scenariosLoader.loadScenario(location.path).
function campaign_campaigns.startScenarioFromKey(key, processedScenario) end

--- Forgets the current campaign (local variable set to nil).
---Source: lua/ge/extensions/campaign/campaigns.lua:113
function campaign_campaigns.stop() end

--- Cancel button of the end screen: hides the menu (guihooks MenuHide), navigates to "menu" and stops the scenario.
---Source: lua/ge/extensions/campaign/campaigns.lua:504
function campaign_campaigns.uiEventCancel() end

--- Next button of the end screen: applies the reward choice, stops the current scenario and launches the next one; shows the summary and stops the campaign if there are no more. Ignored (warning) if no campaign is active.
---Source: lua/ge/extensions/campaign/campaigns.lua:512
function campaign_campaigns.uiEventNext() end

