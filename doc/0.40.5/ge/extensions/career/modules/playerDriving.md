# `career_modules_playerDriving`

*File: `lua/ge/extensions/career/modules/playerDriving.lua` · VM: Game Engine (GE) · 379 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_playerDriving`: `extensions.load("career_modules_playerDriving")`, then the global `career_modules_playerDriving`

Handles the player's driving in career: setup of traffic and parked vehicles, tracking of the player state (parked, traffic, police pursuit), arrest fines, tutorial phases (traffic hidden then restored), teleport to the garage (with trailer), retrieval of the favorite vehicle and display of a position by camera. Uses gameplay_traffic, gameplay_parking and gameplay_police.

## Example

```lua
local d = career_modules_playerDriving.getPlayerData()
if career_modules_playerDriving.playerPursuitActive() then ... end
```

## Notes

- playerData: {maxTrafficAmount, maxParkingAmount, defaultTrafficAmount = 1, isParked, traffic, parking}.
- debugMode is `not shipping_build` (boolean): in debug mode, the traffic and parked vehicle amounts are not bounded; otherwise they are bounded between 2 and 50. If the trafficRestrictForCareer setting is active (outside shipping builds), both amounts are 1.
- Police arrest fine: data.mode * data.uniqueOffensesCount * 100 (marked WIP in the code), paid without canBeNegative: if the player cannot pay, pay fails without debiting anything.
- After the tutorial or at the end of a mission, the police vehicle spawn probability is set to 0.15; during the tutorial it is 0.
- teleportTrailerJob computes trailerBB with vehicle:getSpawnWorldOOBB() instead of the trailer's (probable bug: the trailer is placed according to the size of the towing vehicle).
- onUpdate is a skeleton ("career police logic") with no effect.
- Player updates (setPlayerData) are not done during the tutorial or during a foreground mission.

**Dependencies (loaded first):** `career_career`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_playerDriving.getPlayerData()` | Returns the player state table (traffic, parking, maximum amounts). | 15 |
| `career_modules_playerDriving.onCareerActive(active)` | Hook: starts setupTraffic if the career is active and traffic was never prepared; enables special triggers during loading to precompute garage lighting. *(internal)* *(hook)* | 315 |
| `career_modules_playerDriving.onPursuitAction(vehId, action, data)` | Pursuit hook: disables parking tracking at start, re-enables it on reset/evade, and issues a fine on arrest (UI message). *(internal)* *(hook)* | 262 |
| `career_modules_playerDriving.onTrafficOrParkingReady()` | Hook: when traffic and parked cars are ready, closes the careerVehicles loading screen and disables special triggers; during the tutorial, hides them and remembers their amounts. *(internal)* *(hook)* | 283 |
| `career_modules_playerDriving.onTrafficStarted()` | Hook: when traffic activates, remembers the maximum amounts and resets the player state (outside the tutorial and missions). *(internal)* *(hook)* | 245 |
| `career_modules_playerDriving.onTrafficStopped()` | Hook: clears the player's traffic data. *(internal)* *(hook)* | 258 |
| `career_modules_playerDriving.onUpdate(dtReal, dtSim, dtRaw)` | Frame hook: effectively empty ("career police logic" not implemented). *(internal)* *(hook)* | 309 |
| `career_modules_playerDriving.onVehicleParkingStatus(vehId, data)` | Parking hook: sets playerData.isParked to true (valid event) or false (exit) for the player vehicle, outside missions and the tutorial. *(internal)* *(hook)* | 233 |
| `career_modules_playerDriving.onVehicleSwitched(oldId, newId)` | Hook: updates the player data for the new vehicle (outside the tutorial and missions). *(internal)* *(hook)* | 303 |
| `career_modules_playerDriving.playerPursuitActive()` | Indicates whether the player is being pursued by the police (pursuit.mode different from 0). | 107 |
| `career_modules_playerDriving.resetPlayerState()` | Recomputes the player data for the current vehicle, sets the traffic variables, police (arrest radius 15, evasion time 30) and parking (precision 0.2), and resets the player's traffic tracking. | 111 |
| `career_modules_playerDriving.restoreTrafficAfterTutorialPhase()` | Re-enables traffic if it was turned off, restores the remembered active amounts (or those from the settings if null) then calls setTrafficAfterTutorial. | 141 |
| `career_modules_playerDriving.retrieveFavoriteVehicle()` | Brings the inventory's favorite vehicle to the player's position: teleports it if it exists, otherwise spawns it if it is accessible and does not need repair. | 157 |
| `career_modules_playerDriving.setTrafficAfterTutorial()` | End of tutorial phase: disperses traffic and parked cars, resets the player state and sets the police probability to 0.15. | 125 |
| `career_modules_playerDriving.setTrafficForTutorial()` | Tutorial phase: disperses parked cars and traffic, hides the parked ones (amount 0), sets active traffic to maxTrafficAmount and sets police to 0. | 117 |
| `career_modules_playerDriving.showPosition(pos)` | Orients the player (walking mode) toward pos; if a static obstacle blocks the view, plays a short camera path (5.5 s) that shows the position then returns to the vehicle camera. | 340 |
| `career_modules_playerDriving.teleportToGarage(garageId, veh, resetVeh)` | Teleports the vehicle to the garage, cancels mission navigation, turns off the ignition, handles a possible trailer (deferred teleport, then deletion after part conditions are updated) and checks the minimum fuel. | 205 |

### Parameter details

#### `career_modules_playerDriving.getPlayerData()`

Returns the player state table (traffic, parking, maximum amounts).

- **returns**: table playerData (direct reference).

#### `career_modules_playerDriving.onCareerActive(active)`

Hook: starts setupTraffic if the career is active and traffic was never prepared; enables special triggers during loading to precompute garage lighting.

- `active` (*boolean*) : Activation state.

#### `career_modules_playerDriving.onPursuitAction(vehId, action, data)`

Pursuit hook: disables parking tracking at start, re-enables it on reset/evade, and issues a fine on arrest (UI message).

- `vehId` (*integer*) : Vehicle id.
- `action` (*string*) : start, reset, evade or arrest.
- `data` (*table*) : Pursuit data (mode, uniqueOffensesCount).

#### `career_modules_playerDriving.onUpdate(dtReal, dtSim, dtRaw)`

Frame hook: effectively empty ("career police logic" not implemented).

- `dtReal` (*number*) : Real time (s).
- `dtSim` (*number*) : Simulated time (s).
- `dtRaw` (*number*) : Raw time (s).

#### `career_modules_playerDriving.onVehicleParkingStatus(vehId, data)`

Parking hook: sets playerData.isParked to true (valid event) or false (exit) for the player vehicle, outside missions and the tutorial.

- `vehId` (*integer*) : Vehicle id.
- `data` (*table*) : Event data (event).

#### `career_modules_playerDriving.onVehicleSwitched(oldId, newId)`

Hook: updates the player data for the new vehicle (outside the tutorial and missions).

- `oldId` (*integer*) : Old vehicle.
- `newId` (*integer*) : New vehicle.

#### `career_modules_playerDriving.playerPursuitActive()`

Indicates whether the player is being pursued by the police (pursuit.mode different from 0).

- **returns**: boolean|nil true if a pursuit is in progress, false or nil otherwise.

#### `career_modules_playerDriving.showPosition(pos)`

Orients the player (walking mode) toward pos; if a static obstacle blocks the view, plays a short camera path (5.5 s) that shows the position then returns to the vehicle camera.

- `pos` (*vec3*) : Position to show.

#### `career_modules_playerDriving.teleportToGarage(garageId, veh, resetVeh)`

Teleports the vehicle to the garage, cancels mission navigation, turns off the ignition, handles a possible trailer (deferred teleport, then deletion after part conditions are updated) and checks the minimum fuel.

- `garageId` (*string*) : Garage identifier.
- `veh` (*userdata*) : Vehicle object.
- `resetVeh` (*boolean|nil*) : If true, resets the vehicle on teleport.

## Fields

| Field | Type | Description |
|---|---|---|
| `debugMode` | boolean | not shipping_build: true outside distribution builds. ⚠ reference `not` not defined in the file (probably nil) |
| `dependencies` | table<integer, string> | Extensions loaded before: career_career. |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/playerDriving.lua`.*
