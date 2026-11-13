---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/time.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_time_C
local flowgraph_nodes_util_time_C = {}

--- Corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/time.lua:31
---@param builder table Constructeur de nœud.
---@param style table Style du nœud.
function flowgraph_nodes_util_time_C:drawMiddle(builder, style) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/time.lua:22
---@param mgr any
---@param ... any
function flowgraph_nodes_util_time_C:init(mgr, ...) end

--- Écrit os.clockhp() dans time et mgr.dtReal / mgr.dtSim dans les deux autres sorties.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/time.lua:25
function flowgraph_nodes_util_time_C:work() end

