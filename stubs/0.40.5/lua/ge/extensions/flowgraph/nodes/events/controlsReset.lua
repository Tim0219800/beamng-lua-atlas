---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_events_controlsReset_C
local flowgraph_nodes_events_controlsReset_C = {}

--- Remet self.reset à false après le déclenchement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua:43
function flowgraph_nodes_events_controlsReset_C:_afterTrigger() end

--- Remet self.reset à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua:34
function flowgraph_nodes_events_controlsReset_C:_executionStarted() end

--- Remet self.reset à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua:29
function flowgraph_nodes_events_controlsReset_C:_executionStopped() end

--- Dessin du nœud dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua:47
---@param builder any
---@param style any
function flowgraph_nodes_events_controlsReset_C:drawMiddle(builder, style) end

--- Initialise self.reset et data.blocksOnResetGameplay.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua:24
---@param mgr table Gestionnaire du flowgraph
---@param ... any
function flowgraph_nodes_events_controlsReset_C:init(mgr, ...) end

--- Hook : ajoute à results le bouton {id='controlsReset', label='Reset', order=0, active}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua:64
---@param results table Liste de boutons à compléter
function flowgraph_nodes_events_controlsReset_C:onGatherGameContextUiButtons(results) end

--- Hook appelé par extensions.hook("onResetGameplay") : mémorise l'appui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua:39
function flowgraph_nodes_events_controlsReset_C:onResetGameplay() end

--- Met flow et value à vrai une frame après un reset, sinon à faux.
---Source : lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua:51
---@param args table Arguments du flowgraph
function flowgraph_nodes_events_controlsReset_C:work(args) end

