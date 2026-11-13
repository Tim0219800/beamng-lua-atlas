---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/loadProject.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_loadProject_C
local flowgraph_nodes_util_loadProject_C = {}

--- Arrête la cible (setRunning(false)) et la retire à la frame suivante via core_flowgraphManager.removeNextFrame si destroyTargetOnStop.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/loadProject.lua:32
function flowgraph_nodes_util_loadProject_C:_executionStopped() end

--- Active destroyTargetOnStop et vide la cible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/loadProject.lua:21
---@param mgr any
---@param ... any
function flowgraph_nodes_util_loadProject_C:init(mgr, ...) end

--- Limite le sélecteur de fichier du pin filepath aux fichiers .flow.json.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/loadProject.lua:25
function flowgraph_nodes_util_loadProject_C:postInit() end

--- Résout le chemin (essaie le nom brut, +.flow.json, flowgraphEditor/<nom>.flow.json), charge le gestionnaire (core_flowgraphManager.loadManager) puis le démarre tout de suite ou à la frame suivante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/loadProject.lua:41
function flowgraph_nodes_util_loadProject_C:workOnce() end

