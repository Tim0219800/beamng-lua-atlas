---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficActivate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_trafficActivate_C
local flowgraph_nodes_gameplay_traffic_trafficActivate_C = {}

--- Calls onNodeReset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficActivate.lua:34
function flowgraph_nodes_gameplay_traffic_trafficActivate_C:_executionStopped() end

--- Calls onNodeReset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficActivate.lua:30
function flowgraph_nodes_gameplay_traffic_trafficActivate_C:init() end

--- Deactivates traffic and resets the flags.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficActivate.lua:38
function flowgraph_nodes_gameplay_traffic_trafficActivate_C:onNodeReset() end

--- Publishes the total number of AI vehicles and the activated pulse.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficActivate.lua:54
function flowgraph_nodes_gameplay_traffic_trafficActivate_C:work() end

--- Activates traffic for vehicleIds (if defined) and publishes the validated traffic list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficActivate.lua:44
function flowgraph_nodes_gameplay_traffic_trafficActivate_C:workOnce() end

