# `gameplay_crawl_flowgraphBridge`

*Fichier : `lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua` · VM : Game Engine (GE) · 326 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crawl_flowgraphBridge` : `extensions.load("gameplay_crawl_flowgraphBridge")`, puis la globale `gameplay_crawl_flowgraphBridge`

**Dépendances (chargées avant) :** `gameplay_crawl_saveSystem`, `gameplay_crawl_general`, `gameplay_crawl_utils`, `gameplay_crawl_boundary`, `gameplay_crawl_display`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crawl_flowgraphBridge.applyPenalty(penaltyType)` |  | 250 |
| `gameplay_crawl_flowgraphBridge.cleanup()` |  | 319 |
| `gameplay_crawl_flowgraphBridge.getActiveCrawlerId()` |  | 230 |
| `gameplay_crawl_flowgraphBridge.getAllStartingPositions()` |  | 238 |
| `gameplay_crawl_flowgraphBridge.getAllTrails()` |  | 234 |
| `gameplay_crawl_flowgraphBridge.getCrawlEndData()` |  | 155 |
| `gameplay_crawl_flowgraphBridge.getCrawlRuntimeData()` |  | 177 |
| `gameplay_crawl_flowgraphBridge.getDynamicObjectsFromPrefab(prefabId, dynamicName)` |  | 246 |
| `gameplay_crawl_flowgraphBridge.getLastRecoveryCheckpoint()` |  | 279 |
| `gameplay_crawl_flowgraphBridge.getLastRecoveryCheckpointIndex()` |  | 288 |
| `gameplay_crawl_flowgraphBridge.getPenaltyTypes()` |  | 275 |
| `gameplay_crawl_flowgraphBridge.getPlayerTrailStats(trailId)` |  | 242 |
| `gameplay_crawl_flowgraphBridge.getTrailInfo(trailId)` |  | 200 |
| `gameplay_crawl_flowgraphBridge.isCrawlActive()` |  | 226 |
| `gameplay_crawl_flowgraphBridge.loadCrawlTrail(trailId)` |  | 21 |
| `gameplay_crawl_flowgraphBridge.onCrawlPathnodeReached(eventData)` | *(hook)* | 312 |
| `gameplay_crawl_flowgraphBridge.onCrawlResultsShown(eventData)` | *(hook)* | 309 |
| `gameplay_crawl_flowgraphBridge.onCrawlStarted()` | *(hook)* | 306 |
| `gameplay_crawl_flowgraphBridge.resetCrawl()` |  | 121 |
| `gameplay_crawl_flowgraphBridge.setRecoveryCheckpoint(checkpoint)` |  | 297 |
| `gameplay_crawl_flowgraphBridge.setupCrawl(vehicleId, trail)` |  | 36 |
| `gameplay_crawl_flowgraphBridge.startCrawl(vehicleId, trail)` |  | 66 |
| `gameplay_crawl_flowgraphBridge.stopCrawl()` |  | 112 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua`.*
