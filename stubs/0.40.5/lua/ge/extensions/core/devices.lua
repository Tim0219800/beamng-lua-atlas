---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/devices.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Drives the RGB lighting of gaming peripherals (wheels, gamepads) via the C++ Device object. Each device assigned to a player takes that player's color (BeamNG orange 255,102,0 by default), unless the wheel's force feedback requests the "default" lighting mode and the vehicle's shift LEDs are in use: in that case the color is reset (Device.resetRGB).
--- Access: extension `core_devices`: `extensions.load("core_devices")`, then the global `core_devices`
---@class core_devices
core_devices = {}

--- Hook: forgets the LED state of the vehicle about to be replaced.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/devices.lua:74
---@param vehicleId integer vehicle id
function core_devices.onBeforeVehicleReplaced(vehicleId) end

--- Hook: the force feedback configuration changed, recomputes the devices' lighting.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/devices.lua:86
function core_devices.onFFBConfigChanged() end

--- Hook: forgets the LED state of the destroyed vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/devices.lua:70
---@param vehicleId integer vehicle id
function core_devices.onVehicleDestroyed(vehicleId) end

--- Hook: a vehicle enables or disables its shift LEDs; if it is a player vehicle, the lighting is recomputed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/devices.lua:78
---@param vehicleId integer vehicle id
---@param shiftLEDsInUse boolean true if the shift LEDs are used
function core_devices.onVehicleRPMledStateChanged(vehicleId, shiftLEDsInUse) end

--- Sets the color per player number and immediately refreshes the lighting of all devices.
---Source: lua/ge/extensions/core/devices.lua:91
---@param colors table<integer, vec3>|nil RGB color (components 0-255 in x,y,z) keyed by player number; nil clears the table.
---@param assignments table<string, integer>|nil Temporarily overrides the device name -> player number assignment (for example to show assignments not yet applied); nil uses core_input_bindings.assignedPlayers.
function core_devices.setPlayerColors(colors, assignments) end

