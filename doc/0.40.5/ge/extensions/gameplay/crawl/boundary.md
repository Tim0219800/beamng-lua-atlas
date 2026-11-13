# `gameplay_crawl_boundary`

*Fichier : `lua/ge/extensions/gameplay/crawl/boundary.lua` · VM : Game Engine (GE) · 512 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crawl_boundary` : `extensions.load("gameplay_crawl_boundary")`, puis la globale `gameplay_crawl_boundary`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crawl_boundary.checkBoundary(site, crawler, crawlStates)` |  | 318 |
| `gameplay_crawl_boundary.cleanupBoundaryMarkers()` |  | 306 |
| `gameplay_crawl_boundary.clearAllExitPoints()` | Function to clear all exit points | 431 |
| `gameplay_crawl_boundary.clearCrawlerExitPoint(crawlerId)` | Function to clear exit point for a specific crawler | 422 |
| `gameplay_crawl_boundary.getCrawlerExitPoint(crawlerId)` | Returns the recorded boundary exit point for a crawler, or nil if inside the boundary | 417 |
| `gameplay_crawl_boundary.getQuadtreeStats()` | Function to get quadtree statistics for debugging | 460 |
| `gameplay_crawl_boundary.rebuildQuadtree()` | Function to rebuild quadtree (useful if boundary objects change) | 455 |
| `gameplay_crawl_boundary.resetBoundaryObjects()` |  | 189 |
| `gameplay_crawl_boundary.setAnimationTiming(duration, fadeIn, fadeOut, scaleUp)` | Function to set animation timing | 444 |
| `gameplay_crawl_boundary.setVisibilityRadius(radius)` | Function to set visibility radius for boundary markers | 438 |
| `gameplay_crawl_boundary.spawnBoundaryMarkers(boundary, spacing)` | Utility function to spawn flag markers along crawl boundary | 204 |
| `gameplay_crawl_boundary.triggerAppearingAnimation()` | Function to trigger appearing animation for all currently visible objects | 473 |
| `gameplay_crawl_boundary.updateBoundaryAnimations(dtSim, crawlStates)` |  | 63 |

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `be:` `getSurfaceHeightBelow`
- `obj:` `setField`, `setScale`, `updateInstanceRenderData`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crawl/boundary.lua`.*
