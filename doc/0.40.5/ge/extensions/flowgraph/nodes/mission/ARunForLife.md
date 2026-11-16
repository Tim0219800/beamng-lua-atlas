# `flowgraph_nodes_mission_ARunForLife`

*File: `lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua` · VM: Game Engine (GE) · 839 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/mission/ARunForLife")` (file under extensions/ but not a regular extension)

Flowgraph node 'ARunForLife' (repeat_instant category): complete logic of a small survival mini-game ("Plays my little scenario"). The camera advances at increasing speed along the -Y axis; props (metal_ramp ramp, gate, ball, cannon, caravan, woodcrate/woodplanks/haybale) are activated/deactivated from a vehicle pool (pin 'pool') on 5 lanes, containers are teleported to loop the scenery, and bonuses (coins, repair) appear. The score increases with distance and actions (ramp jump, gate, ball push); the player loses if they stay too long (5 s) outside the camera zone. Many setting input pins, outputs: score, camera speed, trigger positions, medal, signals lost/repaired/coinEarnt/repairSpawned. All state is in module-local variables (not per instance).

## Notes

- Module-global state (score, coins, props, camPos...): two instances of the node would share the state.
- The output pins 'repairBuffCost' and 'gatePoints'/'jumpPoints' have the same name as inputs (distinct input and output).
- checkBuffAvailabilty depends on coins < repairBuffCost for the coin.
- The name 'pipckupSpeed' (typo) is used in moveCamera for the camera catch-up speed.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:activateBuff(buff, pos)` | Activates a bonus at a position, updates the trigger position on the corresponding output. | 380 |
| `C:activatePropsAndBuffs()` | Periodically spawns lines of props (random number between minPropLine and maxPropLine, no duplicate lane) and places the available bonuses. | 458 |
| `C:calcMedal()` | Determines the medal (Gold, Silver, Bronze, Wood) and the next score according to the gold/silver/bronze pins. | 732 |
| `C:checkBuffAvailabilty()` | Updates repairAvailable and coinAvailable (the coin is only available while coins < repairBuffCost). | 326 |
| `C:checkCoinForRepair()` | When enough coins are collected, spends them, makes the repair bonus available and emits repairSpawned. | 355 |
| `C:checkLose()` | If the player is outside the camera zone, counts up to 5 s (timeLeftToLose) then emits 'lost'; otherwise resets the count to -1. | 285 |
| `C:checkTriggers()` | Handles the input impulses: cannon (fire via custom_input.fire), jumpRamp, crashGate (points), repairTrigger, coinTrigger. | 701 |
| `C:coinBuff()` | Adds a coin, deactivates the coin bonus and emits coinEarnt (if the repair is not yet purchasable). | 692 |
| `C:createDecalPool()` | Creates the decal pool (help arrows). | 609 |
| `C:deactivateBuff(buff)` | Deactivates a bonus (off-screen, position {-1,0,0}) and updates the position of the corresponding trigger. | 363 |
| `C:deactivateProp(propName)` | Shows the help decal of a deactivated prop again. | 395 |
| `C:deactivatePropsAndBuffs()` | Deactivates the props and bonuses that are too far behind the camera (propDespawn = 40 m) and puts them back in the inactive props list. | 403 |
| `C:doBuffsTime()` | Advances the timers of the bonuses that use time (coin) until they become available. | 340 |
| `C:doScore()` | Increases the score according to the player's position relative to the camera, the camera speed and dtSim; writes score. | 278 |
| `C:drawDecals()` | Draws the decals (arrows) on the props that have decal.draw active. | 627 |
| `C:getBuffByName(name)` | Returns the bonus with this name ('repair' or 'coin'). | 428 |
| `C:getBuffNextTime(baseTime)` | Returns a random delay around baseTime (+/- 25%). | 376 |
| `C:getPropByName(name)` | Returns the prop info (propsInfo) for a jbeam name. | 436 |
| `C:increaseDecalPool(amount)` | Enlarges the decal pool. | 603 |
| `C:init(mgr, ...)` | Empty. | 133 |
| `C:linkContainers()` | Gathers the ids of existing pins cont1id..cont20id into containers and computes contTpDist (teleport distance = number of containers / 2 * 13.25). | 211 |
| `C:linkProps()` | Gets the pool vehicles (propPool:getVehs()), stores in propsInfo the decals/rotations corrected by jbeam, remembers the ball/cannon/caravan references and the player vehicle (pin plId). | 138 |
| `C:moveCamera()` | Advances the camera (core_camera.setPosRot): initial then slow acceleration, slowdown/catch-up when slowdownCar is active; writes camSpeed. | 233 |
| `C:moveTriggers()` | Updates the outputs gatePos, rampPos, cannonPos from the position of the active props. | 528 |
| `C:pushBall()` | If the ball is active and has moved more than 3 m, adds points proportional to the distance traveled (ballPoint per meter) to the score and bonus points; writes ballPoints. | 304 |
| `C:repairBuff()` | Freezes the player vehicle (setFreeze), deactivates the repair bonus and starts the slowdown. | 686 |
| `C:resetValues()` | Resets the whole game state to zero and recreates the bonus table (repair, coin). | 749 |
| `C:setParameters()` | Copies the non-nil setting pins to the module-local variables. | 786 |
| `C:setReferences()` | Gets the pool, links containers and props, fills the active/inactive prop lists. | 571 |
| `C:slowDownCar()` | During repair, waits until the vehicle is almost stopped (< 0.1 m/s) then unfreezes it, emits 'repaired'. | 673 |
| `C:tpContainers()` | Teleports forward the containers that have fallen behind the camera (alternating right/left lane). | 264 |
| `C:updateValues()` | Every frame: resets outputs to their default values, reads the position/rotation of the camera and the player, updates jumpPoints, gatePoints, totalBonusScore, coins. | 546 |
| `C:work()` | Game loop: optional reset, one-time initialization (parameters, references, decal pool), then chains updateValues, tpContainers, moveCamera, doScore, checkLose, checkTriggers, props/bonus handling, pushBall, moveTriggers, drawDecals, calcMedal, checkCoinForRepair, slowDownCar; writes drawCannon. | 807 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua`.*
