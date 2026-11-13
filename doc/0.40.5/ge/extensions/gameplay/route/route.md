# `gameplay_route_route`

*Fichier : `lua/ge/extensions/gameplay/route/route.lua` · VM : Game Engine (GE) · 459 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/route/route")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_route_route")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calcDistance()` |  | 85 |
| `C:clear()` |  | 249 |
| `C:getNextFixedWP()` |  | 256 |
| `C:getPositionOffset(currentPos)` | local offPathDist = 25 | 373 |
| `C:init()` |  | 27 |
| `C:recalculateRoute(startPos)` |  | 288 |
| `C:setRouteParams(cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ)` |  | 36 |
| `C:setupPath(fromPos, toPos)` |  | 102 |
| `C:setupPathMulti(positions)` |  | 181 |
| `C:setupPathMultiJob(positions, onComplete)` | Same as setupPathMulti but pathfinding runs in core_jobsystem (yields between search steps). Optional onComplete(route) when done.<br> self.path is updated only when the job finishes. If called again while a job is still active, the previous job is cancelled and replaced (warning logged). | 216 |
| `C:setupPathMultiWaypoints(wpList)` |  | 106 |
| `C:shortenPath(idx)` |  | 399 |
| `C:stepAhead(stepDist, reset)` |  | 59 |
| `C:trackCamera()` |  | 408 |
| `C:trackPosition(pos)` |  | 409 |
| `C:trackVehicle(veh)` |  | 407 |
| `C:unflagFirstFixedNode()` |  | 262 |
| `C:updatePathForPos(pos)` |  | 412 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRecalculatedRoute` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/route/route.lua`.*
