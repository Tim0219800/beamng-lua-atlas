# `perfectLaunch`

*File: `lua/vehicle/extensions/perfectLaunch.lua` · VM: Vehicle · 128 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `perfectLaunch`: `extensions.load (vehicle VM)("perfectLaunch")`, then the global `perfectLaunch`

'Perfect' standing-start aid (launch control) for dragsters: full throttle, then PI control of driven-wheel slip and yaw by modulating the throttle, with trajectory holding via the straightLine extension. Sequence: prepare(target) (vehicle frozen, full throttle), go() (unfreeze, launch), stop() (reset).

## Example

```lua
extensions.perfectLaunch.prepare(vec3(0, 400, 0))
extensions.perfectLaunch.go()
-- M.launchFailed becomes true if the vehicle spins out
```

## Notes

- States: idle, prepareThrottle, prepareBrake (waits), go. prepare freezes the vehicle (controller.mainController.setFreeze(1)), sets the gearbox to 'arcade' mode, pauses the ESC action and calls straightLine.setTargetDirection(target, 'road').
- In 'go', the throttle is computed as follows: slipError = (max slip of wheels with differential - 0.2) + parasitic yaw * 80 (doubled if negative); throttle = clamp(1 - (0.5 * slipError + 3.5 * integral), 0.05, 1), set to 1 above 0.95. The throttle is sent via input.event('throttle', throttle, 2).
- launchFailed becomes true if the smoothed yaw rate exceeds 0.5.
- onInit reloads the straightLine extension (extensions.reload) and re-initializes it; it is also used as onReset.
- Depends on drivetrain.esc.isExisting (a field absent from the fake esc object in drivetrain.lua: always nil, so the ESC is never paused) and on the global straightLine.

## Functions

| Function | Description | Line |
|---|---|---|
| `perfectLaunch.go()` | Starts the launch: unfreezes the vehicle and switches to the 'go' state. | 35 |
| `perfectLaunch.onInit()` | Initialization hook: 'idle' state, resets the controllers, gearbox mode 'arcade' and reloads straightLine. *(internal)* *(hook)* | 18 |
| `perfectLaunch.onReset()` | Same function as onInit. *(internal)* *(hook)* | 18 |
| `perfectLaunch.prepare(target)` | Prepares the launch: freezes the vehicle, full throttle, gives the target direction to straightLine. | 40 |
| `perfectLaunch.stop()` | Stops everything: releases parking brake, brake and throttle, unfreezes, stops straightLine and resets. | 50 |
| `perfectLaunch.updateGFX(dt)` | Called every frame: runs the state machine and the throttle control, then straightLine.updateGFX. *(internal)* | 59 |

### Parameter details

#### `perfectLaunch.prepare(target)`

Prepares the launch: freezes the vehicle, full throttle, gives the target direction to straightLine.

- `target` (*vec3|table*) : Target or direction passed to straightLine.setTargetDirection (inferred from code).

#### `perfectLaunch.updateGFX(dt)`

Called every frame: runs the state machine and the throttle control, then straightLine.updateGFX.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `launchFailed` | boolean | true if a spin-out (smoothed yaw > 0.5) was detected during the launch. |

## Calls into the engine (C++)

- `obj:` `getDirectionVector`, `getVelocity`, `getYawAngularVelocity`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/perfectLaunch.lua`.*
