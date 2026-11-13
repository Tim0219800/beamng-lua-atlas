---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/events/onUpdate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_events_onUpdate_C
local flowgraph_nodes_events_onUpdate_C = {}

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/onUpdate.lua:28
---@param mgr table Gestionnaire du flowgraph
---@param ... any
function flowgraph_nodes_events_onUpdate_C:init(mgr, ...) end

--- Appelé quand le projet entre dans l'état : enterState vrai, delta times à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/onUpdate.lua:44
function flowgraph_nodes_events_onUpdate_C:onStateStartedTrigger() end

--- Appelé quand le projet quitte l'état : exitState vrai, delta times à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/onUpdate.lua:58
function flowgraph_nodes_events_onUpdate_C:onStateStoppedTrigger() end

--- Hook appelé à chaque frame : met flow à vrai, copie les delta times dans mgr et les pins, déclenche le nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/onUpdate.lua:31
---@param dtReal number Delta temps réel (s)
---@param dtSim number Delta temps simulé (s)
---@param dtRaw number Delta temps brut (s)
function flowgraph_nodes_events_onUpdate_C:onUpdate(dtReal, dtSim, dtRaw) end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/onUpdate.lua:72
---@param args table Arguments du flowgraph
function flowgraph_nodes_events_onUpdate_C:work(args) end

