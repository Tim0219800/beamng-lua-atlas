# `gameplay_rally_driveline_rallyRouteTracker`

*Fichier : `lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua` · VM : Game Engine (GE) · 378 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/driveline/rallyRouteTracker")` (fichier sous extensions/ mais pas une extension classique)

Suivi de la position d'un véhicule le long d'une route statique de rallye. À chaque update, la position est projetée sur les segments de la route (fenêtre locale autour du segment précédent, puis recherche complète si la progression est incohérente), ce qui donne le segment, la distance restante jusqu'à l'arrivée (distToTarget) et l'écart latéral. Un corridor latéral détermine l'état 'onRoute' / 'offRoute' (avec hystérésis en ticks) ; hors route, le point de départ est mémorisé pour calculer une position de récupération (recovery) proche du point de sortie. Le module renvoie un constructeur : require(...)(path, options).

## Exemple

```lua
local tracker = require('/lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker')(route.path)
tracker:update(vehPos)
local st = tracker:getState()  -- st.state, st.distToTarget, st.lateralDist
```

## Remarques

- path est une liste de points {pos, distToTarget} ordonnés du départ vers l'arrivée ; distToTarget décroît le long de la route.
- Options par défaut : searchBehind 4, searchAhead 8 (segments), offRouteDistance 8 m (demi-largeur du corridor), onRouteDistance 7,9 m, transitionTicks 2, recoveryBackoffDistanceMeters 3 m, maxForwardJump 80 m, maxBackwardJump 20 m. L'option recoveryBackoffDistance est acceptée comme alias de recoveryBackoffDistanceMeters.
- Une projection locale est refusée si la progression dépasse maxForwardJump/maxBackwardJump ; on essaie alors la projection complète, et si elle est refusée aussi la projection précédente est conservée ('held').
- États : 'unknown' (initial), 'onRoute', 'offRoute'. Le passage d'un état à l'autre demande transitionTicks mises à jour consécutives ; l'écart doit être >= offRouteDistance pour quitter, <= onRouteDistance pour revenir.
- setCorridorWidth borne la largeur à [0,1 ; 15] m.
- Les champs debug* (debugLocalCandidate, debugFullCandidate, debugWindow) n'influencent pas le comportement.

## Classe `C`

Suiveur renvoyé par le constructeur du module.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_driveline_rallyRouteTracker")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_acceptProjection(projection, allowJump)` | Accepte ou refuse une projection selon les sauts maximaux vers l'avant/arrière par rapport à la distance courante (toujours acceptée si allowJump ou premier calcul). | 202 |
| `C:_computeDebugWindow(segmentIdx, forceFullSearch)` | Diagnostic : renvoie la fenêtre de segments examinée par la projection locale ({firstIdx, lastIdx}) ou {fullSearch=true}. | 238 |
| `C:_snapshotDeparture(pos, projection)` | Enregistre le point de sortie de route (distToTarget, routePos, vehiclePos, lateralDist, segmentIdx) au passage en 'offRoute' et fixe la distance de récupération. | 220 |
| `C:_updateRecoveryCandidate(pos, projection)` | Mémorise le dernier point récupérable (distToTarget et position sur la route) et calcule recoveryDistToTarget = distToTarget + recul, plafonné au début de la route. | 212 |
| `C:getCorridorWidth()` | Demi-largeur actuelle du corridor. | 186 |
| `C:getOptions()` | Table d'options en cours (partagée, pas une copie). | 190 |
| `C:getRecoveryDistToTarget(backoffDistance)` | Distance restante jusqu'à l'arrivée où replacer le véhicule : point de départ de la sortie de route (si hors route) ou dernier point récupérable, plus un recul, plafonné au début de la route. | 334 |
| `C:getState()` | Instantané de l'état du suiveur : state, segmentIdx, xnorm, distToTarget, distFromStart, routePos, lateralDist, offRouteDistance, onRouteDistance, lastRecoverable*, recoveryDistToTarget, departure, projectionSource ('local', 'full', 'held'), localCandidate, fullCandidate, window, searchBehind, searchAhead. | 347 |
| `C:init(path, options)` | Mémorise la route, fusionne les options avec les valeurs par défaut et réinitialise l'état. | 134 |
| `C:project(pos, options)` | Projette une position sur la route sans modifier l'état : recherche complète si options.forceFullSearch, sinon locale autour du segment courant. | 194 |
| `C:reset(pos)` | Remet à zéro l'état de suivi. Si une position est donnée, fait immédiatement un update avec recherche complète et saut autorisé. | 142 |
| `C:setCorridorWidth(width)` | Règle la demi-largeur du corridor (offRouteDistance, bornée à [0,1 ; 15] m) et le seuil de retour (onRouteDistance = offRouteDistance - 0,1). | 178 |
| `C:setDebugCapture(enabled)` | Active la capture de diagnostic (calcul d'une projection complète supplémentaire à chaque update). | 169 |
| `C:setPath(path)` | Remplace la route suivie et réinitialise l'état. | 173 |
| `C:update(pos, updateOptions)` | Met à jour le suivi avec la position du véhicule : projection (locale puis complète si besoin), mise à jour de segmentIdx, xnorm, distToTarget, distFromStart, routePos, lateralDist, puis de l'état onRoute/offRoute avec hystérésis. Renvoie la projection retenue (ou la dernière si la nouvelle est refusée). | 249 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua`.*
