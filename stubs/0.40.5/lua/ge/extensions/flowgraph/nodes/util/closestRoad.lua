---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/closestRoad.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_closestRoad_C
local flowgraph_nodes_util_closestRoad_C = {}

--- Oublie la dernière position (oldPos=nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/closestRoad.lua:37
function flowgraph_nodes_util_closestRoad_C:_executionStarted() end

--- Pour un nom de nœud composé « DecalRoad<id>_<index> », renvoie l'id de la DecalRoad et l'index du point ; renvoie -1,-1 si un objet de ce nom existe dans scenetree ; nil sinon.
---Source : lua/ge/extensions/flowgraph/nodes/util/closestRoad.lua:41
---@param name string Nom de nœud du navgraph.
function flowgraph_nodes_util_closestRoad_C:findDecalroad(name) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/closestRoad.lua:34
---@param mgr any
function flowgraph_nodes_util_closestRoad_C:init(mgr) end

--- Si pos a changé, cherche la route la plus proche, ordonne les nœuds selon la proximité, remplit les pins (positions, ids de DecalRoad, distance, point projeté, largeur = 2 × rayon interpolé) et exists. Met exists à false si rien n'est trouvé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/closestRoad.lua:66
function flowgraph_nodes_util_closestRoad_C:work() end

