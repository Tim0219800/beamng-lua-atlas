# `gameplay_route_raceRoute`

*Fichier : `lua/ge/extensions/gameplay/route/raceRoute.lua` · VM : Game Engine (GE) · 519 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/route/raceRoute")` (fichier sous extensions/ mais pas une extension classique)

Variante synchrone de route.lua pour les courses et le rallye : chemin sur le navgraph avec métadonnées par point (metadata), callbacks de fusion et de recalcul, et mémorisation des points fixes d'origine pour pouvoir recalculer la route complète. Le chemin se raccourcit au fil du suivi, avec un seuil « sur le chemin » de 15 m. Le module renvoie un constructeur : `require(...)(removeFirst, useMapPathfinding, closeDistSquared, logTag)`.

## Exemple

```lua
local RaceRoute = require('/lua/ge/extensions/gameplay/route/raceRoute')
local r = RaceRoute(true, true, 1)
r:setupPathMultiWithMetadata({{pos = p1}, {pos = p2, metadata = {name = 'cp'}}})
local idx, d = r:trackPosition(vehPos)
```

## Remarques

- Callbacks disponibles dans self.callbacks : onPointProcessed(point) après construction, shouldPointBeFixedForRecalc(point) pour recalculateRouteWithOriginalPositions, onRouteShortened (déclaré mais non appelé ici), onMetadataMerge(i, last, cur) -> newPoint, newMetadata lors de la fusion de points proches.
- Différences avec route.lua : tout est synchrone (pas de core_jobsystem), onPathDist = 15 m, setupPathMultiWithMetadata fixe chaque arrivée comme point fixed et peut ne pas utiliser le pathfinding de la carte (useMapPathfinding = false).
- L'argument logTag de init est local et sans effet (il masque la variable de module).
- calcDistance plante si le chemin est vide (self.path[1] est nil), contrairement à route.lua qui gère ce cas.
- recalculateRoute et recalculateRouteWithOriginalPositions émettent le hook onRecalculatedRoute avec l'argument 'raceRoute'.
- originalFixedPositions est rempli une seule fois, au premier setupPathMultiWithMetadata, et n'est pas vidé par clear().
- updatePathForPos remet à nil la metadata du premier point si celui-ci est repositionné (resetMetadata).

## Classe `C`

Itinéraire de course. Champs : path, removeFirst, useMapPathfinding, closeDistSquared, originalFixedPositions, dirMult, callbacks, trackingMutationEnabled, done, plus les paramètres de recherche (cutOffDrivability, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ).

Le module renvoie un constructeur : `local obj = require("gameplay_route_raceRoute")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calcDistance()` | Recalcule distToTarget de chaque point. | 132 |
| `C:clear()` | Vide le chemin (sans toucher à originalFixedPositions). | 347 |
| `C:getNextFixedWP()` | Position du premier point fixed du chemin. | 352 |
| `C:getPositionOffset(currentPos)` | Cherche le segment le plus proche d'une position (seuil 15 m). | 434 |
| `C:init(removeFirst, useMapPathfinding, closeDistSquared, logTag)` | Constructeur avec options. | 13 |
| `C:recalculateRoute(startPos)` | Reconstruit le chemin depuis startPos en repassant par tous les points fixed restants, puis émet onRecalculatedRoute('raceRoute'). | 358 |
| `C:recalculateRouteWithOriginalPositions(startPos)` | Comme recalculateRoute mais part des points fixes d'origine (non raccourcis). Un point d'origine est gardé si le callback shouldPointBeFixedForRecalc renvoie true, et le dernier point est toujours gardé. Émet onRecalculatedRoute('raceRoute'). | 389 |
| `C:setRouteParams(cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ)` | Fixe les paramètres de recherche du navgraph. | 64 |
| `C:setTrackingMutationEnabled(enabled)` | Si false, updatePathForPos ne modifie plus le chemin (ni recalcul ni raccourcissement) et renvoie seulement l'offset. | 45 |
| `C:setupPath(fromPos, toPos)` | Itinéraire entre deux positions. | 143 |
| `C:setupPathMulti(positions)` | Construit le chemin pour une liste de positions simples (les enveloppe en {pos=...} puis appelle setupPathMultiWithMetadata). | 163 |
| `C:setupPathMultiWaypoints(wpList)` | Ajoute au chemin les nœuds du navgraph entre waypoints donnés (map.getPath). | 147 |
| `C:setupPathMultiWithMetadata(positions)` | Construit le chemin pour des positions avec métadonnées optionnelles. Chaque arrivée devient un point fixed qui garde sa metadata ; les points trop proches sont fusionnés (callback onMetadataMerge possible) ; les extrémités sont ajustées ; onPointProcessed est appelé pour chaque point ; les points fixes d'origine sont mémorisés au premier appel. | 183 |
| `C:shortenPath(idx)` | Supprime les points avant l'indice idx. | 459 |
| `C:stepAhead(stepDist, reset)` | Point situé à stepDist mètres plus loin sur la route (même logique que route.lua). | 106 |
| `C:trackCamera()` | Suit la caméra (core_camera.getPosition). | 473 |
| `C:trackPosition(pos)` | Suit une position quelconque. | 474 |
| `C:trackVehicle(veh)` | Suit un véhicule. | 472 |
| `C:updatePathForPos(pos)` | Met à jour la route pour une position : recalcule si on est hors chemin (>= 15 m), raccourcit le chemin et ajuste le premier point (en remettant sa metadata à nil). Sans mutation autorisée, ne fait que calculer l'offset. | 477 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRecalculatedRoute` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/route/raceRoute.lua`.*
