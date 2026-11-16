# `fire`

*File: `lua/vehicle/fire.lua` · VM: Vehicle · 487 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `fire`

Vehicle fire simulation. jbeam nodes that have a `flashPoint` become flammable nodes: each has a temperature, a chemical energy (chemEnergy), a flame intensity, and possibly a container (containerBeam) whose breaking releases vapors. They heat up through friction/collision (nodeCollision), conduction and radiation from burning nodes (hotNodes), cool down in air or water, emit flames, smoke and sounds, and make tires burst. A modder or a scenario can ignite, explode or extinguish the vehicle with igniteVehicle, explodeVehicle, extinguishVehicle…

## Example

```lua
fire.igniteVehicle()          -- sets fire to all flammable nodes (except tires)
fire.explodeNode(cid)         -- localized explosion
fire.extinguishVehicle()      -- resets everything to ambient temperature
local temp, dist = fire.getClosestHotNodeTempDistance(cid)
```

## Notes

- JBEAM node KEYS read: flashPoint (enables the system, °C), smokePoint (default = flashPoint), burnRate, baseTemp (number in °C, or "thermals" to follow controller.mainController.fireEngineTemperature), conductionRadius (m, default 0), selfIgnitionCoef (default 0, heating by collision), chemEnergy (combustible energy), specHeat (default 1) combined with the node weight (nodeWeight), vaporPoint (vaporization threshold 0..100), containerBeam (name of the container beam), ignoreContainerBeamBreakMessage. A node with containerBeam can only ignite (canIgnite) after this beam breaks.
- The simulation is only active if at least one node has a flashPoint (fireNodeCounter > 0). Otherwise `updateGFX` and `nodeCollision` stay nops. Note: init() does not set nodeCollision back to nop on a new call if the counter drops to 0, but this can only happen if the vehicle data changes.
- Each frame, updateGFX processes only ONE flammable node (circular traversal via getCircular): the simulated time for this node is dt x number of flammable nodes to compensate. Temperatures are in °C; maxNodeTemp = 1950, tirePopTemp = 650 (a tire bursts), tSteam = 100 (steam in water).
- Consequence: a fuel vapor (vaporState) lowers the smoke/flash points by 50%; an intensity > 10 triggers a fireball, massive smoke and a shower of sparks; slow extinguishing (extinguishVehicleSlowly) sets chemEnergy to 0: the fire goes out when the fuel is exhausted.
- Apparent bug: `local rand = random(1)` calls math.random(1) which is always 1 (the comment says "same random value for all effects"), so the random factor of the particles is constant.
- Minor inconsistency: `drivetrain.engineDisabled` is read in updateGFX; if the drivetrain module no longer exposes this field it is nil (cooling is then limited to baseTemp).
- Called by main.lua: init() in initSystems, reset() = init() in onVehicleReset, updateGFX(dt) at the end of onGraphicsStep, nodeCollision(p) in onNodeCollision. Particles by id numbers of the game's particle file (25-30 flames, 31 fireball, 32 smoke, 43/51-53 smokes, 48 extinguisher).

## Functions

| Function | Description | Line |
|---|---|---|
| `fire.explodeNode(cid)` | Explodes a single node: maximum temperature, maximum vapors, tank considered ruptured, node added to the hot nodes. | 440 |
| `fire.explodeVehicle()` | Triggers the explosion: all tanks are considered ruptured and full of vapor, all flammable nodes are ignited at maximum temperature. | 427 |
| `fire.extinguishVehicle()` | Extinguishes immediately: ambient temperature, intensity 0 and extinguisher particles on each flammable node. | 453 |
| `fire.extinguishVehicleSlowly()` | Sets chemEnergy to 0 on all nodes: no more fuel, the flames disappear as they cool down. | 461 |
| `fire.getClosestHotNodeTempDistance(cid)` | Returns the temperature of the burning node closest to a given node and the distance to it. | 43 |
| `fire.igniteNode(cid, temp)` | Brings a flammable node to a given temperature (maxNodeTemp by default); it will then ignite if possible. No effect if the node is not flammable. | 375 |
| `fire.igniteRandomNode()` | Ignites a random flammable node at maximum temperature (excluding wheels, able to ignite, with no flame in progress). | 383 |
| `fire.igniteRandomNodeMinimal()` | Ignites a random node at only flashPoint + 10 °C (discreet fire start). | 398 |
| `fire.igniteVehicle()` | Ignites all flammable nodes except wheel nodes (to delay tire bursting). | 419 |
| `fire.init()` | Builds the list of flammable nodes from v.data.nodes, finds the most central node (particle reference), the container beams and the wheel nodes, and enables updateGFX/nodeCollision if there is at least one flammable node. Called by main.lua at init. *(internal)* | 289 |
| `fire.nodeCollision(p)` | Called by main.lua:onNodeCollision: heats a flammable node with the friction energy (slipForce x slipVel x lastDt x selfIgnitionCoef / thermal capacity) and ignites it if it reaches its smoke point. Ignores collisions with depth > 0. (dynamically assigned) *(internal)* | dyn |
| `fire.reset()` | Identical to init (M.reset = init): resets the whole fire state on vehicle reset. *(internal)* | 289 |
| `fire.updateGFX(dt)` | Called every frame by main.lua (nop if no fire is simulated). Processes the next flammable node: tank vapors, water vapor, heat transfer from burning nodes, cooling, combustion (intensity, chemEnergy consumption), flame/smoke/sound emission and tire bursting. (dynamically assigned) *(internal)* | dyn |

### Parameter details

#### `fire.explodeNode(cid)`

Explodes a single node: maximum temperature, maximum vapors, tank considered ruptured, node added to the hot nodes.

- `cid` (*integer*) : Node identifier.

#### `fire.getClosestHotNodeTempDistance(cid)`

Returns the temperature of the burning node closest to a given node and the distance to it.

- `cid` (*integer*) : Reference node.
- **returns**: number Temperature of the closest hot node (0 if there is none).
- **returns**: number Distance in meters (math.huge if there is no hot node).

#### `fire.igniteNode(cid, temp)`

Brings a flammable node to a given temperature (maxNodeTemp by default); it will then ignite if possible. No effect if the node is not flammable.

- `cid` (*integer*) : Node identifier (cid).
- `temp` (*number|nil*) : Temperature in °C (1950 if nil).

#### `fire.nodeCollision(p)`

Called by main.lua:onNodeCollision: heats a flammable node with the friction energy (slipForce x slipVel x lastDt x selfIgnitionCoef / thermal capacity) and ignites it if it reaches its smoke point. Ignores collisions with depth > 0. (dynamically assigned)

- `p` (*table*) : Collision data (particlefilter.particleData): id1, slipForce, slipVel, depth…

#### `fire.updateGFX(dt)`

Called every frame by main.lua (nop if no fire is simulated). Processes the next flammable node: tank vapors, water vapor, heat transfer from burning nodes, cooling, combustion (intensity, chemEnergy consumption), flame/smoke/sound emission and tire bursting. (dynamically assigned)

- `dt` (*number*) : Simulation time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `debugData` | table | Debug data; debugData.flammableNodes points to the table of flammable nodes. |
| `flammableNodes` | table<integer, table> | Flammable nodes by cid, with temperature, intensity, chemEnergy, flashPoint, smokePoint, burnRate, isVapor, vaporState, canIgnite, etc. |
| `hotNodes` | table<integer, table> | Subset of flammableNodes currently burning (temperature above the smoke point). |

## Calls into the engine (C++)

- `obj:` `addParticleByNodes`, `addParticleByNodesRelative`, `beamIsBroken`, `createSFXSource`, `getEnvTemperature`, `inWater`, `nodeLength`, `nodeSquaredLength`, `playSFX`, `setNodeVolumePitchCT`, `stopSFX`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/fire.lua`.*
