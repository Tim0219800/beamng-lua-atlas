---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/colors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_vehicle_colors`: live changes of the color or paint of one of the 3 paint slots of the configured vehicle (core_vehicle_configTarget), updates the meshes through core_vehicle_manager.liveUpdateVehicleColors, then saves the paints in the config through core_vehicle_partmgmt.setConfigPaints (without respawn). Used by the vehicle configuration UI.
--- Access: extension `core_vehicle_colors`: `extensions.load("core_vehicle_colors")`, then the global `core_vehicle_colors`
---@class core_vehicle_colors
---@field dependencies string[] {'core_vehicle_configTarget'}
core_vehicle_colors = {}

--- Converts a string 'r g b a [...]' (numbers separated by spaces) into an array of numbers; the 4th element (0..2) is brought back to 0..1 (multiplied by 0.5 and clamped).
---Source: lua/ge/extensions/core/vehicle/colors.lua:9
---@param colorString string|nil e.g. '0.5 0.2 0.1 1.2'
---@return number[]|nil  array of numbers; nil if colorString is nil
function core_vehicle_colors.colorStringToColorTable(colorString) end

--- Hook: a vehicle spawns. Copies its 3 actual colors (veh.color, colorPalette0, colorPalette1 + metallic data) into vehicleData.config.paints, rounded to 4 decimals, so that the config reflects the actual paint.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/colors.lua:73
---@param vehId integer vehicle
function core_vehicle_colors.onVehicleSpawned(vehId) end

--- Sets the color of a paint slot from a string (8 numbers: r g b a then 4 metallic values), updates the vehicle live and saves all paints in the config.
---Source: lua/ge/extensions/core/vehicle/colors.lua:36
---@param index integer paint slot, 0-based (0 to 2)
---@param colorString string 'r g b a metallic roughness clearcoat clearcoatRoughness'
---@param objID integer|nil vehicle; nil = configuration target or player 0
function core_vehicle_colors.setVehicleColor(index, colorString, objID) end

--- Applies a paint table to a slot, updates the vehicle live and saves the paints in the config.
---Source: lua/ge/extensions/core/vehicle/colors.lua:53
---@param index integer paint slot, 1-based (1 to 3)
---@param paint table paint {baseColor, metallic, roughness, clearcoat, clearcoatRoughness}
---@param objID integer|nil vehicle; nil = configuration target or player 0
function core_vehicle_colors.setVehiclePaint(index, paint, objID) end

