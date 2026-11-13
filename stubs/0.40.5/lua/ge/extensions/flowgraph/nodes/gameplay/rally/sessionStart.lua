---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/sessionStart.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_rally_sessionStart_C
local flowgraph_nodes_gameplay_rally_sessionStart_C = {}

--- Décharge les extensions rally et émet onRallySessionEnd si fireEvents.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/sessionStart.lua:25
function flowgraph_nodes_gameplay_rally_sessionStart_C:_executionStopped() end

--- Charge l'extension gameplay_rally si besoin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/sessionStart.lua:47
function flowgraph_nodes_gameplay_rally_sessionStart_C:loadExt() end

--- Charge le pont de boucle rally s'il n'est pas chargé et mémorise si c'est ce nœud qui l'a chargé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/sessionStart.lua:54
function flowgraph_nodes_gameplay_rally_sessionStart_C:loadRallyLoopBridge() end

--- Décharge gameplay_rallyStartClock, gameplay_rally et, sous conditions, le pont de boucle rally.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/sessionStart.lua:33
function flowgraph_nodes_gameplay_rally_sessionStart_C:unloadExt() end

--- Exécute la séquence de démarrage de session décrite dans la description du module.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/sessionStart.lua:63
function flowgraph_nodes_gameplay_rally_sessionStart_C:workOnce() end

