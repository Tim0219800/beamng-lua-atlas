---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/distanceBetween.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_distanceBetween_C
local flowgraph_nodes_util_distanceBetween_C = {}

--- Renvoie une position : pour un number, la position du véhicule (getObjectByID) ou vec3 nul si introuvable ; pour une table, un vec3 converti ; nil si l'entrée est vide.
---Source : lua/ge/extensions/flowgraph/nodes/util/distanceBetween.lua:36
---@param pinInput number|table|nil Id de véhicule ou position.
function flowgraph_nodes_util_distanceBetween_C:getPosition(pinInput) end

--- Résout les deux positions via getPosition et écrit la distance dans le pin distance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/distanceBetween.lua:24
function flowgraph_nodes_util_distanceBetween_C:work() end

