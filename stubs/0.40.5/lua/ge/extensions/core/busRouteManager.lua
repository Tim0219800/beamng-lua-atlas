---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/busRouteManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE (core_busRouteManager) qui gère les lignes de bus d'un niveau. Au chargement de l'extension et au démarrage d'un niveau (init), elle lit les fichiers *.buslines.json du dossier du niveau (/buslines/), vérifie que les arrêts cités existent comme triggers BeamNGTrigger de type 'busstop' dans le groupe 'busstops', et remplace les noms d'arrêts par leurs données de position. Elle relaie ensuite les évènements des triggers vers le contrôleur du bus (côté véhicule) et vers le scénario scenario_busdriver.
--- Accès : extension `core_busRouteManager` : `extensions.load("core_busRouteManager")`, puis la globale `core_busRouteManager`
---@class core_busRouteManager
core_busRouteManager = {}

--- Appelée à l'entrée d'un bus dans un arrêt : envoie bus_onAtStop au véhicule data.subjectID.
---Source : lua/ge/extensions/core/busRouteManager.lua:96
---@param data table Données du trigger (subjectID, type, event…)
function core_busRouteManager.onAtStop(data) end

--- Hook appelé par le moteur pour chaque évènement de trigger. Ne traite que type == 'busstop' : 'enter' -> onAtStop, 'exit' -> bus_onDepartedStop, 'tick' -> bus_onTriggerTick envoyés au véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/busRouteManager.lua:107
---@param data table {type, event ('enter'|'exit'|'tick'), subjectID, …}
function core_busRouteManager.onBeamNGTrigger(data) end

--- Hook de mise à jour du bus : transmet l'état à scenario_busdriver.onBusUpdate si ce scénario est chargé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/busRouteManager.lua:119
---@param state table État du bus (déduit du code : contient notamment pos)
function core_busRouteManager.onBusUpdate(state) end

--- Hook appelé au démarrage d'un niveau : (ré)initialise busLines et recharge les fichiers de lignes du niveau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/busRouteManager.lua:73
function core_busRouteManager.onClientStartMission() end

--- Hook appelé au chargement de l'extension : même fonction init que onClientStartMission.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/busRouteManager.lua:73
function core_busRouteManager.onExtensionLoaded() end

--- Cherche la route dont routeID et variance correspondent. Si vehId est donné, envoie les infos de la ligne au véhicule (commande bus_setLineInfo). Renvoie la route trouvée ou nil (avec log d'erreur).
---Source : lua/ge/extensions/core/busRouteManager.lua:83
---@param vehId integer|nil ID du véhicule bus à configurer (getObjectByID), nil pour seulement chercher
---@param routeID any Identifiant de la ligne (comparé avec ==)
---@param variance any Variante de la ligne (ex. 'a')
---@return table|nil  Table de la route (avec tasklist transformée), nil si non trouvée
function core_busRouteManager.setLine(vehId, routeID, variance) end

