---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/controllerTemplate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Starter template for writing a vehicle controller. A controller is a Lua module placed in lua/vehicle/controller/, declared in the jbeam (`controller` section with `fileName`, and optionally `name`) and loaded by `controller.lua`. Lifecycle: `init(jbeamData)` on creation (jbeamData = the declaration merged with the jbeam data bearing the controller's name), then `initSecondStage`, `initSounds`, `initLastStage` (optional) once the other systems are ready; on reset, `reset(jbeamData)` (or, if absent, `init` is called again) as well as `resetLastStage` and `resetSounds`. In operation: `update(dt)` every physics step, `updateWheelsIntermediate(dt)`, `updateFixedStep(dt)` at a fixed 100 Hz step, `updateGFX(dt)` every graphics frame. Only the functions actually exported in M are called. Other optional hooks: debugDraw, beamBroken, beamDeformed, nodeCollision, onCouplerFound/Attached/Detached, onGameplayEvent, settingsChanged, serialize/deserialize.
--- Access: controller `controllerTemplate` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_controllerTemplate
---@field type string "auxiliary" in the template (secondary controller). "main" for the vehicle's main controller.
local controller_controllerTemplate = {}

--- Called by controller.lua when the controller is created (and on reset if `reset` does not exist). Empty body in the template; this is where the jbeam keys are read.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/controllerTemplate.lua:64
---@param jbeamData table Controller jbeam data (fileName, name, custom keys...).
function controller_controllerTemplate.init(jbeamData) end

--- Called on vehicle reset (resetSecondStage step of controller.lua). Empty body in the template.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/controllerTemplate.lua:55
---@param jbeamData table Same jbeam data as for init.
function controller_controllerTemplate.reset(jbeamData) end

--- Called every graphics frame. Empty body in the template. The variants `update` (physics step), `updateWheelsIntermediate` and `updateFixedStep` (100 Hz) are provided as comments.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/controllerTemplate.lua:22
---@param dt number Step duration in seconds.
function controller_controllerTemplate.updateGFX(dt) end

return controller_controllerTemplate
