---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/levelModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module flowgraph (moduleOrder 100) qui synchronise les actions d'un projet avec le chargement d'un niveau. Il permet de différer une fonction jusqu'à la fin du chargement (delayOrInstantFunction) et de recharger la collision (be:reloadCollision) après le chargement d'un niveau ou à la fin du tick quand un prefab est chargé.
--- Accès : `require("extensions/flowgraph/modules/levelModule")` (fichier sous extensions/ mais pas une extension classique)
---@class flowgraph_modules_levelModule
flowgraph_modules_levelModule = {}

--- Appelé après le tick du graphe : si reloadCollisionOnAfterTrigger est vrai, appelle be:reloadCollision(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:dyn
function flowgraph_modules_levelModule.afterTrigger() end

--- Prévu pour signaler le début d'un chargement de niveau (corps vide). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:dyn
function flowgraph_modules_levelModule.beginLoadingLevel() end

--- Vide les tables et remet les drapeaux reloadCollisionOnLevelLoading / reloadCollisionOnAfterTrigger à false. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:dyn
function flowgraph_modules_levelModule.clear() end

--- Exécute fun tout de suite si aucun niveau n'est en chargement, sinon la met en file jusqu'à finishedLevelLoading. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:dyn
---@param fun function fonction sans argument
function flowgraph_modules_levelModule.delayOrInstantFunction(fun) end

--- Appelé à l'arrêt du projet : appelle clear(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:dyn
function flowgraph_modules_levelModule.executionStopped() end

--- À appeler à la fin du chargement du niveau : recharge la collision si demandé, exécute puis vide les fonctions différées. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:dyn
function flowgraph_modules_levelModule.finishedLevelLoading() end

--- Crée les tables funs, uniqueFuns et prefabs, initialise les drapeaux de rechargement de collision puis appelle clear(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:dyn
function flowgraph_modules_levelModule.init() end

--- Signale qu'un prefab a été chargé : demande un rechargement de collision (à la fin du chargement du niveau si en cours, sinon après le tick) et mémorise l'id. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:dyn
---@param id integer id de l'objet prefab
function flowgraph_modules_levelModule.prefabLoaded(id) end

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/levelModule.lua
---@class flowgraph_modules_levelModule_C
local flowgraph_modules_levelModule_C = {}

---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:41
function flowgraph_modules_levelModule_C:afterTrigger() end

---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:25
function flowgraph_modules_levelModule_C:beginLoadingLevel() end

---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:16
function flowgraph_modules_levelModule_C:clear() end

--- this function will delay another function until finishedLevelLoading is called, or will call it instantly if not level is being loaded.
---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:49
---@param fun any
function flowgraph_modules_levelModule_C:delayOrInstantFunction(fun) end

---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:66
function flowgraph_modules_levelModule_C:executionStopped() end

---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:29
function flowgraph_modules_levelModule_C:finishedLevelLoading() end

---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:7
function flowgraph_modules_levelModule_C:init() end

---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:57
---@param id any
function flowgraph_modules_levelModule_C:prefabLoaded(id) end

