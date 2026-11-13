---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/onIntroPopupCareerClosed.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_career_onIntroPopupCareerClosed_C
local flowgraph_nodes_career_onIntroPopupCareerClosed_C = {}

--- Efface les drapeaux après le déclenchement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onIntroPopupCareerClosed.lua:44
function flowgraph_nodes_career_onIntroPopupCareerClosed_C:_afterTrigger() end

--- Crée la table de drapeaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onIntroPopupCareerClosed.lua:22
function flowgraph_nodes_career_onIntroPopupCareerClosed_C:init() end

--- Hook : lève closed et mémorise l'id de la fenêtre si fourni.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onIntroPopupCareerClosed.lua:36
---@param id any id de la fenêtre fermée
function flowgraph_nodes_career_onIntroPopupCareerClosed_C:onIntroPopupCareerClosed(id) end

--- Chaque frame : closed à faux et id à nil, puis applique et efface les drapeaux.
---Source : lua/ge/extensions/flowgraph/nodes/career/onIntroPopupCareerClosed.lua:27
---@param args any non utilisé
function flowgraph_nodes_career_onIntroPopupCareerClosed_C:work(args) end

