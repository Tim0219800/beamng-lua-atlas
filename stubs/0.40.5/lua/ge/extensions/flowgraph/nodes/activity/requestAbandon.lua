---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/activity/requestAbandon.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_activity_requestAbandon_C
local flowgraph_nodes_activity_requestAbandon_C = {}

--- Remet reset à faux après le déclenchement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/requestAbandon.lua:43
function flowgraph_nodes_activity_requestAbandon_C:_afterTrigger() end

--- Remet reset à faux au démarrage du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/requestAbandon.lua:34
function flowgraph_nodes_activity_requestAbandon_C:_executionStarted() end

--- Remet reset à faux à l'arrêt du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/requestAbandon.lua:29
function flowgraph_nodes_activity_requestAbandon_C:_executionStopped() end

--- Éditeur : dessine la zone centrale du nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/requestAbandon.lua:47
---@param builder table constructeur de nœud de l'éditeur
---@param style table style de l'éditeur
function flowgraph_nodes_activity_requestAbandon_C:drawMiddle(builder, style) end

--- Met reset à faux et data.blocksOnResetGameplay à true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/requestAbandon.lua:24
---@param mgr any
---@param ... any
function flowgraph_nodes_activity_requestAbandon_C:init(mgr, ...) end

--- Hook appelé quand le joueur demande l'abandon ; mémorise la demande.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/requestAbandon.lua:39
function flowgraph_nodes_activity_requestAbandon_C:onRequestAbandon() end

--- Si une demande d'abandon est en attente, active flow et value (et journalise), sinon les met à faux.
---Source : lua/ge/extensions/flowgraph/nodes/activity/requestAbandon.lua:51
---@param args any
function flowgraph_nodes_activity_requestAbandon_C:work(args) end

