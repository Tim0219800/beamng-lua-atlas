---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/customTowAction.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_career_customTowAction_C
local flowgraph_nodes_career_customTowAction_C = {}

--- Crée la table de drapeaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/customTowAction.lua:21
function flowgraph_nodes_career_customTowAction_C:init() end

--- Hook de carrière : lève le drapeau tow.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/customTowAction.lua:33
---@param poiId any id du point d'intérêt (non utilisé)
function flowgraph_nodes_career_customTowAction_C:onCareerCustomTowHook(poiId) end

--- Chaque frame : met tow à faux, applique les drapeaux reçus puis les efface.
---Source : lua/ge/extensions/flowgraph/nodes/career/customTowAction.lua:25
---@param args any non utilisé
function flowgraph_nodes_career_customTowAction_C:work(args) end

