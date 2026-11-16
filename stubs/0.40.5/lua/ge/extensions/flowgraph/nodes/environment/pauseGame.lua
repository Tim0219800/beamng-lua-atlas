---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/pauseGame.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_environment_pauseGame_C
local flowgraph_nodes_environment_pauseGame_C = {}

--- If requested and the game is not already paused, calls simTimeAuthority.pause(true), then resets the flag to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/pauseGame.lua:31
function flowgraph_nodes_environment_pauseGame_C:_afterTrigger() end

--- Resets the internal flag to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/pauseGame.lua:23
function flowgraph_nodes_environment_pauseGame_C:_executionStarted() end

--- Requests the pause (flag set to true).
---Source: lua/ge/extensions/flowgraph/nodes/environment/pauseGame.lua:27
function flowgraph_nodes_environment_pauseGame_C:workOnce() end

