# `core_trafficSignals`

*File: `lua/ge/extensions/core/trafficSignals.lua` · VM: Game Engine (GE) · 1725 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_trafficSignals`: `extensions.load("core_trafficSignals")`, then the global `core_trafficSignals`

GE extension `core_trafficSignals` (Traffic Signals V2): simulates the traffic lights, stop signs and other signals of a level. Three object types: SignalInstance (a signal placed in the world with position, direction, controller and sequence), SignalController (signal type and list of states with durations: traffic light, stop...) and SignalSequence (phases chaining controllers, shared by the instances of an intersection). Loads signals.json and signalControllerDefinitions.json from the level folder, updates the lights of the linked TSStatic objects (dynamic fields signalInstance, instanceColor*), publishes the state to vehicles (mailbox 'trafficSignalUpdates') and through the onTrafficSignalUpdate hook.

## Example

```lua
-- State of the first signal
local s = core_trafficSignals.getSignals()[1]
local stateName, stateData = s:getState()   -- e.g. 'greenTrafficLight'
-- Force a sequence to step 2 without the timer interfering
local seq = s:getSequence()
seq:enableTimer(false)
seq:setStep(2)
-- Nearest upstream signal of a vehicle
local best = core_trafficSignals.getBestSignal(veh:getPosition(), veh:getDirectionVector())
```

## Notes

- Lifecycle: onClientStartMission -> loadSignals(); the system is only actually started (runSignals) by onNavgraphReloaded, when the road graph is ready (or immediately with autoRun=true). onClientEndMission -> resetSignals().
- The module time (`timer`, read by getTimer) advances by dtSim on each onUpdate (or real dt if M.useDtReal). Step changes are scheduled in a priority queue (minheap) sorted by time.
- Each state change is published to vehicles as a table {n1, n2, internalIndex, action} (action: 1 alert, 2 stop, 3 briefStop, 4 yield, 5 slow, 0 otherwise) sent in the 'trafficSignalUpdates' mailbox, and to GE Lua via extensions.hook('onTrafficSignalUpdate', results) where results[instanceName] = {state, linkedObjects, stateAction, lightColors, lightStates}.
- Controller definitions come from settings/trafficSignals.json (keys states and types) merged with those of the level; signalActions and signalColors (debug ColorF) are added by the code.
- BUG: setTimer(nil) calls resetTimer() (timer = 0) then executes `timer = val`, which sets timer back to nil; subsequent additions in onUpdate then cause an error.
- Actual signatures differ from the automatic list: SignalController:autoSetTimings(speedMetresPerSecond, intersectionLength, isPermissive) ; SignalInstance:isVehAfterSignal(vehId, maxDist, minDot) ; SignalInstance:getStateAfterTime(seconds, isAbsolute) ; SignalInstance:createSignalObject(shapeFile, pos, rot) ; SignalInstance:setup(pos, dir, controllerId, sequenceId) ; SignalInstance:setStrictState(stateIdx) ; SignalInstance:getVehPlacement(vehId) ; SignalSequence:setStrictState(ctrlName, stateIdx) ; SignalSequence:createPhase(phase, idx) ; SignalSequence:deletePhase(idx) ; SignalSequence:setStep(index) ; SignalSequence:setPhase(index) ; SignalSequence:setActive(val) ; SignalSequence:enableTimer(val) ; SignalController:applyDefinition(key) ; SignalInstance:setActive(val) ; SignalInstance:setLights(lightsArray) ; SignalInstance:setController(id) ; SignalInstance:setSequence(id) ; SignalInstance:setAuxiliaryData().
- The `isPermissive` parameter of autoSetTimings is accepted but not used in the code (the formulas already assume the permissive yellow rule).
- The module functions named newSignal/getSignals/getSignalByName are internally newInstance/getInstances/getInstanceByName; do not look for these internal names. The getSignalsDict field equals `nop` (global empty game function): it never returns anything. The "undefined nop reference" warning is a false alarm.
- SignalSequence:calcDuration(controllersRef) is called with an optional argument (used by the editor). SignalInstance:drawDebug(isEditMode, isSelected, showText, capColor, cylinderScl, arrowScl) draws via debugDrawer; onUpdate calls it when M.debugLevel > 0 for signals within 300 m of the camera (level 2: texts and arrows).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_trafficSignals.getBestSignal(pos, dirVec, resetCache)` | Returns the most relevant signal near a position. With dirVec, favors signals ahead of the vehicle and facing the same way (distance divided by the smaller of the two dot products). The result is cached as long as the road segment (n1, n2) does not change. | 1252 |
| `core_trafficSignals.getControllerByName(name)` | Returns a controller by its name. | 1216 |
| `core_trafficSignals.getControllerDefinitions()` | Returns the controller definitions (states, types, signalActions, signalColors). | 1196 |
| `core_trafficSignals.getControllers()` | Returns the array of controllers. | 1212 |
| `core_trafficSignals.getData(full)` | Returns the main data of the module. | 1232 |
| `core_trafficSignals.getElementById(id)` | Returns an element (instance, controller or sequence) by its unique id. | 47 |
| `core_trafficSignals.getMapNodeSignals()` | Returns the table that links road map nodes to signals: [n1][n2] = list of {instance, pos, useLane, state, action}. | 1204 |
| `core_trafficSignals.getSequenceByName(name)` | Returns a sequence by its name. | 1224 |
| `core_trafficSignals.getSequences()` | Returns the array of sequences. | 1220 |
| `core_trafficSignals.getSignalByName(name)` | Returns an instance by its name. | 1208 |
| `core_trafficSignals.getSignals()` | Returns the array of signal instances. | 1200 |
| `core_trafficSignals.getTimer()` | Returns the elapsed system time (s); -1 as long as it has never been started. | 1228 |
| `core_trafficSignals.loadControllerDefinitions(filePath)` | Reloads the default definitions then applies those of the level (signalControllerDefinitions.json in the level folder, or filePath). | 1459 |
| `core_trafficSignals.loadSignals(filePath, autoRun)` | Loads a JSON signals file (instances, controllers, sequences) and installs it with setupSignals. Also loads the level's controller definitions. | 1476 |
| `core_trafficSignals.newController(data)` | Creates a SignalController (not included until :include() is called). | 1181 |
| `core_trafficSignals.newSequence(data)` | Creates a SignalSequence (not included until :include() is called). | 1185 |
| `core_trafficSignals.newSignal(data)` | Creates a SignalInstance (not included in the system until :include() is called). Without pos: camera position on the ground; without dir: direction of the nearest road, otherwise of the camera. | 1177 |
| `core_trafficSignals.onClientEndMission()` | Hook: the level ends; deletes the signals. *(internal)* *(hook)* | 1631 |
| `core_trafficSignals.onClientStartMission()` | Hook: a level starts; loads the level's signals.json. *(internal)* *(hook)* | 1627 |
| `core_trafficSignals.onDeserialized(data)` | Hook: recreates and includes the serialized elements, reloads the definitions and recomputes the id counter. *(internal)* *(hook)* | 1653 |
| `core_trafficSignals.onNavgraphReloaded()` | Hook: the road graph is (re)loaded. If the system is active, runs runSignals (computes durations, roads, timer, mapNodeSignals table). *(internal)* *(hook)* | 1615 |
| `core_trafficSignals.onSerialize()` | Hook: serializes instances, controllers, sequences, active, loaded, useDtReal, debugLevel before a Lua reload. *(internal)* *(hook)* | 1635 |
| `core_trafficSignals.onUpdate(dt, dtSim)` | Hook called every frame: blinks the flashing-light states, advances the timer, pops the queue to advance sequences, applies pending state changes (lights, mailbox, onTrafficSignalUpdate hook) and draws debug if debugLevel > 0. *(internal)* *(hook)* | 1516 |
| `core_trafficSignals.resetControllerDefinitions()` | Reloads the default definitions (settings/trafficSignals.json: states and types) and adds signalActions (alert=1, stop=2, briefStop=3, yield=4, slow=5) and signalColors. | 66 |
| `core_trafficSignals.resetSignals()` | Deletes all signals, controllers and sequences (setupSignals without argument). | 1455 |
| `core_trafficSignals.resetTimer()` | Sets the timer to 0, empties the queue, (re)activates the valid sequences and instances, then emits onTrafficSignalsReset. | 1287 |
| `core_trafficSignals.setActive(val, autoRun)` | Enables or pauses the system. With autoRun=true and the system not loaded, runs runSignals immediately; otherwise waits for onNavgraphReloaded. | 1357 |
| `core_trafficSignals.setControllerDefinitions(data)` | Merges custom states and types into the controller definitions (tableMerge). | 1189 |
| `core_trafficSignals.setLightsManual(id, stateArray)` | Directly turns on or off the 3 lights of a signal object (fields instanceColor, instanceColor1, instanceColor2) without changing the logical state. | 1376 |
| `core_trafficSignals.setTimer(val)` | Directly sets the timer (may change states instantly). See the bug in the notes if val is nil. | 1309 |
| `core_trafficSignals.setupSignalObjects()` | Caches the scene's TSStatic objects that have a `signalInstance` dynamic field (instance name), keyed by instance name. | 51 |
| `core_trafficSignals.setupSignals(data, merge, autoRun)` | Installs a set of signals (and clears the previous indexes). Without data, clears everything. With data, replaces (or merges if merge) instances, controllers and sequences, removes duplicate ids, then calls setActive(true, autoRun). | 1387 |

### Parameter details

#### `core_trafficSignals.getBestSignal(pos, dirVec, resetCache)`

Returns the most relevant signal near a position. With dirVec, favors signals ahead of the vehicle and facing the same way (distance divided by the smaller of the two dot products). The result is cached as long as the road segment (n1, n2) does not change.

- `pos` (*vec3*) : search position
- `dirVec` (*vec3|nil*) : travel direction
- `resetCache` (*boolean|nil*) : true to forget the cached result
- **returns**: SignalInstance|nil best valid instance; nil if the system is not running or no road is nearby

#### `core_trafficSignals.getControllerByName(name)`

Returns a controller by its name.

- `name` (*string*) : name
- **returns**: SignalController|nil controller

#### `core_trafficSignals.getControllerDefinitions()`

Returns the controller definitions (states, types, signalActions, signalColors).

- **returns**: table definitions (not a copy)

#### `core_trafficSignals.getControllers()`

Returns the array of controllers.

- **returns**: SignalController[] controllers

#### `core_trafficSignals.getData(full)`

Returns the main data of the module.

- `full` (*boolean|nil*) : if true, adds instancesByName, controllersByName, sequencesByName, elementsById
- **returns**: table {instances, controllers, sequences, loaded, active, timer, nextTime (next deadline in the queue, 0 if empty)} (+ tables by name/id if full)

#### `core_trafficSignals.getElementById(id)`

Returns an element (instance, controller or sequence) by its unique id.

- `id` (*integer|nil*) : unique identifier
- **returns**: SignalInstance|SignalController|SignalSequence|nil element

#### `core_trafficSignals.getMapNodeSignals()`

Returns the table that links road map nodes to signals: [n1][n2] = list of {instance, pos, useLane, state, action}.

- **returns**: table reference table (sent to vehicles)

#### `core_trafficSignals.getSequenceByName(name)`

Returns a sequence by its name.

- `name` (*string*) : name
- **returns**: SignalSequence|nil sequence

#### `core_trafficSignals.getSequences()`

Returns the array of sequences.

- **returns**: SignalSequence[] sequences

#### `core_trafficSignals.getSignalByName(name)`

Returns an instance by its name.

- `name` (*string*) : instance name
- **returns**: SignalInstance|nil instance

#### `core_trafficSignals.getSignals()`

Returns the array of signal instances.

- **returns**: SignalInstance[] instances

#### `core_trafficSignals.getTimer()`

Returns the elapsed system time (s); -1 as long as it has never been started.

- **returns**: number timer

#### `core_trafficSignals.loadControllerDefinitions(filePath)`

Reloads the default definitions then applies those of the level (signalControllerDefinitions.json in the level folder, or filePath).

- `filePath` (*string|nil*) : definitions file; default = <level folder>/signalControllerDefinitions.json

#### `core_trafficSignals.loadSignals(filePath, autoRun)`

Loads a JSON signals file (instances, controllers, sequences) and installs it with setupSignals. Also loads the level's controller definitions.

- `filePath` (*string|nil*) : file; default = <level folder>/signals.json
- `autoRun` (*boolean|nil*) : false if the road graph is not loaded yet (level loading case)
- **returns**: boolean true if the file was read

#### `core_trafficSignals.newController(data)`

Creates a SignalController (not included until :include() is called).

- `data` (*table|nil*) : {id?, name?, type?, isSimple?, defaultIndex?, states?}
- **returns**: SignalController new controller

#### `core_trafficSignals.newSequence(data)`

Creates a SignalSequence (not included until :include() is called).

- `data` (*table|nil*) : {id?, name?, startTime?, phases?, startDisabled?, ignoreTimer?}
- **returns**: SignalSequence new sequence

#### `core_trafficSignals.newSignal(data)`

Creates a SignalInstance (not included in the system until :include() is called). Without pos: camera position on the ground; without dir: direction of the nearest road, otherwise of the camera.

- `data` (*table|nil*) : {id?, name?, pos?, dir?, group?, controllerId?, sequenceId?, useCurrentLane?, startDisabled?}
- **returns**: SignalInstance new instance

#### `core_trafficSignals.onDeserialized(data)`

Hook: recreates and includes the serialized elements, reloads the definitions and recomputes the id counter.

- `data` (*table*) : data from onSerialize

#### `core_trafficSignals.onSerialize()`

Hook: serializes instances, controllers, sequences, active, loaded, useDtReal, debugLevel before a Lua reload.

- **returns**: table data

#### `core_trafficSignals.onUpdate(dt, dtSim)`

Hook called every frame: blinks the flashing-light states, advances the timer, pops the queue to advance sequences, applies pending state changes (lights, mailbox, onTrafficSignalUpdate hook) and draws debug if debugLevel > 0.

- `dt` (*number*) : real time (s)
- `dtSim` (*number*) : simulation time (s)

#### `core_trafficSignals.setActive(val, autoRun)`

Enables or pauses the system. With autoRun=true and the system not loaded, runs runSignals immediately; otherwise waits for onNavgraphReloaded.

- `val` (*boolean*) : active state
- `autoRun` (*boolean|nil*) : true: run right away (road graph already ready)

#### `core_trafficSignals.setControllerDefinitions(data)`

Merges custom states and types into the controller definitions (tableMerge).

- `data` (*table*) : {states = {...}, types = {...}}

#### `core_trafficSignals.setLightsManual(id, stateArray)`

Directly turns on or off the 3 lights of a signal object (fields instanceColor, instanceColor1, instanceColor2) without changing the logical state.

- `id` (*integer*) : scene object id (TSStatic)
- `stateArray` (*boolean[]|nil*) : state of each light; default {false,false,false}

#### `core_trafficSignals.setTimer(val)`

Directly sets the timer (may change states instantly). See the bug in the notes if val is nil.

- `val` (*number*) : new timer value (s)

#### `core_trafficSignals.setupSignals(data, merge, autoRun)`

Installs a set of signals (and clears the previous indexes). Without data, clears everything. With data, replaces (or merges if merge) instances, controllers and sequences, removes duplicate ids, then calls setActive(true, autoRun).

- `data` (*table|nil*) : {instances, controllers, sequences} of SignalInstance/Controller/Sequence objects
- `merge` (*boolean|nil*) : true: adds to the existing elements
- `autoRun` (*boolean|nil*) : true: run the system immediately

## Fields

| Field | Type | Description |
|---|---|---|
| `debugLevel` | number | 0 = no debug drawing; 1 = simple drawing; 2 = with texts and arrows. Saved by onSerialize. |
| `getSignalsDict` | function | Equals `nop` (empty function): no effect. |
| `useDtReal` | boolean | false by default; if true, the timer advances with real time (dt) instead of simulation time (dtSim), so even while paused. |

## Class `SignalController`

Signal type with its ordered list of states ({state, duration}): traffic light, stop, etc. Fields: id, name, type, isSimple (durations ignored), defaultIndex (default state), totalDuration, states. Reusable by several sequences.

| Method | Description | Line |
|---|---|---|
| `SignalController:applyDefinition(key)` | Applies a signal type from the definitions (copies isSimple, defaultIndex and the states with their durations). | 695 |
| `SignalController:autoSetTimings(speedMetresPerSecond, intersectionLength, isPermissive)` | Automatically sets the durations: green = 0.7*speed + 0.6*intersection length (clamped 10..40 s), yellow = 1 + (speed - 4.167)/3.27 (clamped 3..7 s), red = 1 s. | 740 |
| `SignalController:calcDuration()` | Computes the total duration of the states (math.huge if a duration is missing or negative; 0 if isSimple). | 723 |
| `SignalController:exclude()` | Removes the controller from the module data. | 763 |
| `SignalController:getStateData(state)` | State data in the definitions (lights, action, flashingLights...). | 719 |
| `SignalController:include()` | Adds the controller to the module data. | 755 |
| `SignalController:new(data)` | Constructor (see newController). | 679 |
| `SignalController:onDeserialized(data)` | Restores the fields. | 795 |
| `SignalController:onSerialize()` | Data to save (negative durations are set back to -1). | 776 |

## Class `SignalInstance`

A signal placed in the world (light, sign). Fields: id, name, pos (vec3), dir (vec3), group, controllerId, sequenceId, startDisabled, active, road ({n1, n2, dist, pos, dir, radius}), linkedObjects (ids of linked TSStatic objects), priorityStateIndex (forced state that takes precedence over the sequence), targetPos/intersectionId (intersection center), _invalid (unusable signal: no road or controller). Created by newSignal.

| Method | Description | Line |
|---|---|---|
| `SignalInstance:calcIntersectionPos()` | Computes the intersection center by averaging the signals of the same sequence located less than 40 m ahead of this signal (at least 2) and fills in targetPos/intersectionId for all of them. Requires the system to be active. | 346 |
| `SignalInstance:clearSignalObjects(alsoDelete)` | Unlinks the linked objects (clears their signalInstance field) or deletes them. | 182 |
| `SignalInstance:createSignalObject(shapeFile, pos, rot)` | Creates a TSStatic (light shape, default art/shapes/objects/trafficlight_overhead1.dae, searched in the level then in art/shapes/), places it, links it to the signal and puts it in the AutoTrafficSignals group. | 207 |
| `SignalInstance:drawDebug(isEditMode, isSelected, showText, capColor, cylinderScl, arrowScl)` | Draws the signal's debug cylinder, arrow and text. | 385 |
| `SignalInstance:exclude()` | Removes the instance from the module data. | 640 |
| `SignalInstance:getBestRoad(pos, dir)` | Finds the nearest road to a position and returns the segment oriented in the signal's direction (one-way road: the road's direction). | 286 |
| `SignalInstance:getController()` | Associated controller (via controllerId). | 463 |
| `SignalInstance:getSequence()` | Associated sequence (via sequenceId). | 467 |
| `SignalInstance:getSignalObjects(refresh)` | Ids of the TSStatic objects linked to this signal (field signalInstance = name). | 177 |
| `SignalInstance:getState()` | Current state (getStateAfterTime(0)). | 528 |
| `SignalInstance:getStateAfterTime(seconds, isAbsolute)` | Signal state after `seconds` seconds (active system required), by simulating the sequence. | 471 |
| `SignalInstance:getVehPlacement(vehId)` | Position of a vehicle relative to the signal. | 324 |
| `SignalInstance:include()` | Adds the instance (and its internal controller/sequence, if any) to the module data. | 624 |
| `SignalInstance:isVehAfterSignal(vehId, maxDist, minDot)` | True if the vehicle has passed the signal point in the right direction and within maxDist. | 335 |
| `SignalInstance:linkSignalObject(objId)` | Links a scene object to this signal (dynamic field signalInstance = name). | 195 |
| `SignalInstance:new(data)` | Constructor. | 114 |
| `SignalInstance:onDeserialized(data)` | Restores the fields from data (pos/dir converted back to vec3). | 669 |
| `SignalInstance:onSerialize()` | Data to save (id, name, pos, dir, group, controllerId, sequenceId, useCurrentLane, startDisabled). | 653 |
| `SignalInstance:refresh()` | Refreshes this signal and its sequence (reactivates, restores the current step). | 532 |
| `SignalInstance:setActive(val)` | Enables or disables the signal; on activation, queues the expected state (sequence, otherwise the controller's default state) for sending. | 556 |
| `SignalInstance:setAuxiliaryData()` | Looks for the road, checks that the controller exists and lists the linked objects; marks the signal _invalid on any problem (error log). | 597 |
| `SignalInstance:setController(id)` | Changes the controller and refreshes if the system is active. | 546 |
| `SignalInstance:setLights(lightsArray)` | Directly turns on/off the lights of all linked objects (without changing the logical state). Mostly internal. | 146 |
| `SignalInstance:setSequence(id)` | Changes the sequence and refreshes if the system is active. | 551 |
| `SignalInstance:setStrictState(stateIdx)` | Forces the state of this signal from the index in the controller's state list (takes precedence over the sequence; disable the sequence timer first). Without a valid stateIdx (nil or <= 0), the signal returns to its normal state. | 161 |
| `SignalInstance:setup(pos, dir, controllerId, sequenceId)` | Alternative setup: sets pos/dir, looks for the road, and creates a controller ('lightsBasic') and/or a sequence if the given ids are missing or invalid. | 266 |
| `SignalInstance:unlinkSignalObject(objId)` | Unlinks a scene object from this signal. | 201 |

## Class `SignalSequence`

Chains phases ({controllerIds, startTime?, totalDuration}) to drive the controllers of an intersection. Fields: id, name, startTime, totalDuration, phases, timeline ([time] = list of {controllerName, phaseIndex, stateIndex}), timelineTimes (sorted times), controllerStates, currStep, currPhase, stateTime, startDisabled, ignoreTimer.

| Method | Description | Line |
|---|---|---|
| `SignalSequence:advance()` | Moves to the next step (loops back to the start). Called by the module queue when the deadline is reached. | 1012 |
| `SignalSequence:calcDuration(controllersRef)` | Computes the duration of each phase (longest duration of its controllers) and of the sequence (sum, or max of startTime + duration if startTime is given). | 840 |
| `SignalSequence:createPhase(phase, idx)` | Adds a phase (at the end or at index idx). | 822 |
| `SignalSequence:deletePhase(idx)` | Deletes a phase. | 833 |
| `SignalSequence:enableTimer(val)` | Indicates whether the sequence follows the main timer; false freezes it (useful with setStep/setPhase/setStrictState). | 1125 |
| `SignalSequence:exclude()` | Removes the sequence from the module data. | 1143 |
| `SignalSequence:include()` | Adds the sequence to the module data. | 1135 |
| `SignalSequence:new(data)` | Constructor (see newSequence). | 803 |
| `SignalSequence:onDeserialized(data)` | Restores the fields. | 1169 |
| `SignalSequence:onSequenceUpdate()` | Internal: processes the current step and schedules the next one in the queue. | 899 |
| `SignalSequence:onSerialize()` | Data to save (id, name, phases, startTime, startDisabled, ignoreTimer). | 1156 |
| `SignalSequence:resetSequence()` | Resets the sequence to the beginning (controllers' default states) and schedules the first deadline. | 933 |
| `SignalSequence:resolveUpdates(forceUpdate)` | Pushes the state of the modified controllers to the active instances into the send queue. | 884 |
| `SignalSequence:setActive(val)` | Activates the sequence (builds timeline and controllerStates, then resetSequence; ignored with a warning if the duration is zero) or deactivates it (instances set to state 'none'). | 1039 |
| `SignalSequence:setPhase(index)` | Jumps to the first step of the given phase. | 978 |
| `SignalSequence:setStep(index)` | Jumps to the step with the given timeline index (if it exists). | 952 |
| `SignalSequence:setStrictState(ctrlName, stateIdx)` | Forces the state of a sequence controller for all its instances (lights and state). Disable the timer beforehand (enableTimer(false)). | 1022 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onTrafficSignalUpdate`
- `onTrafficSignalsReset`

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`
- `be:` `getSurfaceHeightBelow`, `sendToMailbox`
- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawText`, `drawTextAdvanced`
- `obj:` `getID`, `getId`, `getWorldBox`, `registerObject`, `setField`, `setTransform`
- `scenetree.` `findObjectById`, `objectExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/trafficSignals.lua`.*
