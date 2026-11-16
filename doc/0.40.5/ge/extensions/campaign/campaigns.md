# `campaign_campaigns`

*File: `lua/ge/extensions/campaign/campaigns.lua` · VM: Game Engine (GE) · 777 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `campaign_campaigns`: `extensions.load("campaign_campaigns")`, then the global `campaign_campaigns`

Execution engine of a running campaign. It holds the active campaign (local variable campaign = {meta, state}), chains scenarios based on the "nextScenario" key or the onSucceed/onFail events, holds the status of each location (state ready/failed/completed, medal, attempts), checks prerequisites (completed scenarios, required vehicle), handles rewards, comics, achievements (OnlineServiceProvider.unlockAchievement), the end screen (retry/next/cancel/menu/freeroam/finish buttons) and serialization. Locations are in meta.subsections[s].locations[l]; a location's key in state.locationStatus is "subsection.location".

## Notes

- Location types (info.type / info.subtype): "site" with subtype transitionPoint, playerHQ or missionGiver; "race" with subtype timeTrial. isScenarioLocation = type different from "site" and subtype different from "timeTrial".
- Campaign ends: isCampaignOver is true if the next scenario key is "END" or absent; processNextScenario then shows the summary (ui_router "scenario.chapter.end") and stops the campaign.
- In scenarioFinished, a location's status is only updated if the subtype is not "timeTrial" and if the location is "ready" or if the new medal is better (statistics_statistics.getMedalRanking).
- Bug: M.onDeserialized = onDeserialized exports a variable not defined in the file (nil).
- Bug: uiEventRetry is defined but empty and is not exported; the Retry button calls scenario_scenarios.uiEventRetry().
- isOverallResultFail always returns false; displayCampaignSummary also shows hardcoded values (community = 20, player = 78, achievements "Not Implemented").
- rewardSelectionCallback reads campaign.state.scenarioRewards.choices.vehicles: only the choices under the "vehicles" key are therefore handled.
- scenarioStarted and scenarioFinished ignore scenarios whose name differs from campaign.meta.scenarioName.
- A required vehicle (dataType "vehicles") is compared with the model and config of the player's current vehicle (extractVehicleData).

**Dependencies (loaded first):** `scenario_scenarios`

## Functions

| Function | Description | Line |
|---|---|---|
| `campaign_campaigns.canImproveResult(locationKey)` | True if the medal obtained for this location is not already "gold". | 182 |
| `campaign_campaigns.canStartScenario(scenarioKey)` | Checks a location's prerequisites (requires field): all the listed scenarios "completed" in the same subsection, and/or the player's vehicle in the required list. | 155 |
| `campaign_campaigns.execEndCallback()` | Calls the end-of-campaign callback (meta.endCampaignCallback) only once, if it exists. | 189 |
| `campaign_campaigns.getActiveSubsection()` | Returns the active subsection (state.activeSubsection). | 540 |
| `campaign_campaigns.getActiveSubsectionLocationData(locationKey)` | Like getLocationData but in the active subsection. | 551 |
| `campaign_campaigns.getCampaign()` | Returns the current campaign ({meta, state}). | 529 |
| `campaign_campaigns.getCampaignActive()` | Indicates whether a campaign is active (state.campaignActive). | 525 |
| `campaign_campaigns.getCampaignTitle()` | Title of the active campaign (meta.title). | 54 |
| `campaign_campaigns.getCurrentLocation()` | Returns state.currentLocation (format "subsection.location") if a campaign is active. | 555 |
| `campaign_campaigns.getLocationData(subsectionKey, locationKey)` | Returns a location's data in a subsection. | 544 |
| `campaign_campaigns.getLocationStatusTable()` | Returns state.locationStatus ("subsection.location" to {attempts, state, medal}). | 721 |
| `campaign_campaigns.getOwningSubsection(locationKey)` | Returns the campaign subsection that contains the given location. | 28 |
| `campaign_campaigns.getSubsection(subsectionKey)` | Returns a subsection by key (nil if no campaign is active). | 533 |
| `campaign_campaigns.isCampaignOver(scenario)` | True if the scenario has no next scenario (key "END" or absent); false as long as it has no result. | 45 |
| `campaign_campaigns.isLocationCompleted(locationKey)` | True if the location has the "completed" state. | 175 |
| `campaign_campaigns.isMissionGiver(subsectionKey, locationKey)` | True if the location is a site of subtype missionGiver. | 618 |
| `campaign_campaigns.isPlayerHQ(subsectionKey, locationKey)` | True if the location is a site of subtype playerHQ. | 613 |
| `campaign_campaigns.isScenarioLocation(subsectionKey, locationKey)` | True if the location is neither a "site" nor a time trial (subtype timeTrial). | 628 |
| `campaign_campaigns.isSiteLocation(subsectionKey, locationKey)` | True if the location is of type "site". | 623 |
| `campaign_campaigns.isSubsectionMarker(subsectionKey, markerName)` | True if a location in the subsection has entryMarker or exitLocation equal to the given marker name. | 638 |
| `campaign_campaigns.isTransitionPoint(subsectionKey, locationKey)` | True if the location is a site of subtype transitionPoint. | 608 |
| `campaign_campaigns.markCompleted(subsection, locationKey)` | Marks a location as "completed" in locationStatus. | 445 |
| `campaign_campaigns.onExtensionUnloaded()` | Hook called when the extension is unloaded: stops the campaign. *(internal)* *(hook)* | 701 |
| `campaign_campaigns.onResetGameplay(playerID)` | Gameplay reset hook; does nothing in this version. *(internal)* *(hook)* | 732 |
| `campaign_campaigns.onSaveCampaign(saveCallback)` | Save hook: calls saveCallback(M.__globalAlias__, campaign.state + sourceFile). *(internal)* *(hook)* | 725 |
| `campaign_campaigns.onScenarioChange(scenario)` | Scenario change hook: unloads this extension if no campaign is active. *(internal)* *(hook)* | 705 |
| `campaign_campaigns.onSerialize()` | Serialization hook: returns campaign.state with sourceFile, or {} if no campaign is active. *(internal)* *(hook)* | 562 |
| `campaign_campaigns.resumeCampaign(campaignInProgress, data)` | Resumes a saved campaign: replaces campaign.state with data and restarts execution at the current location. | 711 |
| `campaign_campaigns.rewardSelectionCallback(itemIndex)` | Callback called by the UI when the player chooses a vehicle reward; stores the index in state.selectedRewardIndex. | 496 |
| `campaign_campaigns.scenarioFinished(scenario)` | Called at the end of a scenario ("post" state): updates the location's status and medal, computes the rewards (campaign_rewards.processRewards), builds the end screen buttons, unlocks achievements and plays the onSucceed/onFail events. | 453 |
| `campaign_campaigns.scenarioStarted(scenario)` | Called by the scenario system at startup: in the "pre-start" state plays the location's onIntro event (comic, inventory) and increments the location's attempts counter. | 382 |
| `campaign_campaigns.startCampaign(newCampaign)` | Activates the prepared campaign (state.campaignActive = true), sets currentLocation to meta.startingLocation, plays onStart then starts execution (first scenario). Does nothing without meta.startingLocation. | 686 |
| `campaign_campaigns.startScenarioFromKey(key, processedScenario)` | Loads (if not provided) and launches a location's scenario: updates currentLocation, scenarioKey, activeSubsection, saves the campaign then calls scenario_scenarios.executeScenario. Logs an error if the location is unknown. | 61 |
| `campaign_campaigns.stop()` | Forgets the current campaign (local variable set to nil). | 113 |
| `campaign_campaigns.uiEventCancel()` | Cancel button of the end screen: hides the menu (guihooks MenuHide), navigates to "menu" and stops the scenario. | 504 |
| `campaign_campaigns.uiEventNext()` | Next button of the end screen: applies the reward choice, stops the current scenario and launches the next one; shows the summary and stops the campaign if there are no more. Ignored (warning) if no campaign is active. | 512 |

### Parameter details

#### `campaign_campaigns.canImproveResult(locationKey)`

True if the medal obtained for this location is not already "gold".

- `locationKey` (*string*) : Location key.
- **returns**: boolean|nil Result.

#### `campaign_campaigns.canStartScenario(scenarioKey)`

Checks a location's prerequisites (requires field): all the listed scenarios "completed" in the same subsection, and/or the player's vehicle in the required list.

- `scenarioKey` (*string*) : Location key.
- **returns**: boolean true if the scenario can start.

#### `campaign_campaigns.getActiveSubsection()`

Returns the active subsection (state.activeSubsection).

- **returns**: table|nil Active subsection.

#### `campaign_campaigns.getActiveSubsectionLocationData(locationKey)`

Like getLocationData but in the active subsection.

- `locationKey` (*string*) : Location key.
- **returns**: table|nil Location data.

#### `campaign_campaigns.getCampaign()`

Returns the current campaign ({meta, state}).

- **returns**: table|nil Campaign.

#### `campaign_campaigns.getCampaignActive()`

Indicates whether a campaign is active (state.campaignActive).

- **returns**: boolean|nil True if active.

#### `campaign_campaigns.getCampaignTitle()`

Title of the active campaign (meta.title).

- **returns**: string|nil Title.

#### `campaign_campaigns.getCurrentLocation()`

Returns state.currentLocation (format "subsection.location") if a campaign is active.

- **returns**: string|nil Current location.

#### `campaign_campaigns.getLocationData(subsectionKey, locationKey)`

Returns a location's data in a subsection.

- `subsectionKey` (*string*) : Subsection key.
- `locationKey` (*string*) : Location key.
- **returns**: table|nil Location data.

#### `campaign_campaigns.getLocationStatusTable()`

Returns state.locationStatus ("subsection.location" to {attempts, state, medal}).

- **returns**: table Status table.

#### `campaign_campaigns.getOwningSubsection(locationKey)`

Returns the campaign subsection that contains the given location.

- `locationKey` (*string*) : Location key.
- **returns**: table|nil The subsection or nil.

#### `campaign_campaigns.getSubsection(subsectionKey)`

Returns a subsection by key (nil if no campaign is active).

- `subsectionKey` (*string*) : Subsection key.
- **returns**: table|nil Subsection.

#### `campaign_campaigns.isCampaignOver(scenario)`

True if the scenario has no next scenario (key "END" or absent); false as long as it has no result.

- `scenario` (*table*) : Scenario with scenarioKey and result.
- **returns**: boolean Campaign over or not.

#### `campaign_campaigns.isLocationCompleted(locationKey)`

True if the location has the "completed" state.

- `locationKey` (*string*) : Location key.
- **returns**: boolean|nil Result, or nil/false if unknown.

#### `campaign_campaigns.isMissionGiver(subsectionKey, locationKey)`

True if the location is a site of subtype missionGiver.

- `subsectionKey` (*string*) : Subsection.
- `locationKey` (*string*) : Location.
- **returns**: boolean|nil Result.

#### `campaign_campaigns.isPlayerHQ(subsectionKey, locationKey)`

True if the location is a site of subtype playerHQ.

- `subsectionKey` (*string*) : Subsection.
- `locationKey` (*string*) : Location.
- **returns**: boolean|nil Result.

#### `campaign_campaigns.isScenarioLocation(subsectionKey, locationKey)`

True if the location is neither a "site" nor a time trial (subtype timeTrial).

- `subsectionKey` (*string*) : Subsection.
- `locationKey` (*string*) : Location.
- **returns**: boolean|nil Result.

#### `campaign_campaigns.isSiteLocation(subsectionKey, locationKey)`

True if the location is of type "site".

- `subsectionKey` (*string*) : Subsection.
- `locationKey` (*string*) : Location.
- **returns**: boolean|nil Result.

#### `campaign_campaigns.isSubsectionMarker(subsectionKey, markerName)`

True if a location in the subsection has entryMarker or exitLocation equal to the given marker name.

- `subsectionKey` (*string*) : Subsection.
- `markerName` (*string*) : Marker name.
- **returns**: boolean Result.

#### `campaign_campaigns.isTransitionPoint(subsectionKey, locationKey)`

True if the location is a site of subtype transitionPoint.

- `subsectionKey` (*string*) : Subsection.
- `locationKey` (*string*) : Location.
- **returns**: boolean|nil Result.

#### `campaign_campaigns.markCompleted(subsection, locationKey)`

Marks a location as "completed" in locationStatus.

- `subsection` (*table*) : Subsection (key key used).
- `locationKey` (*string*) : Location key.

#### `campaign_campaigns.onResetGameplay(playerID)`

Gameplay reset hook; does nothing in this version.

- `playerID` (*integer*) : Player concerned.

#### `campaign_campaigns.onSaveCampaign(saveCallback)`

Save hook: calls saveCallback(M.__globalAlias__, campaign.state + sourceFile).

- `saveCallback` (*function*) : Provided by campaign_campaignsLoader.

#### `campaign_campaigns.onScenarioChange(scenario)`

Scenario change hook: unloads this extension if no campaign is active.

- `scenario` (*table|nil*) : Current scenario (not used).

#### `campaign_campaigns.onSerialize()`

Serialization hook: returns campaign.state with sourceFile, or {} if no campaign is active.

- **returns**: table Data.

#### `campaign_campaigns.resumeCampaign(campaignInProgress, data)`

Resumes a saved campaign: replaces campaign.state with data and restarts execution at the current location.

- `campaignInProgress` (*table*) : Processed campaign.
- `data` (*table*) : Saved state.

#### `campaign_campaigns.rewardSelectionCallback(itemIndex)`

Callback called by the UI when the player chooses a vehicle reward; stores the index in state.selectedRewardIndex.

- `itemIndex` (*integer*) : Index (1-based) of the chosen vehicle.

#### `campaign_campaigns.scenarioFinished(scenario)`

Called at the end of a scenario ("post" state): updates the location's status and medal, computes the rewards (campaign_rewards.processRewards), builds the end screen buttons, unlocks achievements and plays the onSucceed/onFail events.

- `scenario` (*table*) : Finished scenario with result and stats.

#### `campaign_campaigns.scenarioStarted(scenario)`

Called by the scenario system at startup: in the "pre-start" state plays the location's onIntro event (comic, inventory) and increments the location's attempts counter.

- `scenario` (*table*) : Scenario that is starting.

#### `campaign_campaigns.startCampaign(newCampaign)`

Activates the prepared campaign (state.campaignActive = true), sets currentLocation to meta.startingLocation, plays onStart then starts execution (first scenario). Does nothing without meta.startingLocation.

- `newCampaign` (*table*) : Processed campaign {meta, state}.

#### `campaign_campaigns.startScenarioFromKey(key, processedScenario)`

Loads (if not provided) and launches a location's scenario: updates currentLocation, scenarioKey, activeSubsection, saves the campaign then calls scenario_scenarios.executeScenario. Logs an error if the location is unknown.

- `key` (*string*) : Location/scenario key.
- `processedScenario` (*table|nil*) : Scenario already loaded; otherwise loaded via scenario_scenariosLoader.loadScenario(location.path).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'scenario_scenarios'} |
| `onDeserialized` | nil | Always nil: reference to a variable not defined in the file. ⚠ reference `onDeserialized` not defined in the file (probably nil) |

**UI events (guihooks.trigger):** `MenuHide`

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/campaign/campaigns.lua`.*
