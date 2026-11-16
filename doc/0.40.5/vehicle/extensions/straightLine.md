# `straightLine`

*File: `lua/vehicle/extensions/straightLine.lua` · VM: Vehicle · 72 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `straightLine`: `extensions.load (vehicle VM)("straightLine")`, then the global `straightLine`

Very simple steering autopilot: a PID corrects the steering so that the vehicle drives toward a target point (or straight ahead, 20 m in front of its initial position). It sends the command via input.event("steering", value, 1) every frame. Controls neither throttle nor brake.

## Example

```lua
extensions.load('straightLine')
straightLine.setTargetDirection(nil, 'road')   -- straight ahead
straightLine.setTargetDirection(vec3(100,0,0), 'offroad')
straightLine.stop()
```

## Notes

- Modes: "offroad" uses a PID (0.8, 0.5, 0); any other mode uses (0.4, 0, 0), output clamped to [-1, 1]. The mode parameter is concatenated in a print: passing nil causes an error.
- The target is recomputed every frame: targetPos = baseTargetPos + ((pos - 20) * offset) with offset = (0,1,0); only the Y axis is therefore adjusted (behavior as read in the code).
- No check that steeringPID exists: updateGFX only acts if baseTargetPos is defined, which only happens after setTargetDirection.
- The angle error is shaped (square root with sign preserved) before the PID.

## Functions

| Function | Description | Line |
|---|---|---|
| `straightLine.onInit()` | Hook called on vehicle initialization (extensions.hook('onInit')): clears the target. *(internal)* *(hook)* | 59 |
| `straightLine.onReset()` | Hook called on vehicle reset; same function as onInit: clears the target. *(internal)* *(hook)* | 59 |
| `straightLine.setTargetDirection(target, mode)` | Enables driving toward a target. Without a target, aims at the point 20 m in front of the vehicle in the current direction (projected horizontally). Creates the steering PID according to the mode. | 33 |
| `straightLine.stop()` | Stops the assist: sends input.event('steering', 0, 0) and clears the target. | 53 |
| `straightLine.updateGFX(dt)` | Called every graphics frame via extensions.hook('updateGFX'). If a target is defined, computes the angle error and sends the PID steering via input.event('steering', ...). *(internal)* | 15 |

### Parameter details

#### `straightLine.setTargetDirection(target, mode)`

Enables driving toward a target. Without a target, aims at the point 20 m in front of the vehicle in the current direction (projected horizontally). Creates the steering PID according to the mode.

- `target` (*vec3|nil*) : Target position; nil = 20 m straight ahead.
- `mode` (*string*) : "offroad" for a more aggressive PID, any other value for the standard PID. Must not be nil.

#### `straightLine.updateGFX(dt)`

Called every graphics frame via extensions.hook('updateGFX'). If a target is defined, computes the angle error and sends the PID steering via input.event('steering', ...).

- `dt` (*number*) : Time step in seconds, passed to the PID.

## Calls into the engine (C++)

- `obj:` `getDirectionVector`, `getDirectionVectorUp`, `getPosition`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/straightLine.lua`.*
