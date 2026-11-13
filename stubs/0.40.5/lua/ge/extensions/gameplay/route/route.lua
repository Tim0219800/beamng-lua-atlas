---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/route/route.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Itinéraire. Champs : path, dirMult (1e3), distance, cutOffDrivability, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ, done, lastDist, lastIndexAtDist, lockFixedNodes.
---@class gameplay_route_route
local gameplay_route_route = {}

--- Recalcule distToTarget de chaque point (distance restante jusqu'à la fin) et self.distance.
---Source : lua/ge/extensions/gameplay/route/route.lua:85
---@return number  Longueur totale en mètres.
function gameplay_route_route:calcDistance() end

--- Annule les jobs en cours et vide le chemin.
---Source : lua/ge/extensions/gameplay/route/route.lua:249
function gameplay_route_route:clear() end

--- Position du premier point fixed du chemin.
---Source : lua/ge/extensions/gameplay/route/route.lua:256
---@return vec3|nil  Position, nil si aucun.
function gameplay_route_route:getNextFixedWP() end

--- Cherche le segment du chemin le plus proche d'une position.
---Source : lua/ge/extensions/gameplay/route/route.lua:373
---@param currentPos vec3 Position à tester.
---@return integer  Indice du segment si à moins de 18 m, 0 sinon.
---@return number  Distance minimale au chemin en mètres.
function gameplay_route_route:getPositionOffset(currentPos) end

--- Constructeur : chemin vide, dirMult = 1e3, pas de job en cours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/route/route.lua:27
function gameplay_route_route:init() end

--- Recalcule en tâche asynchrone la route depuis startPos. S'il existe un point fixed, ne refait que le tronçon jusqu'à lui puis recolle la suite ; sinon refait la route jusqu'au dernier point. Émet le hook onRecalculatedRoute à la fin. Annule les jobs précédents.
---Source : lua/ge/extensions/gameplay/route/route.lua:288
---@param startPos vec3 Nouveau point de départ.
function gameplay_route_route:recalculateRoute(startPos) end

--- Fixe les paramètres de recherche transmis à map.getPointToPointPath / map.getPath.
---Source : lua/ge/extensions/gameplay/route/route.lua:36
---@param cutOffDrivability number|nil Seuil de praticabilité des routes.
---@param dirMult number|nil Multiplicateur de sens ; défaut 1e3.
---@param penaltyAboveCutoff number|nil Pénalité au-dessus du seuil.
---@param penaltyBelowCutoff number|nil Pénalité en dessous du seuil.
---@param wD number|nil Poids de la distance (déduit du nom).
---@param wZ number|nil Poids de l'altitude (déduit du nom).
function gameplay_route_route:setRouteParams(cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ) end

--- Itinéraire simple entre deux positions (appelle setupPathMulti).
---Source : lua/ge/extensions/gameplay/route/route.lua:102
---@param fromPos vec3 Départ.
---@param toPos vec3 Arrivée.
function gameplay_route_route:setupPath(fromPos, toPos) end

--- Construit (de façon synchrone) un chemin passant par toutes les positions. L'arrivée de chaque segment est un point `fixed`. Les points proches sont fusionnés et les extrémités sont ajustées sur le segment le plus proche.
---Source : lua/ge/extensions/gameplay/route/route.lua:181
---@param positions vec3[] Au moins 2 positions.
function gameplay_route_route:setupPathMulti(positions) end

--- Comme setupPathMulti mais la recherche tourne dans core_jobsystem (cède entre les étapes). self.path est remplacé une fois le calcul fini. Annule un recalcul ou un job précédent en cours.
---Source : lua/ge/extensions/gameplay/route/route.lua:216
---@param positions vec3[] Positions à relier.
---@param onComplete function|nil Appelée avec la route à la fin du job.
function gameplay_route_route:setupPathMultiJob(positions, onComplete) end

--- Ajoute au chemin les nœuds du navgraph entre des waypoints donnés (map.getPath), sans doublons consécutifs, puis calcule les distances.
---Source : lua/ge/extensions/gameplay/route/route.lua:106
---@param wpList string[] Liste de noms de nœuds du navgraph.
function gameplay_route_route:setupPathMultiWaypoints(wpList) end

--- Supprime les points avant l'indice idx (les idx-1 premiers).
---Source : lua/ge/extensions/gameplay/route/route.lua:399
---@param idx integer Indice du segment courant.
function gameplay_route_route:shortenPath(idx) end

--- Renvoie le point situé à stepDist mètres plus loin le long de la route, en mémorisant la dernière position pour accélérer les appels successifs.
---Source : lua/ge/extensions/gameplay/route/route.lua:59
---@param stepDist number Distance à avancer (m), cumulée avec la précédente sauf si reset.
---@param reset boolean|nil true pour repartir du début.
---@return table|nil  {n1, n2, idx, pos, xnorm} ; nil si le chemin a moins de 2 points. À la fin de la route, renvoie le dernier segment avec xnorm = 1.
function gameplay_route_route:stepAhead(stepDist, reset) end

--- Suit la caméra (core_camera.getPosition).
---Source : lua/ge/extensions/gameplay/route/route.lua:408
---@return integer|nil  Indice du segment.
---@return number|nil  Distance au chemin.
function gameplay_route_route:trackCamera() end

--- Suit une position quelconque.
---Source : lua/ge/extensions/gameplay/route/route.lua:409
---@param pos vec3 Position.
---@return integer|nil  Indice du segment.
---@return number|nil  Distance au chemin.
function gameplay_route_route:trackPosition(pos) end

--- Suit un véhicule (updatePathForPos sur sa position).
---Source : lua/ge/extensions/gameplay/route/route.lua:407
---@param veh table Objet véhicule.
---@return integer|nil  Indice du segment.
---@return number|nil  Distance au chemin.
function gameplay_route_route:trackVehicle(veh) end

--- Retire le drapeau fixed du premier point fixed (étape atteinte).
---Source : lua/ge/extensions/gameplay/route/route.lua:262
---@return boolean  true si un point a été modifié.
function gameplay_route_route:unflagFirstFixedNode() end

--- Met à jour la route pour une position : lance un recalcul si on est à 18 m ou plus de tout segment, annule un recalcul devenu inutile, raccourcit le chemin et ajuste le premier point sur la position. Met done = true si le chemin a moins de 2 points.
---Source : lua/ge/extensions/gameplay/route/route.lua:412
---@param pos vec3 Position actuelle.
---@return integer|nil  Indice du segment (0 hors chemin).
---@return number|nil  Distance au chemin en mètres.
function gameplay_route_route:updatePathForPos(pos) end

