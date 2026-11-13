---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/pauseGame.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_environment_pauseGame_C
local flowgraph_nodes_environment_pauseGame_C = {}

--- Si demandé et si le jeu n'est pas déjà en pause, appelle simTimeAuthority.pause(true), puis remet le drapeau à faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/pauseGame.lua:31
function flowgraph_nodes_environment_pauseGame_C:_afterTrigger() end

--- Remet le drapeau interne à faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/pauseGame.lua:23
function flowgraph_nodes_environment_pauseGame_C:_executionStarted() end

--- Demande la pause (drapeau à true).
---Source : lua/ge/extensions/flowgraph/nodes/environment/pauseGame.lua:27
function flowgraph_nodes_environment_pauseGame_C:workOnce() end

