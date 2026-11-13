---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/pointOnDecalroad.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_pointOnDecalroad_C
local flowgraph_nodes_scene_pointOnDecalroad_C = {}

--- Reinitialise le cache de la route et vide les sorties.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/pointOnDecalroad.lua:33
function flowgraph_nodes_scene_pointOnDecalroad_C:_executionStarted() end

--- Initialise point a (0,0,0) et pz a 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/pointOnDecalroad.lua:28
function flowgraph_nodes_scene_pointOnDecalroad_C:init() end

--- Recharge la route si roadId change, puis calcule closestIdx, onRoad, inside et outside.
---Source : lua/ge/extensions/flowgraph/nodes/scene/pointOnDecalroad.lua:41
function flowgraph_nodes_scene_pointOnDecalroad_C:work() end

