# `gameplay_crawl_crawlFlowgraphBridge`

*Fichier : `lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua` · VM : Game Engine (GE) · 314 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crawl_crawlFlowgraphBridge` : `extensions.load("gameplay_crawl_crawlFlowgraphBridge")`, puis la globale `gameplay_crawl_crawlFlowgraphBridge`

**Dépendances (chargées avant) :** `gameplay_crawl_saveSystem`, `gameplay_crawl_general`, `gameplay_crawl_utils`, `gameplay_crawl_boundary`, `gameplay_crawl_display`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crawl_crawlFlowgraphBridge.applyPenalty(penaltyType)` |  | 243 |
| `gameplay_crawl_crawlFlowgraphBridge.cleanup()` |  | 303 |
| `gameplay_crawl_crawlFlowgraphBridge.configureCrawl(trail)` |  | 32 |
| `gameplay_crawl_crawlFlowgraphBridge.getActiveCrawlerId()` |  | 223 |
| `gameplay_crawl_crawlFlowgraphBridge.getAllStartingPositions()` |  | 231 |
| `gameplay_crawl_crawlFlowgraphBridge.getAllTrails()` |  | 227 |
| `gameplay_crawl_crawlFlowgraphBridge.getCrawlEndData()` |  | 151 |
| `gameplay_crawl_crawlFlowgraphBridge.getCrawlRuntimeData()` |  | 171 |
| `gameplay_crawl_crawlFlowgraphBridge.getDynamicObjectsFromPrefab(prefabId, dynamicName)` |  | 239 |
| `gameplay_crawl_crawlFlowgraphBridge.getLastRecoveryCheckpointIndex()` |  | 271 |
| `gameplay_crawl_crawlFlowgraphBridge.getPenaltyTypes()` |  | 267 |
| `gameplay_crawl_crawlFlowgraphBridge.getPlayerTrailStats(trailId)` |  | 235 |
| `gameplay_crawl_crawlFlowgraphBridge.getTrailInfo(trailId)` |  | 193 |
| `gameplay_crawl_crawlFlowgraphBridge.isCrawlActive()` |  | 219 |
| `gameplay_crawl_crawlFlowgraphBridge.loadCrawlTrail(trailId)` |  | 16 |
| `gameplay_crawl_crawlFlowgraphBridge.onCrawlPathnodeReached(eventData)` | *(hook)* | 295 |
| `gameplay_crawl_crawlFlowgraphBridge.onCrawlResultsShown(eventData)` | *(hook)* | 291 |
| `gameplay_crawl_crawlFlowgraphBridge.onCrawlStarted()` | *(hook)* | 287 |
| `gameplay_crawl_crawlFlowgraphBridge.resetCrawl()` |  | 102 |
| `gameplay_crawl_crawlFlowgraphBridge.setRecoveryCheckpoint(checkpoint)` |  | 279 |
| `gameplay_crawl_crawlFlowgraphBridge.startCrawl(vehicleId)` |  | 59 |
| `gameplay_crawl_crawlFlowgraphBridge.stopCrawl()` |  | 86 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua`.*
