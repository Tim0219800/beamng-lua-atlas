---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/actionModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module flowgraph (moduleOrder 0) qui bloque ou autorise des actions d'entrée (input actions) pendant l'exécution d'un projet flowgraph. Il garde un ensemble d'actions bloquées et, dans afterTrigger, pousse la liste vers core_input_actionFilter sous le groupe 'fg_filter_<id du manager>'. Il mémorise aussi l'état d'autorisation du mode marche (gameplay_walk) au démarrage pour le restaurer à l'arrêt.
--- Accès : `require("extensions/flowgraph/modules/actionModule")` (fichier sous extensions/ mais pas une extension classique)
---@class flowgraph_modules_actionModule
flowgraph_modules_actionModule = {}

--- Appelé par le manager après le tick du graphe. Si des changements ont eu lieu, recalcule la liste des actions bloquées et l'envoie à core_input_actionFilter (setGroup puis addAction(0, groupe, true)). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/actionModule.lua:dyn
function flowgraph_modules_actionModule.afterTrigger() end

--- Marque les actions de la liste enregistrée comme à autoriser de nouveau (appliqué dans afterTrigger). (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/actionModule.lua:dyn
---@param id integer identifiant renvoyé par registerList
function flowgraph_modules_actionModule.allowActions(id) end

--- Marque les actions de la liste enregistrée comme à bloquer (appliqué dans afterTrigger). (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/actionModule.lua:dyn
---@param id integer identifiant renvoyé par registerList
function flowgraph_modules_actionModule.blockActions(id) end

--- Réinitialise les tables storedActions, actionsByName, addActions, removeActions et lists. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/actionModule.lua:dyn
function flowgraph_modules_actionModule.clear() end

--- Appelé au démarrage du projet : mémorise gameplay_walk.isTogglingEnabled(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/actionModule.lua:dyn
function flowgraph_modules_actionModule.executionStarted() end

--- Appelé à l'arrêt du projet : désactive le groupe de filtre et restaure la permission de basculer en mode marche mémorisée au démarrage. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/actionModule.lua:dyn
function flowgraph_modules_actionModule.executionStopped() end

--- Incrémente et renvoie un identifiant unique pour enregistrer une liste d'actions. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/actionModule.lua:dyn
---@return integer  nouvel identifiant
function flowgraph_modules_actionModule.getFreeId() end

--- Appelé à la création du module : appelle clear(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/actionModule.lua:dyn
function flowgraph_modules_actionModule.init() end

--- Enregistre une liste de noms d'actions et renvoie son identifiant, utilisable ensuite avec blockActions/allowActions. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/actionModule.lua:dyn
---@param list string[] noms d'actions d'entrée
---@return integer  identifiant de la liste
function flowgraph_modules_actionModule.registerList(list) end

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/actionModule.lua
---@class flowgraph_modules_actionModule_C
local flowgraph_modules_actionModule_C = {}

---Source : lua/ge/extensions/flowgraph/modules/actionModule.lua:44
function flowgraph_modules_actionModule_C:afterTrigger() end

---Source : lua/ge/extensions/flowgraph/modules/actionModule.lua:37
---@param id any
function flowgraph_modules_actionModule_C:allowActions(id) end

---Source : lua/ge/extensions/flowgraph/modules/actionModule.lua:30
---@param id any
function flowgraph_modules_actionModule_C:blockActions(id) end

---Source : lua/ge/extensions/flowgraph/modules/actionModule.lua:16
function flowgraph_modules_actionModule_C:clear() end

---Source : lua/ge/extensions/flowgraph/modules/actionModule.lua:71
function flowgraph_modules_actionModule_C:executionStarted() end

---Source : lua/ge/extensions/flowgraph/modules/actionModule.lua:62
function flowgraph_modules_actionModule_C:executionStopped() end

---Source : lua/ge/extensions/flowgraph/modules/actionModule.lua:7
function flowgraph_modules_actionModule_C:getFreeId() end

---Source : lua/ge/extensions/flowgraph/modules/actionModule.lua:12
function flowgraph_modules_actionModule_C:init() end

---Source : lua/ge/extensions/flowgraph/modules/actionModule.lua:24
---@param list any
function flowgraph_modules_actionModule_C:registerList(list) end

