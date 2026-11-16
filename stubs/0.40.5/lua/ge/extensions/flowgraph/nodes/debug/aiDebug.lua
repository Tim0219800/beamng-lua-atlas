---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/debug/aiDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_debug_aiDebug_C
local flowgraph_nodes_debug_aiDebug_C = {}

--- Finds the vehicle (vehId or player) and sends it ai.setVehicleDebugMode({debugMode = mode}) via queueLuaCommand.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/aiDebug.lua:42
function flowgraph_nodes_debug_aiDebug_C:SetAIDebugMode() end

--- Provides the list of modes as templates for the mode pin in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/aiDebug.lua:24
function flowgraph_nodes_debug_aiDebug_C:postInit() end

--- If dynamicMode is 'repeat', reapplies the mode every frame.
---Source: lua/ge/extensions/flowgraph/nodes/debug/aiDebug.lua:36
function flowgraph_nodes_debug_aiDebug_C:work() end

--- Applies the mode once.
---Source: lua/ge/extensions/flowgraph/nodes/debug/aiDebug.lua:32
function flowgraph_nodes_debug_aiDebug_C:workOnce() end

