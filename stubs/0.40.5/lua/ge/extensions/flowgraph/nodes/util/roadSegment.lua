---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/roadSegment.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_roadSegment_C
local flowgraph_nodes_util_roadSegment_C = {}

--- Réinitialise le cache des deux noms.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/roadSegment.lua:38
function flowgraph_nodes_util_roadSegment_C:_executionStarted() end

--- Réinitialise le cache des deux noms.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/roadSegment.lua:34
function flowgraph_nodes_util_roadSegment_C:init() end

--- Si les deux nœuds existent dans map.getMap().nodes, recalcule (quand la paire change) longueur, drivabilité, limite de vitesse, sens unique, route privée, nombre de voies (comptage des « - » et « + » de link.lanes, « -+ » par défaut) et direction ; recalcule toujours la largeur (2 × rayon interpolé selon xnorm).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/roadSegment.lua:42
function flowgraph_nodes_util_roadSegment_C:work() end

