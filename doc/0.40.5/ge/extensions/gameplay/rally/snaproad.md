# `gameplay_rally_snaproad`

*Fichier : `lua/ge/extensions/gameplay/rally/snaproad.lua` · VM : Game Engine (GE) · 1648 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/snaproad")` (fichier sous extensions/ mais pas une extension classique)

Snaproad de rallye : « route magnétique » construite sur les points d'une driveline (PointList). Elle permet de projeter une position sur la route (closestSnapResult, avec distance cumulée le long de la route), d'avancer ou reculer d'une distance donnée, de calculer des normales, de partitionner la route autour des pacenotes (partition, partition_all, filtre) et de reprojeter les waypoints des pacenotes quand la route change. Elle contient aussi les fonctions de dessin debugDrawer utilisées par l'éditeur de rallye et la recce app. Le module renvoie un constructeur : Snaproad(driveline).

## Exemple

```lua
local Snaproad = require('/lua/ge/extensions/gameplay/rally/snaproad')
local sr = Snaproad(pointList)
local loc = sr:closestSnapResult(veh:getPosition())
print(loc.distanceAlongRoute, sr:totalRouteLength())
```

## Remarques

- Un « résultat de snap » (route location) est une table {pos, point, nearestPoint, fromPoint, toPoint, segmentIndex, xnorm, distanceAlongRoute (m), distSq (m²)}.
- Les points sont des tables avec pos (vec3), id (index séquentiel) et liens prev / next ; l'index spatial est un kd-tree reconstruit si la table de points change.
- L'argument useAllPoints ignore le filtre actif (filter) et travaille sur tous les points de la driveline ; sinon, si un filtre est actif, seules ses bornes servent à borner le résultat.
- minAdjacentWaypointDistance vaut 2,0 m : les waypoints de début et de fin d'un pacenote sont repoussés pour respecter cet écart (_repairPacenoteProjectionEntries).
- Incohérence possible : rallyManager passe une PointList au constructeur, alors que recce:createPacenotesData appelle Snaproad(self) avec l'objet Recce ; Snaproad lit driveline().points, donc avec un Recce le champ points n'existe pas (la driveline y est dans recce.driveline).
- groupPointsByCornerCall dépend de self.styleData qui n'est jamais défini dans ce fichier : la fonction renvoie une table vide sauf si un code externe assigne styleData.
- Plusieurs fonctions mettent point.partition sur les points : cet état est stocké directement dans les points de la driveline.

## Classe `C`

Objet Snaproad renvoyé par le constructeur.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_snaproad")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_allPoints()` | Tous les points de la driveline (table vide s'il n'y a pas de driveline). | 562 |
| `C:_applySnapLocationToWaypoint(wp, loc)` | Applique position et normale d'un résultat de snap à un waypoint. | 748 |
| `C:_clearPointCachedPartitions()` | Met point.partition à nil sur tous les points. | 1323 |
| `C:_clrSnaproad()` | Couleur du snaproad (cc.snaproads_clr_recce). | 302 |
| `C:_drawDebugCornerCalls()` | Dessine les annonces de virage de la partition. | 524 |
| `C:_drawDebugDefault(adjustH, clrOverride, prismWidth, drawOnTop)` | Dessine tous les points du snaproad. | 370 |
| `C:_drawDebugPartition(adjustH, prismWidth, drawOnTop)` | Dessine la partition courante : avant, focus, après. | 334 |
| `C:_drawDebugPartitionAllPrisms(partition, clr, prismWidth, drawOnTop)` | Dessine les prismes d'une partition. | 161 |
| `C:_drawDebugPartitionsAll(prismWidth, drawOnTop)` | Dessine toutes les partitions (utilisé pour Ctrl+clic de création d'un nouveau pacenote, selon le commentaire du code). | 258 |
| `C:_drawDebugPointPrisms(points, clr, alpha, adjustH, globalOpacity, prismWidth, fromLocation, toLocation, drawOnTop)` | Dessine des prismes (debugDrawer:drawSquarePrism) entre points consécutifs, avec couleur, hauteur et opacité. | 122 |
| `C:_drawDebugPoints(points, clr, alpha, radius, adjustH, globalOpacity)` | Dessine des sphères aux points donnés. | 205 |
| `C:_drawDebugPointsCyl(points, clr, alpha, radius, adjustH, globalOpacity, h)` | Dessine des cylindres aux points donnés. | 233 |
| `C:_indexForPoints(useAllPoints)` | Renvoie l'index des points (tous ou filtrés), reconstruit si la table de points a changé. | 587 |
| `C:_invalidateFilterPointIndex()` | Oublie l'index des points filtrés. | 583 |
| `C:_operativePoints()` | Points du filtre si actif, sinon tous les points. | 570 |
| `C:_partitionPoints(fromPoint, toPoint, fromLoc, toLoc)` | Découpe la route en points avant, focus (de fromPoint à toPoint) et après, et marque les points focus avec partition. | 1206 |
| `C:_rebuildAllPointIndex()` | Reconstruit l'index (kd-tree, distances cumulées) de tous les points. | 578 |
| `C:_repairPacenoteProjectionEntries(entries)` | Corrige la liste ordonnée des projections de pacenotes pour que chaque fin soit au moins 2 m après son début et que les pacenotes ne se chevauchent pas, en décalant les distances et en restant dans la longueur de la route. | 757 |
| `C:_snapshotWaypoint(snapshotPn, key, fallbackWp)` | Lit dans un snapshot la position, la normale et la location d'un waypoint (cs ou ce), avec repli sur le waypoint courant. | 739 |
| `C:advanceAlongRoute(pos, meters, fwd, limitPoints, useAllPoints)` | Projette pos sur la route puis avance (fwd = true) ou recule de meters le long de la route, sans dépasser les points limites. | 712 |
| `C:clearAll()` | Désactive la partition de tous les pacenotes, efface le filtre et les partitions mises en cache sur les points. | 1314 |
| `C:clearFilter()` | Désactive le filtre de points. | 1409 |
| `C:clearPartition()` | Désactive et vide la partition courante. | 1196 |
| `C:closestSnapPoint(source_pos, useAllPoints)` | Point de la route le plus proche d'une position. | 954 |
| `C:closestSnapPos(source_pos)` | Position projetée sur la route ; renvoie source_pos telle quelle si la projection échoue. | 959 |
| `C:closestSnapResult(source_pos, useAllPoints)` | Projette une position sur la route : trouve le point le plus proche (kd-tree) puis le meilleur segment dans une fenêtre de 6 segments autour. Si un filtre avec bornes est actif, borne le résultat entre ces bornes. | 875 |
| `C:compareRouteLocations(a, b)` | Compare deux positions sur la route selon leur distanceAlongRoute. | 628 |
| `C:distanceBackwards(fromPoint, meters, limitPoints)` | Recule de point en point jusqu'à dépasser une distance en mètres, ou avant un point limite. | 1043 |
| `C:distanceBackwardsResult(fromPos, meters, limitPoints)` | Comme advanceAlongRoute vers l'arrière, à partir d'une position. | 1070 |
| `C:distanceBetweenPositions(posA, posB, useAllPoints)` | Distance le long de la route entre les projections de deux positions. | 733 |
| `C:distanceBetweenRouteLocations(a, b)` | Distance absolue entre deux résultats de snap, le long de la route. | 637 |
| `C:distanceForwards(fromPoint, meters, limitPoints)` | Avance de point en point jusqu'à dépasser une distance en mètres, ou avant un point limite. | 1074 |
| `C:distanceForwardsResult(fromPos, meters, limitPoints)` | Comme advanceAlongRoute vers l'avant, à partir d'une position. | 1106 |
| `C:drawDebugCameraPlaying()` | Dessin pendant la lecture du chemin caméra (pacenote de la partition courante). | 399 |
| `C:drawDebugPartitionsAllWindow(window, prismWidth, drawOnTop)` | Dessine seulement les partitions qui recoupent une fenêtre de distance. | 282 |
| `C:drawDebugRecceApp()` | Dessin pour la recce app : la partition si active, sinon tous les points (avec ajustement de hauteur). | 391 |
| `C:drawDebugSnaproad(clrOverride, prismWidth, drawOnTop)` | Dessin principal : la partition si active, sinon la partition de tous les pacenotes, sinon tous les points. | 379 |
| `C:driveline()` | Renvoie la driveline passée au constructeur. | 558 |
| `C:firstSnapPoint()` | Premier point de la driveline. | 1113 |
| `C:forwardNormalVec(point)` | Normale vers l'avant d'un point (délégué à snaproad/normals). | 997 |
| `C:groupPointsByCornerCall(points)` | Regroupe des points par annonce de virage selon styleData (voir notes : renvoie {} si styleData n'est pas défini). | 464 |
| `C:init(driveline)` | Mémorise la driveline, crée le lecteur de chemin caméra, initialise filtre, partition, partition_all, opacité globale et l'index des points. | 68 |
| `C:measurePartition()` | Mesure la géométrie du virage de la partition courante (geoPacenotes.measurePartition) sur ses points focus. | 362 |
| `C:minAdjacentWaypointDistance()` | Écart minimal entre waypoints adjacents : 2,0 m. | 601 |
| `C:nextSnapPoint(srcPos)` | Point suivant le point le plus proche de srcPos (le point lui-même à la fin). | 1143 |
| `C:nextSnapPos(srcPos)` | Position du point renvoyé par nextSnapPoint (erreur si nil). | 1139 |
| `C:normalAlignPoints(point)` | Renvoie (précédent, courant, suivant) d'un point (délégué à snaproad/normals). | 987 |
| `C:normalForSnapResult(result)` | Normale vers l'avant d'un résultat de snap (calculée sur le segment fromPoint/toPoint, ou via le point le plus proche si le segment est dégénéré). | 643 |
| `C:partitionAllEnabled()` | Indique si la partition de tous les pacenotes est active. | 1629 |
| `C:partitionAllPacenotes(notebook)` | Découpe toute la route entre les pacenotes : une partition par intervalle avant chaque pacenote et une par pacenote. Renseigne aussi _driveline_location et _driveline_point sur les waypoints. | 1329 |
| `C:playCameraPath()` | Lance la lecture du chemin caméra (cameraPathPlayer). | 1621 |
| `C:pointsBackwards(fromPoint, steps, limitPoints)` | Recule d'un nombre de points donné, en s'arrêtant avant un point limite. | 1001 |
| `C:pointsForCameraPath(bufferBeforeMeters, bufferAfterMeters)` | Liste des points de la route autour de la partition courante pour un chemin caméra (40 m avant et 20 m après par défaut). | 1576 |
| `C:pointsForwards(fromPoint, steps, limitPoints)` | Avance d'un nombre de points donné, en s'arrêtant avant un point limite. | 1022 |
| `C:positionAtDistanceAlongRoute(distanceAlongRoute, useAllPoints)` | Position sur la route à une distance cumulée donnée (bornée entre 0 et la longueur totale), interpolée sur le segment concerné. | 659 |
| `C:prevSnapPoint(srcPos)` | Point précédant le point le plus proche de srcPos (le point lui-même au début). | 1121 |
| `C:prevSnapPos(srcPos)` | Position du point renvoyé par prevSnapPoint (erreur si nil). | 1117 |
| `C:reprojectPacenoteWaypoints(notebook, previousSnaproad, snapshot)` | Reprojette les waypoints des pacenotes. Sans snapshot, en construit un à partir des positions actuelles (et de l'ancien snaproad s'il est fourni). | 843 |
| `C:reprojectPacenoteWaypointsFromSnapshot(notebook, snapshot)` | Reprojette sur la route actuelle les waypoints cs/ce de tous les pacenotes non manquants, à partir d'un snapshot, répare les chevauchements, met à jour les halfpoints et recalcule les appels de distance (autofillDistanceCalls). | 799 |
| `C:routeLocationForPoint(point)` | Construit le résultat de snap correspondant exactement à un point de la driveline. | 610 |
| `C:setFilter(wp)` | Active un filtre qui limite les points déplaçables d'un waypoint de pacenote entre les pacenotes voisins (avec une marge de 2 m). | 1455 |
| `C:setFilterPartitionPoint(point)` | Active un filtre limité à la partition contenant le point donné. | 1435 |
| `C:setFilterToAllPartitions()` | Active un filtre contenant tous les points des partitions (nécessite partitionAllPacenotes d'abord). | 1417 |
| `C:setGlobalOpacity(globalOpacity)` | Définit l'opacité globale des dessins debug. | 112 |
| `C:setPartitionToFilter()` | Définit la partition « focus » sur la portion de route couverte par le filtre actif. | 1565 |
| `C:setPartitionToPacenote(pn)` | Définit la partition « focus » sur la portion de route allant du début à la fin du pacenote. | 1183 |
| `C:stopCameraPath()` | Arrête la lecture du chemin caméra. | 1625 |
| `C:toggleCornerCalls()` | Bascule l'affichage des annonces de virage et recalcule la partition du pacenote courant. | 1633 |
| `C:totalRouteLength()` | Longueur totale de la route (tous les points). | 605 |
| `C:updateHalfpoint(pn)` | Calcule le point milieu (en distance sur la route) entre le début et la fin du pacenote et le stocke dans pn.halfpoint, halfpointLocation, halfpointPos. | 1161 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/snaproad.lua`.*
