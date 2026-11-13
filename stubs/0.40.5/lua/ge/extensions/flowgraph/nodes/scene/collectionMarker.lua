---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/collectionMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_collectionMarker_C
local flowgraph_nodes_scene_collectionMarker_C = {}

--- Appele a l'arret du graphe : supprime le marqueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/collectionMarker.lua:42
function flowgraph_nodes_scene_collectionMarker_C:_executionStopped() end

--- Appele a la destruction du noeud : supprime le marqueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/collectionMarker.lua:94
function flowgraph_nodes_scene_collectionMarker_C:destroy() end

--- Supprime l'objet marqueur et la lumiere et remet les references a nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/collectionMarker.lua:30
function flowgraph_nodes_scene_collectionMarker_C:hideMarker() end

--- Rien a initialiser.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/collectionMarker.lua:25
---@param mgr any gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_scene_collectionMarker_C:init(mgr, ...) end

--- Hook de fin de mission : supprime le marqueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/collectionMarker.lua:89
function flowgraph_nodes_scene_collectionMarker_C:onClientEndMission() end

--- Sur reset, appelle self:clearMarkers(). Sur flow, cree si besoin le TSStatic et la PointLight, puis met a jour position (avec oscillation verticale sinusoidale), rotation, couleur d'instance et lumiere (rayon 3).
---Source : lua/ge/extensions/flowgraph/nodes/scene/collectionMarker.lua:47
function flowgraph_nodes_scene_collectionMarker_C:work() end

