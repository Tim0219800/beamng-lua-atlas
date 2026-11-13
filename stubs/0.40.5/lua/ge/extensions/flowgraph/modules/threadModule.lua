---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/threadModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module flowgraph (moduleOrder 1000) qui permet à un projet flowgraph d'en lancer d'autres (projets enfants) et d'échanger des messages avec eux. Les messages reçus sont mis en file puis distribués au début de la mise à jour suivante (hook onFlowgraphManagerPreUpdate) aux nœuds via broadcastCall. À l'arrêt, tous les enfants lancés sont arrêtés et retirés.
--- Accès : `require("extensions/flowgraph/modules/threadModule")` (fichier sous extensions/ mais pas une extension classique)
---@class flowgraph_modules_threadModule
flowgraph_modules_threadModule = {}

--- Appelé après le tick du graphe (ne fait rien). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/threadModule.lua:dyn
function flowgraph_modules_threadModule.afterTrigger() end

--- Vide les enfants et les messages, remet parentId = -1. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/threadModule.lua:dyn
function flowgraph_modules_threadModule.clear() end

--- Appelé au démarrage du projet (ne fait rien). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/threadModule.lua:dyn
function flowgraph_modules_threadModule.executionStarted() end

--- Appelé à l'arrêt du projet : arrête immédiatement chaque enfant, les retire à la frame suivante, puis appelle clear(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/threadModule.lua:dyn
function flowgraph_modules_threadModule.executionStopped() end

--- Appelé à la création du module : appelle clear(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/threadModule.lua:dyn
function flowgraph_modules_threadModule.init() end

--- Hook appelé avant la mise à jour des managers : diffuse puis vide la file de messages reçus. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/threadModule.lua:dyn
function flowgraph_modules_threadModule.onFlowgraphManagerPreUpdate() end

--- Ajoute un message à la file de réception et le journalise. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/threadModule.lua:dyn
---@param message table message
---@param sourceId integer id du manager émetteur
function flowgraph_modules_threadModule.receiveMessage(message, sourceId) end

--- Envoie un message au manager cible (ou au parent si targetId vaut -1). Journalise l'envoi. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/threadModule.lua:dyn
---@param targetId integer id du manager flowgraph cible, -1 pour le parent
---@param message table message (champs facultatifs name, hook, data)
---@param sourceNode table|nil nœud émetteur, pour le log
---@return boolean  true si la cible existe
function flowgraph_modules_threadModule.sendMessage(targetId, message, sourceNode) end

--- Charge un projet flowgraph depuis un fichier (core_flowgraphManager.loadManager), le démarre, l'enregistre comme enfant et lui donne ce manager comme parent. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/threadModule.lua:dyn
---@param file string chemin du projet
---@param sourceNode table|nil nœud à l'origine, pour le log
---@return integer  id du manager enfant
function flowgraph_modules_threadModule.startProjectFromFilepath(file, sourceNode) end

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/threadModule.lua
---@class flowgraph_modules_threadModule_C
local flowgraph_modules_threadModule_C = {}

---Source : lua/ge/extensions/flowgraph/modules/threadModule.lua:18
function flowgraph_modules_threadModule_C:afterTrigger() end

---Source : lua/ge/extensions/flowgraph/modules/threadModule.lua:12
function flowgraph_modules_threadModule_C:clear() end

---Source : lua/ge/extensions/flowgraph/modules/threadModule.lua:74
function flowgraph_modules_threadModule_C:executionStarted() end

---Source : lua/ge/extensions/flowgraph/modules/threadModule.lua:62
function flowgraph_modules_threadModule_C:executionStopped() end

---Source : lua/ge/extensions/flowgraph/modules/threadModule.lua:8
function flowgraph_modules_threadModule_C:init() end

---Source : lua/ge/extensions/flowgraph/modules/threadModule.lua:32
function flowgraph_modules_threadModule_C:onFlowgraphManagerPreUpdate() end

---Source : lua/ge/extensions/flowgraph/modules/threadModule.lua:43
---@param message any
---@param sourceId any
function flowgraph_modules_threadModule_C:receiveMessage(message, sourceId) end

---Source : lua/ge/extensions/flowgraph/modules/threadModule.lua:21
---@param targetId any
---@param message any
---@param sourceNode any
function flowgraph_modules_threadModule_C:sendMessage(targetId, message, sourceNode) end

---Source : lua/ge/extensions/flowgraph/modules/threadModule.lua:49
---@param file any
---@param sourceNode any
function flowgraph_modules_threadModule_C:startProjectFromFilepath(file, sourceNode) end

