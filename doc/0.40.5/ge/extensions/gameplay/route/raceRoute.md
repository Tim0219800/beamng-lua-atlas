# `gameplay_route_raceRoute`

*Fichier : `lua/ge/extensions/gameplay/route/raceRoute.lua` · VM : Game Engine (GE) · 519 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/route/raceRoute")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_route_raceRoute")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calcDistance()` |  | 132 |
| `C:clear()` |  | 347 |
| `C:getNextFixedWP()` |  | 352 |
| `C:getPositionOffset(currentPos)` |  | 434 |
| `C:init(removeFirst, useMapPathfinding, closeDistSquared, logTag)` |  | 13 |
| `C:recalculateRoute(startPos)` |  | 358 |
| `C:recalculateRouteWithOriginalPositions(startPos)` | The difference with recalculateRoute() is that this function uses the<br> original fixed positions, ie the original unshorted self.path points,<br> instead of the remaining points in self.path after repeated shortening.<br> It also uses a callback to determine whether a point should be considered fixed for recalculation.<br> The overall behavior is that the route is recalculatd along the same path as when the route created. | 389 |
| `C:setRouteParams(cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ)` |  | 64 |
| `C:setTrackingMutationEnabled(enabled)` |  | 45 |
| `C:setupPath(fromPos, toPos)` |  | 143 |
| `C:setupPathMulti(positions)` |  | 163 |
| `C:setupPathMultiWaypoints(wpList)` |  | 147 |
| `C:setupPathMultiWithMetadata(positions)` | Parameters:<br> * positions (array): table of tables with the following fields:<br>   Required fields:<br>   * pos (vec3): position of the node<br>   Optional fields:<br>   * mergePriority (float): used to merge nodes into one. lower values are merged into higher values.<br>   * metadata (table): used to store additional data for each node. merging<br>                       behavior is defined by the metadata. metadata with same keys will have the<br>                       higher mergePriority value kept.<br>   Internally added fields: wp, fixed | 183 |
| `C:shortenPath(idx)` |  | 459 |
| `C:stepAhead(stepDist, reset)` |  | 106 |
| `C:trackCamera()` |  | 473 |
| `C:trackPosition(pos)` |  | 474 |
| `C:trackVehicle(veh)` |  | 472 |
| `C:updatePathForPos(pos)` |  | 477 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRecalculatedRoute` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/route/raceRoute.lua`.*
