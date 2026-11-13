---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/snaproad.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet Snaproad renvoyé par le constructeur.
---@class gameplay_rally_snaproad
local gameplay_rally_snaproad = {}

--- Tous les points de la driveline (table vide s'il n'y a pas de driveline).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:562
---@return table
function gameplay_rally_snaproad:_allPoints() end

--- Applique position et normale d'un résultat de snap à un waypoint.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:748
---@param wp table Waypoint
---@param loc table Résultat de snap
function gameplay_rally_snaproad:_applySnapLocationToWaypoint(wp, loc) end

--- Met point.partition à nil sur tous les points.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1323
function gameplay_rally_snaproad:_clearPointCachedPartitions() end

--- Couleur du snaproad (cc.snaproads_clr_recce).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:302
function gameplay_rally_snaproad:_clrSnaproad() end

--- Dessine les annonces de virage de la partition.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:524
function gameplay_rally_snaproad:_drawDebugCornerCalls() end

--- Dessine tous les points du snaproad.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:370
---@param adjustH boolean|nil
---@param clrOverride table|nil Couleur imposée
---@param prismWidth number|nil
---@param drawOnTop boolean|nil
function gameplay_rally_snaproad:_drawDebugDefault(adjustH, clrOverride, prismWidth, drawOnTop) end

--- Dessine la partition courante : avant, focus, après.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:334
---@param adjustH boolean|nil
---@param prismWidth number|nil
---@param drawOnTop boolean|nil
function gameplay_rally_snaproad:_drawDebugPartition(adjustH, prismWidth, drawOnTop) end

--- Dessine les prismes d'une partition.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:161
---@param partition table Partition
---@param clr table Couleur
---@param prismWidth number|nil Largeur
---@param drawOnTop boolean|nil
function gameplay_rally_snaproad:_drawDebugPartitionAllPrisms(partition, clr, prismWidth, drawOnTop) end

--- Dessine toutes les partitions (utilisé pour Ctrl+clic de création d'un nouveau pacenote, selon le commentaire du code).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:258
---@param prismWidth number|nil
---@param drawOnTop boolean|nil
function gameplay_rally_snaproad:_drawDebugPartitionsAll(prismWidth, drawOnTop) end

--- Dessine des prismes (debugDrawer:drawSquarePrism) entre points consécutifs, avec couleur, hauteur et opacité.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:122
---@param points table[] Points
---@param clr table|nil Couleur
---@param alpha number|nil Alpha
---@param adjustH boolean|nil Ajustement de hauteur
---@param globalOpacity number|nil Opacité globale
---@param prismWidth number|nil Largeur du prisme (1,945 par défaut)
---@param fromLocation table|nil Début limité par un résultat de snap
---@param toLocation table|nil Fin limitée par un résultat de snap
---@param drawOnTop boolean|nil Dessiner par-dessus la scène
function gameplay_rally_snaproad:_drawDebugPointPrisms(points, clr, alpha, adjustH, globalOpacity, prismWidth, fromLocation, toLocation, drawOnTop) end

--- Dessine des sphères aux points donnés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:205
---@param points table[] Points
---@param clr table|nil Couleur
---@param alpha number|nil
---@param radius number|nil Rayon
---@param adjustH boolean|nil
---@param globalOpacity number|nil
function gameplay_rally_snaproad:_drawDebugPoints(points, clr, alpha, radius, adjustH, globalOpacity) end

--- Dessine des cylindres aux points donnés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:233
---@param points table[] Points
---@param clr table|nil
---@param alpha number|nil
---@param radius number|nil
---@param adjustH boolean|nil
---@param globalOpacity number|nil
---@param h number|nil Hauteur
function gameplay_rally_snaproad:_drawDebugPointsCyl(points, clr, alpha, radius, adjustH, globalOpacity, h) end

--- Renvoie l'index des points (tous ou filtrés), reconstruit si la table de points a changé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:587
---@param useAllPoints boolean true pour ignorer le filtre
---@return table  {points, kdTree, stableIdIndex, prefixDistances, totalLength}
function gameplay_rally_snaproad:_indexForPoints(useAllPoints) end

--- Oublie l'index des points filtrés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:583
function gameplay_rally_snaproad:_invalidateFilterPointIndex() end

--- Points du filtre si actif, sinon tous les points.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:570
---@return table
function gameplay_rally_snaproad:_operativePoints() end

--- Découpe la route en points avant, focus (de fromPoint à toPoint) et après, et marque les points focus avec partition.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1206
---@param fromPoint table Premier point du focus
---@param toPoint table Dernier point du focus
---@param fromLoc table|nil Résultat de snap de départ
---@param toLoc table|nil Résultat de snap de fin
function gameplay_rally_snaproad:_partitionPoints(fromPoint, toPoint, fromLoc, toLoc) end

--- Reconstruit l'index (kd-tree, distances cumulées) de tous les points.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:578
function gameplay_rally_snaproad:_rebuildAllPointIndex() end

--- Corrige la liste ordonnée des projections de pacenotes pour que chaque fin soit au moins 2 m après son début et que les pacenotes ne se chevauchent pas, en décalant les distances et en restant dans la longueur de la route.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:757
---@param entries table[] Entrées {csLoc, ceLoc, ...} modifiées en place
function gameplay_rally_snaproad:_repairPacenoteProjectionEntries(entries) end

--- Lit dans un snapshot la position, la normale et la location d'un waypoint (cs ou ce), avec repli sur le waypoint courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:739
---@param snapshotPn table|nil Entrée de snapshot du pacenote
---@param key string 'cs' ou 'ce'
---@param fallbackWp table Waypoint de repli
---@return table  {pos, normal, location}
function gameplay_rally_snaproad:_snapshotWaypoint(snapshotPn, key, fallbackWp) end

--- Projette pos sur la route puis avance (fwd = true) ou recule de meters le long de la route, sans dépasser les points limites.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:712
---@param pos vec3 Position de départ
---@param meters number Distance en mètres
---@param fwd boolean true vers l'avant, false vers l'arrière
---@param limitPoints table[]|nil Points que le résultat ne doit pas dépasser
---@param useAllPoints boolean|nil true pour ignorer le filtre
---@return table|nil  Résultat de snap
function gameplay_rally_snaproad:advanceAlongRoute(pos, meters, fwd, limitPoints, useAllPoints) end

--- Désactive la partition de tous les pacenotes, efface le filtre et les partitions mises en cache sur les points.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1314
function gameplay_rally_snaproad:clearAll() end

--- Désactive le filtre de points.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1409
function gameplay_rally_snaproad:clearFilter() end

--- Désactive et vide la partition courante.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1196
function gameplay_rally_snaproad:clearPartition() end

--- Point de la route le plus proche d'une position.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:954
---@param source_pos vec3 Position
---@param useAllPoints boolean|nil true pour ignorer le filtre
---@return table|nil  Point
function gameplay_rally_snaproad:closestSnapPoint(source_pos, useAllPoints) end

--- Position projetée sur la route ; renvoie source_pos telle quelle si la projection échoue.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:959
---@param source_pos vec3 Position
---@return vec3  Position
function gameplay_rally_snaproad:closestSnapPos(source_pos) end

--- Projette une position sur la route : trouve le point le plus proche (kd-tree) puis le meilleur segment dans une fenêtre de 6 segments autour. Si un filtre avec bornes est actif, borne le résultat entre ces bornes.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:875
---@param source_pos vec3 Position à projeter
---@param useAllPoints boolean|nil true pour ignorer le filtre
---@return table|nil  Résultat de snap ; nil si pas de points
function gameplay_rally_snaproad:closestSnapResult(source_pos, useAllPoints) end

--- Compare deux positions sur la route selon leur distanceAlongRoute.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:628
---@param a table Résultat de snap
---@param b table Résultat de snap
---@return integer|nil  -1 si a avant b, 0 si égaux (écart < 0,0001 m), 1 si a après b ; nil si donnée manquante
function gameplay_rally_snaproad:compareRouteLocations(a, b) end

--- Recule de point en point jusqu'à dépasser une distance en mètres, ou avant un point limite.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1043
---@param fromPoint table Point de départ
---@param meters number Distance
---@param limitPoints table[]|nil Points limites
---@return table  Point atteint
function gameplay_rally_snaproad:distanceBackwards(fromPoint, meters, limitPoints) end

--- Comme advanceAlongRoute vers l'arrière, à partir d'une position.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1070
---@param fromPos vec3 Position
---@param meters number Distance
---@param limitPoints table[]|nil Points limites
---@return table|nil  Résultat de snap
function gameplay_rally_snaproad:distanceBackwardsResult(fromPos, meters, limitPoints) end

--- Distance le long de la route entre les projections de deux positions.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:733
---@param posA vec3 Première position
---@param posB vec3 Seconde position
---@param useAllPoints boolean|nil true pour ignorer le filtre
---@return number|nil  mètres
function gameplay_rally_snaproad:distanceBetweenPositions(posA, posB, useAllPoints) end

--- Distance absolue entre deux résultats de snap, le long de la route.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:637
---@param a table Résultat de snap
---@param b table Résultat de snap
---@return number|nil  mètres
function gameplay_rally_snaproad:distanceBetweenRouteLocations(a, b) end

--- Avance de point en point jusqu'à dépasser une distance en mètres, ou avant un point limite.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1074
---@param fromPoint table Point de départ
---@param meters number Distance
---@param limitPoints table[]|nil Points limites
---@return table  Point atteint
function gameplay_rally_snaproad:distanceForwards(fromPoint, meters, limitPoints) end

--- Comme advanceAlongRoute vers l'avant, à partir d'une position.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1106
---@param fromPos vec3 Position
---@param meters number Distance
---@param limitPoints table[]|nil Points limites
---@return table|nil  Résultat de snap
function gameplay_rally_snaproad:distanceForwardsResult(fromPos, meters, limitPoints) end

--- Dessin pendant la lecture du chemin caméra (pacenote de la partition courante).
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:399
function gameplay_rally_snaproad:drawDebugCameraPlaying() end

--- Dessine seulement les partitions qui recoupent une fenêtre de distance.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:282
---@param window table Fenêtre (déduit du code)
---@param prismWidth number|nil
---@param drawOnTop boolean|nil
function gameplay_rally_snaproad:drawDebugPartitionsAllWindow(window, prismWidth, drawOnTop) end

--- Dessin pour la recce app : la partition si active, sinon tous les points (avec ajustement de hauteur).
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:391
function gameplay_rally_snaproad:drawDebugRecceApp() end

--- Dessin principal : la partition si active, sinon la partition de tous les pacenotes, sinon tous les points.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:379
---@param clrOverride table|nil Couleur imposée
---@param prismWidth number|nil
---@param drawOnTop boolean|nil
function gameplay_rally_snaproad:drawDebugSnaproad(clrOverride, prismWidth, drawOnTop) end

--- Renvoie la driveline passée au constructeur.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:558
---@return table|nil
function gameplay_rally_snaproad:driveline() end

--- Premier point de la driveline.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1113
---@return table|nil  Point
function gameplay_rally_snaproad:firstSnapPoint() end

--- Normale vers l'avant d'un point (délégué à snaproad/normals).
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:997
---@param point table Point
---@return vec3|nil  Normale
function gameplay_rally_snaproad:forwardNormalVec(point) end

--- Regroupe des points par annonce de virage selon styleData (voir notes : renvoie {} si styleData n'est pas défini).
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:464
---@param points table[] Points
function gameplay_rally_snaproad:groupPointsByCornerCall(points) end

--- Mémorise la driveline, crée le lecteur de chemin caméra, initialise filtre, partition, partition_all, opacité globale et l'index des points.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:68
---@param driveline table PointList (champ points)
function gameplay_rally_snaproad:init(driveline) end

--- Mesure la géométrie du virage de la partition courante (geoPacenotes.measurePartition) sur ses points focus.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:362
function gameplay_rally_snaproad:measurePartition() end

--- Écart minimal entre waypoints adjacents : 2,0 m.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:601
---@return number  mètres
function gameplay_rally_snaproad:minAdjacentWaypointDistance() end

--- Point suivant le point le plus proche de srcPos (le point lui-même à la fin).
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1143
---@param srcPos vec3 Position
---@return table|nil  Point
function gameplay_rally_snaproad:nextSnapPoint(srcPos) end

--- Position du point renvoyé par nextSnapPoint (erreur si nil).
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1139
---@param srcPos vec3 Position
---@return vec3  Position
function gameplay_rally_snaproad:nextSnapPos(srcPos) end

--- Renvoie (précédent, courant, suivant) d'un point (délégué à snaproad/normals).
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:987
---@param point table Point
---@return table|nil  prev
---@return table|nil  courant
---@return table|nil  next
function gameplay_rally_snaproad:normalAlignPoints(point) end

--- Normale vers l'avant d'un résultat de snap (calculée sur le segment fromPoint/toPoint, ou via le point le plus proche si le segment est dégénéré).
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:643
---@param result table|nil Résultat de snap
---@return vec3|nil  Normale
function gameplay_rally_snaproad:normalForSnapResult(result) end

--- Indique si la partition de tous les pacenotes est active.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1629
---@return boolean
function gameplay_rally_snaproad:partitionAllEnabled() end

--- Découpe toute la route entre les pacenotes : une partition par intervalle avant chaque pacenote et une par pacenote. Renseigne aussi _driveline_location et _driveline_point sur les waypoints.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1329
---@param notebook table Notebook
function gameplay_rally_snaproad:partitionAllPacenotes(notebook) end

--- Lance la lecture du chemin caméra (cameraPathPlayer).
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1621
function gameplay_rally_snaproad:playCameraPath() end

--- Recule d'un nombre de points donné, en s'arrêtant avant un point limite.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1001
---@param fromPoint table Point de départ
---@param steps integer Nombre de points
---@param limitPoints table[]|nil Points à ne pas atteindre
---@return table  Point atteint
function gameplay_rally_snaproad:pointsBackwards(fromPoint, steps, limitPoints) end

--- Liste des points de la route autour de la partition courante pour un chemin caméra (40 m avant et 20 m après par défaut).
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1576
---@param bufferBeforeMeters number|nil Marge avant, 40 par défaut
---@param bufferAfterMeters number|nil Marge après, 20 par défaut
---@return table[]|nil  Points ; nil sans partition active
function gameplay_rally_snaproad:pointsForCameraPath(bufferBeforeMeters, bufferAfterMeters) end

--- Avance d'un nombre de points donné, en s'arrêtant avant un point limite.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1022
---@param fromPoint table Point de départ
---@param steps integer Nombre de points
---@param limitPoints table[]|nil Points à ne pas atteindre
---@return table  Point atteint
function gameplay_rally_snaproad:pointsForwards(fromPoint, steps, limitPoints) end

--- Position sur la route à une distance cumulée donnée (bornée entre 0 et la longueur totale), interpolée sur le segment concerné.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:659
---@param distanceAlongRoute number Distance depuis le début de la route, en mètres
---@param useAllPoints boolean|nil true pour ignorer le filtre
---@return table|nil  Résultat de snap ; nil s'il n'y a aucun point
function gameplay_rally_snaproad:positionAtDistanceAlongRoute(distanceAlongRoute, useAllPoints) end

--- Point précédant le point le plus proche de srcPos (le point lui-même au début).
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1121
---@param srcPos vec3 Position
---@return table|nil  Point
function gameplay_rally_snaproad:prevSnapPoint(srcPos) end

--- Position du point renvoyé par prevSnapPoint (erreur si nil).
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1117
---@param srcPos vec3 Position
---@return vec3  Position
function gameplay_rally_snaproad:prevSnapPos(srcPos) end

--- Reprojette les waypoints des pacenotes. Sans snapshot, en construit un à partir des positions actuelles (et de l'ancien snaproad s'il est fourni).
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:843
---@param notebook table Notebook
---@param previousSnaproad table|nil Ancien Snaproad
---@param snapshot table|nil Snapshot de positions
function gameplay_rally_snaproad:reprojectPacenoteWaypoints(notebook, previousSnaproad, snapshot) end

--- Reprojette sur la route actuelle les waypoints cs/ce de tous les pacenotes non manquants, à partir d'un snapshot, répare les chevauchements, met à jour les halfpoints et recalcule les appels de distance (autofillDistanceCalls).
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:799
---@param notebook table Notebook
---@param snapshot table {pacenotes = {[pnId] = {cs={pos, normal, location}, ce=...}}}
function gameplay_rally_snaproad:reprojectPacenoteWaypointsFromSnapshot(notebook, snapshot) end

--- Construit le résultat de snap correspondant exactement à un point de la driveline.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:610
---@param point table|nil Point avec id et pos
---@return table|nil  Résultat de snap ; nil si le point est inconnu
function gameplay_rally_snaproad:routeLocationForPoint(point) end

--- Active un filtre qui limite les points déplaçables d'un waypoint de pacenote entre les pacenotes voisins (avec une marge de 2 m).
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1455
---@param wp table Waypoint de début ou de fin de virage
function gameplay_rally_snaproad:setFilter(wp) end

--- Active un filtre limité à la partition contenant le point donné.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1435
---@param point table Point avec champ partition
function gameplay_rally_snaproad:setFilterPartitionPoint(point) end

--- Active un filtre contenant tous les points des partitions (nécessite partitionAllPacenotes d'abord).
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1417
function gameplay_rally_snaproad:setFilterToAllPartitions() end

--- Définit l'opacité globale des dessins debug.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:112
---@param globalOpacity number 0 à 1
function gameplay_rally_snaproad:setGlobalOpacity(globalOpacity) end

--- Définit la partition « focus » sur la portion de route couverte par le filtre actif.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1565
function gameplay_rally_snaproad:setPartitionToFilter() end

--- Définit la partition « focus » sur la portion de route allant du début à la fin du pacenote.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1183
---@param pn table Pacenote
function gameplay_rally_snaproad:setPartitionToPacenote(pn) end

--- Arrête la lecture du chemin caméra.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1625
function gameplay_rally_snaproad:stopCameraPath() end

--- Bascule l'affichage des annonces de virage et recalcule la partition du pacenote courant.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1633
function gameplay_rally_snaproad:toggleCornerCalls() end

--- Longueur totale de la route (tous les points).
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:605
---@return number  mètres
function gameplay_rally_snaproad:totalRouteLength() end

--- Calcule le point milieu (en distance sur la route) entre le début et la fin du pacenote et le stocke dans pn.halfpoint, halfpointLocation, halfpointPos.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1161
---@param pn table Pacenote
function gameplay_rally_snaproad:updateHalfpoint(pn) end

