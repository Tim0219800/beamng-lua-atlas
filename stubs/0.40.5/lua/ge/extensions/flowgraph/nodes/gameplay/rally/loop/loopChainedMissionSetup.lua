---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopChainedMissionSetup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_rally_loop_loopChainedMissionSetup_C
local flowgraph_nodes_gameplay_rally_loop_loopChainedMissionSetup_C = {}

--- Décharge l'extension rally loop si elle est chargée et qu'aucun transfert d'exécution de mission n'est signalé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopChainedMissionSetup.lua:21
function flowgraph_nodes_gameplay_rally_loop_loopChainedMissionSetup_C:_executionStopped() end

--- Réinitialise le drapeau de transfert et appelle setupForNewMission si gameplay_rallyLoop existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopChainedMissionSetup.lua:33
function flowgraph_nodes_gameplay_rally_loop_loopChainedMissionSetup_C:workOnce() end

