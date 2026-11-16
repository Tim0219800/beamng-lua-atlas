---@meta
-- tim19Atlas stub generated from lua/vehicle/controller.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manager of the vehicle's jbeam controllers (vehicle VM, global `controller`). On load, it reads the `controller` section of the jbeam (`v.data.controller`), loads each `lua/vehicle/controller/<fileName>.lua` file with `rerequire`, calls its `init(jbeamData)` then the stages `initSecondStage`, `initSounds`, `initLastStage`. It sorts the controllers (by rank of the powertrain device `relevantDevice`, then `manualOrder`, then `defaultOrder`, then name) and builds cached function lists to call all the `update`, `updateGFX`, `updateFixedStep`, etc. without a test every frame. A modder mainly uses it to find a controller (`controller.getController("name")`) or to load one on the fly (`loadControllerExternal`).
--- Access: global `controller`
---@class controller
---@field beamBroke function Broadcasts beamBroken(id, energy) to the controllers that have it.
---@field beamDeformed function Broadcasts beamDeformed(id, ratio) to the controllers that have it.
---@field debugDraw function Broadcasts debugDraw(focusPos) to the controllers that have it.
---@field isFrozen boolean true if setFreeze(1) has been called.
---@field mainController table|nil Controller whose `type == "main"` (only one), or the `dummy` controller if none. nil before init().
---@field nilController table|nil 'Null' object created by init(): any indexing or call returns itself, writing is ignored. Returned by getControllerSafe when the controller is not found.
---@field nodeCollision function Broadcasts nodeCollision(p) to the controllers that have it (p: parameter coming from the engine).
---@field onCouplerAttached function Broadcasts onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy).
---@field onCouplerDetached function Broadcasts onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce).
---@field onCouplerFound function Broadcasts onCouplerFound(nodeId, obj2id, obj2nodeId, nodeDist).
---@field onGameplayEvent function Broadcasts onGameplayEvent(eventName, ...) to the controllers that have it.
---@field update function Calls update(dt) of each controller then, with the 100 Hz accumulator, updateFixedStep. Is nop if there is nothing to call. Called by the physics loop.
---@field updateGFX function Calls updateGFX(dt) on each controller, once per graphics frame.
---@field updateWheelsIntermediate function Calls updateWheelsIntermediate(dt) on each relevant controller (intermediate physics step for the wheels).
controller = {}

--- Rebuilds the function lists called by update, updateGFX, updateFixedStep, updateWheelsIntermediate and the hooks, based on the functions present on each sorted controller. To be called again if a controller dynamically adds or removes one of these functions (e.g. M.update = ...).
---Source: lua/vehicle/controller.lua:708
function controller.cacheAllControllerFunctions() end

--- Returns the actual table (not a copy) of all loaded controllers, keyed by name.
---Source: lua/vehicle/controller.lua:228
---@return table<string, table>  name -> controller module.
function controller.getAllControllers() end

--- Returns the controller with this name, or nil if it does not exist (test before indexing, otherwise error).
---Source: lua/vehicle/controller.lua:232
---@param name string Controller name (by default the fileName, otherwise the jbeam `name` key).
---@return table|nil  The controller module.
function controller.getController(name) end

--- Like getController but never returns nil: handles relocated controllers and, if nothing is found, returns `nilController`, which accepts any index or call without error. Handy for calls like `controller.getControllerSafe("x").function()`.
---Source: lua/vehicle/controller.lua:236
---@param name string Controller name.
---@return table  The controller, or nilController.
function controller.getControllerSafe(name) end

--- Lists the controllers whose type (fileName) equals typeName, taking into account relocated controllers without a custom name.
---Source: lua/vehicle/controller.lua:259
---@param typeName string File path, e.g. "braking/transbrake".
---@return table[]  List (order not guaranteed) of controllers.
function controller.getControllersByType(typeName) end

--- Lists the controllers whose typeName starts with the given prefix (search by folder).
---Source: lua/vehicle/controller.lua:272
---@param path string Prefix, e.g. "braking/".
---@return table[]  List of matching controllers.
function controller.getControllersFromPath(path) end

--- Recursively merges the results of `getState()` from each controller that defines it.
---Source: lua/vehicle/controller.lua:995
---@return table|nil  Merged state, nil if empty.
function controller.getState() end

--- Loads all controllers from the jbeam (or dummy), creates the nilController, registers relocated controllers, skips the blacklist, merges the `v.data[name]` data with the declaration, calls `init(data)`, designates the main controller and sorts the controllers. A controller's errors are logged without blocking the others.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller.lua:436
function controller.init() end

--- Calls `initLastStage(jbeamData)` on each controller then rebuilds the caches.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller.lua:743
function controller.initLastStage() end

--- Calls `initSecondStage(jbeamData)` on each controller then rebuilds the caches. Called after the init of all the vehicle's systems.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller.lua:733
function controller.initSecondStage() end

--- Calls `initSounds(jbeamData)` on each controller then rebuilds the caches.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller.lua:753
function controller.initSounds() end

--- Indicates whether at least one controller needs the physics loop (update, updateFixedStep or updateWheelsIntermediate).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller.lua:1006
---@return boolean  true if one of these hooks exists.
function controller.isPhysicsStepUsed() end

--- Loads a controller on the fly, outside the jbeam. Refuses a name already taken and controllers of type `main`. Then calls init, initSecondStage, initSounds, initLastStage, re-sorts the controllers and rebuilds the call caches. Errors are logged without crashing.
---Source: lua/vehicle/controller.lua:297
---@param fileName string File path relative to controller/ (without .lua).
---@param controllerName string|nil Instance name; defaults to fileName.
---@param controllerData table|nil Data passed to init as jbeamData; {} by default.
---@return table|nil  The loaded controller, nil on failure.
function controller.loadControllerExternal(fileName, controllerName, controllerData) end

--- Hook called when a saved state is reloaded: passes to each controller named in `data` its share via `deserialize(controllerData)`.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller.lua:961
---@param data table<string, any>|nil controller name -> data previously returned by its serialize().
function controller.onDeserialize(data) end

--- Hook called on state save: collects `serialize()` from each controller that defines it.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller.lua:973
---@return table<string, any>  controller name -> serialized data.
function controller.onSerialize() end

--- Development tool: prints Lua code listing the direct calls (by sortedControllers index) to paste at the top of controller.lua to replace the loops.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller.lua:807
---@param callType string|nil "update", "updateGFX", "updateWheelsIntermediate", "beamBroke", "beamDeformed", "nodeCollision", "onCouplerFound", "onCouplerAttached", "onCouplerDetached", "onGameplayEvent", "debugDraw", "settingsChanged"; nil = all.
function controller.printDebugMethodCalls(callType) end

--- Declares that an old controller path/name is now at a new path, so that old jbeam files keep working.
---Source: lua/vehicle/controller.lua:62
---@param originalPath string Old name (e.g. "transbrake") or path ("controller/transbrake").
---@param newPath string New path relative to the controller/ folder (e.g. "braking/transbrake"); for loadControllerExternal it is the full path without extension.
function controller.registerRelocatedController(originalPath, newPath) end

--- Resets the fixed-step accumulator to 0 and calls `init(jbeamData)` again on controllers that have no `reset` function _anon(those that have one are handled in resetSecondStage).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller.lua:763
function controller.reset() end

--- For each controller: `resetLastStage()` if it exists, otherwise `initLastStage(jbeamData)`; then rebuilds the caches.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller.lua:785
function controller.resetLastStage() end

--- For each controller: `reset(jbeamData)` if it exists, otherwise `initSecondStage(jbeamData)`; then rebuilds the caches.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller.lua:773
function controller.resetSecondStage() end

--- Calls `resetSounds()` on the controllers that define it then rebuilds the caches.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller.lua:797
function controller.resetSounds() end

--- Sets `isFrozen` to `mode == 1` and forwards the call to the main controller.
---Source: lua/vehicle/controller.lua:282
---@param mode integer 1 = frozen, other = not frozen.
function controller.setFreeze(mode) end

--- Passes `data` to the `setState(data)` function of each controller that defines it.
---Source: lua/vehicle/controller.lua:983
---@param data table|nil State to apply; nil does nothing.
function controller.setState(data) end

--- Calls `settingsChanged()` on each controller that defines it. Called when the game settings change.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller.lua:220
function controller.settingsChanged() end

--- Removes a loaded controller from the manager (without calling any cleanup function) and rebuilds the call caches.
---Source: lua/vehicle/controller.lua:376
---@param controllerName string Instance name.
function controller.unloadControllerExternal(controllerName) end

--- Calls `updateSimpleControlButtons()` on each controller that has it (refreshes the UI's simplified control buttons).
---Source: lua/vehicle/controller.lua:289
function controller.updateSimpleControlButtons() end

