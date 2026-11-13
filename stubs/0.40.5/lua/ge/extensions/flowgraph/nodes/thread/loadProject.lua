---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/thread/loadProject.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_thread_loadProject_C
local flowgraph_nodes_thread_loadProject_C = {}

--- Remet targetId à nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/thread/loadProject.lua:33
function flowgraph_nodes_thread_loadProject_C:_executionStarted() end

--- Remet targetId à nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/thread/loadProject.lua:37
function flowgraph_nodes_thread_loadProject_C:_executionStopped() end

--- Initialise targetId.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/thread/loadProject.lua:23
---@param mgr any gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_thread_loadProject_C:init(mgr, ...) end

--- Restreint path aux fichiers « Flowgraph Files » (.flow.json).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/thread/loadProject.lua:27
function flowgraph_nodes_thread_loadProject_C:postInit() end

--- Résout le chemin (avec ou sans extension .flow.json), démarre le projet et écrit son id.
---Source : lua/ge/extensions/flowgraph/nodes/thread/loadProject.lua:41
function flowgraph_nodes_thread_loadProject_C:workOnce() end

