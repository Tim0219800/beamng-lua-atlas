# `campaign_campaigns`

*Fichier : `lua/ge/extensions/campaign/campaigns.lua` · VM : Game Engine (GE) · 777 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `campaign_campaigns` : `extensions.load("campaign_campaigns")`, puis la globale `campaign_campaigns`

**Dépendances (chargées avant) :** `scenario_scenarios`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `campaign_campaigns.canImproveResult(locationKey)` |  | 182 |
| `campaign_campaigns.canStartScenario(scenarioKey)` |  | 155 |
| `campaign_campaigns.execEndCallback()` |  | 189 |
| `campaign_campaigns.getActiveSubsection()` |  | 540 |
| `campaign_campaigns.getActiveSubsectionLocationData(locationKey)` |  | 551 |
| `campaign_campaigns.getCampaign()` |  | 529 |
| `campaign_campaigns.getCampaignActive()` |  | 525 |
| `campaign_campaigns.getCampaignTitle()` |  | 54 |
| `campaign_campaigns.getCurrentLocation()` |  | 555 |
| `campaign_campaigns.getLocationData(subsectionKey, locationKey)` |  | 544 |
| `campaign_campaigns.getLocationStatusTable()` |  | 721 |
| `campaign_campaigns.getOwningSubsection(locationKey)` |  | 28 |
| `campaign_campaigns.getSubsection(subsectionKey)` |  | 533 |
| `campaign_campaigns.isCampaignOver(scenario)` |  | 45 |
| `campaign_campaigns.isLocationCompleted(locationKey)` |  | 175 |
| `campaign_campaigns.isMissionGiver(subsectionKey, locationKey)` |  | 618 |
| `campaign_campaigns.isPlayerHQ(subsectionKey, locationKey)` |  | 613 |
| `campaign_campaigns.isScenarioLocation(subsectionKey, locationKey)` |  | 628 |
| `campaign_campaigns.isSiteLocation(subsectionKey, locationKey)` |  | 623 |
| `campaign_campaigns.isSubsectionMarker(subsectionKey, markerName)` |  | 638 |
| `campaign_campaigns.isTransitionPoint(subsectionKey, locationKey)` |  | 608 |
| `campaign_campaigns.markCompleted(subsection, locationKey)` | public interface | 445 |
| `campaign_campaigns.onExtensionUnloaded()` | *(hook)* | 701 |
| `campaign_campaigns.onResetGameplay(playerID)` | *(hook)* | 732 |
| `campaign_campaigns.onSaveCampaign(saveCallback)` | *(hook)* | 725 |
| `campaign_campaigns.onScenarioChange(scenario)` | *(hook)* | 705 |
| `campaign_campaigns.onSerialize()` | *(hook)* | 562 |
| `campaign_campaigns.resumeCampaign(campaignInProgress, data)` |  | 711 |
| `campaign_campaigns.rewardSelectionCallback(itemIndex)` |  | 496 |
| `campaign_campaigns.scenarioFinished(scenario)` |  | 453 |
| `campaign_campaigns.scenarioStarted(scenario)` |  | 382 |
| `campaign_campaigns.startCampaign(newCampaign)` |  | 686 |
| `campaign_campaigns.startScenarioFromKey(key, processedScenario)` |  | 61 |
| `campaign_campaigns.stop()` |  | 113 |
| `campaign_campaigns.uiEventCancel()` |  | 504 |
| `campaign_campaigns.uiEventNext()` |  | 512 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `onDeserialized` | any |  ⚠ référence `onDeserialized` non définie dans le fichier (vaut probablement nil) |

**Évènements UI (guihooks.trigger) :** `MenuHide`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/campaign/campaigns.lua`.*
