---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/input/vehicleSwitching.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_input_vehicleSwitching`: implements switching to the next/previous vehicle (vehicle switch keys). It can follow a custom order (list of ids defined by setVehicleOrder) or iterate over all usable active vehicles, ignoring the 'unicycle', vehicles with playerUsable == false and those that gameplay_seatOccupants refuses. In multiplayer, the request is delegated to multiplayer_vehicleSync.
--- Access: extension `core_input_vehicleSwitching`: `extensions.load("core_input_vehicleSwitching")`, then the global `core_input_vehicleSwitching`
---@class core_input_vehicleSwitching
core_input_vehicleSwitching = {}

--- Actually performs the switch: looks for the target (custom order then default order), calls be:enterVehicle and emits the hooks.
---Source: lua/ge/extensions/core/input/vehicleSwitching.lua:50
---@param player integer|nil Player index, default 0; -1 = ignored.
---@param dir integer +1 next, -1 previous.
function core_input_vehicleSwitching.applySwitchCycleVehicle(player, dir) end

--- Defines the custom vehicle traversal order (list of ids). nil to go back to the default order.
---Source: lua/ge/extensions/core/input/vehicleSwitching.lua:8
---@param order integer[]|nil Vehicle ids.
function core_input_vehicleSwitching.setVehicleOrder(order) end

--- Entry point: switches vehicle for the player. In multiplayer (multiplayer_vehicleSync present), sends requestSwitchCycleVehicle; otherwise calls applySwitchCycleVehicle.
---Source: lua/ge/extensions/core/input/vehicleSwitching.lua:89
---@param player integer|nil Player index, default 0; -1 = ignored.
---@param dir integer +1 next, -1 previous.
function core_input_vehicleSwitching.switchCycleVehicle(player, dir) end

