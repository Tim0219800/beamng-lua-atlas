---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_spawnLight_C
local flowgraph_nodes_scene_spawnLight_C = {}

--- Supprime les lumières à l'arrêt.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua:76
function flowgraph_nodes_scene_spawnLight_C:_executionStopped() end

--- Supprime toutes les lumières créées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua:79
function flowgraph_nodes_scene_spawnLight_C:clearObjects() end

--- Crée la lumière avec les valeurs des pins (canSave = false), l'ajoute à la liste, écrit lastId et notifie l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua:38
---@param objectName any non utilisé (le nom calculé n'est pas appliqué)
function flowgraph_nodes_scene_spawnLight_C:createObject(objectName) end

--- Appelé à la destruction du noeud : nettoie les objets créés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua:134
function flowgraph_nodes_scene_spawnLight_C:destroy() end

--- Initialise la liste d'objets et data.maxObjectCount = 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua:33
---@param mgr any gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_scene_spawnLight_C:init(mgr, ...) end

--- Hook de fin de mission : nettoie les objets créés par le noeud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua:129
function flowgraph_nodes_scene_spawnLight_C:onClientEndMission() end

--- Sur clear, supprime ; sinon crée la lumière si le maximum n'est pas atteint (created = true) et, avec update, la met à jour (position, rotation, angles, luminosité, portée, couleur).
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua:92
function flowgraph_nodes_scene_spawnLight_C:work() end

