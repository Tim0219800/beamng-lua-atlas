# `gameplay_route_route`

*Fichier : `lua/ge/extensions/gameplay/route/route.lua` · VM : Game Engine (GE) · 459 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/route/route")` (fichier sous extensions/ mais pas une extension classique)

Classe d'itinéraire sur le navgraph (module `map`) : calcule un chemin via une liste de positions, mémorise les distances restantes (distToTarget), suit un véhicule, la caméra ou une position, raccourcit le chemin au fil de l'avancée et le recalcule quand on s'en écarte de plus de 18 m. Les calculs peuvent se faire de façon asynchrone dans core_jobsystem (setupPathMultiJob, recalculateRoute). Le module renvoie un constructeur : `require('/lua/ge/extensions/gameplay/route/route')()`. Chaque point du chemin est une table {pos, wp, linkCount, distToTarget, fixed}.

## Exemple

```lua
local route = require('/lua/ge/extensions/gameplay/route/route')()
route:setRouteParams(nil, nil, nil, nil, nil, nil)
route:setupPathMulti({vec3(0,0,0), vec3(500,200,0)})
local idx, dist = route:trackVehicle(be:getPlayerVehicle(0))
```

## Remarques

- Un point `fixed` est une étape imposée (arrivée de chaque segment) ; recalculateRoute ne recalcule que jusqu'au premier point fixed puis recolle le reste du chemin (« queue »).
- Distance de « sur le chemin » : onPathDist = 18 m ; les points à moins de 1 m (closeDistSquared = 1) sont fusionnés.
- Le champ lockFixedNodes (non initialisé, à positionner de l'extérieur) empêche de dépasser un point fixed lors du suivi.
- updatePathForPos fait un print("recalculateRoute(pos)") quand un recalcul en cours est remplacé car le véhicule s'est trop éloigné de l'ancre.
- Le hook onRecalculatedRoute (sans argument) est émis à la fin d'un recalcul asynchrone. Le module raceRoute équivalent émet le même hook avec l'argument 'raceRoute'.
- La fonction debugLog est neutralisée (debugLog = nop) : aucun log de debug n'est émis. Les jobs utilisent global_pathJobMaxDt ou un dt quasi nul (1e-11) pour céder à chaque étape de recherche.

## Classe `C`

Itinéraire. Champs : path, dirMult (1e3), distance, cutOffDrivability, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ, done, lastDist, lastIndexAtDist, lockFixedNodes.

Le module renvoie un constructeur : `local obj = require("gameplay_route_route")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calcDistance()` | Recalcule distToTarget de chaque point (distance restante jusqu'à la fin) et self.distance. | 85 |
| `C:clear()` | Annule les jobs en cours et vide le chemin. | 249 |
| `C:getNextFixedWP()` | Position du premier point fixed du chemin. | 256 |
| `C:getPositionOffset(currentPos)` | Cherche le segment du chemin le plus proche d'une position. | 373 |
| `C:init()` | Constructeur : chemin vide, dirMult = 1e3, pas de job en cours. | 27 |
| `C:recalculateRoute(startPos)` | Recalcule en tâche asynchrone la route depuis startPos. S'il existe un point fixed, ne refait que le tronçon jusqu'à lui puis recolle la suite ; sinon refait la route jusqu'au dernier point. Émet le hook onRecalculatedRoute à la fin. Annule les jobs précédents. | 288 |
| `C:setRouteParams(cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ)` | Fixe les paramètres de recherche transmis à map.getPointToPointPath / map.getPath. | 36 |
| `C:setupPath(fromPos, toPos)` | Itinéraire simple entre deux positions (appelle setupPathMulti). | 102 |
| `C:setupPathMulti(positions)` | Construit (de façon synchrone) un chemin passant par toutes les positions. L'arrivée de chaque segment est un point `fixed`. Les points proches sont fusionnés et les extrémités sont ajustées sur le segment le plus proche. | 181 |
| `C:setupPathMultiJob(positions, onComplete)` | Comme setupPathMulti mais la recherche tourne dans core_jobsystem (cède entre les étapes). self.path est remplacé une fois le calcul fini. Annule un recalcul ou un job précédent en cours. | 216 |
| `C:setupPathMultiWaypoints(wpList)` | Ajoute au chemin les nœuds du navgraph entre des waypoints donnés (map.getPath), sans doublons consécutifs, puis calcule les distances. | 106 |
| `C:shortenPath(idx)` | Supprime les points avant l'indice idx (les idx-1 premiers). | 399 |
| `C:stepAhead(stepDist, reset)` | Renvoie le point situé à stepDist mètres plus loin le long de la route, en mémorisant la dernière position pour accélérer les appels successifs. | 59 |
| `C:trackCamera()` | Suit la caméra (core_camera.getPosition). | 408 |
| `C:trackPosition(pos)` | Suit une position quelconque. | 409 |
| `C:trackVehicle(veh)` | Suit un véhicule (updatePathForPos sur sa position). | 407 |
| `C:unflagFirstFixedNode()` | Retire le drapeau fixed du premier point fixed (étape atteinte). | 262 |
| `C:updatePathForPos(pos)` | Met à jour la route pour une position : lance un recalcul si on est à 18 m ou plus de tout segment, annule un recalcul devenu inutile, raccourcit le chemin et ajuste le premier point sur la position. Met done = true si le chemin a moins de 2 points. | 412 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRecalculatedRoute` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/route/route.lua`.*
