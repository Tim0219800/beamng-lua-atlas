---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/hideLoadingScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_hideLoadingScreen_C
local flowgraph_nodes_util_hideLoadingScreen_C = {}

--- Disables clearOutPinsOnStart.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/hideLoadingScreen.lua:20
function flowgraph_nodes_util_hideLoadingScreen_C:init() end

--- Sets finished to true as soon as modules.level is no longer loading a level.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/hideLoadingScreen.lua:34
function flowgraph_nodes_util_hideLoadingScreen_C:work() end

--- Sets finished to false, calls modules.level:finishedLevelLoading() and server.fadeoutLoadingScreen(true).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/hideLoadingScreen.lua:24
function flowgraph_nodes_util_hideLoadingScreen_C:workOnce() end

