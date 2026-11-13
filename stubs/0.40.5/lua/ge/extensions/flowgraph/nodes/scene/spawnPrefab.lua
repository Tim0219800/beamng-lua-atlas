---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_spawnPrefab_C
local flowgraph_nodes_scene_spawnPrefab_C = {}

--- Oublie les objets à l'arrêt.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua:81
function flowgraph_nodes_scene_spawnPrefab_C:_executionStopped() end

--- Vide la liste d'objets (sans supprimer le prefab de la scène).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua:85
function flowgraph_nodes_scene_spawnPrefab_C:clearObjects() end

--- Résout le chemin (avec extensions possibles), crée le prefab (canSave = false), le met dans MissionGroup et dans modules.prefab ; en cas d'échec, objects = {'failed'}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua:45
function flowgraph_nodes_scene_spawnPrefab_C:createObject() end

--- Appelé à la destruction du noeud : oublie les objets.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua:116
function flowgraph_nodes_scene_spawnPrefab_C:destroy() end

--- Initialise la liste d'objets et origPositions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua:33
---@param mgr any gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_scene_spawnPrefab_C:init(mgr, ...) end

--- Hook de fin de mission : oublie les objets.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua:112
function flowgraph_nodes_scene_spawnPrefab_C:onClientEndMission() end

--- Restreint le pin path aux fichiers .prefab.json et .prefab.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua:38
function flowgraph_nodes_scene_spawnPrefab_C:postInit() end

--- Gère reset (oublie le prefab), resetVeh (restaure les positions des véhicules) et crée le prefab une seule fois par flow ; écrit created, flow et success.
---Source : lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua:89
function flowgraph_nodes_scene_spawnPrefab_C:work() end

