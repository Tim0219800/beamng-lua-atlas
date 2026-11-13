---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/foreachModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module flowgraph (moduleOrder 1000, donc exécuté en dernier) réservé aux graphes enfants créés par une boucle foreach. Il ne contient que les champs parentGraphId, key et value, que le nœud foreach renseigne pour l'enfant. Toutes ses méthodes d'exécution sont vides.
--- Accès : `require("extensions/flowgraph/modules/foreachModule")` (fichier sous extensions/ mais pas une extension classique)
---@class flowgraph_modules_foreachModule
flowgraph_modules_foreachModule = {}

--- Appelé après le tick du graphe (ne fait rien). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/foreachModule.lua:dyn
function flowgraph_modules_foreachModule.afterTrigger() end

--- Remet parentGraphId, key et value à nil. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/foreachModule.lua:dyn
function flowgraph_modules_foreachModule.clear() end

--- Appelé au démarrage du projet (ne fait rien). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/foreachModule.lua:dyn
function flowgraph_modules_foreachModule.executionStarted() end

--- Appelé à l'arrêt du projet (ne fait rien). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/foreachModule.lua:dyn
function flowgraph_modules_foreachModule.executionStopped() end

--- Appelé à la création du module : appelle clear(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/foreachModule.lua:dyn
function flowgraph_modules_foreachModule.init() end

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/foreachModule.lua
---@class flowgraph_modules_foreachModule_C
local flowgraph_modules_foreachModule_C = {}

---Source : lua/ge/extensions/flowgraph/modules/foreachModule.lua:18
function flowgraph_modules_foreachModule_C:afterTrigger() end

---Source : lua/ge/extensions/flowgraph/modules/foreachModule.lua:11
function flowgraph_modules_foreachModule_C:clear() end

---Source : lua/ge/extensions/flowgraph/modules/foreachModule.lua:26
function flowgraph_modules_foreachModule_C:executionStarted() end

---Source : lua/ge/extensions/flowgraph/modules/foreachModule.lua:22
function flowgraph_modules_foreachModule_C:executionStopped() end

---Source : lua/ge/extensions/flowgraph/modules/foreachModule.lua:7
function flowgraph_modules_foreachModule_C:init() end

