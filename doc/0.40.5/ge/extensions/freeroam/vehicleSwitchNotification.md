# `freeroam_vehicleSwitchNotification`

*File: `lua/ge/extensions/freeroam/vehicleSwitchNotification.lua` · VM: Game Engine (GE) · 168 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `freeroam_vehicleSwitchNotification`: `extensions.load("freeroam_vehicleSwitchNotification")`, then the global `freeroam_vehicleSwitchNotification`

Displays an on-screen notification when the player changes vehicle or seat: vehicle name (brand, name, configuration), icon by type, occupied seat or spectator mode, and the number of selectable vehicles (current position). Clears the message when the player has no vehicle anymore or switches to walking mode (unicycle). Goes through guihooks.trigger('Message', ...) with the category "vehicleSwitch<player>". Global: freeroam_vehicleSwitchNotification.

## Notes

- Icon: Trailer -> smallTrailer, Prop -> trafficCone, Truck -> boxTruck, Car -> car, other type -> beamNG; default car.
- The vehicles counted as "selectable" exclude: unicycle, non-playerUsable, inactive, blacklisted (gameplay_walk.isVehicleBlacklisted) and the Types PropParked/PropTraffic. If the switch_next_vehicle/switch_previous_vehicle actions are blocked, the count is forced to 1 / index 0.
- The message depends on presence.seatId (seat, via gameplay_seatOccupants.getSeats for the name) or on presence.permissionMode ('passenger' = spectator, otherwise full controls).
- Message TTL: 5 s.

## Functions

| Function | Description | Line |
|---|---|---|
| `freeroam_vehicleSwitchNotification.onPlayerVehiclePresenceChanged(player, _, presence)` | Hook called when a player's presence in a vehicle/seat changes: displays the corresponding notification. *(internal)* *(hook)* | 159 |
| `freeroam_vehicleSwitchNotification.onVehicleSwitched(_, newId, player)` | Vehicle change hook: if the new vehicle does not exist or is the unicycle, clears this player's notification (clear=true). *(internal)* *(hook)* | 147 |

### Parameter details

#### `freeroam_vehicleSwitchNotification.onPlayerVehiclePresenceChanged(player, _, presence)`

Hook called when a player's presence in a vehicle/seat changes: displays the corresponding notification.

- `player` (*integer|nil*) : Player (default 0).
- `_` (*any*) : Unused (old presence, inferred from code).
- `presence` (*table|nil*) : {vehicleId, seatId?, permissionMode?}

#### `freeroam_vehicleSwitchNotification.onVehicleSwitched(_, newId, player)`

Vehicle change hook: if the new vehicle does not exist or is the unicycle, clears this player's notification (clear=true).

- `_` (*integer*) : Old id (unused).
- `newId` (*integer*) : New id (-1 = none).
- `player` (*integer|nil*) : Player (default 0).

**UI events (guihooks.trigger):** `Message`

## Calls into the engine (C++)

- `be:` `getObject`, `getObjectCount`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/freeroam/vehicleSwitchNotification.lua`.*
