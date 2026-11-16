---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setupParkedCars.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_setupParkedCars_C
local flowgraph_nodes_gameplay_traffic_setupParkedCars_C = {}

--- Calls onNodeReset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setupParkedCars.lua:26
function flowgraph_nodes_gameplay_traffic_setupParkedCars_C:_executionStopped() end

--- Calls onNodeReset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setupParkedCars.lua:22
function flowgraph_nodes_gameplay_traffic_setupParkedCars_C:init() end

--- Deactivates the parked cars and resets the parking system's sites.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setupParkedCars.lua:30
function flowgraph_nodes_gameplay_traffic_setupParkedCars_C:onNodeReset() end

--- Enables parking, applies the sites if provided and activates the parked cars for the id list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setupParkedCars.lua:35
function flowgraph_nodes_gameplay_traffic_setupParkedCars_C:workOnce() end

