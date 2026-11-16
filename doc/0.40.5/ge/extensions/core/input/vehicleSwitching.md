# `core_input_vehicleSwitching`

*File: `lua/ge/extensions/core/input/vehicleSwitching.lua` · VM: Game Engine (GE) · 103 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_input_vehicleSwitching`: `extensions.load("core_input_vehicleSwitching")`, then the global `core_input_vehicleSwitching`

GE extension `core_input_vehicleSwitching`: implements switching to the next/previous vehicle (vehicle switch keys). It can follow a custom order (list of ids defined by setVehicleOrder) or iterate over all usable active vehicles, ignoring the 'unicycle', vehicles with playerUsable == false and those that gameplay_seatOccupants refuses. In multiplayer, the request is delegated to multiplayer_vehicleSync.

## Example

```lua
-- switch to the next vehicle for player 0
core_input_vehicleSwitching.switchCycleVehicle(0, 1)
-- force an order
core_input_vehicleSwitching.setVehicleOrder({idA, idB, idC})
```

## Notes

- dir: +1 = next, -1 = previous (the computation uses dir * step with modulo).
- If a custom order is defined but the player is not in the list (and no lastIndex), or no valid target exists, the order is deleted (vehicleOrder = nil) and the default behavior applies. The order is therefore only valid once.
- Hooks emitted on a switch: trackNewVeh, onVehicleSwitchPerformendByUser (typo 'Performend' in the hook name, to be used as is), onVehicleCycleSwitchPerformedByUser(dir, player, vehId).
- Inconsistencies: lastIndex is always -1 and is never modified; in applySwitchCycleVehicle, be is used (be:getPlayerVehicleID) before the `if be` test.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_input_vehicleSwitching.applySwitchCycleVehicle(player, dir)` | Actually performs the switch: looks for the target (custom order then default order), calls be:enterVehicle and emits the hooks. | 50 |
| `core_input_vehicleSwitching.setVehicleOrder(order)` | Defines the custom vehicle traversal order (list of ids). nil to go back to the default order. | 8 |
| `core_input_vehicleSwitching.switchCycleVehicle(player, dir)` | Entry point: switches vehicle for the player. In multiplayer (multiplayer_vehicleSync present), sends requestSwitchCycleVehicle; otherwise calls applySwitchCycleVehicle. | 89 |

### Parameter details

#### `core_input_vehicleSwitching.applySwitchCycleVehicle(player, dir)`

Actually performs the switch: looks for the target (custom order then default order), calls be:enterVehicle and emits the hooks.

- `player` (*integer|nil*) : Player index, default 0; -1 = ignored.
- `dir` (*integer*) : +1 next, -1 previous.

#### `core_input_vehicleSwitching.setVehicleOrder(order)`

Defines the custom vehicle traversal order (list of ids). nil to go back to the default order.

- `order` (*integer[]|nil*) : Vehicle ids.

#### `core_input_vehicleSwitching.switchCycleVehicle(player, dir)`

Entry point: switches vehicle for the player. In multiplayer (multiplayer_vehicleSync present), sends requestSwitchCycleVehicle; otherwise calls applySwitchCycleVehicle.

- `player` (*integer|nil*) : Player index, default 0; -1 = ignored.
- `dir` (*integer*) : +1 next, -1 previous.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onVehicleCycleSwitchPerformedByUser`
- `onVehicleSwitchPerformendByUser` — listened to by 1 module(s)
- `trackNewVeh`

## Calls into the engine (C++)

- `be:` `enterVehicle`, `getObject`, `getObjectCount`, `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/input/vehicleSwitching.lua`.*
