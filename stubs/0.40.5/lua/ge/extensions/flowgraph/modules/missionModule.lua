---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/missionModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module flowgraph (moduleOrder -100) qui lie un projet flowgraph à la mission qui l'a lancé (self.mgr.activity). Il gère les véhicules de mission (garder ou masquer le véhicule joueur et le trafic), prépare un véhicule (phares la nuit, conducteur factice), supprime le véhicule joueur mis de côté et relaie les évènements personnalisés vers la mission. À l'arrêt, il stoppe la mission si elle est en cours et émet onMissionFinished.
--- Accès : `require("extensions/flowgraph/modules/missionModule")` (fichier sous extensions/ mais pas une extension classique)
---@class flowgraph_modules_missionModule
flowgraph_modules_missionModule = {}

--- Remet processed à false. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/missionModule.lua:dyn
function flowgraph_modules_missionModule.clear() end

--- Appelé au démarrage du projet : déclenche l'évènement UI hotlappingReevaluateControlsEnabled et appelle clear(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/missionModule.lua:dyn
function flowgraph_modules_missionModule.executionStarted() end

--- Appelé à l'arrêt du projet : arrête la mission si elle est en cours (gameplay_missions_missionManager.stop), émet extensions.hook('onMissionFinished') et déclenche l'évènement UI hotlappingReevaluateControlsEnabled. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/missionModule.lua:dyn
function flowgraph_modules_missionModule.executionStopped() end

--- Renvoie l'id du véhicule joueur d'avant la mission (mission._startingInfo.vehId). (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/missionModule.lua:dyn
---@return integer|nil  id ou nil
function flowgraph_modules_missionModule.getOriginalPlayerId() end

--- Appelé à la création du module : appelle clear(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/missionModule.lua:dyn
function flowgraph_modules_missionModule.init() end

--- Appelle mission:onMissionCustomEvent(name, data) si la mission le définit, et journalise l'évènement. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/missionModule.lua:dyn
---@param name string nom de l'évènement
---@param data any données
function flowgraph_modules_missionModule.missionHook(name, data) end

--- Fonction vide. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/missionModule.lua:dyn
function flowgraph_modules_missionModule.onClear() end

--- Prépare un véhicule pour la mission : si l'heure du jeu est dans la fenêtre de nuit solaire, allume les phares (electrics.setLightsState(2)) ; si addDummyDriver et le réglage enableSeatOccupants, place un occupant factice au siège conducteur. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/missionModule.lua:dyn
---@param id integer|nil id du véhicule (défaut : véhicule joueur 0)
---@param addDummyDriver boolean|nil ajouter un conducteur factice
function flowgraph_modules_missionModule.prepareVehicle(id, addDummyDriver) end

--- Applique les options keepPlayer et keepTraffic de la mission : active ou désactive le véhicule joueur d'origine et met à jour mission.setupData.stashedVehicles, et dégèle le trafic via gameplay_traffic.unfreezeState si keepTraffic est vrai. Avertit si déjà appelé. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/missionModule.lua:dyn
---@param params table champs keepPlayer (boolean) et keepTraffic (boolean)
function flowgraph_modules_missionModule.processVehicles(params) end

--- Supprime définitivement le véhicule joueur mis de côté (il ne sera plus réactivé à la fin du projet). (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/missionModule.lua:dyn
function flowgraph_modules_missionModule.removeStashedPlayerVehicle() end

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/missionModule.lua
---@class flowgraph_modules_missionModule_C
local flowgraph_modules_missionModule_C = {}

---Source : lua/ge/extensions/flowgraph/modules/missionModule.lua:11
function flowgraph_modules_missionModule_C:clear() end

---Source : lua/ge/extensions/flowgraph/modules/missionModule.lua:127
function flowgraph_modules_missionModule_C:executionStarted() end

---Source : lua/ge/extensions/flowgraph/modules/missionModule.lua:114
function flowgraph_modules_missionModule_C:executionStopped() end

---Source : lua/ge/extensions/flowgraph/modules/missionModule.lua:87
function flowgraph_modules_missionModule_C:getOriginalPlayerId() end

---Source : lua/ge/extensions/flowgraph/modules/missionModule.lua:7
function flowgraph_modules_missionModule_C:init() end

---Source : lua/ge/extensions/flowgraph/modules/missionModule.lua:107
---@param name any
---@param data any
function flowgraph_modules_missionModule_C:missionHook(name, data) end

---Source : lua/ge/extensions/flowgraph/modules/missionModule.lua:124
function flowgraph_modules_missionModule_C:onClear() end

---Source : lua/ge/extensions/flowgraph/modules/missionModule.lua:63
---@param id any
---@param addDummyDriver any
function flowgraph_modules_missionModule_C:prepareVehicle(id, addDummyDriver) end

---Source : lua/ge/extensions/flowgraph/modules/missionModule.lua:15
---@param params any
function flowgraph_modules_missionModule_C:processVehicles(params) end

---Source : lua/ge/extensions/flowgraph/modules/missionModule.lua:93
function flowgraph_modules_missionModule_C:removeStashedPlayerVehicle() end

