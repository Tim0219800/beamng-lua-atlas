# `gameplay_crawl_utils`

*Fichier : `lua/ge/extensions/gameplay/crawl/utils.lua` · VM : Game Engine (GE) · 2071 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crawl_utils` : `extensions.load("gameplay_crawl_utils")`, puis la globale `gameplay_crawl_utils`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crawl_utils.activateCrawlMarkers()` |  | 540 |
| `gameplay_crawl_utils.applyPenalty(crawlerId, penaltyType, points)` |  | 231 |
| `gameplay_crawl_utils.calculatePathStats(pathId, pathReversed)` |  | 1741 |
| `gameplay_crawl_utils.clear(force)` |  | 397 |
| `gameplay_crawl_utils.clearCrawler(crawlerId)` |  | 372 |
| `gameplay_crawl_utils.clearMarkers()` |  | 359 |
| `gameplay_crawl_utils.drawMarkers(dtReal, dtSim, dtRaw)` |  | 1623 |
| `gameplay_crawl_utils.getActiveCrawlerId()` |  | 1902 |
| `gameplay_crawl_utils.getAllCrawlStates()` |  | 1898 |
| `gameplay_crawl_utils.getCrawlState(crawlerId)` |  | 1862 |
| `gameplay_crawl_utils.getCrawlerDirection(crawlerId)` |  | 1874 |
| `gameplay_crawl_utils.getCrawlerPosition(crawlerId)` |  | 1866 |
| `gameplay_crawl_utils.getDottedPath()` |  | 1915 |
| `gameplay_crawl_utils.getDynamicObjectsFromPrefab(prefabId, dynamicName)` |  | 288 |
| `gameplay_crawl_utils.getLastRecoveryCheckpoint(crawlerId)` |  | 1919 |
| `gameplay_crawl_utils.getLastRecoveryCheckpointIndex(crawlerId)` |  | 1932 |
| `gameplay_crawl_utils.hasPenalties(crawlerId)` |  | 225 |
| `gameplay_crawl_utils.isDebugDrawEnabled()` |  | 1737 |
| `gameplay_crawl_utils.isPreviewMode()` |  | 1911 |
| `gameplay_crawl_utils.loadPrefabs(prefabFileList)` |  | 313 |
| `gameplay_crawl_utils.onBoundaryViolation(crawlerId)` | *(hook)* | 1550 |
| `gameplay_crawl_utils.onDrawOnMinimap(td)` | *(hook)* | 1660 |
| `gameplay_crawl_utils.onExtensionUnloaded()` | *(hook)* | 2063 |
| `gameplay_crawl_utils.onPreRender(dtReal, dtSim, dtRaw)` | *(hook)* | 1713 |
| `gameplay_crawl_utils.onSpawnCCallback(objId)` | *(hook)* | 1830 |
| `gameplay_crawl_utils.onSplitScreenChanged(enabled, _playerCount, _layoutId, layoutMode)` | *(hook)* | 1672 |
| `gameplay_crawl_utils.onVehicleFlippedUpright(crawlerId)` | *(hook)* | 1431 |
| `gameplay_crawl_utils.onVehicleReset(crawlerId, isGateRecovery)` | *(hook)* | 1440 |
| `gameplay_crawl_utils.recoverToLastGate(crawlerId)` |  | 1495 |
| `gameplay_crawl_utils.resetCrawlData(crawlerId, force)` |  | 1151 |
| `gameplay_crawl_utils.resumeCrawlTimer(crawlerId)` |  | 1806 |
| `gameplay_crawl_utils.setCrawlState(crawlerId, state)` |  | 1890 |
| `gameplay_crawl_utils.setDebugDraw(enabled)` |  | 1727 |
| `gameplay_crawl_utils.setRecoveryCheckpoint(crawlerId, checkpoint)` |  | 1945 |
| `gameplay_crawl_utils.setupCrawlMarkers(path)` |  | 490 |
| `gameplay_crawl_utils.setupCrawlerData(veh)` |  | 1279 |
| `gameplay_crawl_utils.startCrawl(crawlerId, trail, crawlerData, isFromMission)` |  | 1074 |
| `gameplay_crawl_utils.stopCrawl(force)` |  | 1029 |
| `gameplay_crawl_utils.toggleDebugDraw()` |  | 1732 |
| `gameplay_crawl_utils.trackVehReset(vehId)` |  | 2010 |
| `gameplay_crawl_utils.unloadPrefabs()` |  | 267 |
| `gameplay_crawl_utils.updateCrawl(dtSim)` |  | 1567 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `drivingBackwardsSettings` | table |  |
| `infractionCooldowns` | table |  |
| `infractionPoints` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCrawlCleared` — écouté par 2 module(s)
- `onCrawlDisqualified` — écouté par 2 module(s)
- `onCrawlPathnodeReached` — écouté par 2 module(s)
- `onCrawlPenaltyScoreChanged` — écouté par 1 module(s)
- `onCrawlResultsShown` — écouté par 5 module(s)
- `showDisqualifiedMessage`

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `be:` `getObjectOOBBCenterXYZ`, `getPlayerVehicle`, `getPlayerVehicleID`, `reloadCollision`
- `debugDrawer:` `drawSphere`
- `obj:` `delete`, `setDynDataFieldbyName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crawl/utils.lua`.*
