---@meta
-- tim19Atlas stub generated from lua/vehicle/fire.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vehicle fire simulation. jbeam nodes that have a `flashPoint` become flammable nodes: each has a temperature, a chemical energy (chemEnergy), a flame intensity, and possibly a container (containerBeam) whose breaking releases vapors. They heat up through friction/collision (nodeCollision), conduction and radiation from burning nodes (hotNodes), cool down in air or water, emit flames, smoke and sounds, and make tires burst. A modder or a scenario can ignite, explode or extinguish the vehicle with igniteVehicle, explodeVehicle, extinguishVehicle…
--- Access: global `fire`
---@class fire
---@field debugData table Debug data; debugData.flammableNodes points to the table of flammable nodes.
---@field flammableNodes table<integer, table> Flammable nodes by cid, with temperature, intensity, chemEnergy, flashPoint, smokePoint, burnRate, isVapor, vaporState, canIgnite, etc.
---@field hotNodes table<integer, table> Subset of flammableNodes currently burning (temperature above the smoke point).
fire = {}

--- Explodes a single node: maximum temperature, maximum vapors, tank considered ruptured, node added to the hot nodes.
---Source: lua/vehicle/fire.lua:440
---@param cid integer Node identifier.
function fire.explodeNode(cid) end

--- Triggers the explosion: all tanks are considered ruptured and full of vapor, all flammable nodes are ignited at maximum temperature.
---Source: lua/vehicle/fire.lua:427
function fire.explodeVehicle() end

--- Extinguishes immediately: ambient temperature, intensity 0 and extinguisher particles on each flammable node.
---Source: lua/vehicle/fire.lua:453
function fire.extinguishVehicle() end

--- Sets chemEnergy to 0 on all nodes: no more fuel, the flames disappear as they cool down.
---Source: lua/vehicle/fire.lua:461
function fire.extinguishVehicleSlowly() end

--- Returns the temperature of the burning node closest to a given node and the distance to it.
---Source: lua/vehicle/fire.lua:43
---@param cid integer Reference node.
---@return number  Temperature of the closest hot node (0 if there is none).
---@return number  Distance in meters (math.huge if there is no hot node).
function fire.getClosestHotNodeTempDistance(cid) end

--- Brings a flammable node to a given temperature (maxNodeTemp by default); it will then ignite if possible. No effect if the node is not flammable.
---Source: lua/vehicle/fire.lua:375
---@param cid integer Node identifier (cid).
---@param temp number|nil Temperature in °C (1950 if nil).
function fire.igniteNode(cid, temp) end

--- Ignites a random flammable node at maximum temperature (excluding wheels, able to ignite, with no flame in progress).
---Source: lua/vehicle/fire.lua:383
function fire.igniteRandomNode() end

--- Ignites a random node at only flashPoint + 10 °C (discreet fire start).
---Source: lua/vehicle/fire.lua:398
function fire.igniteRandomNodeMinimal() end

--- Ignites all flammable nodes except wheel nodes (to delay tire bursting).
---Source: lua/vehicle/fire.lua:419
function fire.igniteVehicle() end

--- Builds the list of flammable nodes from v.data.nodes, finds the most central node (particle reference), the container beams and the wheel nodes, and enables updateGFX/nodeCollision if there is at least one flammable node. Called by main.lua at init.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/fire.lua:289
function fire.init() end

--- Called by main.lua:onNodeCollision: heats a flammable node with the friction energy (slipForce x slipVel x lastDt x selfIgnitionCoef / thermal capacity) and ignites it if it reaches its smoke point. Ignores collisions with depth > 0. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/fire.lua:dyn
---@param p table Collision data (particlefilter.particleData): id1, slipForce, slipVel, depth…
function fire.nodeCollision(p) end

--- Identical to init (M.reset = init): resets the whole fire state on vehicle reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/fire.lua:289
function fire.reset() end

--- Called every frame by main.lua (nop if no fire is simulated). Processes the next flammable node: tank vapors, water vapor, heat transfer from burning nodes, cooling, combustion (intensity, chemEnergy consumption), flame/smoke/sound emission and tire bursting. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/fire.lua:dyn
---@param dt number Simulation time step in seconds.
function fire.updateGFX(dt) end

