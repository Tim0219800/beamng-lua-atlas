---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_rally_recoverInPlace_C
local flowgraph_nodes_gameplay_rally_recoverInPlace_C = {}

--- Appelle onNodeReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua:43
function flowgraph_nodes_gameplay_rally_recoverInPlace_C:_executionStarted() end

--- Appelle onNodeReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua:47
function flowgraph_nodes_gameplay_rally_recoverInPlace_C:_executionStopped() end

--- Appelle onNodeReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua:39
function flowgraph_nodes_gameplay_rally_recoverInPlace_C:init() end

--- Efface la recovery en attente et l'instantané de carburant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua:51
function flowgraph_nodes_gameplay_rally_recoverInPlace_C:onNodeReset() end

--- Exécute la recovery en attente : téléporte le véhicule, réapplique le carburant, émet les hooks.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua:56
function flowgraph_nodes_gameplay_rally_recoverInPlace_C:runRecovery() end

--- Prépare la recovery (position/rotation actuelles, choix de réparation) ; demande d'abord l'instantané de carburant si réparation, puis lance runRecovery.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua:85
function flowgraph_nodes_gameplay_rally_recoverInPlace_C:startRecovery() end

--- Si flow est actif, appelle startRecovery.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua:125
function flowgraph_nodes_gameplay_rally_recoverInPlace_C:work() end

