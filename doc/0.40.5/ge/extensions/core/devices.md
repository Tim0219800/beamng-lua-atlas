# `core_devices`

*File: `lua/ge/extensions/core/devices.lua` · VM: Game Engine (GE) · 104 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_devices`: `extensions.load("core_devices")`, then the global `core_devices`

Drives the RGB lighting of gaming peripherals (wheels, gamepads) via the C++ Device object. Each device assigned to a player takes that player's color (BeamNG orange 255,102,0 by default), unless the wheel's force feedback requests the "default" lighting mode and the vehicle's shift LEDs are in use: in that case the color is reset (Device.resetRGB).

## Notes

- Uses core_input_bindings.assignedPlayers to determine which device belongs to which player, unless setPlayerColors received an assignment table.
- Devices that lose their player go back to orange.
- Does nothing if the global Device object does not exist.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_devices.onBeforeVehicleReplaced(vehicleId)` | Hook: forgets the LED state of the vehicle about to be replaced. *(internal)* *(hook)* | 74 |
| `core_devices.onFFBConfigChanged()` | Hook: the force feedback configuration changed, recomputes the devices' lighting. *(internal)* *(hook)* | 86 |
| `core_devices.onVehicleDestroyed(vehicleId)` | Hook: forgets the LED state of the destroyed vehicle. *(internal)* *(hook)* | 70 |
| `core_devices.onVehicleRPMledStateChanged(vehicleId, shiftLEDsInUse)` | Hook: a vehicle enables or disables its shift LEDs; if it is a player vehicle, the lighting is recomputed. *(internal)* *(hook)* | 78 |
| `core_devices.setPlayerColors(colors, assignments)` | Sets the color per player number and immediately refreshes the lighting of all devices. | 91 |

### Parameter details

#### `core_devices.onBeforeVehicleReplaced(vehicleId)`

Hook: forgets the LED state of the vehicle about to be replaced.

- `vehicleId` (*integer*) : vehicle id

#### `core_devices.onVehicleDestroyed(vehicleId)`

Hook: forgets the LED state of the destroyed vehicle.

- `vehicleId` (*integer*) : vehicle id

#### `core_devices.onVehicleRPMledStateChanged(vehicleId, shiftLEDsInUse)`

Hook: a vehicle enables or disables its shift LEDs; if it is a player vehicle, the lighting is recomputed.

- `vehicleId` (*integer*) : vehicle id
- `shiftLEDsInUse` (*boolean*) : true if the shift LEDs are used

#### `core_devices.setPlayerColors(colors, assignments)`

Sets the color per player number and immediately refreshes the lighting of all devices.

- `colors` (*table<integer, vec3>|nil*) : RGB color (components 0-255 in x,y,z) keyed by player number; nil clears the table.
- `assignments` (*table<string, integer>|nil*) : Temporarily overrides the device name -> player number assignment (for example to show assignments not yet applied); nil uses core_input_bindings.assignedPlayers.

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/devices.lua`.*
