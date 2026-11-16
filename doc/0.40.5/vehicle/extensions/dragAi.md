# `dragAi`

*File: `lua/vehicle/extensions/dragAi.lua` · VM: Vehicle · 74 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `dragAi`: `extensions.load (vehicle VM)("dragAi")`, then the global `dragAi`

Mini drag-racing AI: full throttle, proportional steering toward a target point, then braking and handbrake on arrival. The state goes from 'ready' (throttle engaged, handbrake applied) to 'go' (handbrake released, drives to the target), 'stopping', 'finished'. It drives the vehicle by sending input events (input.event).

## Example

```lua
extensions.dragAi.setTarget(vec3(0, 400, 0))
extensions.dragAi.getReady()
extensions.dragAi.go()
```

## Notes

- Internal states: nil/idle, 'ready', 'go', 'stopping', 'finished'. In 'go' the steering equals (cos - sign(cos)) * 30 * sign(side) (no clamp) toward targetPosition (horizontal plane); switches to 'stopping' within 10 m of the target.
- In 'stopping': brake and handbrake, throttle and steering at zero; 'finished' when electrics.values.airspeed < 2 (m/s), then handbrake held.
- If go() is called without a prior setTarget, vec3(nil) will cause an error.
- reset() sets the state to 'idle', cuts the throttle and applies the handbrake.

## Functions

| Function | Description | Line |
|---|---|---|
| `dragAi.getReady()` | Switches to the 'ready' state: applies full throttle. | 10 |
| `dragAi.go()` | Switches to the 'go' state: releases the handbrake, the loop drives toward the target. | 14 |
| `dragAi.reset()` | Vehicle reset hook: 'idle' state, throttle at zero, handbrake applied. *(internal)* | 61 |
| `dragAi.setTarget(targetPos)` | Sets the target point to reach. | 19 |
| `dragAi.updateGFX(dt)` | Called every frame: runs the driving state machine. *(internal)* | 23 |

### Parameter details

#### `dragAi.setTarget(targetPos)`

Sets the target point to reach.

- `targetPos` (*vec3*) : World position of the target (x,y used).

#### `dragAi.updateGFX(dt)`

Called every frame: runs the driving state machine.

- `dt` (*number*) : Time step in seconds (unused).

## Calls into the engine (C++)

- `obj:` `getDirectionVector`, `getDirectionVectorUp`, `getPosition`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/dragAi.lua`.*
