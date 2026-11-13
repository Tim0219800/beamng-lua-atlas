---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module flowgraph (moduleOrder 1, après missionReplayModule) qui enregistre ou rejoue le parcours IA (script AI) du véhicule joueur pour les missions. Il n'est actif que si l'argument de ligne de commande enableAiRecordingForMissions vaut true, ou si la mission a startingOptions.aiPath. À l'arrêt de l'enregistrement, le véhicule renvoie son tracé via le hook onVehicleSubmitRecordingForMission et le module écrit un fichier recording_<date>.missionTestData.json dans <dossier de mission>/tests/.
--- Accès : `require("extensions/flowgraph/modules/aiRecordingModule")` (fichier sous extensions/ mais pas une extension classique)
---@class flowgraph_modules_aiRecordingModule
flowgraph_modules_aiRecordingModule = {}

--- Appelé au démarrage du projet : active le module si parseArgs.args.enableAiRecordingForMissions est true ou si la mission a startingOptions.aiPath. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
function flowgraph_modules_aiRecordingModule.executionStarted() end

--- Appelé à l'arrêt du projet : appelle stopAiRecording() sans arguments. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
function flowgraph_modules_aiRecordingModule.executionStopped() end

--- Renvoie la table des états par id de véhicule (valeur 'recording' ou nil). (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
---@return table<integer, string>  états des véhicules
function flowgraph_modules_aiRecordingModule.getVehicleStates() end

--- Appelé à la création du module (vide). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
function flowgraph_modules_aiRecordingModule.init() end

--- Indique si le module est actif. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
---@return boolean  valeur du flag enabled
function flowgraph_modules_aiRecordingModule.isRecordingScriptAi() end

--- Hook appelé via extensions.hook depuis le véhicule quand l'enregistrement IA est terminé. Écrit le fichier missionTestData.json dans le dossier tests de la mission. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
---@param vehId integer id du véhicule
---@param aiPath table tracé IA (champ path = liste de points avec t)
function flowgraph_modules_aiRecordingModule.onVehicleSubmitRecordingForMission(vehId, aiPath) end

--- Force l'activation ou la désactivation du module. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
---@param newEnabled boolean nouvel état
function flowgraph_modules_aiRecordingModule.setenabled(newEnabled) end

--- Si actif, marque le véhicule joueur comme 'recording' et lui envoie ai.startRecording(). (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
function flowgraph_modules_aiRecordingModule.startAiRecording() end

--- Si actif et que la mission a startingOptions.aiPath, lance ai.startFollowing avec ce tracé (mode 'noReset') sur le véhicule joueur. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
function flowgraph_modules_aiRecordingModule.startAiReplay() end

--- Mémorise attempt et totalChange puis, si le module est actif et que le véhicule joueur est en état 'recording', demande au véhicule d'arrêter l'enregistrement (ai.stopRecording()) et de renvoyer le résultat via le hook onVehicleSubmitRecordingForMission. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
---@param attempt table|nil tentative de mission (champs data, unlockedStars) (déduit du code)
---@param totalChange table|nil changements totaux de progression (champ unlockedStarsAttempt) (déduit du code)
function flowgraph_modules_aiRecordingModule.stopAiRecording(attempt, totalChange) end

--- Si actif et que la mission a un aiPath, envoie 'ai:scriptStop(false, false)' au véhicule joueur. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
function flowgraph_modules_aiRecordingModule.stopAiReplay() end

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua
---@class flowgraph_modules_aiRecordingModule_C
local flowgraph_modules_aiRecordingModule_C = {}

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:18
function flowgraph_modules_aiRecordingModule_C:executionStarted() end

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:14
function flowgraph_modules_aiRecordingModule_C:executionStopped() end

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:117
function flowgraph_modules_aiRecordingModule_C:getVehicleStates() end

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:11
function flowgraph_modules_aiRecordingModule_C:init() end

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:113
function flowgraph_modules_aiRecordingModule_C:isRecordingScriptAi() end

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:57
---@param vehId any
---@param aiPath any
function flowgraph_modules_aiRecordingModule_C:onVehicleSubmitRecordingForMission(vehId, aiPath) end

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:109
---@param newEnabled any
function flowgraph_modules_aiRecordingModule_C:setenabled(newEnabled) end

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:87
function flowgraph_modules_aiRecordingModule_C:startAiRecording() end

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:97
function flowgraph_modules_aiRecordingModule_C:startAiReplay() end

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:30
---@param attempt any
---@param totalChange any
function flowgraph_modules_aiRecordingModule_C:stopAiRecording(attempt, totalChange) end

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:45
function flowgraph_modules_aiRecordingModule_C:stopAiReplay() end

