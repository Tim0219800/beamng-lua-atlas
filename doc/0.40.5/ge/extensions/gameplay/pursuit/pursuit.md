# `gameplay_pursuit_pursuit`

*File: `lua/ge/extensions/gameplay/pursuit/pursuit.lua` · VM: Game Engine (GE) · 784 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_pursuit_pursuit`: `extensions.load("gameplay_pursuit_pursuit")`, then the global `gameplay_pursuit_pursuit`

Pursuit mode manager: a gameplay event where several "chase" vehicles (police) pursue several "flee" vehicles (fugitives), players or AI. Only one instance at a time. It inserts the vehicles (police/suspect roles), handles the goals (free, timed, score, destination modes), the start (manual or at a given speed), arrests, recovery of released fugitives and stuck detection. The manager states are 'off', 'ready', 'active', 'inactive' and 'complete'.

## Example

```lua
local p = gameplay_pursuit_pursuit
p.setupPursuit(policeId, suspectId, {gameMode = 'timed', timeLimit = 120, recoveryMode = 'basic'})
p.start()
```

## Notes

- Options read: gameMode, timeLimit, scoreGoal, arrestGoal, locationGoal, startSpeed (auto start when a fugitive reaches this speed, m/s), recoveryMode ('none', 'basic', 'teleportRoad', 'teleportStart', 'teleportRandom', otherwise fade only), autoRecovery, shuffleVehGroups, shuffleSpots, zoneName.
- Goal constraints (setupGoals): timed mode -> time >= 30 s and arrestGoal = number of fugitives if <= 0; score mode -> score >= 100; destination mode -> locations >= 1.
- Winners passed to stop(winner) and to the onPursuitGameplayFinished hook: 'flee' or 'chase'; time elapsed in timed mode = fugitives win, otherwise the pursuers; 'none' if all vehicles are stuck.
- A 10 s grace period (defaults.graceTime) prevents arrests and stuck detection at the start; all vehicles under 2.5 m/s for 10 consecutive seconds are considered stuck.
- Emitted hooks: onPursuitGameplayStarted, onPursuitGameplayFinished({winningTeam}), onPursuitGameplayEvent('recoverAll'|'stuckAll'), onPursuitAction (for fugitives).
- Probable bug in onPursuitAction (arrest): the loop over chaseVehs reuses the name vehId for its variable, so `vehData.role.targetId == vehId` compares to the pursuer's own id, not the arrested one's.
- Probable bug in onPursuitAction (evade): the next-target test uses `targetVeh.pursuitUsable` (already set to false) instead of vehData.pursuitUsable: nextTargetId stays nil and the pursuers are simply reset.
- Probable bug in setupVehiclesFromFiles: parkingSpots is redeclared as `local` inside the if block, the outer variable stays nil: the start points from the sites files are never used (automatic 'roadAhead' placement).
- When a vehicle is already in traffic, its data is shared (isShared); it has ignorePursuit = true so the main police system ignores it.
- reset() is called on module load and also resets the gameplay_police pursuit variables.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_pursuit_pursuit.filterParkingSpots(parkingSpots, chaseAmount, fleeAmount)` | Copies the parking point list and, if both quantities are given, rearranges it into n points tagged 'chase' then n points tagged 'flee' (without the opposite tag). Keeps the original list if the two lists are not filled enough. | 280 |
| `gameplay_pursuit_pursuit.getManager()` | Returns the manager object (vehData, vehIds, chaseVehs, fleeVehs, options, goals, state, running, data{duration, arrests, totalScore, tempScore, locations, roadblocks}). | 507 |
| `gameplay_pursuit_pursuit.insertVeh(vehId, isChase, isAiControlled, options)` | Validates and inserts a vehicle into the manager. Reuses the traffic data if there is any (isShared), otherwise creates a traffic vehicle object. Gives it the police or suspect role, disables respawn and pooling, and sets the AI to 'stop' mode (or 'disabled' for a player). | 106 |
| `gameplay_pursuit_pursuit.onDeserialized(data)` | Hook after Lua reload: resets then restores the manager and reinserts the vehicles. *(internal)* *(hook)* | 746 |
| `gameplay_pursuit_pursuit.onPursuitAction(vehId, action, pursuit)` | Hook emitted by gameplay_police for a pursuit action. Active only if the state is 'active' and for a fugitive: 'arrest' counts the arrest, 'evade' removes the fugitive from targeting, 'release' applies the recoveryMode. *(internal)* *(hook)* | 511 |
| `gameplay_pursuit_pursuit.onSerialize()` | Hook before Lua reload: returns the manager state (options, goals, data, state) and the serialized vehicle data. *(internal)* *(hook)* | 719 |
| `gameplay_pursuit_pursuit.onTrafficAmountChanged()` | Hook on change of the number of traffic vehicles; does nothing. *(internal)* *(hook)* | 716 |
| `gameplay_pursuit_pursuit.onTrafficStarted()` | Hook at traffic start: replaces the traffic entries with the manager's data for the vehicles that are part of it. *(internal)* *(hook)* | 704 |
| `gameplay_pursuit_pursuit.onTrafficStopped()` | Hook at traffic stop; does nothing. *(internal)* *(hook)* | 713 |
| `gameplay_pursuit_pursuit.onUpdate(dt, dtSim)` | Called every frame. Updates the non-shared vehicles, triggers the automatic start (options.startSpeed), and in active play: duration, targeting every second, stuck detection, recovery, fades, total score and victory conditions. *(internal)* *(hook)* | 560 |
| `gameplay_pursuit_pursuit.onVehicleGroupSpawned(vehList, groupId, groupName)` | core_multiSpawn hook: when the 'autoPursuitChase' then 'autoPursuitFlee' groups have spawned, calls setupPursuitMulti with the stored data; fails (reset) if one of the groups is empty. *(internal)* *(hook)* | 682 |
| `gameplay_pursuit_pursuit.removeVeh(vehId)` | Removes a vehicle from the manager and gives it back its automatic traffic role if it is part of it. | 159 |
| `gameplay_pursuit_pursuit.reset()` | Completely resets the manager (stops the gameplay if running, clears the vehicles, sets the state to 'off', resets the vehicles and the gameplay_police variables). | 221 |
| `gameplay_pursuit_pursuit.restart()` | Sets the gameplay back to the 'ready' state without clearing the manager: resets the data, the pursuits and returns the vehicles to their original position (interactRecovery loadHome). Does not start. | 241 |
| `gameplay_pursuit_pursuit.setupGoals(options)` | Computes the goals (mode, time, score, arrests, locations) from the options; applies minimums depending on the mode. | 70 |
| `gameplay_pursuit_pursuit.setupPursuit(chaseVehId, fleeVehId, options, pursuitVars)` | Creates a pursuit with one existing pursuer and one existing fugitive (first resets the manager if it is not 'off'). Moves to the 'ready' state. | 310 |
| `gameplay_pursuit_pursuit.setupPursuitMulti(chaseVehIds, fleeVehIds, options, pursuitVars)` | Creates a pursuit with several pursuers and fugitives. Fails (reset) if there is no pursuer or no fugitive inserted; warns if some failed. | 342 |
| `gameplay_pursuit_pursuit.setupVehicles(chaseAmount, fleeAmount, chaseVehGroup, fleeVehGroup, parkingSpots, options, pursuitVars)` | Spawns the vehicle groups (core_multiSpawn.spawnGroup, names 'autoPursuitChase' and 'autoPursuitFlee') then, via onVehicleGroupSpawned, calls setupPursuitMulti. Uses the provided parking points, otherwise places the vehicles on the road ahead (15 m gap). | 420 |
| `gameplay_pursuit_pursuit.setupVehiclesFromFiles(chaseAmount, fleeAmount, chaseVehGroupFile, fleeVehGroupFile, sitesFile, options, pursuitVars)` | Like setupVehicles but reads the vehicle groups (data field) from JSON files, and optionally the parking points from a sites file (optional zone options.zoneName, shuffle options.shuffleSpots, filter by chase/flee tags). | 448 |
| `gameplay_pursuit_pursuit.start()` | Starts the gameplay ('ready' or 'inactive' states only): activates the vehicles (pursuers in pursuitStart action level 3, fugitives in fleePolice) and emits onPursuitGameplayStarted. | 250 |
| `gameplay_pursuit_pursuit.stop(winner)` | Stops the active gameplay. With a winner, the state becomes 'complete', the fugitives' pursuits are reset and onPursuitGameplayFinished is emitted; without a winner, the state becomes 'inactive'. | 258 |

### Parameter details

#### `gameplay_pursuit_pursuit.filterParkingSpots(parkingSpots, chaseAmount, fleeAmount)`

Copies the parking point list and, if both quantities are given, rearranges it into n points tagged 'chase' then n points tagged 'flee' (without the opposite tag). Keeps the original list if the two lists are not filled enough.

- `parkingSpots` (*table[]*) : Parking points with customFields.tags.
- `chaseAmount` (*integer|nil*) : Number of chase points wanted.
- `fleeAmount` (*integer|nil*) : Number of flee points wanted.
- **returns**: table[] Filtered list (shallow copy).

#### `gameplay_pursuit_pursuit.getManager()`

Returns the manager object (vehData, vehIds, chaseVehs, fleeVehs, options, goals, state, running, data{duration, arrests, totalScore, tempScore, locations, roadblocks}).

- **returns**: table Manager (direct reference).

#### `gameplay_pursuit_pursuit.insertVeh(vehId, isChase, isAiControlled, options)`

Validates and inserts a vehicle into the manager. Reuses the traffic data if there is any (isShared), otherwise creates a traffic vehicle object. Gives it the police or suspect role, disables respawn and pooling, and sets the AI to 'stop' mode (or 'disabled' for a player).

- `vehId` (*integer*) : Vehicle id.
- `isChase` (*boolean*) : true = pursuer, false = fugitive.
- `isAiControlled` (*boolean*) : true if driven by the AI (not usable by the player).
- `options` (*table|nil*) : Options (not used in the function).
- **returns**: boolean|nil true if inserted, false if the data could not be created, nil if id is missing or already inserted.

#### `gameplay_pursuit_pursuit.onDeserialized(data)`

Hook after Lua reload: resets then restores the manager and reinserts the vehicles.

- `data` (*table*) : Result of onSerialize.

#### `gameplay_pursuit_pursuit.onPursuitAction(vehId, action, pursuit)`

Hook emitted by gameplay_police for a pursuit action. Active only if the state is 'active' and for a fugitive: 'arrest' counts the arrest, 'evade' removes the fugitive from targeting, 'release' applies the recoveryMode.

- `vehId` (*integer*) : Fugitive concerned.
- `action` (*string*) : 'start', 'arrest', 'evade', 'release', 'roadblockAlert', 'roadblock'.
- `pursuit` (*table*) : Pursuit data of the vehicle.

#### `gameplay_pursuit_pursuit.onSerialize()`

Hook before Lua reload: returns the manager state (options, goals, data, state) and the serialized vehicle data.

- **returns**: table {manager, vehicles}

#### `gameplay_pursuit_pursuit.onUpdate(dt, dtSim)`

Called every frame. Updates the non-shared vehicles, triggers the automatic start (options.startSpeed), and in active play: duration, targeting every second, stuck detection, recovery, fades, total score and victory conditions.

- `dt` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).

#### `gameplay_pursuit_pursuit.onVehicleGroupSpawned(vehList, groupId, groupName)`

core_multiSpawn hook: when the 'autoPursuitChase' then 'autoPursuitFlee' groups have spawned, calls setupPursuitMulti with the stored data; fails (reset) if one of the groups is empty.

- `vehList` (*integer[]*) : Ids of the spawned vehicles.
- `groupId` (*any*) : Group id (unused).
- `groupName` (*string*) : Group name.

#### `gameplay_pursuit_pursuit.removeVeh(vehId)`

Removes a vehicle from the manager and gives it back its automatic traffic role if it is part of it.

- `vehId` (*integer*) : Vehicle id.

#### `gameplay_pursuit_pursuit.setupGoals(options)`

Computes the goals (mode, time, score, arrests, locations) from the options; applies minimums depending on the mode.

- `options` (*table|nil*) : gameMode, timeLimit, scoreGoal, arrestGoal, locationGoal; default manager.options.

#### `gameplay_pursuit_pursuit.setupPursuit(chaseVehId, fleeVehId, options, pursuitVars)`

Creates a pursuit with one existing pursuer and one existing fugitive (first resets the manager if it is not 'off'). Moves to the 'ready' state.

- `chaseVehId` (*integer*) : Pursuer id.
- `fleeVehId` (*integer*) : Fugitive id.
- `options` (*table|nil*) : Gameplay options.
- `pursuitVars` (*table|nil*) : Variables passed to gameplay_police.setPursuitVars.
- **returns**: boolean false if one of the vehicles is not found.

#### `gameplay_pursuit_pursuit.setupPursuitMulti(chaseVehIds, fleeVehIds, options, pursuitVars)`

Creates a pursuit with several pursuers and fugitives. Fails (reset) if there is no pursuer or no fugitive inserted; warns if some failed.

- `chaseVehIds` (*integer[]*) : Pursuer ids.
- `fleeVehIds` (*integer[]*) : Fugitive ids.
- `options` (*table|nil*) : Gameplay options.
- `pursuitVars` (*table|nil*) : Pursuit variables.
- **returns**: boolean true if the setup is ready.

#### `gameplay_pursuit_pursuit.setupVehicles(chaseAmount, fleeAmount, chaseVehGroup, fleeVehGroup, parkingSpots, options, pursuitVars)`

Spawns the vehicle groups (core_multiSpawn.spawnGroup, names 'autoPursuitChase' and 'autoPursuitFlee') then, via onVehicleGroupSpawned, calls setupPursuitMulti. Uses the provided parking points, otherwise places the vehicles on the road ahead (15 m gap).

- `chaseAmount` (*integer|nil*) : Number of pursuers (default 1).
- `fleeAmount` (*integer|nil*) : Number of fugitives (default 1).
- `chaseVehGroup` (*table|nil*) : Vehicle group {model, config...} of the pursuers.
- `fleeVehGroup` (*table|nil*) : Fugitives' group.
- `parkingSpots` (*table[]|nil*) : Points {pos, rot}, the first ones for the pursuers.
- `options` (*table|nil*) : Options (shuffleVehGroups...).
- `pursuitVars` (*table|nil*) : Pursuit variables.
- **returns**: boolean false if a quantity is less than 1.

#### `gameplay_pursuit_pursuit.setupVehiclesFromFiles(chaseAmount, fleeAmount, chaseVehGroupFile, fleeVehGroupFile, sitesFile, options, pursuitVars)`

Like setupVehicles but reads the vehicle groups (data field) from JSON files, and optionally the parking points from a sites file (optional zone options.zoneName, shuffle options.shuffleSpots, filter by chase/flee tags).

- `chaseAmount` (*integer*) : Number of pursuers (>= 1).
- `fleeAmount` (*integer*) : Number of fugitives (>= 1).
- `chaseVehGroupFile` (*string*) : Path of the pursuer group JSON.
- `fleeVehGroupFile` (*string*) : Path of the fugitive group JSON.
- `sitesFile` (*string|nil*) : Path of the sites file.
- `options` (*table|nil*) : Options (zoneName, shuffleSpots, shuffleVehGroups...).
- `pursuitVars` (*table|nil*) : Pursuit variables.
- **returns**: boolean false if the quantities are invalid or a group file is unreadable.

#### `gameplay_pursuit_pursuit.stop(winner)`

Stops the active gameplay. With a winner, the state becomes 'complete', the fugitives' pursuits are reset and onPursuitGameplayFinished is emitted; without a winner, the state becomes 'inactive'.

- `winner` (*string|nil*) : 'flee', 'chase' or another non-nil value to finish; nil to simply pause.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onPursuitAction` — listened to by 3 module(s)
- `onPursuitGameplayEvent`
- `onPursuitGameplayFinished`
- `onPursuitGameplayStarted`

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/pursuit/pursuit.lua`.*
