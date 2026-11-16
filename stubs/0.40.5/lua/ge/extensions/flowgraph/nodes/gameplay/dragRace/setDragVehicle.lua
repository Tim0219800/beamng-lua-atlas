---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_dragRace_setDragVehicle_C
local flowgraph_nodes_gameplay_dragRace_setDragVehicle_C = {}

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua:35
function flowgraph_nodes_gameplay_dragRace_setDragVehicle_C:_executionStarted() end

--- Restores mode and count and recreates the pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua:130
---@param res table Saved data
function flowgraph_nodes_gameplay_dragRace_setDragVehicle_C:_onDeserialized(res) end

--- Saves mode and count.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua:125
---@param res table Serialization table
function flowgraph_nodes_gameplay_dragRace_setDragVehicle_C:_onSerialize(res) end

--- Editor: count field and choice of the merge function.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua:39
function flowgraph_nodes_gameplay_dragRace_setDragVehicle_C:drawCustomProperties() end

--- Displays the merge mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua:30
---@param builder any
---@param style any
function flowgraph_nodes_gameplay_dragRace_setDragVehicle_C:drawMiddle(builder, style) end

--- count = 1, mode = 'first'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua:25
function flowgraph_nodes_gameplay_dragRace_setDragVehicle_C:init() end

--- Adds or removes the per-lane pins to go from old to new.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua:71
---@param old integer Old number
---@param new integer New number
function flowgraph_nodes_gameplay_dragRace_setDragVehicle_C:updatePins(old, new) end

--- Builds the list {id, isPlayable, dial, lane} and calls dragBridge.setVehicles.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua:107
function flowgraph_nodes_gameplay_dragRace_setDragVehicle_C:workOnce() end

