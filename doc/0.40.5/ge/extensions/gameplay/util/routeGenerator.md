# `gameplay_util_routeGenerator`

*Fichier : `lua/ge/extensions/gameplay/util/routeGenerator.lua` · VM : Game Engine (GE) · 851 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_util_routeGenerator` : `extensions.load("gameplay_util_routeGenerator")`, puis la globale `gameplay_util_routeGenerator`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_util_routeGenerator.generateRaceRoute(startPos, targetDistanceMeters, startDir, minDrivability, routeSmoothness, lookAheadDistance, job, seed, targetRatios, bandBoundaries, checkpointDistance)` |  | 608 |
| `gameplay_util_routeGenerator.pickRandomRoadPoint()` |  | 813 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultMinDrivability` | number | ground marker routing has to use these, otherwise phase 3 validates a route the player never gets |
| `drivabilityPenalty` | number |  |
| `maxCheckpointRadius` | number |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/util/routeGenerator.lua`.*
