# `advancedwheeldebug`

*File: `lua/vehicle/extensions/advancedwheeldebug.lua` · VM: Vehicle · 103 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `advancedwheeldebug`: `extensions.load (vehicle VM)("advancedwheeldebug")`, then the global `advancedwheeldebug`

Debug extension that computes for each wheel the camber, toe, caster, steering axis inclination (SAI) angles and the wheel pressure, relative to the surface under the vehicle, and sends them to the UI via gui.send('advancedWheelDebugData'). Only active if at least one 'debug user' has enabled it through registerDebugUser.

## Example

```lua
extensions.advancedwheeldebug.registerDebugUser('myTool', true)  -- enable
extensions.advancedwheeldebug.registerDebugUser('myTool', false) -- disable
```

## Notes

- Send format: list of {name, caster?, sai?, camber, toe, pressure}. Angles in degrees; pressure in psi (Pa * 0.000145038), 0 if the wheel has no pressure group.
- caster and sai are only provided if the wheel has steerAxisUp and steerAxisDown. NaN/inf values of toe and camber are replaced by 0.
- The reference plane is computed by averaging the surface normal (mapmgr.surfaceNormalBelow) under each wheel that has a lastTreadContactNode; if no wheel touches the ground, the division by count = 0 produces non-finite values.
- Only sends to the UI if the first player is seated (playerInfo.firstPlayerSeated).

## Functions

| Function | Description | Line |
|---|---|---|
| `advancedwheeldebug.onInit()` | Hook called at extension initialization: clears the debug users and disables the computation. *(internal)* *(hook)* | 12 |
| `advancedwheeldebug.registerDebugUser(user, value)` | Registers or removes a debug requester; the computation is active as long as at least one value is true. | 17 |
| `advancedwheeldebug.updateGFX(dt)` | Called every frame: computes and sends the wheel data if debug is active. *(internal)* | 26 |

### Parameter details

#### `advancedwheeldebug.registerDebugUser(user, value)`

Registers or removes a debug requester; the computation is active as long as at least one value is true.

- `user` (*string*) : Requester identifier.
- `value` (*boolean*) : true to request the display, false to remove it.

#### `advancedwheeldebug.updateGFX(dt)`

Called every frame: computes and sends the wheel data if debug is active.

- `dt` (*number*) : Time step in seconds (unused).

## Calls into the engine (C++)

- `obj:` `getDirectionVector`, `getDirectionVectorRight`, `getGroupPressure`, `getNodePosition`, `getPosition`, `nodeVecCos`, `nodeVecPlanarCos`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/advancedwheeldebug.lua`.*
