---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_mission_ARunForLife_C
local flowgraph_nodes_mission_ARunForLife_C = {}

--- Activates a bonus at a position, updates the trigger position on the corresponding output.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:380
---@param buff table bonus
---@param pos vec3 position
function flowgraph_nodes_mission_ARunForLife_C:activateBuff(buff, pos) end

--- Periodically spawns lines of props (random number between minPropLine and maxPropLine, no duplicate lane) and places the available bonuses.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:458
function flowgraph_nodes_mission_ARunForLife_C:activatePropsAndBuffs() end

--- Determines the medal (Gold, Silver, Bronze, Wood) and the next score according to the gold/silver/bronze pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:732
function flowgraph_nodes_mission_ARunForLife_C:calcMedal() end

--- Updates repairAvailable and coinAvailable (the coin is only available while coins < repairBuffCost).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:326
function flowgraph_nodes_mission_ARunForLife_C:checkBuffAvailabilty() end

--- When enough coins are collected, spends them, makes the repair bonus available and emits repairSpawned.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:355
function flowgraph_nodes_mission_ARunForLife_C:checkCoinForRepair() end

--- If the player is outside the camera zone, counts up to 5 s (timeLeftToLose) then emits 'lost'; otherwise resets the count to -1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:285
function flowgraph_nodes_mission_ARunForLife_C:checkLose() end

--- Handles the input impulses: cannon (fire via custom_input.fire), jumpRamp, crashGate (points), repairTrigger, coinTrigger.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:701
function flowgraph_nodes_mission_ARunForLife_C:checkTriggers() end

--- Adds a coin, deactivates the coin bonus and emits coinEarnt (if the repair is not yet purchasable).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:692
function flowgraph_nodes_mission_ARunForLife_C:coinBuff() end

--- Creates the decal pool (help arrows).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:609
function flowgraph_nodes_mission_ARunForLife_C:createDecalPool() end

--- Deactivates a bonus (off-screen, position {-1,0,0}) and updates the position of the corresponding trigger.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:363
---@param buff table bonus to deactivate
function flowgraph_nodes_mission_ARunForLife_C:deactivateBuff(buff) end

--- Shows the help decal of a deactivated prop again.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:395
---@param propName string jbeam name of the prop
function flowgraph_nodes_mission_ARunForLife_C:deactivateProp(propName) end

--- Deactivates the props and bonuses that are too far behind the camera (propDespawn = 40 m) and puts them back in the inactive props list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:403
function flowgraph_nodes_mission_ARunForLife_C:deactivatePropsAndBuffs() end

--- Advances the timers of the bonuses that use time (coin) until they become available.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:340
function flowgraph_nodes_mission_ARunForLife_C:doBuffsTime() end

--- Increases the score according to the player's position relative to the camera, the camera speed and dtSim; writes score.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:278
function flowgraph_nodes_mission_ARunForLife_C:doScore() end

--- Draws the decals (arrows) on the props that have decal.draw active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:627
function flowgraph_nodes_mission_ARunForLife_C:drawDecals() end

--- Returns the bonus with this name ('repair' or 'coin').
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:428
---@param name string bonus name
---@return table|nil  bonus
function flowgraph_nodes_mission_ARunForLife_C:getBuffByName(name) end

--- Returns a random delay around baseTime (+/- 25%).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:376
---@param baseTime number base time in seconds
---@return number  random delay
function flowgraph_nodes_mission_ARunForLife_C:getBuffNextTime(baseTime) end

--- Returns the prop info (propsInfo) for a jbeam name.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:436
---@param name string jbeam name
---@return table|nil  prop info
function flowgraph_nodes_mission_ARunForLife_C:getPropByName(name) end

--- Enlarges the decal pool.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:603
---@param amount integer number to add
function flowgraph_nodes_mission_ARunForLife_C:increaseDecalPool(amount) end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:133
---@param mgr any
---@param ... any
function flowgraph_nodes_mission_ARunForLife_C:init(mgr, ...) end

--- Gathers the ids of existing pins cont1id..cont20id into containers and computes contTpDist (teleport distance = number of containers / 2 * 13.25).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:211
function flowgraph_nodes_mission_ARunForLife_C:linkContainers() end

--- Gets the pool vehicles (propPool:getVehs()), stores in propsInfo the decals/rotations corrected by jbeam, remembers the ball/cannon/caravan references and the player vehicle (pin plId).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:138
function flowgraph_nodes_mission_ARunForLife_C:linkProps() end

--- Advances the camera (core_camera.setPosRot): initial then slow acceleration, slowdown/catch-up when slowdownCar is active; writes camSpeed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:233
function flowgraph_nodes_mission_ARunForLife_C:moveCamera() end

--- Updates the outputs gatePos, rampPos, cannonPos from the position of the active props.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:528
function flowgraph_nodes_mission_ARunForLife_C:moveTriggers() end

--- If the ball is active and has moved more than 3 m, adds points proportional to the distance traveled (ballPoint per meter) to the score and bonus points; writes ballPoints.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:304
function flowgraph_nodes_mission_ARunForLife_C:pushBall() end

--- Freezes the player vehicle (setFreeze), deactivates the repair bonus and starts the slowdown.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:686
function flowgraph_nodes_mission_ARunForLife_C:repairBuff() end

--- Resets the whole game state to zero and recreates the bonus table (repair, coin).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:749
function flowgraph_nodes_mission_ARunForLife_C:resetValues() end

--- Copies the non-nil setting pins to the module-local variables.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:786
function flowgraph_nodes_mission_ARunForLife_C:setParameters() end

--- Gets the pool, links containers and props, fills the active/inactive prop lists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:571
function flowgraph_nodes_mission_ARunForLife_C:setReferences() end

--- During repair, waits until the vehicle is almost stopped (< 0.1 m/s) then unfreezes it, emits 'repaired'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:673
function flowgraph_nodes_mission_ARunForLife_C:slowDownCar() end

--- Teleports forward the containers that have fallen behind the camera (alternating right/left lane).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:264
function flowgraph_nodes_mission_ARunForLife_C:tpContainers() end

--- Every frame: resets outputs to their default values, reads the position/rotation of the camera and the player, updates jumpPoints, gatePoints, totalBonusScore, coins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:546
function flowgraph_nodes_mission_ARunForLife_C:updateValues() end

--- Game loop: optional reset, one-time initialization (parameters, references, decal pool), then chains updateValues, tpContainers, moveCamera, doScore, checkLose, checkTriggers, props/bonus handling, pushBall, moveTriggers, drawDecals, calcMedal, checkCoinForRepair, slowDownCar; writes drawCannon.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:807
function flowgraph_nodes_mission_ARunForLife_C:work() end

