---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_activity_activityFlow_C
local flowgraph_nodes_activity_activityFlow_C = {}

--- Hook : quand le graphe passe à 'stopped', déclenche stop() et arrête la mission (si activité en cours).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:82
---@param newState string nouvel état d'exécution
function flowgraph_nodes_activity_activityFlow_C:changedRunningState(newState) end

--- Éditeur : affiche si une activité est associée et la fin de son id.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:102
function flowgraph_nodes_activity_activityFlow_C:drawMiddle() end

--- Éditeur : infobulle indiquant l'id de l'activité ou le mode de compatibilité limitée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:106
function flowgraph_nodes_activity_activityFlow_C:drawTooltip() end

--- Hook : au démarrage du graphe, si une activité existe et n'est pas en cours, la démarre via gameplay_missions_missionManager.start ; sans activité, appelle start().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:39
function flowgraph_nodes_activity_activityFlow_C:onExecutionStarted() end

--- Hook appelé au démarrage de l'activité ; appelle start().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:48
function flowgraph_nodes_activity_activityFlow_C:onStartActivity() end

--- Hook appelé à l'arrêt de l'activité ; appelle stop().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:95
function flowgraph_nodes_activity_activityFlow_C:onStopActivity() end

--- Hook par frame ; n'appelle update que si le graphe n'a pas d'activité.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:65
---@param ... any
function flowgraph_nodes_activity_activityFlow_C:onUpdate(...) end

--- Hook par frame envoyé par l'activité ; appelle update.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:70
---@param ... any
function flowgraph_nodes_activity_activityFlow_C:onUpdateActivity(...) end

--- Met le flux de « started » à vrai (update et stopped à faux) et déclenche le nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:33
function flowgraph_nodes_activity_activityFlow_C:start() end

--- Active le flux « stopped » et déclenche le nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:75
function flowgraph_nodes_activity_activityFlow_C:stop() end

--- Met à jour dtReal/dtSim/dtRaw (pins et gestionnaire), active « update » et déclenche le nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua:53
---@param dtReal number delta temps réel (s)
---@param dtSim number delta temps simulé (s)
---@param dtRaw number delta temps brut (s)
function flowgraph_nodes_activity_activityFlow_C:update(dtReal, dtSim, dtRaw) end

