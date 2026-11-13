---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/setTimeOfDay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_environment_setTimeOfDay_C
local flowgraph_nodes_environment_setTimeOfDay_C = {}

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setTimeOfDay.lua:43
function flowgraph_nodes_environment_setTimeOfDay_C:_executionStarted() end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setTimeOfDay.lua:46
function flowgraph_nodes_environment_setTimeOfDay_C:_executionStopped() end

--- Définit data.restoreTod = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setTimeOfDay.lua:23
---@param mgr table Gestionnaire du flowgraph
function flowgraph_nodes_environment_setTimeOfDay_C:init(mgr) end

--- Configure le pin time (curseur 0 à 1, modèles Midday/Evening/Midnight/Morning).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setTimeOfDay.lua:27
function flowgraph_nodes_environment_setTimeOfDay_C:postInit() end

--- Marque todChanged puis appelle core_environment.setTimeOfDay({time, play, dayLength}).
---Source : lua/ge/extensions/flowgraph/nodes/environment/setTimeOfDay.lua:63
function flowgraph_nodes_environment_setTimeOfDay_C:setTimeOfDay() end

--- En mode repeat, applique l'heure à chaque frame.
---Source : lua/ge/extensions/flowgraph/nodes/environment/setTimeOfDay.lua:57
function flowgraph_nodes_environment_setTimeOfDay_C:work() end

--- Applique l'heure une fois.
---Source : lua/ge/extensions/flowgraph/nodes/environment/setTimeOfDay.lua:53
function flowgraph_nodes_environment_setTimeOfDay_C:workOnce() end

