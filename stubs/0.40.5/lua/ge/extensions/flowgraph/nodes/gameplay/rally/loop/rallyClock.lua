---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/rallyClock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_rally_loop_rallyClock_C
local flowgraph_nodes_gameplay_rally_loop_rallyClock_C = {}

--- Vide le cache au démarrage du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/rallyClock.lua:30
function flowgraph_nodes_gameplay_rally_loop_rallyClock_C:_executionStarted() end

--- Initialise le cache (nom d'évènement, id de mission, heure planifiée) à nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/rallyClock.lua:23
---@param mgr table Gestionnaire flowgraph.
---@param ... any
function flowgraph_nodes_gameplay_rally_loop_rallyClock_C:init(mgr, ...) end

--- Chaque frame : met à jour currentEpochTime et scheduledEventTime (avec cache).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/rallyClock.lua:45
function flowgraph_nodes_gameplay_rally_loop_rallyClock_C:work() end

