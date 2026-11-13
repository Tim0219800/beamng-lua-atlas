---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/odometer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-module de la livraison libre qui suit l'odomètre des véhicules marqués trackOdometer dans la définition de livraison. Il lit la valeur via core_vehicleBridge (getRootPartOdometer), calcule la distance parcourue depuis le départ, affiche un message dans la liste de tâches et fait échouer la livraison si la distance dépasse maxOdometer.
--- Accès : extension `gameplay_freeformDelivery_odometer` : `extensions.load("gameplay_freeformDelivery_odometer")`, puis la globale `gameplay_freeformDelivery_odometer`
---@class gameplay_freeformDelivery_odometer
---@field dependencies string[] core_vehicleBridge, gameplay_freeformDelivery_utils, gameplay_freeformDelivery_setup.
gameplay_freeformDelivery_odometer = {}

--- Vide le suivi et retire le message d'odomètre de la liste de tâches (DiscardTasklistItem).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:242
function gameplay_freeformDelivery_odometer.cleanup() end

--- Renvoie les données de suivi d'un véhicule.
---Source : lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:181
---@param vehId integer ID d'objet du véhicule dans le jeu.
---@return table|nil  {deliveryVehicleId, startingOdometer, currentOdometer, maxOdometer, requestPending} ou nil.
function gameplay_freeformDelivery_odometer.getOdometerData(vehId) end

--- Comme getOdometerData mais en cherchant par l'ID du véhicule dans la définition de livraison.
---Source : lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:186
---@param deliveryVehicleId string ID du véhicule dans la livraison (déduit du code).
---@return table|nil  Données de suivi ou nil.
function gameplay_freeformDelivery_odometer.getOdometerDataByDeliveryId(deliveryVehicleId) end

--- Indique si toutes les requêtes d'odomètre initiales ont reçu une réponse.
---Source : lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:130
---@return boolean  true quand aucune requête n'est en attente.
function gameplay_freeformDelivery_odometer.isSetupComplete() end

--- Réinitialise le suivi puis, pour chaque véhicule de delivery.vehicles ayant trackOdometer, demande l'odomètre de départ au véhicule. maxOdometer (optionnel) vient de la définition du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:92
---@param delivery table Données de livraison avec le tableau vehicles.
function gameplay_freeformDelivery_odometer.setup(delivery) end

--- Appelée chaque frame ; toutes les 1/8 s, redemande l'odomètre de chaque véhicule suivi et fait échouer la livraison si la distance parcourue dépasse maxOdometer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:135
---@param dtReal number Delta temps réel en secondes.
function gameplay_freeformDelivery_odometer.update(dtReal) end

--- Met à jour (ou retire) le message d'odomètre de la liste de tâches pour le véhicule du joueur. N'envoie SetTasklistTask que si le texte a changé.
---Source : lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:197
function gameplay_freeformDelivery_odometer.updateTasklistMessage() end

