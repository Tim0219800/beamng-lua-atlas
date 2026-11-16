# `ui_firstDrive_moveOff`

*File: `lua/ge/extensions/ui/firstDrive/moveOff.lua` · VM: Game Engine (GE) · 665 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_firstDrive_moveOff`: `extensions.load("ui_firstDrive_moveOff")`, then the global `ui_firstDrive_moveOff`

"Start and drive off" tutorial of the First Drive experience. Once enabled, it follows player 0's vehicle (throttle, brake, clutch, gear, engine, RPM, wheel speed, read via core_vehicleBridge) and shows in the "moveOff" application of the "topCenter" container the keys to use for each step: turn the engine on, drive off, stop, reverse, turn the engine off. The instructions depend on the gearbox mode: arcade, realistic manual with automatic clutch, or realistic manual.

## Example

```lua
ui_firstDrive_moveOff.setEnabled(true)
-- the interface receives the FirstDriveMoveOffState event on each instruction change
local state = ui_firstDrive_moveOff.getState()
```

## Notes

- UI event: FirstDriveMoveOffState, with { label, steps, sectionIndex, sectionCount, active }. Each step contains action, actionLabel, inputType ("press", "hold" or "release"), status ("complete", "current" or "upcoming") and possibly separator ("or"). On deactivation, { active = false } is sent.
- The number of sections is 5 in arcade and in automatic clutch, 6 in realistic manual (extra step to shift to neutral before driving off).
- The hook onFirstDriveMoveOffSectionCompleted is emitted (once, with the section name: engineOn, moveOff, stopping, reverse or engineOff) after the state update that completed the section.
- Thresholds used: wheel speed 0.5 m/s for "moving", 1.5 m/s to validate reversing, 1500 RPM before releasing the clutch, brake 0.2, clutch held from 0.8 and released below 0.15. A 2 s pause separates each section and 0.3 s is waited after each vehicle change to let the values refresh.
- The mode (arcade, realisticAutoClutch, realisticManual) is determined by the gearboxMode value of the vehicle's mainController (fallback: setting defaultGearboxBehavior, "arcade"), then by the autoClutch setting.
- The extension disables itself on onExtensionUnloaded and onClientEndMission; a settings change restarts the vehicle tracking after 0.1 s.
- Only player 0 is tracked: onVehicleSwitched ignores the other players.

**Dependencies (loaded first):** `ui_appContainers`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_firstDrive_moveOff.getEnabled()` | Indicates whether the tutorial is active. | 654 |
| `ui_firstDrive_moveOff.getState()` | Returns the last published instruction (label, steps, sectionIndex, sectionCount, active), or nil if nothing is displayed. | 588 |
| `ui_firstDrive_moveOff.onClientEndMission()` | Hook called at the end of the level: disables the tutorial. *(internal)* *(hook)* | 649 |
| `ui_firstDrive_moveOff.onExtensionUnloaded()` | Hook called when the extension is unloaded: disables the tutorial. *(internal)* *(hook)* | 645 |
| `ui_firstDrive_moveOff.onSettingsChanged()` | Hook called when the settings change. If active, restarts the vehicle tracking after 0.1 s, which rereads the gearbox mode. *(internal)* *(hook)* | 636 |
| `ui_firstDrive_moveOff.onUpdate(dtReal)` | Hook called every frame with dtReal (real seconds). Reconfigures the tracking if the player's vehicle changes, waits for the delays to end, computes the current instruction, publishes it to the interface if it has changed and emits onFirstDriveMoveOffSectionCompleted when a section has just been validated. *(internal)* *(hook)* | 592 |
| `ui_firstDrive_moveOff.onVehicleDestroyed(vehicleId)` | Hook called when a vehicle is destroyed: stops the tracking if it is the tracked vehicle. *(internal)* *(hook)* | 632 |
| `ui_firstDrive_moveOff.onVehicleReplaced(vehicleId)` | Hook called when a vehicle is replaced; same handling as onVehicleDestroyed. *(internal)* *(hook)* | 632 |
| `ui_firstDrive_moveOff.onVehicleSwitched(_, newVehicleId, player)` | Hook called when the player's vehicle changes. Restarts the tracking on the new vehicle (ignored if inactive or if player is not 0). *(internal)* *(hook)* | 627 |
| `ui_firstDrive_moveOff.setEnabled(value)` | Enables or disables the tutorial. On enable, starts following player 0's vehicle (subscriptions to the values throttle_input, brake_input, clutch_input, gearIndex, engineRunning, rpm, wheelspeed); on disable, unsubscribes, hides the application and sends { active = false }. No effect if the state does not change. | 576 |

### Parameter details

#### `ui_firstDrive_moveOff.getEnabled()`

Indicates whether the tutorial is active.

- **returns**: boolean true if active.

#### `ui_firstDrive_moveOff.getState()`

Returns the last published instruction (label, steps, sectionIndex, sectionCount, active), or nil if nothing is displayed.

- **returns**: table|nil Last state sent to the interface.

#### `ui_firstDrive_moveOff.onUpdate(dtReal)`

Hook called every frame with dtReal (real seconds). Reconfigures the tracking if the player's vehicle changes, waits for the delays to end, computes the current instruction, publishes it to the interface if it has changed and emits onFirstDriveMoveOffSectionCompleted when a section has just been validated.

- `dtReal` (*number*) : Real frame duration in seconds.

#### `ui_firstDrive_moveOff.onVehicleDestroyed(vehicleId)`

Hook called when a vehicle is destroyed: stops the tracking if it is the tracked vehicle.

- `vehicleId` (*integer*) : Identifier of the destroyed vehicle.

#### `ui_firstDrive_moveOff.onVehicleReplaced(vehicleId)`

Hook called when a vehicle is replaced; same handling as onVehicleDestroyed.

- `vehicleId` (*integer*) : Identifier of the replaced vehicle.

#### `ui_firstDrive_moveOff.onVehicleSwitched(_, newVehicleId, player)`

Hook called when the player's vehicle changes. Restarts the tracking on the new vehicle (ignored if inactive or if player is not 0).

- `_` (*any*) : Identifier of the old vehicle (not used).
- `newVehicleId` (*integer|nil*) : Identifier of the new vehicle.
- `player` (*integer|nil*) : Index of the player concerned.

#### `ui_firstDrive_moveOff.setEnabled(value)`

Enables or disables the tutorial. On enable, starts following player 0's vehicle (subscriptions to the values throttle_input, brake_input, clutch_input, gearIndex, engineRunning, rpm, wheelspeed); on disable, unsubscribes, hides the application and sends { active = false }. No effect if the state does not change.

- `value` (*boolean*) : Only true enables; any other value disables.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before this one: ui_appContainers. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onFirstDriveMoveOffSectionCompleted`

## Calls into the engine (C++)

- `be:` `getPlayerVehicle`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/firstDrive/moveOff.lua`.*
