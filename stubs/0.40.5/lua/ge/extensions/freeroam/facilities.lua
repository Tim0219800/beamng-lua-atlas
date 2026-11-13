---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/facilities.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Registre des « facilities » (installations) d'un niveau : garages, stations-service, concessions, ordinateurs, vendeurs privés, fournisseurs de livraison et dragstrips. Lit la section de ces listes dans `<niveau>/info.json` et dans `<niveau>/facilities/*.facilities.json`, normalise chaque entrée (id, aperçu, fichier de sites), puis donne accès aux positions (portes, places de parking, zones), à la téléportation au garage et à la génération des POI (marqueurs de grande carte / jeu). Global : freeroam_facilities.
--- Accès : extension `freeroam_facilities` : `extensions.load("freeroam_facilities")`, puis la globale `freeroam_facilities`
---@class freeroam_facilities
freeroam_facilities = {}

--- Tente de formater une facility selon son clusterType par défaut et d'y appliquer les valeurs par défaut de facilityPoiDefaults (clusterInBigMap, interactableInPlayMode, quickTravelAvailable…). Voir le bug dans les notes.
---Source : lua/ge/extensions/freeroam/facilities.lua:445
---@param f table|nil Facility.
---@param elements table[] Liste de POI.
function freeroam_facilities.formatFacilityToRawPoi(f, elements) end

--- Moyenne des positions des objets de scène listés dans facility.doors ; vec3 nul avec log d'erreur s'il n'y en a aucun.
---Source : lua/ge/extensions/freeroam/facilities.lua:135
---@param facility table Facility avec `doors`.
---@return vec3  Position moyenne.
function freeroam_facilities.getAverageDoorPositionForFacility(facility) end

--- Position de la porte la plus proche de la caméra (core_camera.getPosition).
---Source : lua/ge/extensions/freeroam/facilities.lua:156
---@param facility table Facility avec `doors`.
---@return vec3|nil  Position ou nil.
function freeroam_facilities.getClosestDoorPositionForFacility(facility) end

--- Raccourci getFacility('dealership', id).
---Source : lua/ge/extensions/freeroam/facilities.lua:132
---@param id string Id de la concession.
---@return table|nil  Concession.
function freeroam_facilities.getDealership(id) end

--- Charge (cache) et renvoie toutes les facilities d'un niveau, sous forme de table de listes (garages, gasStations, dealerships, computers, privateSellers, deliveryProviders, dragstrips).
---Source : lua/ge/extensions/freeroam/facilities.lua:78
---@param levelName string Nom du niveau.
---@return table<string, table[]>  Listes par type.
function freeroam_facilities.getFacilities(levelName) end

--- Liste des facilities d'un type pour un niveau (niveau courant par défaut).
---Source : lua/ge/extensions/freeroam/facilities.lua:117
---@param type string Type de facility.
---@param levelName string|nil Niveau (défaut getCurrentLevelIdentifier()).
---@return table[]|nil  Liste, nil sans niveau.
function freeroam_facilities.getFacilitiesByType(type, levelName) end

--- Cherche une facility par type et id dans le niveau courant ; log d'erreur si le type est invalide ou l'id introuvable.
---Source : lua/ge/extensions/freeroam/facilities.lua:101
---@param type string garage, gasStation, dealership, computer, privateSeller, deliveryProvider ou dragstrip.
---@param id string Id de la facility.
---@return table|nil  Facility.
function freeroam_facilities.getFacility(type, id) end

--- Raccourci getFacility('garage', id).
---Source : lua/ge/extensions/freeroam/facilities.lua:130
---@param id string Id du garage.
---@return table|nil  Garage.
function freeroam_facilities.getGarage(id) end

--- Meilleure place de parking (pour le véhicule) du garage dont l'id est poi.id.
---Source : lua/ge/extensions/freeroam/facilities.lua:248
---@param poi table {id = idGarage}
---@param veh userdata|nil Véhicule (défaut joueur 0).
---@return vec3|nil  Position.
---@return quat|nil  Rotation.
function freeroam_facilities.getGaragePosRot(poi, veh) end

--- Raccourci getFacility('gasStation', id).
---Source : lua/ge/extensions/freeroam/facilities.lua:131
---@param id string Id de la station.
---@return table|nil  Station.
function freeroam_facilities.getGasStation(id) end

--- Charge les fichiers de sites de la facility (gameplay_sites_sitesManager.loadSites) et renvoie les places de parking dont les noms sont dans facility.parkingSpotNames.
---Source : lua/ge/extensions/freeroam/facilities.lua:179
---@param facility table Facility.
---@return table[]  Places de parking trouvées (non manquantes).
function freeroam_facilities.getParkingSpotsForFacility(facility) end

--- Idem pour les zones listées dans facility.zoneNames.
---Source : lua/ge/extensions/freeroam/facilities.lua:214
---@param facility table Facility.
---@return table[]  Zones trouvées.
function freeroam_facilities.getZonesForFacility(facility) end

--- Hook de collecte des activités proposées par un POI : fiche (icône, titre, props, bouton) pour garage (gameplay_garageMode.start), concession (career_modules_vehicleShopping.openShop), ordinateur (career_modules_computer.openMenu), dragstrip (écran de règles ou d'historique via gameplay_drag_dragBridge). Les stations sont gérées dans gasStations.lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/facilities.lua:493
---@param elemData table[] Éléments du POI.
---@param activityData table[] Liste à compléter.
function freeroam_facilities.onActivityAcceptGatherData(elemData, activityData) end

--- Hook de collecte des POI d'un niveau : concessions (hors remotePurchaseOnly) et ordinateurs en carrière, dragstrips toujours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/facilities.lua:461
---@param levelIdentifier string Niveau.
---@param elements table[] Liste à compléter.
function freeroam_facilities.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Hook de collecte des POI du tutoriel : dragstrips avec isTutorialForDragstrip sur le niveau west_coast_usa.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/facilities.lua:482
---@param elements table[] Liste à compléter.
function freeroam_facilities.onGetRawPoiListForTutorial(elements) end

--- Téléporte un véhicule au garage (spawn.safeTeleport), réinitialise la caméra, émet onTeleportedToGarage(garageId, veh) et recadre la navigation de la grande carte si un itinéraire est actif.
---Source : lua/ge/extensions/freeroam/facilities.lua:260
---@param garageId string Id du garage.
---@param veh userdata Véhicule.
---@param resetVeh boolean|nil Réparer/réinitialiser le véhicule.
function freeroam_facilities.teleportToGarage(garageId, veh, resetVeh) end

--- Idem walkingMarkerFormatFacility mais avec un marqueur de type vehicleTrigger (dragstrips).
---Source : lua/ge/extensions/freeroam/facilities.lua:409
---@param f table Facility avec `doors`.
---@param elements table[] Liste à compléter.
function freeroam_facilities.vehicleTriggerFormatFacility(f, elements) end

--- Ajoute à `elements` un POI à marqueur piéton (centre des portes, rayon = distance max + rayon de porte) et marqueur de grande carte.
---Source : lua/ge/extensions/freeroam/facilities.lua:372
---@param f table Facility avec `doors`.
---@param elements table[] Liste à compléter.
function freeroam_facilities.walkingMarkerFormatFacility(f, elements) end

--- Ajoute à `elements` un POI à marqueur de zone (zones, centre = milieu de la boîte englobante posé sur le terrain, rayon) et un marqueur de grande carte avec téléportation au garage.
---Source : lua/ge/extensions/freeroam/facilities.lua:353
---@param f table Facility.
---@param elements table[] Liste de POI à compléter.
---@param bigMapIcon string|nil Non utilisé.
function freeroam_facilities.zoneMarkerFormatFacility(f, elements, bigMapIcon) end

