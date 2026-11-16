---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_signals_fileTrafficSignals_C
local flowgraph_nodes_gameplay_traffic_signals_fileTrafficSignals_C = {}

--- Clears the output and reloads the map's default signals file.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals.lua:47
function flowgraph_nodes_gameplay_traffic_signals_fileTrafficSignals_C:_executionStopped() end

--- Draws the node's custom properties in the flowgraph editor panel (ImGui).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals.lua:35
function flowgraph_nodes_gameplay_traffic_signals_fileTrafficSignals_C:drawCustomProperties() end

--- Initializes the node's internal state at creation (called by the flowgraph engine).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals.lua:24
function flowgraph_nodes_gameplay_traffic_signals_fileTrafficSignals_C:init() end

--- Clears the signalsData output.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals.lua:43
function flowgraph_nodes_gameplay_traffic_signals_fileTrafficSignals_C:onNodeReset() end

--- Called after the node's pins are created; used to adjust the pins (value templates, file filters, dynamic keys).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals.lua:29
function flowgraph_nodes_gameplay_traffic_signals_fileTrafficSignals_C:postInit() end

--- On the first call, loads the signals, activates the simulation and publishes core_trafficSignals.getData() on signalsData.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals.lua:54
function flowgraph_nodes_gameplay_traffic_signals_fileTrafficSignals_C:work() end

