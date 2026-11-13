---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/gasStations.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestion simple du ravitaillement aux stations-service (carburant ou recharge électrique). Fournit les points d'intérêt (POI) des stations pour la grande carte et les marqueurs, le bouton d'action « faire le plein » et le remplissage des réservoirs du véhicule ; en mode carrière, délègue la transaction à career_modules_fuel. Global : freeroam_gasStations. Dépend de gameplay_achievement.
--- Accès : extension `freeroam_gasStations` : `extensions.load("freeroam_gasStations")`, puis la globale `freeroam_gasStations`
---@class freeroam_gasStations
---@field dependencies table
freeroam_gasStations = {}

--- Construit l'élément POI d'une station : id, data {type='gasStation', facility}, markerInfo {gasStationMarker {pumps, pos, radius, electric}, bigmapMarker {pos, icon (poi_fuel_round ou poi_charge_round), name, description, thumbnail, previews, cardIcon}}. Station électrique si energyTypes contient electricEnergy.
---Source : lua/ge/extensions/freeroam/gasStations.lua:53
---@param gasStation table Facility de station.
---@return table  Élément POI.
function freeroam_gasStations.formatGasStationPoi(gasStation) end

--- Calcule le centre (moyenne des positions des pompes, objets de la scène nommés par pump[1]) et le rayon (distance max au centre) d'une station.
---Source : lua/ge/extensions/freeroam/gasStations.lua:30
---@param f table Facility station avec `pumps` : liste de paires dont le 1er élément est le nom d'objet de la pompe.
---@return vec3  Centre.
---@return number  Rayon (m).
function freeroam_gasStations.gasStationCenterRadius(f) end

--- Hook de collecte des activités d'un POI : pour chaque élément de type gasStation, ajoute une fiche (icône, titre, props par type de carburant, bouton « refuel/recharge/refuelMixed » dont l'action appelle refuelCar sur le véhicule joueur 0).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/gasStations.lua:80
---@param elemData table[] Éléments du POI.
---@param activityData table[] Liste à compléter.
function freeroam_gasStations.onActivityAcceptGatherData(elemData, activityData) end

--- Hook de collecte des POI d'un niveau : ajoute un POI par station de freeroam_facilities.getFacilities(levelIdentifier).gasStations (sous conditions, voir notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/gasStations.lua:69
---@param levelIdentifier string Nom du niveau.
---@param elements table Liste à compléter.
function freeroam_gasStations.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Remplit le véhicule : demande ses réservoirs (core_vehicleBridge.requestValue 'energyStorage'), vérifie la compatibilité avec fuelTypes, remplit ou lance la transaction carrière, affiche les messages et joue le son de ravitaillement.
---Source : lua/ge/extensions/freeroam/gasStations.lua:123
---@param gasStation table Élément POI de la station (utilisé aussi comme argument de career_modules_fuel.startTransaction).
---@param fuelTypes table<string, boolean> Types d'énergie fournis (ensemble).
---@param veh userdata Objet véhicule à ravitailler.
function freeroam_gasStations.refuelCar(gasStation, fuelTypes, veh) end

