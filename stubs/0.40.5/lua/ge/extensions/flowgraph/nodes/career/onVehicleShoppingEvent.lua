---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_career_onVehicleShoppingEvent_C
local flowgraph_nodes_career_onVehicleShoppingEvent_C = {}

--- Creates the flag table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua:26
function flowgraph_nodes_career_onVehicleShoppingEvent_C:init() end

--- Hook: raises closedMenu when the player returns to the game.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua:64
---@param enteredPlay boolean true if entering the play state
function flowgraph_nodes_career_onVehicleShoppingEvent_C:onUIPlayStateChanged(enteredPlay) end

--- Hook: raises vehicleBought and converts data.inventoryId into a vehicle id (vehId).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua:55
---@param data table contains inventoryId
function flowgraph_nodes_career_onVehicleShoppingEvent_C:onVehicleAddedToInventory(data) end

--- Hook: raises closedMenu.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua:60
function flowgraph_nodes_career_onVehicleShoppingEvent_C:onVehicleShoppingMenuClosed() end

--- Hook: raises openedMenu.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua:43
---@param data any unused
function flowgraph_nodes_career_onVehicleShoppingEvent_C:onVehicleShoppingMenuOpened(data) end

--- Hook: raises openedDetail.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua:51
---@param data any unused
function flowgraph_nodes_career_onVehicleShoppingEvent_C:onVehicleShoppingPurchaseMenuOpened(data) end

--- Hook: raises vehicleSpawned.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua:47
---@param data any unused
function flowgraph_nodes_career_onVehicleShoppingEvent_C:onVehicleShoppingVehicleShown(data) end

--- Every frame: sets five flow outputs back to false, applies and clears the flags, updates testDriveActive.
---Source: lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua:30
---@param args any unused
function flowgraph_nodes_career_onVehicleShoppingEvent_C:work(args) end

