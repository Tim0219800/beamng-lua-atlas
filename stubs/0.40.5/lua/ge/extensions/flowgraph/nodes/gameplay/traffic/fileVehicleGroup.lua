---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/fileVehicleGroup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_fileVehicleGroup_C
local flowgraph_nodes_gameplay_traffic_fileVehicleGroup_C = {}

--- Called when the flowgraph project execution stops; releases the internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/fileVehicleGroup.lua:36
function flowgraph_nodes_gameplay_traffic_fileVehicleGroup_C:_executionStopped() end

--- Initializes the node's internal state at creation (called by the flowgraph engine).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/fileVehicleGroup.lua:22
function flowgraph_nodes_gameplay_traffic_fileVehicleGroup_C:init() end

--- Called when the node is reset; resets its internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/fileVehicleGroup.lua:32
function flowgraph_nodes_gameplay_traffic_fileVehicleGroup_C:onNodeReset() end

--- Called after the node's pins are created; used to adjust the pins (value templates, file filters, dynamic keys).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/fileVehicleGroup.lua:26
function flowgraph_nodes_gameplay_traffic_fileVehicleGroup_C:postInit() end

--- On the first call, resolves the path, reads the file, generates the data if needed and publishes the group; node error if the file is not found.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/fileVehicleGroup.lua:40
function flowgraph_nodes_gameplay_traffic_fileVehicleGroup_C:work() end

