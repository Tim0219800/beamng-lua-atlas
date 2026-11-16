---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/crash/onCrashDetected.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_crash_onCrashDetected_C
local flowgraph_nodes_gameplay_crash_onCrashDetected_C = {}

--- Calls reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/crash/onCrashDetected.lua:24
function flowgraph_nodes_gameplay_crash_onCrashDetected_C:_executionStopped() end

--- Calls reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/crash/onCrashDetected.lua:20
function flowgraph_nodes_gameplay_crash_onCrashDetected_C:init() end

--- Hook: adds vehId to the crash end queue.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/crash/onCrashDetected.lua:55
---@param crashEndData table Contains vehId
function flowgraph_nodes_gameplay_crash_onCrashDetected_C:onVehicleCrashEnded(crashEndData) end

--- Hook: adds vehId to the crash start queue.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/crash/onCrashDetected.lua:51
---@param crashStartData table Contains vehId
function flowgraph_nodes_gameplay_crash_onCrashDetected_C:onVehicleCrashStarted(crashStartData) end

--- Empties the crashStartQueue and crashEndQueue queues.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/crash/onCrashDetected.lua:28
function flowgraph_nodes_gameplay_crash_onCrashDetected_C:reset() end

--- Pops one crash start and one crash end per frame and fills startCrash, endCrash, vehId.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/crash/onCrashDetected.lua:33
function flowgraph_nodes_gameplay_crash_onCrashDetected_C:work() end

