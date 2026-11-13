---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/groundmarkers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_groundmarkers_C
local flowgraph_nodes_gameplay_groundmarkers_C = {}

--- Oublie la dernière cible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/groundmarkers.lua:134
function flowgraph_nodes_gameplay_groundmarkers_C:_executionStarted() end

--- Appelle core_groundMarkers.resetAll().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/groundmarkers.lua:128
function flowgraph_nodes_gameplay_groundmarkers_C:_executionStopped() end

--- Compare la cible du pin à la précédente (types, longueur, valeurs numériques avec le seuil threshold, chaînes).
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/groundmarkers.lua:47
---@return boolean  vrai si la cible a changé
function flowgraph_nodes_gameplay_groundmarkers_C:hasNewTarget() end

--- Définit data.fadeStart et data.fadeEnd.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/groundmarkers.lua:34
---@param mgr table Gestionnaire du flowgraph
---@param ... any
function flowgraph_nodes_gameplay_groundmarkers_C:init(mgr, ...) end

--- Gère clear (resetAll) puis, si flow et target sont présents et la cible a changé, appelle core_groundMarkers.setPath(target, options).
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/groundmarkers.lua:98
---@param args table Arguments du flowgraph
function flowgraph_nodes_gameplay_groundmarkers_C:work(args) end

