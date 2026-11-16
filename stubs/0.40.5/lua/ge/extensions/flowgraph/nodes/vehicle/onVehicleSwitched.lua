---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSwitched.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_onVehicleSwitched_C
local flowgraph_nodes_vehicle_onVehicleSwitched_C = {}

--- Called by the manager after the node is triggered; resets the event flag to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSwitched.lua:49
function flowgraph_nodes_vehicle_onVehicleSwitched_C:_afterTrigger() end

--- Called by the manager when the flowgraph project execution starts; resets the internal state to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSwitched.lua:31
function flowgraph_nodes_vehicle_onVehicleSwitched_C:_executionStarted() end

--- Empty constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSwitched.lua:27
---@param mgr any
---@param ... any
function flowgraph_nodes_vehicle_onVehicleSwitched_C:init(mgr, ...) end

--- Hook called when the player changes vehicle; `oid` old id, `nid` new id, `player` player id.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSwitched.lua:53
---@param oid integer Old vehicle.
---@param nid integer New vehicle.
---@param player integer Player id.
function flowgraph_nodes_vehicle_onVehicleSwitched_C:onVehicleSwitched(oid, nid, player) end

--- If a change was signaled, fills `oldID`, `newID`, `player` and sets `flow` to true for one frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSwitched.lua:37
---@param args any
function flowgraph_nodes_vehicle_onVehicleSwitched_C:work(args) end

