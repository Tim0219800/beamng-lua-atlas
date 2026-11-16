# `main`

*File: `lua/vehicle/main.lua` · VM: Vehicle · 555 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("main")`

Entry point of a vehicle's Lua VM: it is the first script run. It configures LuaJIT and package.path, loads the common utilities, creates the base globals (extensions, settings, playerInfo, lastDt, physicsDt), then defines GLOBAL functions that the C++ engine calls directly (init, onPhysicsStep, onGraphicsStep, onDebugDraw, onVehicleReset, beam/coupler callbacks, etc.). Each callback relays the event to the internal modules (wheels, powertrain, controller, beamstate…) then, in general, to the extensions via extensions.hook. A modder almost never calls these functions: they write extensions that receive the hooks (updateGFX, onPhysicsStep, onReset…) or read the globals.

## Example

```lua
-- a vehicle extension receives the hooks emitted by main.lua
local M = {}
M.onReset = function(retainDebug) end
M.updateGFX = function(dtSim) end
M.onPlayersChanged = function(anyPlayerSeated) end
return M
```

## Notes

- ORDER of the graphics loop onGraphicsStep(dtSim): sensors.updateGFX -> mapmgr.sendTracking -> wheels.updateGFX -> ai.updateGFX -> input.updateGFX -> electrics.updateGFX -> controller.updateGFX -> electrics.updateGFXSecondStep -> extensions.hook('updateGFX') -> hydros.updateGFX -> powertrain.updateGFX -> energyStorage.updateGFX -> drivetrain.updateGFX -> beamstate.updateGFX -> protocols.updateGFX -> sounds.updateGFX -> thrusters.updateGFX -> (guihooks.sendStreams if streams are active) -> damageTracker.updateGFX (only if the first player is seated) -> props.updateGFX -> material.updateGFX -> fire.updateGFX -> recovery.updateGFX -> powertrain.updateGFXLastStage. The code comments require: sensors before input and ai, input as early as possible, extensions after electrics and before drivetrain/hydros.
- ORDER of the physics loop onPhysicsStep(dtPhys): wheels.updateWheelVelocities -> powertrain.update -> controller.updateWheelsIntermediate -> wheels.updateWheelTorques -> controller.update -> thrusters.update -> hydros.update -> beamstate.update -> protocols.update -> extensions.hook('onPhysicsStep') (only if enablePhysicsStepHook() has been called). The C++ engine only calls onPhysicsStep if obj:setPhysicsStepEnabled(true), computed by updateCorePhysicsStepEnabled() (at least one module or the extension hook needs it).
- ORDER of initialization (initSystems): backwardsCompatibility.init, material.init, bdebug.init, electrics.init, damageTracker.init, beamstate.init, protocols.init, wheels.init, powertrain.init, energyStorage.init, input.init, controller.init, wheels.initSecondStage, controller.initSecondStage, drivetrain.init, sensors.reset, thrusters.init, hydros.init, sounds.init, props.init, input.initSecondStage, recovery.init, sensors.init, fire.init, wheels.initSounds, powertrain.initSounds, controller.initSounds, extensions.hook('onInit'), mapmgr.init, electrics.initLastStage, controller.initLastStage, powertrain.sendTorqueData, detectGlobalWrites(), updateCorePhysicsStepEnabled.
- ORDER of the reset (onVehicleReset): guihooks.reset, extensions.hook('onReset'), ai.reset, mapmgr.reset, damageTracker, beamstate, protocols, wheels, electrics, powertrain, energyStorage, controller, wheels.resetSecondStage, controller.resetSecondStage, drivetrain, props, sensors, bdebug, thrusters, input, hydros, material, fire, powertrain.resetSounds, controller.resetSounds, sounds, partCondition, electrics.resetLastStage, controller.resetLastStage, powertrain.sendTorqueData, updateCorePhysicsStepEnabled. Note: the extensions receive onReset BEFORE the core modules.
- MODULES LOADED AS GLOBALS by init() (in this order): damageTracker, drivetrain, powertrain, energyStorage, controller, wheels, sounds, bdebug, input, props, particles, particlefilter, material, v (= require('jbeam/stage2')), electrics, beamstate, protocols, sensors, bullettime (to be deprecated), thrusters, hydros, guihooks (name must not be changed or the GUI callback breaks), streams (= guistreams), gui (alias of guihooks), ai, recovery, mapmgr, fire, partCondition. Globals created before init: extensions, settings, backwardsCompatibility, playerInfo, lastDt, physicsDt, vehiclePath, ghostOnReset, ghostOnTp, float3 (alias of vec3), profilerPushEvent/PopEvent(1), shippingBuild, vmType='vehicle'.
- Extensions loaded by init: all those in <vehicle>/lua (except controller, powertrain, energyStorage), core_quickAccess, input_haptics (before the modules), then skeleton, the whole lua/vehicle/extensions/auto folder, gameplayStatistic; the onVehicleLoaded hook is emitted right after the auto folder.
- init returns false (the engine then unloads the vehicle's Lua) if the spawn data is invalid, if the stage2 loading fails or if v.data.information.simpleObject == true. If no node exists (nodesMissing), init raises error('nodesMissing') at the end to show the spawn failure.
- playerInfo: seatedPlayers (table player index -> true, 0-based, nil at start), persona, firstPlayerSeated (player 0 seated), anyPlayerSeated.
- Bug spotted: `profilerPopEvent1 = profilerPushEvent or nop` and `profilerPushEvent1 = profilerPushEvent or nop` (Pop1 actually receives the Push function); if the profiler exists, profilerPopEvent1 pushes instead of popping.
- Minor bug: init passes `retainDebug` to extensions.hook('onVehicleLoaded', retainDebug) although this variable is not defined anywhere in main.lua (nil global unless defined elsewhere).
- print is redefined: print(...) calls log('A','print',tostring(...)) and therefore only prints the FIRST argument.
- onNodeCollision fills the shared table particlefilter.particleData (fields id1, pos, normal, nodeVel, perpendicularVel, slipVec, slipVel, slipForce, normalForce, depth, materialID1, materialID2) then passes it to wheels, fire, controller, particlefilter, bdebug (not to the extensions).
- onDynamicBeamAdded/onDynamicBeamDeleted/onDynamicBeamBroke exist but are empty.

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `enablePhysicsStepHook()` | Makes onPhysicsStep relay extensions.hook('onPhysicsStep', dt) and forces the re-evaluation of the engine flag. To be called in onExtensionLoaded by any extension that defines onPhysicsStep (the hook is never disabled afterwards). | 65 |
| `exportPersistentData()` | Called by the engine before a Lua reload: serializes the extensions (serializePackages('reload')) and hands them to the engine via obj:setPersistentData. | 533 |
| `importPersistentData(s)` | Called by the engine after a reload: deserializes the persistent data and gives it back to the extensions (deserializePackages). | 539 |
| `init(path, initData)` | Called by the engine at vehicle spawn. Adjusts package.path to the vehicle folder, loads the modules as globals, decodes initData (lpack) and builds the vehicle data (v.loadVehicleStage2), calls initSystems, loads the base extensions (skeleton, auto folder, gameplayStatistic) and emits 'onVehicleLoaded'. | 206 |
| `initSystems()` | Initializes all subsystems in the order described in the notes, emits the 'onInit' hook, enables global write detection (detectGlobalWrites) and sets the physics step flag. Called by init(). | 139 |
| `onBeamBroke(id, energy)` | Called by the engine when a beam breaks. Relays to beamstate, wheels, powertrain, energyStorage, controller, bdebug, then extensions.hook('onBeamBroke'). | 366 |
| `onBeamDeformed(id, ratio)` | Called by the engine only for beams that have deformation triggers. Relays to beamstate and controller then to the 'onBeamDeformed' hook. | 377 |
| `onCallEvent(funName, data)` | Generic callback used by the engine to call a Lua function by name. Resolves `funName` either as a global ("maFonction") or as "module.function" (a single level, the module must be a global table) and calls it with `data`. Silently ignores anything that is not a function. | 345 |
| `onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy)` | Called by the engine when a coupler attaches. Relays to the same modules as onCouplerFound then to the 'onCouplerAttached' hook. | 397 |
| `onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Called by the engine when a coupler detaches. Relays to the same modules then to the 'onCouplerDetached' hook. | 406 |
| `onCouplerFound(nodeId, obj2id, obj2nodeId, nodeDist)` | Called by the engine when a coupler finds a compatible coupler in range. Relays to beamstate, controller, powertrain, energyStorage then to the 'onCouplerFound' hook. | 388 |
| `onDebugDraw(x, y, z)` | Called by the engine every debug draw frame. Updates the shared focus position, calls bdebug.debugDraw, ai.debugDraw, beamstate.debugDraw, controller.debugDraw, hydros.debugDraw, then extensions.hook('onDebugDraw', focusPos) and, if a player is seated, 'onDebugDrawActive'. | 126 |
| `onDespawnObject()` | Called by the engine when the vehicle is removed: hydros.destroy(), protocols.destroy() and, if the global odometer exists, odometer.submitStatistic(). | 430 |
| `onDynamicBeamAdded(dbId, nodeId, tag)` | Engine callback when a dynamic beam is added; empty body. | 420 |
| `onDynamicBeamBroke(dbId, energy)` | Engine callback when a dynamic beam breaks; empty body. | 426 |
| `onDynamicBeamDeleted(dbId)` | Engine callback when a dynamic beam is removed; empty body. | 423 |
| `onGraphicsStep(dtSim)` | Called by the engine every graphics frame (once per render/simulation frame). Stores lastDt, updates GUI streams, sensors, wheels, AI, inputs, electrics, controllers, extensions (hook 'updateGFX'), hydros, powertrain, etc. in the order described in the notes. | 86 |
| `onNodeCollision(id1, pos, normal, nodeVel, perpendicularVel, slipVec, slipVel, slipForce, normalForce, depth, materialId1, materialId2)` | Called by the engine on each filtered node collision. Fills particlefilter.particleData and passes it to wheels, fire, controller, particlefilter and bdebug. | 491 |
| `onPhysicsStep(dtPhys)` | Called by the engine at each physics step (high frequency) if the step is enabled. Runs the physics chain (see notes) then the 'onPhysicsStep' extension hook. | 73 |
| `onSetClusterPosRelRot(cNodeId, pos, relRot)` | Called by the engine when a node cluster is teleported/repositioned. Enables ghost mode (obj:setGhostEnabled(true)) if ghostOnTp, then emits the 'onSetClusterPosRelRot' hook. | 439 |
| `onSettingsChanged()` | Called by the engine when the settings change: settings.settingsChanged, 'onSettingsChanged' hook, then controller, input, wheels and protocols.settingsChanged. | 545 |
| `onSlidenodeDetached(nodeId, railId, energy)` | Called by the engine when a slidenode leaves its rail; relays only to the 'onSlidenodeDetached' extension hook. | 415 |
| `onTorsionbarBroken(id, energy)` | Called by the engine when a torsion bar breaks; relays to beamstate and to the 'onTorsionbarBroken' hook. | 383 |
| `onVehicleReset(retainDebug)` | Called by the engine on vehicle reset (I key, recovery…). Re-enables ghost mode if ghostOnReset, resets all modules (order in the notes) and emits the 'onReset' hook. | 448 |
| `print(...)` | Replaces the standard print: sends the first argument converted to a string to the log (level 'A', tag 'print'). | 16 |
| `setControllingPlayers(players)` | Called by the engine when the list of players seated in this vehicle changes. Updates playerInfo (seatedPlayers, anyPlayerSeated, firstPlayerSeated), notifies the main controller/powertrain/damageTracker if a player is seated, notifies bdebug, protocols, ai, sounds, then emits 'onPlayersChanged'. | 504 |
| `setPlayerPersona(persona)` | Sets playerInfo.persona (the player's persona identifier). | 529 |
| `updateCorePhysicsStepEnabled()` | Enables or disables, on the engine side, the call of onPhysicsStep: obj:setPhysicsStepEnabled(true) if controller, powertrain, wheels, thrusters, hydros, beamstate or protocols need it (isPhysicsStepUsed) or if the extension hook is active. Called at the end of init and reset. | 61 |

**Globals assigned:** `backwardsCompatibility`, `extensions`, `float3`, `lastDt`, `physicsDt`, `playerInfo`, `profilerPopEvent`, `profilerPopEvent1`, `profilerPushEvent`, `profilerPushEvent1`, `settings`, `shippingBuild`, `vmType`

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onBeamBroke`
- `onBeamDeformed` — listened to by 1 module(s)
- `onCouplerAttached` — listened to by 10 module(s)
- `onCouplerDetached` — listened to by 10 module(s)
- `onCouplerFound` — listened to by 5 module(s)
- `onDebugDraw` — listened to by 3 module(s)
- `onDebugDrawActive`
- `onInit` — listened to by 14 module(s)
- `onPlayersChanged` — listened to by 3 module(s)
- `onReset` — listened to by 15 module(s)
- `onSetClusterPosRelRot`
- `onSettingsChanged`
- `onSlidenodeDetached`
- `onTorsionbarBroken`
- `onVehicleLoaded` — listened to by 1 module(s)
- `updateGFX`

## Calls into the engine (C++)

- `obj:` `getPhysicsDt`, `getUpdateUIflag`, `setGhostEnabled`, `setPersistentData`, `setPhysicsStepEnabled`, `setSlipTireMarkThreshold`

**Loads extensions:** `core_quickAccess`, `gameplayStatistic`, `input_haptics`, `skeleton`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/main.lua`.*
