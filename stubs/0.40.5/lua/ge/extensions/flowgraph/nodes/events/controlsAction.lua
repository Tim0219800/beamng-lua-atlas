---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/events/controlsAction.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_events_controlsAction_C
local flowgraph_nodes_events_controlsAction_C = {}

--- Réinitialise l'état et appelle pushActionMap("FlowgraphActions").
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/controlsAction.lua:36
function flowgraph_nodes_events_controlsAction_C:_executionStarted() end

--- Réinitialise l'état et appelle popActionMap("FlowgraphActions").
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/controlsAction.lua:30
function flowgraph_nodes_events_controlsAction_C:_executionStopped() end

--- Dessin du nœud dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/controlsAction.lua:47
---@param builder any
---@param style any
function flowgraph_nodes_events_controlsAction_C:drawMiddle(builder, style) end

--- Initialise self.reset = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/controlsAction.lua:26
---@param mgr table Gestionnaire du flowgraph
---@param ... any
function flowgraph_nodes_events_controlsAction_C:init(mgr, ...) end

--- Hook appelé quand l'action est déclenchée : mémorise le numéro de frame.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/controlsAction.lua:42
function flowgraph_nodes_events_controlsAction_C:onControlsAction() end

--- Met flow et value à vrai pendant la frame qui suit l'appui, sinon à faux.
---Source : lua/ge/extensions/flowgraph/nodes/events/controlsAction.lua:53
---@param args table Arguments du flowgraph
function flowgraph_nodes_events_controlsAction_C:work(args) end

