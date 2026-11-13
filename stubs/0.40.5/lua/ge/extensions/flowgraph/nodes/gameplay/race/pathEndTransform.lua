---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/race/pathEndTransform.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_race_pathEndTransform_C
local flowgraph_nodes_gameplay_race_pathEndTransform_C = {}

--- Oublie le chemin mémorisé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/pathEndTransform.lua:32
function flowgraph_nodes_gameplay_race_pathEndTransform_C:_executionStopped() end

--- Initialise self.path et désactive clearOutPinsOnStart.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/pathEndTransform.lua:27
---@param mgr table Gestionnaire flowgraph.
---@param ... any
function flowgraph_nodes_gameplay_race_pathEndTransform_C:init(mgr, ...) end

--- Trouve le pathnode de fin et écrit existing, pos, dirVec, radius et les flows endExists/endDoesNotExist.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/pathEndTransform.lua:36
---@param args table Arguments du moteur flowgraph (non utilisés).
function flowgraph_nodes_gameplay_race_pathEndTransform_C:work(args) end

