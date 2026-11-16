# `controller`

*File: `lua/vehicle/controller.lua` · VM: Vehicle · 1059 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `controller`

Manager of the vehicle's jbeam controllers (vehicle VM, global `controller`). On load, it reads the `controller` section of the jbeam (`v.data.controller`), loads each `lua/vehicle/controller/<fileName>.lua` file with `rerequire`, calls its `init(jbeamData)` then the stages `initSecondStage`, `initSounds`, `initLastStage`. It sorts the controllers (by rank of the powertrain device `relevantDevice`, then `manualOrder`, then `defaultOrder`, then name) and builds cached function lists to call all the `update`, `updateGFX`, `updateFixedStep`, etc. without a test every frame. A modder mainly uses it to find a controller (`controller.getController("name")`) or to load one on the fly (`loadControllerExternal`).

## Example

```lua
-- direct access (error if absent)
local esc = controller.getController("esc")
-- tolerant access: returns a 'nil' object that accepts any call
controller.getControllerSafe("jato").fire(true)
-- all controllers of a type
for _, c in ipairs(controller.getControllersByType("hydraulics/electricHydraulics")) do print(c.name) end
```

## Notes

- Controller lifecycle: (1) init(jbeamData) on creation; (2) initSecondStage(jbeamData), initSounds(jbeamData), initLastStage(jbeamData) after the powertrain, electrics, etc. are ready; (3) every physics step `update(dt)` then `updateWheelsIntermediate(dt)`, an `updateFixedStep(dt)` at a fixed 100 Hz (1/100 s accumulator), every graphics frame `updateGFX(dt)`. The optional hooks are beamBroken, beamDeformed, nodeCollision, onCouplerFound, onCouplerAttached, onCouplerDetached, onGameplayEvent, debugDraw, settingsChanged, serialize/deserialize, getState/setState.
- On reset: if the controller has no `reset`, `controller.reset` calls its `init` again; `resetSecondStage` calls `reset(jbeamData)` if it exists, otherwise `initSecondStage`; `resetLastStage` calls `resetLastStage()` otherwise `initLastStage`. `resetSounds` only calls `resetSounds()` if it exists.
- Warning: the name of the break hook in controllers is `beamBroken` (this is what cacheControllerFunctions looks for), whereas the manager's function is called `controller.beamBroke`.
- Controller without a standard `type`: `M.type = "main"` designates the main controller (only one; a second one replaces the first with a warning). If there is none, the `dummy` controller is added. A controller without a jbeam section also gets `dummy`.
- The `shiftLogic-*` controllers (automaticGearbox, cvtGearbox, dctGearbox, manualGearbox, sequentialGearbox) are ignored (blacklist); a controller's default name is its fileName, so a unique `name` must be given to instantiate several of the same type.
- Relocated controllers: registerRelocatedController keeps compatibility of the old names (vehicleController, AVAS, airbrakes, reverseWarn, adaptiveBrakeLights, brakedDifferentialSteering, compressionBrake, postCrashBrake, transbrake) with their new subfolders.
- The fields update, updateGFX, updateWheelsIntermediate, beamBroke, beamDeformed, nodeCollision, onCouplerFound/Attached/Detached, onGameplayEvent and debugDraw are `nop` (empty function) as long as no controller has the corresponding function; they are therefore not nil. The fields mainController and nilController are nil at declaration and then filled by init().
- Anomaly: the getControllerSafe logs for the relocated case announce `controller.getControllersByType` instead of `controller.getControllerSafe` (log message only).
- The manager's onCouplerFound passes 4 arguments (including nodeDist) whereas controllerTemplate and the debug versions declare only 3.
- If a hard-coded debug version (updateDebug, etc.) is uncommented at the top of the file, it replaces the loops; it must be generated with controller.printDebugMethodCalls() for the exact vehicle.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller.cacheAllControllerFunctions()` | Rebuilds the function lists called by update, updateGFX, updateFixedStep, updateWheelsIntermediate and the hooks, based on the functions present on each sorted controller. To be called again if a controller dynamically adds or removes one of these functions (e.g. M.update = ...). | 708 |
| `controller.getAllControllers()` | Returns the actual table (not a copy) of all loaded controllers, keyed by name. | 228 |
| `controller.getController(name)` | Returns the controller with this name, or nil if it does not exist (test before indexing, otherwise error). | 232 |
| `controller.getControllerSafe(name)` | Like getController but never returns nil: handles relocated controllers and, if nothing is found, returns `nilController`, which accepts any index or call without error. Handy for calls like `controller.getControllerSafe("x").function()`. | 236 |
| `controller.getControllersByType(typeName)` | Lists the controllers whose type (fileName) equals typeName, taking into account relocated controllers without a custom name. | 259 |
| `controller.getControllersFromPath(path)` | Lists the controllers whose typeName starts with the given prefix (search by folder). | 272 |
| `controller.getState()` | Recursively merges the results of `getState()` from each controller that defines it. | 995 |
| `controller.init()` | Loads all controllers from the jbeam (or dummy), creates the nilController, registers relocated controllers, skips the blacklist, merges the `v.data[name]` data with the declaration, calls `init(data)`, designates the main controller and sorts the controllers. A controller's errors are logged without blocking the others. *(internal)* | 436 |
| `controller.initLastStage()` | Calls `initLastStage(jbeamData)` on each controller then rebuilds the caches. *(internal)* | 743 |
| `controller.initSecondStage()` | Calls `initSecondStage(jbeamData)` on each controller then rebuilds the caches. Called after the init of all the vehicle's systems. *(internal)* | 733 |
| `controller.initSounds()` | Calls `initSounds(jbeamData)` on each controller then rebuilds the caches. *(internal)* | 753 |
| `controller.isPhysicsStepUsed()` | Indicates whether at least one controller needs the physics loop (update, updateFixedStep or updateWheelsIntermediate). *(internal)* | 1006 |
| `controller.loadControllerExternal(fileName, controllerName, controllerData)` | Loads a controller on the fly, outside the jbeam. Refuses a name already taken and controllers of type `main`. Then calls init, initSecondStage, initSounds, initLastStage, re-sorts the controllers and rebuilds the call caches. Errors are logged without crashing. | 297 |
| `controller.onDeserialize(data)` | Hook called when a saved state is reloaded: passes to each controller named in `data` its share via `deserialize(controllerData)`. *(internal)* *(hook)* | 961 |
| `controller.onSerialize()` | Hook called on state save: collects `serialize()` from each controller that defines it. *(internal)* *(hook)* | 973 |
| `controller.printDebugMethodCalls(callType)` | Development tool: prints Lua code listing the direct calls (by sortedControllers index) to paste at the top of controller.lua to replace the loops. *(internal)* | 807 |
| `controller.registerRelocatedController(originalPath, newPath)` | Declares that an old controller path/name is now at a new path, so that old jbeam files keep working. | 62 |
| `controller.reset()` | Resets the fixed-step accumulator to 0 and calls `init(jbeamData)` again on controllers that have no `reset` function (those that have one are handled in resetSecondStage). *(internal)* | 763 |
| `controller.resetLastStage()` | For each controller: `resetLastStage()` if it exists, otherwise `initLastStage(jbeamData)`; then rebuilds the caches. *(internal)* | 785 |
| `controller.resetSecondStage()` | For each controller: `reset(jbeamData)` if it exists, otherwise `initSecondStage(jbeamData)`; then rebuilds the caches. *(internal)* | 773 |
| `controller.resetSounds()` | Calls `resetSounds()` on the controllers that define it then rebuilds the caches. *(internal)* | 797 |
| `controller.setFreeze(mode)` | Sets `isFrozen` to `mode == 1` and forwards the call to the main controller. | 282 |
| `controller.setState(data)` | Passes `data` to the `setState(data)` function of each controller that defines it. | 983 |
| `controller.settingsChanged()` | Calls `settingsChanged()` on each controller that defines it. Called when the game settings change. *(internal)* | 220 |
| `controller.unloadControllerExternal(controllerName)` | Removes a loaded controller from the manager (without calling any cleanup function) and rebuilds the call caches. | 376 |
| `controller.updateSimpleControlButtons()` | Calls `updateSimpleControlButtons()` on each controller that has it (refreshes the UI's simplified control buttons). | 289 |

### Parameter details

#### `controller.getAllControllers()`

Returns the actual table (not a copy) of all loaded controllers, keyed by name.

- **returns**: table<string, table> name -> controller module.

#### `controller.getController(name)`

Returns the controller with this name, or nil if it does not exist (test before indexing, otherwise error).

- `name` (*string*) : Controller name (by default the fileName, otherwise the jbeam `name` key).
- **returns**: table|nil The controller module.

#### `controller.getControllerSafe(name)`

Like getController but never returns nil: handles relocated controllers and, if nothing is found, returns `nilController`, which accepts any index or call without error. Handy for calls like `controller.getControllerSafe("x").function()`.

- `name` (*string*) : Controller name.
- **returns**: table The controller, or nilController.

#### `controller.getControllersByType(typeName)`

Lists the controllers whose type (fileName) equals typeName, taking into account relocated controllers without a custom name.

- `typeName` (*string*) : File path, e.g. "braking/transbrake".
- **returns**: table[] List (order not guaranteed) of controllers.

#### `controller.getControllersFromPath(path)`

Lists the controllers whose typeName starts with the given prefix (search by folder).

- `path` (*string*) : Prefix, e.g. "braking/".
- **returns**: table[] List of matching controllers.

#### `controller.getState()`

Recursively merges the results of `getState()` from each controller that defines it.

- **returns**: table|nil Merged state, nil if empty.

#### `controller.isPhysicsStepUsed()`

Indicates whether at least one controller needs the physics loop (update, updateFixedStep or updateWheelsIntermediate).

- **returns**: boolean true if one of these hooks exists.

#### `controller.loadControllerExternal(fileName, controllerName, controllerData)`

Loads a controller on the fly, outside the jbeam. Refuses a name already taken and controllers of type `main`. Then calls init, initSecondStage, initSounds, initLastStage, re-sorts the controllers and rebuilds the call caches. Errors are logged without crashing.

- `fileName` (*string*) : File path relative to controller/ (without .lua).
- `controllerName` (*string|nil*) : Instance name; defaults to fileName.
- `controllerData` (*table|nil*) : Data passed to init as jbeamData; {} by default.
- **returns**: table|nil The loaded controller, nil on failure.

#### `controller.onDeserialize(data)`

Hook called when a saved state is reloaded: passes to each controller named in `data` its share via `deserialize(controllerData)`.

- `data` (*table<string, any>|nil*) : controller name -> data previously returned by its serialize().

#### `controller.onSerialize()`

Hook called on state save: collects `serialize()` from each controller that defines it.

- **returns**: table<string, any> controller name -> serialized data.

#### `controller.printDebugMethodCalls(callType)`

Development tool: prints Lua code listing the direct calls (by sortedControllers index) to paste at the top of controller.lua to replace the loops.

- `callType` (*string|nil*) : "update", "updateGFX", "updateWheelsIntermediate", "beamBroke", "beamDeformed", "nodeCollision", "onCouplerFound", "onCouplerAttached", "onCouplerDetached", "onGameplayEvent", "debugDraw", "settingsChanged"; nil = all.

#### `controller.registerRelocatedController(originalPath, newPath)`

Declares that an old controller path/name is now at a new path, so that old jbeam files keep working.

- `originalPath` (*string*) : Old name (e.g. "transbrake") or path ("controller/transbrake").
- `newPath` (*string*) : New path relative to the controller/ folder (e.g. "braking/transbrake"); for loadControllerExternal it is the full path without extension.

#### `controller.setFreeze(mode)`

Sets `isFrozen` to `mode == 1` and forwards the call to the main controller.

- `mode` (*integer*) : 1 = frozen, other = not frozen.

#### `controller.setState(data)`

Passes `data` to the `setState(data)` function of each controller that defines it.

- `data` (*table|nil*) : State to apply; nil does nothing.

#### `controller.unloadControllerExternal(controllerName)`

Removes a loaded controller from the manager (without calling any cleanup function) and rebuilds the call caches.

- `controllerName` (*string*) : Instance name.

## Fields

| Field | Type | Description |
|---|---|---|
| `beamBroke` | function | Broadcasts beamBroken(id, energy) to the controllers that have it. |
| `beamDeformed` | function | Broadcasts beamDeformed(id, ratio) to the controllers that have it. |
| `debugDraw` | function | Broadcasts debugDraw(focusPos) to the controllers that have it. |
| `isFrozen` | boolean | true if setFreeze(1) has been called. |
| `mainController` | table|nil | Controller whose `type == "main"` (only one), or the `dummy` controller if none. nil before init(). |
| `nilController` | table|nil | 'Null' object created by init(): any indexing or call returns itself, writing is ignored. Returned by getControllerSafe when the controller is not found. |
| `nodeCollision` | function | Broadcasts nodeCollision(p) to the controllers that have it (p: parameter coming from the engine). |
| `onCouplerAttached` | function | Broadcasts onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy). |
| `onCouplerDetached` | function | Broadcasts onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce). |
| `onCouplerFound` | function | Broadcasts onCouplerFound(nodeId, obj2id, obj2nodeId, nodeDist). |
| `onGameplayEvent` | function | Broadcasts onGameplayEvent(eventName, ...) to the controllers that have it. |
| `update` | function | Calls update(dt) of each controller then, with the 100 Hz accumulator, updateFixedStep. Is nop if there is nothing to call. Called by the physics loop. |
| `updateGFX` | function | Calls updateGFX(dt) on each controller, once per graphics frame. |
| `updateWheelsIntermediate` | function | Calls updateWheelsIntermediate(dt) on each relevant controller (intermediate physics step for the wheels). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller.lua`.*
