---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/removePrefab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_removePrefab_C
local flowgraph_nodes_scene_removePrefab_C = {}

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/removePrefab.lua:24
function flowgraph_nodes_scene_removePrefab_C:_executionStopped() end

--- Appelle deletePrefab(id, true) du module prefab à chaque exécution avec flow.
---Source : lua/ge/extensions/flowgraph/nodes/scene/removePrefab.lua:20
function flowgraph_nodes_scene_removePrefab_C:work() end

