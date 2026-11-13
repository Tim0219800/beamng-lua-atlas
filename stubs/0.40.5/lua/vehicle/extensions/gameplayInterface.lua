---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterface.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Passerelle générique entre le code gameplay (VM GE Lua, via core_vehicleBridge) ou d'autres extensions véhicule et le VM véhicule. Elle charge à l'init tous les modules du dossier gameplayInterfaceModules, leur fait déclarer leurs 'actions' (commandes sans retour direct) et leurs 'lookups' (lectures de données), puis exécute les requêtes numérotées et renvoie le résultat par un callback enregistré. Gère aussi les notifications de changement de valeur d'une clé d'electrics. Un moddeur l'utilise pour piloter un véhicule à distance ou pour ajouter son propre module (fichier gameplayInterfaceModules/<nom>.lua).
--- Accès : extension `gameplayInterface` : `extensions.load (VM véhicule)("gameplayInterface")`, puis la globale `gameplayInterface`
---@class gameplayInterface
gameplayInterface = {}

--- Callback de débogage (id 1) : affiche les données reçues via print/dump.
---Source : lua/vehicle/extensions/gameplayInterface.lua:18
---@param requestId integer Identifiant de requête.
---@param data any Données reçues.
function gameplayInterface.debugCallback(requestId, data) end

--- Exécute une action enregistrée par un module ; renvoie un résultat au callback seulement si l'action retourne une valeur (ex. {failReason}).
---Source : lua/vehicle/extensions/gameplayInterface.lua:102
---@param callbackId integer Callback qui recevra le résultat.
---@param id integer Identifiant de requête.
---@param action string Nom de l'action (ex. 'setIgnitionLevel').
---@param ... any Paramètres passés à l'action sous forme de table.
function gameplayInterface.executeAction(callbackId, id, action, ...) end

--- Exécute un lookup (lecture) enregistré par un module et envoie le résultat au callback. Si le système est inconnu ou les paramètres invalides, envoie {failReason}.
---Source : lua/vehicle/extensions/gameplayInterface.lua:70
---@param callbackId integer Callback qui recevra le résultat.
---@param id integer Identifiant de requête (renvoyé tel quel).
---@param system string Nom du lookup (ex. 'electricsValue').
---@param ... any Paramètres passés au lookup sous forme de table.
function gameplayInterface.getSystemData(callbackId, id, system, ...) end

--- Appelé au chargement de l'extension : parcourt lua/vehicle/extensions/gameplayInterfaceModules, charge chaque module, appelle requestRegistration(M) puis le décharge s'il n'était pas déjà chargé ; réinitialise la table des callbacks (id 0 = GE Lua, id 1 = debug).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterface.lua:195
function gameplayInterface.onExtensionLoaded() end

--- Hook d'initialisation du véhicule ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterface.lua:192
function gameplayInterface.onInit() end

--- Appelé au reset du véhicule : oublie la dernière valeur connue des notifications de changement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterface.lua:186
function gameplayInterface.onReset() end

--- Enregistre un callback de réponse et renvoie immédiatement son identifiant au demandeur (requête -1 avec {callbackId}).
---Source : lua/vehicle/extensions/gameplayInterface.lua:165
---@param vm string 'gelua' (callback = nom de fonction GE Lua sous forme de texte) ou 'vlua' (callback = fonction locale).
---@param callback string|function Nom de fonction GE ou fonction(requestId, data) selon vm.
function gameplayInterface.registerCallback(vm, callback) end

--- Enregistre un module : associe chaque nom d'action et de lookup au nom du module, avec détection des doublons. Appelé par module.requestRegistration(gi).
---Source : lua/vehicle/extensions/gameplayInterface.lua:171
---@param name string Nom du module (nom du fichier sans extension).
---@param actions table<string, function> Table moduleActions du module.
---@param lookups table<string, function> Table moduleLookups du module.
function gameplayInterface.registerModule(name, actions, lookups) end

--- Demande d'être notifié (via callbackId, id de requête -2, données {[clé] = valeur}) à chaque changement de electrics.values[electricsKey]. Confirme par {registerResult = true}.
---Source : lua/vehicle/extensions/gameplayInterface.lua:133
---@param callbackId integer Callback à appeler.
---@param id integer Identifiant de la requête d'inscription.
---@param electricsKey string Clé de electrics.values à surveiller.
function gameplayInterface.registerValueChangeNotification(callbackId, id, electricsKey) end

--- Déclenche manuellement une notification de changement enregistrée (par son index) avec des données quelconques : le callback reçoit {data, valueChangeNotificationId}.
---Source : lua/vehicle/extensions/gameplayInterface.lua:159
---@param valueChangeNotificationId integer Index dans la liste des notifications enregistrées.
---@param data any Données à transmettre.
function gameplayInterface.triggerValueChangeNotification(valueChangeNotificationId, data) end

--- Retire la première notification correspondant à (callbackId, electricsKey) ; arrête la surveillance quand il n'en reste plus.
---Source : lua/vehicle/extensions/gameplayInterface.lua:141
---@param callbackId integer Callback inscrit.
---@param electricsKey string Clé surveillée.
function gameplayInterface.unregisterValueChangeNotification(callbackId, electricsKey) end

--- Appelé chaque frame : exécute la vérification des notifications de changement de valeur si au moins une est enregistrée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterface.lua:60
---@param dt number Pas de temps en secondes.
function gameplayInterface.updateGFX(dt) end

