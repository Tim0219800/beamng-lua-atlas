---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/sessionStart.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_rally_sessionStart_C
local flowgraph_nodes_gameplay_rally_sessionStart_C = {}

--- Unloads the rally extensions and emits onRallySessionEnd if fireEvents.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/sessionStart.lua:25
function flowgraph_nodes_gameplay_rally_sessionStart_C:_executionStopped() end

--- Loads the gameplay_rally extension if needed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/sessionStart.lua:47
function flowgraph_nodes_gameplay_rally_sessionStart_C:loadExt() end

--- Loads the rally loop bridge if it is not loaded and remembers whether this node loaded it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/sessionStart.lua:54
function flowgraph_nodes_gameplay_rally_sessionStart_C:loadRallyLoopBridge() end

--- Unloads gameplay_rallyStartClock, gameplay_rally and, under conditions, the rally loop bridge.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/sessionStart.lua:33
function flowgraph_nodes_gameplay_rally_sessionStart_C:unloadExt() end

--- Executes the session start sequence described in the module description.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/sessionStart.lua:63
function flowgraph_nodes_gameplay_rally_sessionStart_C:workOnce() end

