# `gameplay_crawl_saveSystem`

*Fichier : `lua/ge/extensions/gameplay/crawl/saveSystem.lua` · VM : Game Engine (GE) · 861 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crawl_saveSystem` : `extensions.load("gameplay_crawl_saveSystem")`, puis la globale `gameplay_crawl_saveSystem`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crawl_saveSystem.addNewPlayerScore(trailId, time, penaltyPoints)` |  | 774 |
| `gameplay_crawl_saveSystem.cleanup()` | Cleanup function | 840 |
| `gameplay_crawl_saveSystem.clearCache(type)` | Clear cache for a specific type or all | 67 |
| `gameplay_crawl_saveSystem.ensurePlayerSaveDirectories()` |  | 687 |
| `gameplay_crawl_saveSystem.getAllBoundaries()` |  | 646 |
| `gameplay_crawl_saveSystem.getAllBoundaryFiles(levelPath)` |  | 621 |
| `gameplay_crawl_saveSystem.getAllPathFiles(levelPath)` |  | 625 |
| `gameplay_crawl_saveSystem.getAllPaths()` |  | 658 |
| `gameplay_crawl_saveSystem.getAllStartingPositionFiles(levelPath)` |  | 629 |
| `gameplay_crawl_saveSystem.getAllStartingPositions()` |  | 670 |
| `gameplay_crawl_saveSystem.getAllTrailFiles(levelPath)` |  | 617 |
| `gameplay_crawl_saveSystem.getAllTrails(levelPath)` | Getter functions for all objects | 634 |
| `gameplay_crawl_saveSystem.getBoundaryById(boundaryId)` |  | 569 |
| `gameplay_crawl_saveSystem.getCurrentLevelCrawlPath()` |  | 20 |
| `gameplay_crawl_saveSystem.getPathById(pathId)` |  | 578 |
| `gameplay_crawl_saveSystem.getPlayerCrawlTrailById(trailId)` |  | 723 |
| `gameplay_crawl_saveSystem.getPlayerCrawlTrailsById()` |  | 727 |
| `gameplay_crawl_saveSystem.getPlayerTrailStats(trailId)` |  | 827 |
| `gameplay_crawl_saveSystem.getStartingPositionById(startingPositionId, trail)` |  | 587 |
| `gameplay_crawl_saveSystem.getTrailById(trailId)` | Getter functions with lazy loading | 560 |
| `gameplay_crawl_saveSystem.isTrailFromMission(trail)` | Mission detection functions | 857 |
| `gameplay_crawl_saveSystem.loadCrawlData(filename)` | Load crawl data (main entry point) | 428 |
| `gameplay_crawl_saveSystem.onCareerActive()` | Player save system exports *(hook)* | 695 |
| `gameplay_crawl_saveSystem.onSaveCurrentProfile(currentSavePath)` | *(hook)* | 705 |
| `gameplay_crawl_saveSystem.resetPlayerTrailScores(trailId)` |  | 815 |
| `gameplay_crawl_saveSystem.saveBoundary(boundary, filePath)` |  | 322 |
| `gameplay_crawl_saveSystem.saveCrawlData(saveData, filepath)` | Save crawl data (main entry point) | 469 |
| `gameplay_crawl_saveSystem.savePath(path, filePath)` |  | 357 |
| `gameplay_crawl_saveSystem.savePlayerCrawlTrailScoresForTrailById(trailId)` |  | 713 |
| `gameplay_crawl_saveSystem.saveStartingPosition(startingPosition, filePath)` |  | 392 |
| `gameplay_crawl_saveSystem.saveTrail(trail, filePath)` | Save functions for individual items | 287 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crawl/saveSystem.lua`.*
