# `core_funstuff`

*File: `lua/ge/extensions/core/funstuff.lua` · VM: Game Engine (GE) · 514 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_funstuff`: `extensions.load("core_funstuff")`, then the global `core_funstuff`

GE extension `core_funstuff`: "fun" actions of the sandbox mode radial menu: force field, vehicle boosts and flings, destruction (break, deflate, ignite, explode), opening hoods/doors, fuel level, random colors and vehicle, random route. The exported functions act on player vehicle 0 and return an instruction for the radial menu ({'hide'} or {'reload'}). registerFunstuffActions registers the entries in core_quickAccess.

## Example

```lua
extensions.load('core_funstuff')
core_funstuff.boost()            -- +25 m/s in the vehicle's direction
core_funstuff.flingUpward()      -- +15 m/s upwards
core_funstuff.igniteVehicle()
```

## Notes

- Fling values (applyFling, velocities added to the vehicle's cluster via applyClusterVelocityScaleAdd): flingUpward +15 m/s in z, flingDownward -15 m/s, boost +25 m/s along the vehicle's direction, boostBackwards -25 m/s. The effect is reduced linearly when the vehicle's speed in the fling direction exceeds 200 km/h (55.6 m/s) and cancelled at 450 km/h (125 m/s).
- Return: each action returns {'hide'} (close the radial menu) or {'reload'} (reload the menu entries): value expected by core_quickAccess; no effect when called by script.
- Several functions have no check: breakAllBreakgroups, breakHinges, deflateTires, deflateRandomTire, igniteVehicle, extinguishVehicle call getPlayerVehicle(0):queueLuaCommand(...) directly and cause a Lua error if there is no player vehicle. The boost/fling functions do check that the vehicle exists.
- explodeVehicle: creates a repulsive 'planet' (obj:setPlanets({x,y,z,radius 5,mass})) under the vehicle with a mass of -3e13 * size/3 (size = largest half-dimension of the bounding box), triggers fire.explodeVehicle and beamstate.breakAllBreakgroups, then removes the planet after 0.2 s of simulation time (the comment says "1 second"). The command is sent to all objects (be:queueAllObjectLua), so all vehicles are subject to the force.
- Not exported (internal to the menu entries): randomizeColors, randomVehicle, randomRoute (3000 to 8000 m, checkpoints every 300 m, 50 % dirt / 50 % asphalt ratio), setFuelLevel(level 0..1).
- Menu entries are hidden if the corresponding action is blocked by core_input_actionFilter (funBreak, funHinges, funTires, funFire, funExtinguish, funBoom, forceField, funFling, funFlingDownward, funBoost, funBoostBackwards, latchesOpen, latchesClose, parts_selector, vehicle_selector, toggleBigMap).
- Inconsistencies: the `entries` parameter of registerFunstuffActions is unused; the function registers three menu levels (/root/sandbox/funStuff/, .../destruction/, .../forces/, .../other/) and can create duplicates if called several times.

**Dependencies (loaded first):** `core_jobsystem`, `gameplay_forceField`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_funstuff.boost()` | Adds 25 m/s to the player vehicle in its forward direction. | 61 |
| `core_funstuff.boostBackwards()` | Adds 25 m/s to the player vehicle backwards. | 72 |
| `core_funstuff.breakAllBreakgroups()` | Breaks all breakgroups of the player vehicle (beamstate.breakAllBreakgroups). Error if there is no vehicle. | 85 |
| `core_funstuff.breakHinges()` | Breaks the hinges of the player vehicle (beamstate.breakHinges). | 90 |
| `core_funstuff.closeLatches()` | Closes all latches of the player vehicle via the 'latchesClose' action. | 253 |
| `core_funstuff.deflateRandomTire()` | Deflates one random tire (beamstate.deflateRandomTire). | 100 |
| `core_funstuff.deflateTires()` | Deflates all tires of the player vehicle (beamstate.deflateTires). | 95 |
| `core_funstuff.explodeVehicle()` | Explodes the player vehicle (see notes: temporary repulsive planet + fire.explodeVehicle + breaking all breakgroups). Runs in a core_jobsystem job. | 133 |
| `core_funstuff.extinguishVehicle()` | Extinguishes the fire of the player vehicle (fire.extinguishVehicle). | 110 |
| `core_funstuff.flingDownward()` | Throws the player vehicle downwards at 15 m/s. | 53 |
| `core_funstuff.flingUpward()` | Throws the player vehicle upwards at 15 m/s (reduced if it is already rising fast). | 45 |
| `core_funstuff.igniteVehicle()` | Sets the player vehicle on fire (fire.igniteVehicle). | 105 |
| `core_funstuff.openLatches()` | Opens all latches (doors, hood, trunk) of the player vehicle via core_vehicleBridge.executeAction(…, 'latchesOpen'). | 248 |
| `core_funstuff.registerFunstuffActions(entries)` | Registers in core_quickAccess the radial menu levels '/root/sandbox/funStuff/' (home + Destruction, Forces, Other submenus) and their entries, respecting the actions blocked by core_input_actionFilter. | 271 |
| `core_funstuff.toggleForceField()` | Cycles the force field through three states: inactive -> repulsion (multiplier 1) -> attraction (multiplier -0.5) -> inactive. | 9 |

### Parameter details

#### `core_funstuff.boost()`

Adds 25 m/s to the player vehicle in its forward direction.

- **returns**: string[] {'hide'}.

#### `core_funstuff.boostBackwards()`

Adds 25 m/s to the player vehicle backwards.

- **returns**: string[] {'hide'}.

#### `core_funstuff.breakAllBreakgroups()`

Breaks all breakgroups of the player vehicle (beamstate.breakAllBreakgroups). Error if there is no vehicle.

- **returns**: string[] {'hide'}.

#### `core_funstuff.breakHinges()`

Breaks the hinges of the player vehicle (beamstate.breakHinges).

- **returns**: string[] {'hide'}.

#### `core_funstuff.closeLatches()`

Closes all latches of the player vehicle via the 'latchesClose' action.

- **returns**: string[] {'hide'}.

#### `core_funstuff.deflateRandomTire()`

Deflates one random tire (beamstate.deflateRandomTire).

- **returns**: string[] {'hide'}.

#### `core_funstuff.deflateTires()`

Deflates all tires of the player vehicle (beamstate.deflateTires).

- **returns**: string[] {'hide'}.

#### `core_funstuff.explodeVehicle()`

Explodes the player vehicle (see notes: temporary repulsive planet + fire.explodeVehicle + breaking all breakgroups). Runs in a core_jobsystem job.

- **returns**: string[]|nil {'hide'}; nil if there is no player vehicle.

#### `core_funstuff.extinguishVehicle()`

Extinguishes the fire of the player vehicle (fire.extinguishVehicle).

- **returns**: string[] {'hide'}.

#### `core_funstuff.flingDownward()`

Throws the player vehicle downwards at 15 m/s.

- **returns**: string[] {'hide'}.

#### `core_funstuff.flingUpward()`

Throws the player vehicle upwards at 15 m/s (reduced if it is already rising fast).

- **returns**: string[] {'hide'}.

#### `core_funstuff.igniteVehicle()`

Sets the player vehicle on fire (fire.igniteVehicle).

- **returns**: string[] {'hide'}.

#### `core_funstuff.openLatches()`

Opens all latches (doors, hood, trunk) of the player vehicle via core_vehicleBridge.executeAction(…, 'latchesOpen').

- **returns**: string[] {'hide'}.

#### `core_funstuff.registerFunstuffActions(entries)`

Registers in core_quickAccess the radial menu levels '/root/sandbox/funStuff/' (home + Destruction, Forces, Other submenus) and their entries, respecting the actions blocked by core_input_actionFilter.

- `entries` (*any*) : Not used.

#### `core_funstuff.toggleForceField()`

Cycles the force field through three states: inactive -> repulsion (multiplier 1) -> attraction (multiplier -0.5) -> inactive.

- **returns**: string[] {'reload'}: reloads the radial menu.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'core_jobsystem', 'gameplay_forceField'}. |

## Calls into the engine (C++)

- `be:` `getPlayerVehicle`, `queueAllObjectLua`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/funstuff.lua`.*
