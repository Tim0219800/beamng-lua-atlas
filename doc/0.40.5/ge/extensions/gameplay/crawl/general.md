# `gameplay_crawl_general`

*Fichier : `lua/ge/extensions/gameplay/crawl/general.lua` · VM : Game Engine (GE) · 519 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crawl_general` : `extensions.load("gameplay_crawl_general")`, puis la globale `gameplay_crawl_general`

**Dépendances (chargées avant) :** `gameplay_crawl_saveSystem`, `gameplay_crawl_utils`, `gameplay_crawl_boundary`, `gameplay_crawl_display`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crawl_general.clear(force)` |  | 38 |
| `gameplay_crawl_general.onActivityAcceptGatherData(elemData, activityData)` | *(hook)* | 302 |
| `gameplay_crawl_general.onActivityIndexVisible(data)` | *(hook)* | 385 |
| `gameplay_crawl_general.onAnyMissionChanged(status, id)` | *(hook)* | 464 |
| `gameplay_crawl_general.onCrawlCleared()` | *(hook)* | 470 |
| `gameplay_crawl_general.onCrawlResultsShown(eventData)` | *(hook)* | 480 |
| `gameplay_crawl_general.onDrawOnMinimap(td)` | *(hook)* | 424 |
| `gameplay_crawl_general.onExtensionLoaded()` | *(hook)* | 433 |
| `gameplay_crawl_general.onGetRawPoiListForLevel(levelIdentifier, elements)` | *(hook)* | 229 |
| `gameplay_crawl_general.onMPSessionChanged(old, new)` | *(hook)* | 492 |
| `gameplay_crawl_general.onSerialize()` | *(hook)* | 438 |
| `gameplay_crawl_general.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 209 |
| `gameplay_crawl_general.onVehicleDestroyed(vehId)` | *(hook)* | 453 |
| `gameplay_crawl_general.onVehicleSwitched(oldId, newId, player)` | *(hook)* | 442 |
| `gameplay_crawl_general.setupCrawl(trail, veh, isFromMission)` |  | 49 |
| `gameplay_crawl_general.startCrawlFlowgraph(trail, veh)` |  | 169 |
| `gameplay_crawl_general.startCrawlFreeroam(trail, veh)` |  | 131 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `activeTrail` | nil |  |
| `crawlersData` | table |  |
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCrawlStarted` — écouté par 6 module(s)

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`

**Charge les extensions :** `gameplay_crawl_freeroamMultiplayer`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crawl/general.lua`.*
