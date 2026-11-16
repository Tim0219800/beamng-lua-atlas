# `gameplay_traffic_vehicle`

*File: `lua/ge/extensions/gameplay/traffic/vehicle.lua` · VM: Game Engine (GE) · 1029 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/traffic/vehicle")` (file under extensions/ but not a regular extension)

Class of a vehicle managed by the traffic system (gameplay_traffic). It tracks the vehicle's state (reset, active, fadeIn, fadeOut, queued, locked), its driver role (standard, police, suspect, empty), its road tracking (roadTracking), its collisions, its offenses and its police pursuit state (pursuit). It also handles out-of-sight respawn, headlights, horn and siren, and the AI mode.

## Example

```lua
local veh = require('/lua/ge/extensions/gameplay/traffic/vehicle')({id = vehId})
if veh then veh:postInit(); veh:setAiMode('traffic') end
```

## Notes

- The module returns a constructor: the parameter (table) becomes the object and init(o.id) is called; returns nil if the vehicle is invalid (not found or ignoreTraffic flag). The second parameter 'role' of init is not used.
- States (self.state): 'reset', 'active', 'fadeIn', 'fadeOut', 'queued', 'locked'.
- Cadence: onTrafficTick is called every 0.25 s of simulated time (TICK_TIME); SLOW_SPEED is 2.5 m/s.
- pursuit.mode: 0 = no pursuit, 1 = passive, 2 = aggressive, 3 = aggressive with roadblocks, -1 = stopped (arrest).
- Offenses tested by checkOffenses: speeding (>= max(16.7 m/s, 1.2 x limit)), racing (>= max(27.8 m/s, 2 x limit)), reckless, wrongWay, intersection, hitPolice, hitTraffic. They only count if the police's strictness > 0.
- Values of self.respawn: spawnValue (0 disables respawn), spawnDirBias (-1 to 1), spawnRandomization (0 to 1), activeRadius, finalRadius, innerRadius, staticVisibility.
- The getters self.getTraffic, getPolice, getTrafficVars and getPoliceVars are references to gameplay_traffic / gameplay_police, modifiable from outside.
- Emitted hooks: onTrafficAction (changeRole), onPursuitOffense, onTrafficVehicleCrashed, onPursuitAction (arrest, release, roadblock, roadblockAlert, evade) for vehicles outside the main traffic.
- In onVehicleResetted, role.flags.freeze is set to false (and not nil) whereas the other roles test the flag's truthiness.

## Class `C`

Traffic vehicle object. Common fields: id, state, isAi, isPerson, isVehicle, isPlayerControlled, model, modelName, drivability, autoRole, role, tracking (roadTracking), collisions, pursuit, respawn, pos/dirVec/vel/driveVec/targetPos, speed, damage, alpha, focus, focusDist, enableRespawn, enableTracking, enableAutoPooling, camVisible, headlights, queuedFuncs.

The module returns a constructor: `local obj = require("gameplay_traffic_vehicle")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:applyModelConfigData()` | Deduced from the model and config data: display name, drivability (from the off-road score and size), random paint, taxi, vehicle status (types car, truck, automation, traffic, proptraffic, player) and automatic role ('police' for police configs, otherwise 'standard'; 'empty' if not a vehicle). | 98 |
| `C:checkCollisions()` | Detects contacts with the other objects on the map (OBB check), creates and updates the collision tables (counter, speed, damage, dot product), notifies the role (onCollision) and the other traffic vehicles (onOtherCollision) when the speed >= 1 m/s, and handles the case of a pedestrian (unicycle) being hit (the AI stops then resumes). | 319 |
| `C:checkOffenses()` | Evaluates the vehicle's offenses for the police (speeding, racing, reckless driving, wrong way, light/stop, collision with police or traffic) from the roadTracking faults and the collisions. No effect if strictness <= 0. | 492 |
| `C:checkPoliceVisibility(dtSim)` | Determines the closest police, increases or decreases sightValue (visibility 0 to 1; policeVisible if >= 0.5) and updates the pursuit score. | 550 |
| `C:checkRayCast(startPos, endPos)` | Tests the static line of sight between two points (castRayStatic). | 412 |
| `C:checkTimeOfDay()` | Indicates whether it is daytime based on the game time and the solar night window. | 599 |
| `C:fade(rate, isFadeOut)` | Varies the vehicle's opacity; at 0 when fading out the state becomes 'queued', at 1 when fading in it becomes 'active'. | 401 |
| `C:getBrakingDistance(speed, accel)` | Estimates the braking distance: v² / (2 · accel · g), with g bounded to avoid a division by zero. | 311 |
| `C:getInteractiveDistance(pos, squared)` | Returns the distance between the vehicle's "look ahead" point (targetPos, 10 to 50 m ahead depending on speed) and a position. | 297 |
| `C:honkHorn(duration)` | Turns on the horn then stops it after the given duration (deferred function 'horn'). | 213 |
| `C:init(id, role)` | Initializes the traffic vehicle: forces visibility, creates collision and deferred function tables, the roadTracking object and the getters, calls resetAll, measures width/length and sets the default 'empty' role. Does nothing (and the constructor returns nil) if the vehicle does not exist or has ignoreTraffic. | 23 |
| `C:modifyRespawnValues(addActiveRadius, addInnerRadius)` | Immediately increases the respawn radii to keep the vehicle active longer (used after a collision and during pursuits). | 305 |
| `C:onActiveDone()` | Called after fading out or being sent to the inactive pool; relays to role:onActiveDone(). | 618 |
| `C:onDeserialized(data)` | Restores the state from the onSerialize table, recreates the role and restores tracking; sets the state to 'queued' if the object is not active. | 994 |
| `C:onPursuitUpdate(dt, dtSim)` | Advances the pursuit: alert, arrest (arrestTime), release, roadblocks (mode 3), evasion (evadeTime), arrest and evasion radii, and the normalized values arrestValue and evadeValue. For a vehicle outside the main traffic, emits the onPursuitAction hooks directly. | 755 |
| `C:onRefresh()` | Called when the vehicle data must be refreshed (usually after a respawn). For an AI: reset, playerUsable setting, AI debug mode, night adjustment of spawnValue (x0.25), active/fadeIn state, reset of the role's action and personality, AI parameters. Then calls role:onRefresh(). | 632 |
| `C:onRespawn()` | Called after a respawn in traffic: repaints at random if allowed, increments respawnCount, sets the state to 'reset'. | 622 |
| `C:onSerialize()` | Serializes the traffic vehicle's state (including road tracking and role) for saving. | 966 |
| `C:onTrafficTick(tickTime)` | Traffic tick (0.25 s): updates road tracking, visibility, active radius, headlights (night or tunnel), detects crash damage (hook onTrafficVehicleCrashed) and near misses, then calls role:onTrafficTick. | 668 |
| `C:onUpdate(dt, dtSim)` | Per-frame update: reads position, direction and speed from map.objects, computes driveVec and targetPos, handles the states (locked, fadeIn, fadeOut), paces the traffic ticks, tracks collisions and police, runs the deferred functions and calls role:onUpdate. | 875 |
| `C:onVehicleResetted()` | Called when the vehicle is reset (automatic or manual): unfreezes the vehicle if needed and resets tracking. | 610 |
| `C:postInit()` | To call after initialization: applies the model/config data (applyModelConfigData) then the chosen automatic role (autoRole). | 93 |
| `C:resetAll()` | Calls resetPursuit, resetTracking and resetValues. | 207 |
| `C:resetElectrics()` | Turns off the vehicle's light bar, warnings and horn (vehicle Lua commands). | 200 |
| `C:resetPursuit()` | Resets the pursuit state (mode 0, scores, counters, timers); if a pursuit was ongoing, first calls gameplay_police.setPursuitMode(0, id). | 168 |
| `C:resetTracking()` | Refreshes roadTracking and resets collision counters and crash damage; stores the current damage as a reference. | 177 |
| `C:resetValues()` | Resets the respawn values (from the traffic variables), and clears collisions, deferred functions and active data. | 184 |
| `C:setAiMode(mode, ignoreParams)` | Sets the vehicle's AI mode (ai.setMode) and its automatic parameters: 'traffic' (base aggression, legal speed, lane driving), 'random', 'flee' and 'chase' (aggression >= 0.8 for flee/chase, no speed limit). Sets isAi to false if the mode is 'disabled'. Ends with ai.reset(). | 225 |
| `C:setAiParameters(params)` | Applies to the AI the aggression, the speed limit (negative = legal speed) and the aiAware setting (car avoidance) from params or, by default, from the traffic variables. | 253 |
| `C:setRole(roleName)` | Changes the driver's role: ends the old role (onRoleEnded), creates the new one via trafficUtils.getRoleConstructor, calls onRoleStarted and emits the hook onTrafficAction(id, 'changeRole', ...). | 278 |
| `C:trackCollision(otherId, dt)` | Evolves a collision's state: 'active' then 'resolved' (stopped near the site for 5 s) or 'abandoned' (the vehicle moves away); clears the collision when the other vehicle is more than 120 m away. | 377 |
| `C:triggerOffense(data)` | Records a pursuit offense (unique key, default score 100, divided by 2 for an AI), updates counters and additional score and emits the hook onPursuitOffense the first time. | 473 |
| `C:tryRespawn()` | Tests whether the vehicle is far enough from the focus to respawn (never the player's vehicle) and that no non-traffic vehicle is too close; then switches to the 'fadeOut' state and turns off horn and headlights. | 439 |
| `C:updateActiveRadius(tickTime)` | Updates the radii that decide whether the vehicle can respawn: active radius decreasing according to spawnValue and visibility, plus an extra radius depending on the focus's speed and direction. | 421 |
| `C:useSiren(duration, disableAfterUse)` | Turns on the light bar with siren (signal 2) then sets it back to 1 (or 0 if disableAfterUse) after the given duration. Assumes the vehicle has a light bar. Uses the same deferred entry 'horn' as honkHorn: the two overwrite each other. | 218 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onPursuitAction` — listened to by 3 module(s)
- `onPursuitOffense` — listened to by 1 module(s)
- `onTrafficAction` — listened to by 2 module(s)
- `onTrafficVehicleCrashed` — listened to by 1 module(s)

## Calls into the engine (C++)

- `be:` `getObjectActive`, `getObjectOOBBCenterXYZ`, `getPlayerVehicleID`
- `core_environment.` `getGravity`, `getTimeOfDay`
- `obj:` `isPlayerControlled`, `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/traffic/vehicle.lua`.*
