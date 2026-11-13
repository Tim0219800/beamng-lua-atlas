---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/getPointOnDecalroad.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_getPointOnDecalroad_C
local flowgraph_nodes_scene_getPointOnDecalroad_C = {}

--- Reinitialise le cache (oldRoadId, oldIdx, roadObj) et vide les pins de sortie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/getPointOnDecalroad.lua:28
function flowgraph_nodes_scene_getPointOnDecalroad_C:_executionStarted() end

--- Rien a initialiser.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/getPointOnDecalroad.lua:24
function flowgraph_nodes_scene_getPointOnDecalroad_C:init() end

--- Cherche la route, calcule pos ({x,y,z} du noeud idx) et rot (quatFromDir de la direction suivant->precedent, vecteur haut Z).
---Source : lua/ge/extensions/flowgraph/nodes/scene/getPointOnDecalroad.lua:37
function flowgraph_nodes_scene_getPointOnDecalroad_C:work() end

