---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/activity/activityHook.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_activity_activityHook_C
local flowgraph_nodes_activity_activityHook_C = {}

--- Fixe data.eventName = 'start' et active allowCustomInPins et savePins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/activityHook.lua:29
function flowgraph_nodes_activity_activityHook_C:init() end

--- Construit une table {nomPin = valeur} avec les pins d'entrée (sauf flow, reset) et appelle mgr.modules.mission:missionHook(eventName, données).
---Source : lua/ge/extensions/flowgraph/nodes/activity/activityHook.lua:35
function flowgraph_nodes_activity_activityHook_C:workOnce() end

