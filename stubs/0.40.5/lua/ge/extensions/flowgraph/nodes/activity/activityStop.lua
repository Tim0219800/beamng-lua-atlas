---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/activity/activityStop.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_activity_activityStop_C
local flowgraph_nodes_activity_activityStop_C = {}

--- Appelée après le déclenchement des nœuds : si stopping, arrête le graphe (setRunning(false)) ; sans activité, loggue l'abandon de la tentative et arrête le fondu d'écran.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/activityStop.lua:27
function flowgraph_nodes_activity_activityStop_C:_afterTrigger() end

--- Marque self.stopping = true quand le nœud est exécuté.
---Source : lua/ge/extensions/flowgraph/nodes/activity/activityStop.lua:23
function flowgraph_nodes_activity_activityStop_C:work() end

