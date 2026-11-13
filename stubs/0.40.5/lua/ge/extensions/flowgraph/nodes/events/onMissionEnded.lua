---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/events/onMissionEnded.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_events_onMissionEnded_C
local flowgraph_nodes_events_onMissionEnded_C = {}

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/onMissionEnded.lua:19
---@param mgr table Gestionnaire du flowgraph
---@param ... any
function flowgraph_nodes_events_onMissionEnded_C:init(mgr, ...) end

--- Hook appelé au déchargement du niveau : met flow à vrai et déclenche le nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/onMissionEnded.lua:22
function flowgraph_nodes_events_onMissionEnded_C:onClientEndMission() end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/onMissionEnded.lua:27
---@param args table Arguments du flowgraph
function flowgraph_nodes_events_onMissionEnded_C:work(args) end

