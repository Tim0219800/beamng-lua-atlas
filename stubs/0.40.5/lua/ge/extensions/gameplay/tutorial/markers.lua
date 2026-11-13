---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/tutorial/markers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les marqueurs visuels du tutoriel de carrière : marqueurs d'attention au-dessus d'un véhicule ou à une position, marqueurs de direction sur une place de parking, et décalques au sol des places de parking dont la couleur indique si le véhicule est bien garé (blanc : non garé, jaune : garé mais mal orienté, vert : garé et bien orienté). Fournit aussi les tests de stationnement utilisés pour valider un objectif de parking.
--- Accès : extension `gameplay_tutorial_markers` : `extensions.load("gameplay_tutorial_markers")`, puis la globale `gameplay_tutorial_markers`
---@class gameplay_tutorial_markers
gameplay_tutorial_markers = {}

--- Enregistre un décalque au sol pour une place de parking (affiché par update).
---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:139
---@param parkingSpot table Place avec name, pos, rot, scl.
function gameplay_tutorial_markers.addParkingSpotDecal(parkingSpot) end

--- Valide un objectif de parking : garé, bien orienté et immobile pendant la durée demandée. L'état du chronomètre est conservé dans la table state.
---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:193
---@param vehicle table Objet véhicule.
---@param parkingSpot table Place de parking.
---@param dtReal number Delta temps réel (s).
---@param requiredSeconds number|nil Durée d'immobilité requise (1 s par défaut).
---@param state table|nil Table d'état {stationaryTimer, wasStationary}, à réutiliser d'un appel à l'autre.
---@return boolean  true quand l'objectif est atteint.
function gameplay_tutorial_markers.checkParkGoalWithStationaryTime(vehicle, parkingSpot, dtReal, requiredSeconds, state) end

--- Teste si un véhicule est garé dans une place, bien orienté et à l'arrêt.
---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:167
---@param vehicle table Objet véhicule.
---@param parkingSpot table Place de parking (méthode checkParking, rot).
---@return boolean  isParked : garé dans la place (tolérance 0,8).
---@return boolean  isFacingCorrect : orientation compatible (produit scalaire >= 0,7).
---@return boolean  isStationary : vitesse < 0,1 m/s.
function gameplay_tutorial_markers.checkVehicleInParkingSpot(vehicle, parkingSpot) end

--- Supprime tous les marqueurs et vide décalques et véhicules associés.
---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:303
function gameplay_tutorial_markers.cleanup() end

--- Supprime tous les marqueurs.
---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:131
function gameplay_tutorial_markers.clearAllMarkers() end

--- Crée un marqueur de direction posé 1,75 m au-dessus d'une place de parking, orienté selon la rotation de la place.
---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:82
---@param parkingSpot table Place de parking avec pos, rot (et name).
---@param scale vec3|nil Échelle ; x sert de rayon (2 par défaut).
---@return integer|nil  Id du marqueur, ou nil si la place est invalide ou le chargement échoue.
function gameplay_tutorial_markers.createDirectionMarkerFromParkingSpot(parkingSpot, scale) end

--- Crée un marqueur d'attention (scenario/raceMarkers/attention) à une position, 1,75 m au-dessus pour la partie visible, et l'affiche.
---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:39
---@param pos vec3 Position du marqueur.
---@param rot quat|nil Rotation facultative.
---@param scale vec3|nil Échelle (1,1,1 par défaut).
---@return integer|nil  Id du marqueur, ou nil en cas d'échec.
function gameplay_tutorial_markers.createMarker(pos, rot, scale) end

--- Crée un marqueur d'attention 2 m au-dessus d'un véhicule (échelle 1,5 par défaut).
---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:75
---@param vehicle table Objet véhicule (getPosition).
---@param scale vec3|nil Échelle du marqueur.
---@return integer|nil  Id du marqueur, ou nil.
function gameplay_tutorial_markers.createMarkerAboveVehicle(vehicle, scale) end

--- Supprime un marqueur par son id.
---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:118
---@param markerId integer Id renvoyé à la création.
---@return boolean  true si supprimé, false s'il est introuvable.
function gameplay_tutorial_markers.removeMarker(markerId) end

--- Retire le décalque d'une place et le véhicule qui lui était associé.
---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:157
---@param parkingSpotName string Nom de la place.
function gameplay_tutorial_markers.removeParkingSpotDecal(parkingSpotName) end

--- Définit la fonction qui fournit le véhicule à tester pour la couleur des décalques de parking, quand aucun véhicule n'est associé à la place.
---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:30
---@param getter function|nil Fonction sans argument renvoyant un véhicule (objet) ou nil.
function gameplay_tutorial_markers.setDefaultParkingSpotVehicleGetter(getter) end

--- Associe un véhicule à une place pour déterminer la couleur de son décalque.
---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:163
---@param parkingSpotName string Nom de la place.
---@param vehicle table|nil Objet véhicule.
function gameplay_tutorial_markers.setParkingSpotVehicle(parkingSpotName, vehicle) end

--- Met à jour les marqueurs (échelle selon la distance à la caméra, update de chaque marqueur) puis calcule et envoie les décalques de parking proches à Engine.Render.DynamicDecalMgr.
---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:231
---@param dt number Delta temps réel.
---@param dtSim number Delta temps de simulation.
function gameplay_tutorial_markers.update(dt, dtSim) end

