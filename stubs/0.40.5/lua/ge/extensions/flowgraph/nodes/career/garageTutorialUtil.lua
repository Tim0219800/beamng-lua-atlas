---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/garageTutorialUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_career_garageTutorialUtil_C
local flowgraph_nodes_career_garageTutorialUtil_C = {}

--- Minuteur à 0 au démarrage du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/garageTutorialUtil.lua:24
function flowgraph_nodes_career_garageTutorialUtil_C:_executionStarted() end

--- Minuteur à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/garageTutorialUtil.lua:20
function flowgraph_nodes_career_garageTutorialUtil_C:init() end

--- Chaque frame : calcule parkedInGarage et isRepaired ; chaque seconde, appelle career_modules_inventory.updatePartConditions pour le véhicule du joueur s'il ne marche pas.
---Source : lua/ge/extensions/flowgraph/nodes/career/garageTutorialUtil.lua:28
---@param args any non utilisé
function flowgraph_nodes_career_garageTutorialUtil_C:work(args) end

