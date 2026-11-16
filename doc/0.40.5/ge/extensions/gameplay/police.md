# `gameplay_police`

*File: `lua/ge/extensions/gameplay/police.lua` · VM: Game Engine (GE) · 806 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_police`: `extensions.load("gameplay_police")`, then the global `gameplay_police`

Traffic police logic: tracks vehicles with the 'police' role, handles pursuits (levels -1 to 3 depending on the offense score), arrest, evasion, release, roadblocks (vehicles and props), and the queue of random suspects. It relies on gameplay_traffic (traffic data, roles). A modder uses it to start or end a pursuit, set the pursuit variables or set up a roadblock.

## Example

```lua
gameplay_police.setPursuitVars({arrestTime = 3, evadeTime = 30})
gameplay_police.setupPursuitGameplay(suspectId, {policeId1, policeId2})
gameplay_police.setPursuitMode(2, suspectId)
local ok, isPolice = gameplay_police.isVehicleInPursuit(suspectId)
```

## Notes

- Pursuit levels: -1 arrested (busted), 0 none, 1 to 3 levels; the mode is bounded by clamp(-1, 3). The level is triggered by pursuit.score against vars.scoreLevels (default {100, 500, 2000}).
- Default pursuit variables (vars): scoreLevels, strictness 0.5, arrestTime 5, arrestRadius 20, evadeTime 45, evadeRadius 80, suspectFrequency 0.5, roadblockFrequency 0.5, useVisibility true, autoRelease true.
- setPoliceVars/getPoliceVars and getPolice are aliases of setPursuitVars/getPursuitVars and getPoliceVehicles.
- setPursuitVars(nil) or (false) resets the variables; a table is merged into the current variables.
- The variables are reset at the end of the level (onClientEndMission); they are kept by onSerialize/onDeserialized.
- The extension does nothing if M.enabled is false, if physics is disabled (be:getEnabled) or if traffic is not in the 'on' state.
- The random suspect timer only advances if gameplay_traffic.getTrafficVars().enableRandomEvents is true and vars.suspectFrequency > 0.
- Emitted hooks: onPursuitAction(id, 'start'|'arrest'|'evade'|'release', pursuit) and onPursuitModeUpdate(id, {mode}).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_police.arrestVehicle(id, showMessages)` | Immediately declares a vehicle arrested: optional messages (ticket or arrest, list of offenses), emits onPursuitAction 'arrest' then setPursuitMode(-1) for the police targeting it. Works as intended if the target has the suspect role. | 456 |
| `gameplay_police.checkRoadblock(vehIds, rbWidth, useLength)` | Indicates how many of the provided vehicles fit in the width of a roadblock (from shortest to longest, length = largest extent of the box, or the axis chosen by useLength). | 56 |
| `gameplay_police.evadeVehicle(id, showMessages)` | Immediately declares that a vehicle escaped the police: emits onPursuitAction 'evade' then setPursuitMode(0). | 493 |
| `gameplay_police.getNearestPoliceVehicle(targetId, isVisible, isUsable)` | Active police closest to the target, based on the distances cached in role.validTargets. | 277 |
| `gameplay_police.getPolice()` | Alias of getPoliceVehicles. | 273 |
| `gameplay_police.getPoliceVars()` | Alias of getPursuitVars. | 603 |
| `gameplay_police.getPoliceVehicles()` | Table of the traffic police vehicles, by vehicle id (gameplay_traffic data). Alias: getPolice. | 273 |
| `gameplay_police.getPursuitData(id)` | Pursuit data (veh.pursuit) of a traffic vehicle. Kept for compatibility. | 594 |
| `gameplay_police.getPursuitVars()` | Current pursuit variables. Alias: getPoliceVars. | 603 |
| `gameplay_police.insertProp(propId)` | Adds an object as a roadblock prop, if it exists, is not already a traffic vehicle and is not already registered. | 235 |
| `gameplay_police.isVehicleInPursuit(id, targetId)` | Pursuit status of a traffic vehicle: for a police vehicle, true if it is pursuing (optionally targetId); for a suspect, true if pursuit.mode > 0. | 299 |
| `gameplay_police.onClientEndMission()` | Level end hook: clears the police list and resets the pursuit variables. *(internal)* *(hook)* | 707 |
| `gameplay_police.onDeserialized(data)` | Hook after Lua reload: restores vars and policePropIds. *(internal)* *(hook)* | 762 |
| `gameplay_police.onSerialize()` | Hook before Lua reload: returns {vars, propIds} and clears the police list (rebuilt afterwards). *(internal)* *(hook)* | 756 |
| `gameplay_police.onTrafficAction(id, action, data)` | Traffic hook: tracks role changes ('changeRole' action) to add or remove a vehicle from the police list. *(internal)* *(hook)* | 607 |
| `gameplay_police.onTrafficSpecialVehiclesProviders()` | gameplay_traffic hook: registers the 'police' special vehicle provider (priority 10, at least 3 traffic vehicles in total, 25% of the total rounded up if options.police). The group comes from a group file (if options.autoLoadFromFile or the trafficSmartSelections setting), otherwise from trafficUtils.createPoliceGroup, otherwise from the fullsize/police. *(internal)* *(hook)* | 26 |
| `gameplay_police.onTrafficStarted()` | Hook at traffic start: logs the number of police vehicles and props. *(internal)* *(hook)* | 635 |
| `gameplay_police.onTrafficStopped()` | Hook at traffic stop: clears the police list. *(internal)* *(hook)* | 642 |
| `gameplay_police.onTrafficVehicleAdded(id)` | Hook: adds the vehicle to the police list if its role is 'police'. *(internal)* *(hook)* | 623 |
| `gameplay_police.onTrafficVehicleRemoved(id)` | Hook: removes the vehicle from the police list. *(internal)* *(hook)* | 629 |
| `gameplay_police.onUpdate(dt, dtSim)` | Called every frame. For each traffic vehicle, triggers setPursuitMode when the score reaches a new scoreLevels step (with a short delay at the start). Also handles the random suspect timer. *(internal)* *(hook)* | 712 |
| `gameplay_police.onVehicleDestroyed(id)` | Hook: removes the destroyed object from the props list. *(internal)* *(hook)* | 700 |
| `gameplay_police.onVehicleResetted(id)` | AI vehicle reset hook: optionally picks a random suspect among the 'standard' vehicles when the timer has elapsed, or returns a non-'wanted' suspect to the standard role. *(internal)* *(hook)* | 683 |
| `gameplay_police.onVehicleSwitched(oldId, newId)` | Controlled vehicle change hook: inserts the new vehicle into traffic if needed; on a switch on foot/in vehicle (jbeam 'unicycle') during a pursuit, transfers the pursuit data to the new vehicle, restarts the mode, and forces the arrest on a return to a vehicle in front of the police. Sets ignorePolice to avoid the self-arrest of a police officer getting out. *(internal)* *(hook)* | 646 |
| `gameplay_police.placeRoadblock(vehIds, pos, rot, placeData)` | Places vehicles in a row across a road (centered on pos, spread over placeData.width), then teleports them with core_multiSpawn.placeGroup. | 91 |
| `gameplay_police.releaseVehicle(id, showMessages)` | Releases a vehicle after arrest: emits onPursuitAction 'release' and sets the pursuit mode back to 0. If the vehicle is not traffic, sends controller.setFreeze(0) to its VM. | 519 |
| `gameplay_police.removeProp(propId)` | Removes a prop from the roadblock list. | 242 |
| `gameplay_police.setPoliceVars(data)` | Alias of setPursuitVars. | 265 |
| `gameplay_police.setPropsActive(active, reset)` | Enables or disables all registered roadblock props; with reset, calls recovery.loadHome() on each. | 226 |
| `gameplay_police.setPursuitMode(mode, targetId, policeIds)` | Sets a target's pursuit mode: -1 arrested, 0 end, 1 to 3 level. Gives the target the suspect role (fleePolice action), updates the police (pursuitStart, pursuitEnd, resetAction) and the score, then emits onPursuitModeUpdate. When going from 0 to >0, emits onPursuitAction 'start'. Has no effect if the target is not traffic or has ignorePursuit. | 325 |
| `gameplay_police.setPursuitVars(data)` | Merges data into the pursuit variables; without a valid table (nil/false), resets them to default. Alias: setPoliceVars. | 265 |
| `gameplay_police.setSuspect(id)` | Sets a traffic vehicle to the 'suspect' role with the 'watchPolice' action (kept on role refresh). | 429 |
| `gameplay_police.setSuspectTimer(time)` | Sets the delay before the next random suspect. With no argument: 120 * coef * (1 - suspectFrequency)^2 + 15 to 45 s; coef is 2, 1 after an arrest by the police player, 5 after an evasion. | 439 |
| `gameplay_police.setupPursuitGameplay(suspectId, policeIds, options)` | Prepares a pursuit scenario: inserts the suspect into traffic (without deactivation by the vehicle pool), disables its respawn, gives it the suspect role (pursuitMode), forces the 'police' role on the provided policeIds, and starts the 'watchPolice' action unless preventAutoStart. | 544 |
| `gameplay_police.setupRoadblock(targetId, roadblockVehIds, roadblockPropIds, originPos, originDirVec, activeDist, spawnDist)` | Prepares and places a roadblock in front of the target. Chooses the active police vehicles, farther than activeDist and behind the origin, that can target targetId. Looks for a road point at spawnDist ahead, computes the road width, adjusts the angle randomly, puts the police in 'roadblock' action and also places props (propIds). | 136 |

### Parameter details

#### `gameplay_police.arrestVehicle(id, showMessages)`

Immediately declares a vehicle arrested: optional messages (ticket or arrest, list of offenses), emits onPursuitAction 'arrest' then setPursuitMode(-1) for the police targeting it. Works as intended if the target has the suspect role.

- `id` (*integer*) : Arrested vehicle.
- `showMessages` (*boolean|nil*) : Show the UI messages.

#### `gameplay_police.checkRoadblock(vehIds, rbWidth, useLength)`

Indicates how many of the provided vehicles fit in the width of a roadblock (from shortest to longest, length = largest extent of the box, or the axis chosen by useLength).

- `vehIds` (*integer[]*) : Vehicle or prop ids.
- `rbWidth` (*number|nil*) : Maximum roadblock width in meters (default 10).
- `useLength` (*boolean|nil*) : nil = best axis; true = Y extent; false = X extent.
- **returns**: integer[] Ids that fit in the roadblock (nil if vehIds is not a table).
- **returns**: number Total length occupied in meters.

#### `gameplay_police.evadeVehicle(id, showMessages)`

Immediately declares that a vehicle escaped the police: emits onPursuitAction 'evade' then setPursuitMode(0).

- `id` (*integer*) : Vehicle.
- `showMessages` (*boolean|nil*) : Show the UI messages.

#### `gameplay_police.getNearestPoliceVehicle(targetId, isVisible, isUsable)`

Active police closest to the target, based on the distances cached in role.validTargets.

- `targetId` (*integer|nil*) : Target id.
- `isVisible` (*boolean|nil*) : Keep only the police that see the target (ignored if vars.useVisibility is false).
- `isUsable` (*boolean|nil*) : Exclude police in the 'disabled' state.
- **returns**: integer|nil Police vehicle id.
- **returns**: number Distance (math.huge if none).
- **returns**: number Interactive distance (the police is facing forward).

#### `gameplay_police.getPolice()`

Alias of getPoliceVehicles.

- **returns**: table<integer, table> Police vehicles.

#### `gameplay_police.getPoliceVars()`

Alias of getPursuitVars.

- **returns**: table Variables (direct reference).

#### `gameplay_police.getPoliceVehicles()`

Table of the traffic police vehicles, by vehicle id (gameplay_traffic data). Alias: getPolice.

- **returns**: table<integer, table> Police vehicles.

#### `gameplay_police.getPursuitData(id)`

Pursuit data (veh.pursuit) of a traffic vehicle. Kept for compatibility.

- `id` (*integer|nil*) : Vehicle (default player 0).
- **returns**: table|nil pursuit table (mode, score, timers, offensesList...).

#### `gameplay_police.getPursuitVars()`

Current pursuit variables. Alias: getPoliceVars.

- **returns**: table Variables (direct reference).

#### `gameplay_police.insertProp(propId)`

Adds an object as a roadblock prop, if it exists, is not already a traffic vehicle and is not already registered.

- `propId` (*integer*) : Object id.

#### `gameplay_police.isVehicleInPursuit(id, targetId)`

Pursuit status of a traffic vehicle: for a police vehicle, true if it is pursuing (optionally targetId); for a suspect, true if pursuit.mode > 0.

- `id` (*integer|nil*) : Vehicle (default player 0).
- `targetId` (*integer|nil*) : Filter on the pursued target (police only).
- **returns**: boolean In pursuit.
- **returns**: boolean The vehicle is a police vehicle.

#### `gameplay_police.onDeserialized(data)`

Hook after Lua reload: restores vars and policePropIds.

- `data` (*table*) : Result of onSerialize.

#### `gameplay_police.onSerialize()`

Hook before Lua reload: returns {vars, propIds} and clears the police list (rebuilt afterwards).

- **returns**: table {vars, propIds}

#### `gameplay_police.onTrafficAction(id, action, data)`

Traffic hook: tracks role changes ('changeRole' action) to add or remove a vehicle from the police list.

- `id` (*integer*) : Vehicle.
- `action` (*string*) : Name of the action.
- `data` (*table*) : For 'changeRole': name, prevName.

#### `gameplay_police.onTrafficVehicleAdded(id)`

Hook: adds the vehicle to the police list if its role is 'police'.

- `id` (*integer*) : Vehicle added.

#### `gameplay_police.onTrafficVehicleRemoved(id)`

Hook: removes the vehicle from the police list.

- `id` (*integer*) : Vehicle removed.

#### `gameplay_police.onUpdate(dt, dtSim)`

Called every frame. For each traffic vehicle, triggers setPursuitMode when the score reaches a new scoreLevels step (with a short delay at the start). Also handles the random suspect timer.

- `dt` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).

#### `gameplay_police.onVehicleDestroyed(id)`

Hook: removes the destroyed object from the props list.

- `id` (*integer*) : Destroyed object.

#### `gameplay_police.onVehicleResetted(id)`

AI vehicle reset hook: optionally picks a random suspect among the 'standard' vehicles when the timer has elapsed, or returns a non-'wanted' suspect to the standard role.

- `id` (*integer*) : Vehicle reset.

#### `gameplay_police.onVehicleSwitched(oldId, newId)`

Controlled vehicle change hook: inserts the new vehicle into traffic if needed; on a switch on foot/in vehicle (jbeam 'unicycle') during a pursuit, transfers the pursuit data to the new vehicle, restarts the mode, and forces the arrest on a return to a vehicle in front of the police. Sets ignorePolice to avoid the self-arrest of a police officer getting out.

- `oldId` (*integer*) : Old vehicle.
- `newId` (*integer*) : New vehicle.

#### `gameplay_police.placeRoadblock(vehIds, pos, rot, placeData)`

Places vehicles in a row across a road (centered on pos, spread over placeData.width), then teleports them with core_multiSpawn.placeGroup.

- `vehIds` (*integer[]*) : Ids to place.
- `pos` (*vec3*) : Center of the roadblock.
- `rot` (*quat*) : Orientation (the forward direction must follow the road).
- `placeData` (*table|nil*) : width (default 10 m), angle (degrees, default 0), centerAngle (angle of the center vehicle).

#### `gameplay_police.releaseVehicle(id, showMessages)`

Releases a vehicle after arrest: emits onPursuitAction 'release' and sets the pursuit mode back to 0. If the vehicle is not traffic, sends controller.setFreeze(0) to its VM.

- `id` (*integer*) : Vehicle.
- `showMessages` (*boolean|nil*) : Show the "drive away" message if it is the player.

#### `gameplay_police.removeProp(propId)`

Removes a prop from the roadblock list.

- `propId` (*integer*) : Object id.

#### `gameplay_police.setPoliceVars(data)`

Alias of setPursuitVars.

- `data` (*table|nil|false*) : See setPursuitVars.

#### `gameplay_police.setPropsActive(active, reset)`

Enables or disables all registered roadblock props; with reset, calls recovery.loadHome() on each.

- `active` (*boolean*) : true to enable.
- `reset` (*boolean|nil*) : true to return them to their original position.

#### `gameplay_police.setPursuitMode(mode, targetId, policeIds)`

Sets a target's pursuit mode: -1 arrested, 0 end, 1 to 3 level. Gives the target the suspect role (fleePolice action), updates the police (pursuitStart, pursuitEnd, resetAction) and the score, then emits onPursuitModeUpdate. When going from 0 to >0, emits onPursuitAction 'start'. Has no effect if the target is not traffic or has ignorePursuit.

- `mode` (*integer*) : -1 to 3 (clamped).
- `targetId` (*integer|nil*) : Target (default player 0).
- `policeIds` (*integer[]|integer|nil*) : Police concerned (default all; a single number is accepted).

#### `gameplay_police.setPursuitVars(data)`

Merges data into the pursuit variables; without a valid table (nil/false), resets them to default. Alias: setPoliceVars.

- `data` (*table|nil|false*) : Variables to change (scoreLevels, strictness, arrestTime, arrestRadius, evadeTime, evadeRadius, suspectFrequency, roadblockFrequency, useVisibility, autoRelease).

#### `gameplay_police.setSuspect(id)`

Sets a traffic vehicle to the 'suspect' role with the 'watchPolice' action (kept on role refresh).

- `id` (*integer*) : Vehicle id.

#### `gameplay_police.setSuspectTimer(time)`

Sets the delay before the next random suspect. With no argument: 120 * coef * (1 - suspectFrequency)^2 + 15 to 45 s; coef is 2, 1 after an arrest by the police player, 5 after an evasion.

- `time` (*number|nil*) : Delay in seconds; nil = automatic calculation.

#### `gameplay_police.setupPursuitGameplay(suspectId, policeIds, options)`

Prepares a pursuit scenario: inserts the suspect into traffic (without deactivation by the vehicle pool), disables its respawn, gives it the suspect role (pursuitMode), forces the 'police' role on the provided policeIds, and starts the 'watchPolice' action unless preventAutoStart.

- `suspectId` (*integer|nil*) : Suspect (default player 0 vehicle).
- `policeIds` (*integer[]|nil*) : Police (default: existing police).
- `options` (*table|nil*) : playerId, pursuitMode (default 2), preventAutoStart (default false).
- **returns**: boolean false if the suspect is not found or if there is no police.

#### `gameplay_police.setupRoadblock(targetId, roadblockVehIds, roadblockPropIds, originPos, originDirVec, activeDist, spawnDist)`

Prepares and places a roadblock in front of the target. Chooses the active police vehicles, farther than activeDist and behind the origin, that can target targetId. Looks for a road point at spawnDist ahead, computes the road width, adjusts the angle randomly, puts the police in 'roadblock' action and also places props (propIds).

- `targetId` (*integer|nil*) : Target (default player 0 vehicle).
- `roadblockVehIds` (*integer[]|nil*) : Candidate vehicles (default all police vehicles).
- `roadblockPropIds` (*integer[]|nil*) : Props (default those of insertProp).
- `originPos` (*vec3|nil*) : Origin (default camera position).
- `originDirVec` (*vec3|nil*) : Origin direction (default camera forward).
- `activeDist` (*number|nil*) : Radiating distance (default 100 m); 0 skips the distance and direction tests.
- `spawnDist` (*number|nil*) : Minimum placement distance (default 120 m); 0 forces placement at the origin.
- **returns**: table|nil {vehIds, propIds} of the placed elements; nil on failure.

## Fields

| Field | Type | Description |
|---|---|---|
| `enabled` | boolean | If false, the police logic at runtime (onUpdate) is suspended. Is true by default. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onPursuitAction` — listened to by 3 module(s)
- `onPursuitModeUpdate`

## Calls into the engine (C++)

- `be:` `getEnabled`, `getObjectActive`, `getObjectPositionXYZ`, `getPlayerVehicleID`
- `obj:` `isPlayerControlled`, `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/police.lua`.*
