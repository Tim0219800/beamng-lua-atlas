---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicleBridge.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_vehicleBridge` : pont de communication entre le Lua GE et le Lua du véhicule (vlua). Envoie des commandes à `extensions.gameplayInterface` côté véhicule pour lire une valeur (requestValue), exécuter une action (executeAction) ou s'abonner aux changements d'une clé électrique (registerValueChangeNotification), et reçoit les réponses via callbackFromVlua. Les valeurs reçues par abonnement sont mises en cache dans `vehicleData[vehId].data`.
--- Accès : extension `core_vehicleBridge` : `extensions.load("core_vehicleBridge")`, puis la globale `core_vehicleBridge`
---@class core_vehicleBridge
---@field logCommand function Fonction appelée avant chaque envoi (log détaillé) ; `nop` par défaut, logCommandFunction si setLogCommands(true).
---@field vehicleData table<integer, {data: table, registeredCallbacks: table<string, integer>}> [vehId] = {data = dernières valeurs reçues par clé, registeredCallbacks = [clé] = idCallback}. Vidé pour un véhicule détruit ou remplacé.
core_vehicleBridge = {}

--- Appelée depuis le Lua du véhicule avec la réponse à une requête ou une notification. Décode les données, met à jour le cache (id -2) ou appelle la fonction de rappel enregistrée puis l'oublie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleBridge.lua:37
---@param vehId integer véhicule émetteur
---@param callbackId integer identifiant du callback, ou -2 pour une notification de changement de valeur
---@param data string données encodées par lpack
function core_vehicleBridge.callbackFromVlua(vehId, callbackId, data) end

--- Exécute une action côté véhicule (extensions.gameplayInterface.executeAction). Vérifie que veh existe et possède queueLuaCommand.
---Source : lua/ge/extensions/core/vehicleBridge.lua:119
---@param veh userdata véhicule cible
---@param ... any arguments (nom de l'action et paramètres), sérialisés
function core_vehicleBridge.executeAction(veh, ...) end

--- Lit une valeur mise en cache par une notification de changement.
---Source : lua/ge/extensions/core/vehicleBridge.lua:143
---@param vehId integer identifiant du véhicule
---@param key string clé
---@return any  dernière valeur reçue, nil si inconnue
function core_vehicleBridge.getCachedVehicleData(vehId, key) end

--- Logue (niveau D) la commande envoyée à un véhicule.
---Source : lua/ge/extensions/core/vehicleBridge.lua:14
---@param veh userdata véhicule destinataire
---@param id integer identifiant de callback
---@param command any commande (chaîne ou buffer)
function core_vehicleBridge.logCommandFunction(veh, id, command) end

--- Hook : un véhicule est détruit ; efface son cache et ses abonnements.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleBridge.lua:154
---@param id integer identifiant du véhicule
function core_vehicleBridge.onVehicleDestroyed(id) end

--- Hook (émis par core_vehicles.replaceVehicle) : le véhicule a été remplacé ; efface son cache et ses abonnements (le nouveau Lua véhicule doit se réabonner).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleBridge.lua:155
---@param id integer identifiant du véhicule
function core_vehicleBridge.onVehicleReplaced(id) end

--- Abonne GE aux changements d'une clé électrique du véhicule : à chaque changement, la valeur est mise à jour dans vehicleData[vehId].data[clé]. Sans effet si déjà abonné à cette clé.
---Source : lua/ge/extensions/core/vehicleBridge.lua:73
---@param veh userdata véhicule
---@param electricsKey string clé de la table electrics
function core_vehicleBridge.registerValueChangeNotification(veh, electricsKey) end

--- Demande une valeur au véhicule (extensions.gameplayInterface.getSystemData côté véhicule). La fonction de rappel reçoit les données décodées de manière asynchrone (au plus tôt à la frame suivante).
---Source : lua/ge/extensions/core/vehicleBridge.lua:53
---@param veh userdata véhicule interrogé (log d'erreur si nil)
---@param callback function fonction(data) appelée avec la réponse
---@param ... any arguments supplémentaires, sérialisés et transmis à getSystemData
function core_vehicleBridge.requestValue(veh, callback, ...) end

--- Active ou désactive le log de toutes les commandes envoyées aux véhicules.
---Source : lua/ge/extensions/core/vehicleBridge.lua:18
---@param enabled boolean true pour activer
function core_vehicleBridge.setLogCommands(enabled) end

--- Annule l'abonnement créé par registerValueChangeNotification (sans effet s'il n'existe pas).
---Source : lua/ge/extensions/core/vehicleBridge.lua:98
---@param veh userdata véhicule
---@param electricsKey string clé de la table electrics
function core_vehicleBridge.unregisterValueChangeNotification(veh, electricsKey) end

