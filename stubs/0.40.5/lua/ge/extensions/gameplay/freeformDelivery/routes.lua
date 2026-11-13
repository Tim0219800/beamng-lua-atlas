---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/routes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestion des itinéraires de la livraison libre. Construit des routes de guidage (core_groundMarkers.setPath) vers une zone cible ou vers un véhicule, avec waypoints issus d'un fichier race ou de noms de nœuds de la carte, détecte l'arrivée du joueur, choisit automatiquement la route quand il ne reste qu'un objectif visible, réagit aux attelages (couplerAttachedRoute) et alimente la grande carte (bigmap) en points d'intérêt et en groupes.
--- Accès : extension `gameplay_freeformDelivery_routes` : `extensions.load("gameplay_freeformDelivery_routes")`, puis la globale `gameplay_freeformDelivery_routes`
---@class gameplay_freeformDelivery_routes
---@field dependencies string[] gameplay_freeformDelivery_utils, _goals et _markers.
gameplay_freeformDelivery_routes = {}

--- Efface le guidage et oublie la livraison, les routes et la route courante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:587
function gameplay_freeformDelivery_routes.cleanup() end

--- Cache le marqueur de route, efface le guidage (core_groundMarkers.resetAll) et met à jour la liste de tâches.
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:487
---@return boolean  false si core_groundMarkers n'est pas disponible, sinon true.
function gameplay_freeformDelivery_routes.clearRoute() end

--- Route active.
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:453
---@return table|nil  {type = 'targetArea'|'vehicle', id, automaticGoalId?} ou nil.
function gameplay_freeformDelivery_routes.getCurrentRoute() end

--- Renvoie la route d'indice donné (à partir de 1).
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:440
---@param index integer Indice 1-based.
---@return table|nil  Route ou nil si hors limites.
function gameplay_freeformDelivery_routes.getRoute(index) end

--- Nombre de routes disponibles.
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:458
---@return integer  Nombre de routes.
function gameplay_freeformDelivery_routes.getRouteCount() end

--- Nom affichable d'une route : nom traduit de la zone cible ou du véhicule, à défaut l'id, ou le texte « route inconnue ».
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:422
---@param route table Entrée de route.
---@return string  Nom à afficher.
function gameplay_freeformDelivery_routes.getRouteName(route) end

--- Renvoie la liste des routes de la livraison.
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:448
---@return table[]  Routes (delivery.routes).
function gameplay_freeformDelivery_routes.getRoutes() end

--- Position d'une zone cible : pos pour un lieu ou une place, centre (ou moyenne des sommets recalée sur le relief) pour une zone.
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:475
---@param targetAreaId string ID de la zone cible.
---@return vec3|nil  Position ou nil.
function gameplay_freeformDelivery_routes.getTargetAreaPosition(targetAreaId) end

--- Renvoie les zones cibles de la livraison active (utile pour générer les POI).
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:463
---@return table[]  targetAreas, ou tableau vide sans livraison.
function gameplay_freeformDelivery_routes.getTargetAreas() end

--- Position en cache d'un véhicule de la livraison active.
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:481
---@param vehicleId string ID du véhicule de livraison.
---@return vec3|nil  Position ou nil.
function gameplay_freeformDelivery_routes.getVehiclePosition(vehicleId) end

--- Renvoie les véhicules de la livraison active (utile pour générer les POI).
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:469
---@return table[]  vehicles, ou tableau vide sans livraison.
function gameplay_freeformDelivery_routes.getVehicles() end

--- Hook de la grande carte : ajoute la structure de groupes « delivery » (delivery_relevant et groupes de la livraison).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:1134
---@param customGroupStructures table[] Liste de structures, modifiée en place.
function gameplay_freeformDelivery_routes.onBigmapBuildCustomGroupStructures(customGroupStructures) end

--- Hook de la grande carte : crée les groupes delivery_relevant et ceux de bigmapGroups dans groupData.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:1116
---@param groupData table Table des groupes, indexée par id, modifiée en place.
function gameplay_freeformDelivery_routes.onBigmapBuildGroupData(groupData) end

--- Hook appelé à l'attelage de deux véhicules ; si l'un est le véhicule du joueur et que l'autre a une couplerAttachedRoute, active cette route.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:1151
---@param objId1 integer ID du premier véhicule.
---@param objId2 integer ID du second véhicule.
---@param nodeId integer Nœud d'attelage du premier véhicule (déduit du code).
---@param obj2nodeId integer Nœud d'attelage du second véhicule (déduit du code).
function gameplay_freeformDelivery_routes.onCouplerAttached(objId1, objId2, nodeId, obj2nodeId) end

--- Hook appelé au dételage ; efface la route courante si elle correspond à la couplerAttachedRoute du véhicule dételé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:1165
---@param objId1 integer ID du premier véhicule.
---@param objId2 integer ID du second véhicule.
---@param nodeId integer Nœud d'attelage du premier véhicule (déduit du code).
---@param obj2nodeId integer Nœud d'attelage du second véhicule (déduit du code).
---@param breakForce number Force de rupture (non utilisée).
function gameplay_freeformDelivery_routes.onCouplerDetached(objId1, objId2, nodeId, obj2nodeId, breakForce) end

--- Hook du système de POI : ajoute les POI de la livraison (zones cibles et véhicules, avec description des objectifs liés) quand une livraison est active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:1147
---@param levelIdentifier string Identifiant du niveau (non utilisé).
---@param elements table[] Liste de POI complétée en place.
function gameplay_freeformDelivery_routes.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Construit et active un itinéraire de guidage vers une zone cible de la livraison (position du lieu, centre de la zone ou position de la place). Pose le marqueur de route, avec le contour de zone ou de place le cas échéant, et met à jour le message de la liste de tâches.
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:366
---@param targetAreaId string ID de la zone cible dans delivery.targetAreas.
---@param route table|nil Entrée de route dont params fournit waypoints et options de calcul.
---@return boolean  true si la route est posée ; false si core_groundMarkers manque ou si la zone, le site ou la position est introuvable.
function gameplay_freeformDelivery_routes.setRouteToTargetArea(targetAreaId, route) end

--- Construit et active un itinéraire de guidage vers la position en cache d'un véhicule de livraison.
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:404
---@param vehicleId string ID du véhicule dans delivery.vehicles.
---@param route table|nil Entrée de route (params).
---@return boolean  true si la route est posée.
function gameplay_freeformDelivery_routes.setRouteToVehicle(vehicleId, route) end

--- Initialise le module avec la livraison : routes, groupes de grande carte, groupes de repli otherLocations et otherVehicles pour les routes et véhicules sans groupe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:505
---@param delivery table Données de livraison.
function gameplay_freeformDelivery_routes.setup(delivery) end

--- Appelée chaque frame : vérifie l'arrivée à la route courante puis met à jour la route automatique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:582
---@param dtReal number Non utilisé.
---@param dtSim number Non utilisé.
---@param dtRaw number Non utilisé.
---@param profiler table|nil Non utilisé.
function gameplay_freeformDelivery_routes.update(dtReal, dtSim, dtRaw, profiler) end

