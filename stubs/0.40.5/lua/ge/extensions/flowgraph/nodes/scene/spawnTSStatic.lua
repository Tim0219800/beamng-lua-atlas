---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_spawnTSStatic_C
local flowgraph_nodes_scene_spawnTSStatic_C = {}

--- Appelle onNodeReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua:100
function flowgraph_nodes_scene_spawnTSStatic_C:_executionStopped() end

--- Crée le TSStatic (canSave = false), l'enregistre sous spawnedObj_<time>_<id>_<n>, écrit lastId et notifie l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua:41
---@param objectName any non utilisé
function flowgraph_nodes_scene_spawnTSStatic_C:createObject(objectName) end

--- Appelé à la destruction du noeud : nettoie les objets créés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua:136
function flowgraph_nodes_scene_spawnTSStatic_C:destroy() end

--- Initialise la liste d'objets et data.maxObjectCount = 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua:35
---@param mgr any gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_scene_spawnTSStatic_C:init(mgr, ...) end

--- Hook de fin de mission : nettoie les objets créés par le noeud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua:132
function flowgraph_nodes_scene_spawnTSStatic_C:onClientEndMission() end

--- Supprime tous les objets créés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua:104
function flowgraph_nodes_scene_spawnTSStatic_C:onNodeReset() end

--- Retombe created à false à la frame suivante.
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua:121
function flowgraph_nodes_scene_spawnTSStatic_C:work() end

--- Crée l'objet et lève created.
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua:116
function flowgraph_nodes_scene_spawnTSStatic_C:workOnce() end

