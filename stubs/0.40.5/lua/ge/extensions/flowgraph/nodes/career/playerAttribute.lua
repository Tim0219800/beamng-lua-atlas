---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/playerAttribute.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_career_playerAttribute_C
local flowgraph_nodes_career_playerAttribute_C = {}

--- Appelle onNodeReset au démarrage du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/playerAttribute.lua:30
function flowgraph_nodes_career_playerAttribute_C:_executionStarted() end

--- Remet le drapeau d'application à faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/playerAttribute.lua:26
function flowgraph_nodes_career_playerAttribute_C:onNodeReset() end

--- Si carrière active et pas encore appliqué, ajoute amount (signé selon add) à l'attribut et marque appliqué ; réinitialise si le pin reset est actif.
---Source : lua/ge/extensions/flowgraph/nodes/career/playerAttribute.lua:34
function flowgraph_nodes_career_playerAttribute_C:work() end

