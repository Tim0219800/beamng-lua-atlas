# `controller_controllerTemplate`

*File: `lua/vehicle/controller/controllerTemplate.lua` · VM: Vehicle · 120 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `controllerTemplate` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Starter template for writing a vehicle controller. A controller is a Lua module placed in lua/vehicle/controller/, declared in the jbeam (`controller` section with `fileName`, and optionally `name`) and loaded by `controller.lua`. Lifecycle: `init(jbeamData)` on creation (jbeamData = the declaration merged with the jbeam data bearing the controller's name), then `initSecondStage`, `initSounds`, `initLastStage` (optional) once the other systems are ready; on reset, `reset(jbeamData)` (or, if absent, `init` is called again) as well as `resetLastStage` and `resetSounds`. In operation: `update(dt)` every physics step, `updateWheelsIntermediate(dt)`, `updateFixedStep(dt)` at a fixed 100 Hz step, `updateGFX(dt)` every graphics frame. Only the functions actually exported in M are called. Other optional hooks: debugDraw, beamBroken, beamDeformed, nodeCollision, onCouplerFound/Attached/Detached, onGameplayEvent, settingsChanged, serialize/deserialize.

## Example

```lua
local M = {}
M.type = "auxiliary"
local function init(jbeamData)
  -- read jbeamData.myKey
end
local function updateGFX(dt)
end
M.init = init
M.reset = init
M.updateGFX = updateGFX
return M
```

## Notes

- `M.type`: "auxiliary" for an ordinary controller; "main" designates the main controller (only one per vehicle, never hot-loadable).
- controller.lua itself adds `name`, `typeName`, `hasCustomName`, `manualOrder` (jbeam key `manualOrder`) and `order` to the module after init. A controller can define `M.relevantDevice` (name of a powertrain device) or `M.defaultOrder` to influence the call order.
- The beam break hook must be called `beamBroken` (and not beamBroke) to be detected.
- In the template, onCouplerFound and onCouplerAttached are commented out with fewer arguments than those actually passed by controller.lua (nodeDist for Found; attachSpeed, attachEnergy for Attached).
- If a controller dynamically adds or removes `M.update` & co, it must call `controller.cacheAllControllerFunctions()`.
- The commented-out functions of the template are not exported; only init, reset and updateGFX are active.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_controllerTemplate.init(jbeamData)` | Called by controller.lua when the controller is created (and on reset if `reset` does not exist). Empty body in the template; this is where the jbeam keys are read. *(internal)* | 64 |
| `controller_controllerTemplate.reset(jbeamData)` | Called on vehicle reset (resetSecondStage step of controller.lua). Empty body in the template. *(internal)* | 55 |
| `controller_controllerTemplate.updateGFX(dt)` | Called every graphics frame. Empty body in the template. The variants `update` (physics step), `updateWheelsIntermediate` and `updateFixedStep` (100 Hz) are provided as comments. *(internal)* | 22 |

### Parameter details

#### `controller_controllerTemplate.init(jbeamData)`

Called by controller.lua when the controller is created (and on reset if `reset` does not exist). Empty body in the template; this is where the jbeam keys are read.

- `jbeamData` (*table*) : Controller jbeam data (fileName, name, custom keys...).

#### `controller_controllerTemplate.reset(jbeamData)`

Called on vehicle reset (resetSecondStage step of controller.lua). Empty body in the template.

- `jbeamData` (*table*) : Same jbeam data as for init.

#### `controller_controllerTemplate.updateGFX(dt)`

Called every graphics frame. Empty body in the template. The variants `update` (physics step), `updateWheelsIntermediate` and `updateFixedStep` (100 Hz) are provided as comments.

- `dt` (*number*) : Step duration in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary" in the template (secondary controller). "main" for the vehicle's main controller. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/controllerTemplate.lua`.*
