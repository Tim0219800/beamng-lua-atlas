# `core_booster`

*File: `lua/vehicle/extensions/core/booster.lua` · VM: Vehicle · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_booster`: `extensions.load (vehicle VM)("core_booster")`, then the global `core_booster`

Experimental 'boost' extension: simulates a force on the vehicle by placing very distant negative-mass 'planets' (obj:setPlanets), which pushes the vehicle in a given direction for a limited time. A call to boost(force, dt) adds a push that lasts dt seconds.

## Example

```lua
extensions.core_booster.boost(vec3(0, 1, 0), 2)  -- pushes for 2 s
```

## Notes

- For each push, a planet is placed at (vehicle position - force * 1000) with radius 10 and mass -1e18; obj:setPlanets receives the full list every frame.
- BUG: in updateGFX, `table.remove(boosts, i)` uses a variable `i` that does not exist (ipairs is written `_, boost`). When a push expires, the call receives nil and raises a Lua error; moreover removing during iteration skips an element.
- updateGFX prints (print) the planet list every frame as long as there is at least one push: log noise.
- When the list is empty, obj:setPlanets({}) is still called every frame.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_booster.boost(force, dt)` | Adds a push: the direction/force is given by a vector, dt is its duration. | 35 |
| `core_booster.updateGFX(dtSim)` | Called every frame: updates lifetimes, builds the planet list and applies it with obj:setPlanets. *(internal)* | 9 |

### Parameter details

#### `core_booster.boost(force, dt)`

Adds a push: the direction/force is given by a vector, dt is its duration.

- `force` (*vec3|table*) : Push vector (converted to vec3); it is multiplied by 1000 to place the planet.
- `dt` (*number*) : Push duration in seconds.

#### `core_booster.updateGFX(dtSim)`

Called every frame: updates lifetimes, builds the planet list and applies it with obj:setPlanets.

- `dtSim` (*number*) : Simulation time step in seconds.

## Calls into the engine (C++)

- `obj:` `getPosition`, `setPlanets`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/core/booster.lua`.*
