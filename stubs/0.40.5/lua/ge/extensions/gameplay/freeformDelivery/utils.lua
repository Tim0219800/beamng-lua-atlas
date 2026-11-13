---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fonctions utilitaires partagées par les sous-modules de la livraison libre : cache de positions de véhicules, recherche d'objets de site (lieux, zones, places de parking), tests de présence d'un véhicule dans une zone cible, résolution de chemins, formatage du temps et accès au joueur (véhicule ou à pied).
--- Accès : extension `gameplay_freeformDelivery_utils` : `extensions.load("gameplay_freeformDelivery_utils")`, puis la globale `gameplay_freeformDelivery_utils`
---@class gameplay_freeformDelivery_utils
gameplay_freeformDelivery_utils = {}

--- Test unifié de présence : lieu (distance <= radius), zone (containsVehicle) ou place de parking.
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:114
---@param veh table Objet véhicule.
---@param siteObj table Objet de site.
---@param areaType string "location", "zone" ou "parkingSpot".
---@return boolean  true si le véhicule est dans la zone.
function gameplay_freeformDelivery_utils.checkVehicleInArea(veh, siteObj, areaType) end

--- Teste si un véhicule est garé dans une place via parkingSpot:checkParking(vehId, 0.8).
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:101
---@param veh table Objet véhicule.
---@param parkingSpot table Objet place de parking.
---@return boolean  Résultat de checkParking, false si argument manquant.
function gameplay_freeformDelivery_utils.checkVehicleInParkingSpot(veh, parkingSpot) end

--- Vide tout le cache de positions.
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:63
function gameplay_freeformDelivery_utils.clearVehicleCache() end

--- Retrouve un objet de site (lieu, zone ou place de parking) par type et identifiant.
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:81
---@param sites table|nil Table de sites avec locations, zones, parkingSpots (chacun avec byName et objects).
---@param siteType string "location", "zone" ou "parkingSpot".
---@param siteId string|integer Nom ou indice de l'objet.
---@return table|nil  Objet de site ou nil.
function gameplay_freeformDelivery_utils.findSiteObject(sites, siteType, siteId) end

--- Cherche une zone cible par id dans delivery.targetAreas.
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:152
---@param delivery table Données de livraison.
---@param areaId string ID de la zone cible.
---@return table|nil  Zone cible ou nil.
function gameplay_freeformDelivery_utils.findTargetArea(delivery, areaId) end

--- Cherche la définition d'un véhicule par id dans delivery.vehicles.
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:163
---@param delivery table Données de livraison.
---@param vehicleId string ID du véhicule de livraison.
---@return table|nil  Définition du véhicule ou nil.
function gameplay_freeformDelivery_utils.findVehicle(delivery, vehicleId) end

--- Formate une durée en secondes en H:MM:SS (si au moins une heure) ou M:SS.
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:68
---@param seconds number Durée en secondes.
---@return string  Chaîne formatée.
function gameplay_freeformDelivery_utils.formatTime(seconds) end

--- Renvoie la position en cache d'un véhicule (la calcule au premier appel).
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:46
---@param veh table Objet véhicule.
---@return vec3|nil  Position partagée, ne pas modifier ; nil si veh invalide.
function gameplay_freeformDelivery_utils.getCachedVehiclePosition(veh) end

--- Détaille le stationnement d'un véhicule dans une place : nombre de coins dans la place (0 à 4), validité et taille de la place.
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:214
---@param veh table Objet véhicule.
---@param parkingSpot table Objet place de parking.
---@return table|nil  {valid, cornerCount, corners, spotSize={x,y,z}} ; nil si aucun coin n'est dans la place.
function gameplay_freeformDelivery_utils.getParkingInfo(veh, parkingSpot) end

--- Position du joueur : position en cache de son véhicule, sinon position du personnage s'il marche (gameplay_walk).
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:199
---@return vec3|nil  Position ou nil.
function gameplay_freeformDelivery_utils.getPlayerPosition() end

--- Renvoie le véhicule du joueur 0 (upcasté).
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:192
---@return table|nil  Objet véhicule ou nil.
function gameplay_freeformDelivery_utils.getPlayerVehicle() end

--- Normalise un goal : renvoie goal.vehicleIds, ou {goal.vehicleId}, ou un tableau vide.
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:96
---@param goal table Objectif de livraison.
---@return string[]  Liste d'ID de véhicules de livraison.
function gameplay_freeformDelivery_utils.getVehicleIds(goal) end

--- Convertit un ID de véhicule de livraison en objet véhicule (via gameplay_freeformDelivery_setup.getVehicleId puis Sim.upcast).
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:174
---@param vehicleId string ID du véhicule de livraison.
---@return table|nil  Objet véhicule upcasté ou nil.
function gameplay_freeformDelivery_utils.getVehicleObjectByDeliveryId(vehicleId) end

--- Position en cache du véhicule désigné par son ID de livraison.
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:185
---@param vehicleId string ID du véhicule de livraison.
---@return vec3|nil  Position en cache ou nil.
function gameplay_freeformDelivery_utils.getVehiclePositionByDeliveryId(vehicleId) end

--- Résout un chemin relatif par rapport au dossier d'un fichier de base. Un chemin commençant par '/' est renvoyé tel quel.
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:132
---@param basePath string Chemin du fichier de référence.
---@param relativePath string|nil Chemin à résoudre.
---@return string|nil  Chemin résolu, nil si relativePath est nil ou dossier introuvable.
function gameplay_freeformDelivery_utils.resolvePath(basePath, relativePath) end

--- Met à jour la position en cache d'un véhicule (sans allocation) et la marque valide.
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:22
---@param veh table Objet véhicule (getID, getPositionXYZ).
function gameplay_freeformDelivery_utils.updateVehicleCache(veh) end

--- Met à jour le cache pour chaque véhicule d'une liste.
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:37
---@param vehicles table[] Liste d'objets véhicule.
function gameplay_freeformDelivery_utils.updateVehicleCacheList(vehicles) end

