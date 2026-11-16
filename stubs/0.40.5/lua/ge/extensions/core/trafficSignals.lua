---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/trafficSignals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_trafficSignals` (Traffic Signals V2): simulates the traffic lights, stop signs and other signals of a level. Three object types: SignalInstance (a signal placed in the world with position, direction, controller and sequence), SignalController (signal type and list of states with durations: traffic light, stop...) and SignalSequence (phases chaining controllers, shared by the instances of an intersection). Loads signals.json and signalControllerDefinitions.json from the level folder, updates the lights of the linked TSStatic objects (dynamic fields signalInstance, instanceColor*), publishes the state to vehicles (mailbox 'trafficSignalUpdates') and through the onTrafficSignalUpdate hook.
--- Access: extension `core_trafficSignals`: `extensions.load("core_trafficSignals")`, then the global `core_trafficSignals`
---@class core_trafficSignals
---@field debugLevel number 0 = no debug drawing; 1 = simple drawing; 2 = with texts and arrows. Saved by onSerialize.
---@field getSignalsDict function Equals `nop` (empty function): no effect.
---@field useDtReal boolean false by default; if true, the timer advances with real time (dt) instead of simulation time (dtSim), so even while paused.
core_trafficSignals = {}

--- Returns the most relevant signal near a position. With dirVec, favors signals ahead of the vehicle and facing the same way (distance divided by the smaller of the two dot products). The result is cached as long as the road segment (n1, n2) does not change.
---Source: lua/ge/extensions/core/trafficSignals.lua:1252
---@param pos vec3 search position
---@param dirVec vec3|nil travel direction
---@param resetCache boolean|nil true to forget the cached result
---@return SignalInstance|nil  best valid instance; nil if the system is not running or no road is nearby
function core_trafficSignals.getBestSignal(pos, dirVec, resetCache) end

--- Returns a controller by its name.
---Source: lua/ge/extensions/core/trafficSignals.lua:1216
---@param name string name
---@return SignalController|nil  controller
function core_trafficSignals.getControllerByName(name) end

--- Returns the controller definitions (states, types, signalActions, signalColors).
---Source: lua/ge/extensions/core/trafficSignals.lua:1196
---@return table  definitions (not a copy)
function core_trafficSignals.getControllerDefinitions() end

--- Returns the array of controllers.
---Source: lua/ge/extensions/core/trafficSignals.lua:1212
---@return SignalController[]  controllers
function core_trafficSignals.getControllers() end

--- Returns the main data of the module.
---Source: lua/ge/extensions/core/trafficSignals.lua:1232
---@param full boolean|nil if true, adds instancesByName, controllersByName, sequencesByName, elementsById
---@return table  {instances, controllers, sequences, loaded, active, timer, nextTime (next deadline in the queue, 0 if empty)} (+ tables by name/id if full)
function core_trafficSignals.getData(full) end

--- Returns an element (instance, controller or sequence) by its unique id.
---Source: lua/ge/extensions/core/trafficSignals.lua:47
---@param id integer|nil unique identifier
---@return SignalInstance|SignalController|SignalSequence|nil  element
function core_trafficSignals.getElementById(id) end

--- Returns the table that links road map nodes to signals: [n1][n2] = list of {instance, pos, useLane, state, action}.
---Source: lua/ge/extensions/core/trafficSignals.lua:1204
---@return table  reference table (sent to vehicles)
function core_trafficSignals.getMapNodeSignals() end

--- Returns a sequence by its name.
---Source: lua/ge/extensions/core/trafficSignals.lua:1224
---@param name string name
---@return SignalSequence|nil  sequence
function core_trafficSignals.getSequenceByName(name) end

--- Returns the array of sequences.
---Source: lua/ge/extensions/core/trafficSignals.lua:1220
---@return SignalSequence[]  sequences
function core_trafficSignals.getSequences() end

--- Returns an instance by its name.
---Source: lua/ge/extensions/core/trafficSignals.lua:1208
---@param name string instance name
---@return SignalInstance|nil  instance
function core_trafficSignals.getSignalByName(name) end

--- Returns the array of signal instances.
---Source: lua/ge/extensions/core/trafficSignals.lua:1200
---@return SignalInstance[]  instances
function core_trafficSignals.getSignals() end

--- Returns the elapsed system time (s); -1 as long as it has never been started.
---Source: lua/ge/extensions/core/trafficSignals.lua:1228
---@return number  timer
function core_trafficSignals.getTimer() end

--- Reloads the default definitions then applies those of the level (signalControllerDefinitions.json in the level folder, or filePath).
---Source: lua/ge/extensions/core/trafficSignals.lua:1459
---@param filePath string|nil definitions file; default = <level folder>/signalControllerDefinitions.json
function core_trafficSignals.loadControllerDefinitions(filePath) end

--- Loads a JSON signals file (instances, controllers, sequences) and installs it with setupSignals. Also loads the level's controller definitions.
---Source: lua/ge/extensions/core/trafficSignals.lua:1476
---@param filePath string|nil file; default = <level folder>/signals.json
---@param autoRun boolean|nil false if the road graph is not loaded yet (level loading case)
---@return boolean  true if the file was read
function core_trafficSignals.loadSignals(filePath, autoRun) end

--- Creates a SignalController (not included until :include() is called).
---Source: lua/ge/extensions/core/trafficSignals.lua:1181
---@param data table|nil {id?, name?, type?, isSimple?, defaultIndex?, states?}
---@return SignalController  new controller
function core_trafficSignals.newController(data) end

--- Creates a SignalSequence (not included until :include() is called).
---Source: lua/ge/extensions/core/trafficSignals.lua:1185
---@param data table|nil {id?, name?, startTime?, phases?, startDisabled?, ignoreTimer?}
---@return SignalSequence  new sequence
function core_trafficSignals.newSequence(data) end

--- Creates a SignalInstance (not included in the system until :include() is called). Without pos: camera position on the ground; without dir: direction of the nearest road, otherwise of the camera.
---Source: lua/ge/extensions/core/trafficSignals.lua:1177
---@param data table|nil {id?, name?, pos?, dir?, group?, controllerId?, sequenceId?, useCurrentLane?, startDisabled?}
---@return SignalInstance  new instance
function core_trafficSignals.newSignal(data) end

--- Hook: the level ends; deletes the signals.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trafficSignals.lua:1631
function core_trafficSignals.onClientEndMission() end

--- Hook: a level starts; loads the level's signals.json.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trafficSignals.lua:1627
function core_trafficSignals.onClientStartMission() end

--- Hook: recreates and includes the serialized elements, reloads the definitions and recomputes the id counter.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trafficSignals.lua:1653
---@param data table data from onSerialize
function core_trafficSignals.onDeserialized(data) end

--- Hook: the road graph is (re)loaded. If the system is active, runs runSignals (computes durations, roads, timer, mapNodeSignals table).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trafficSignals.lua:1615
function core_trafficSignals.onNavgraphReloaded() end

--- Hook: serializes instances, controllers, sequences, active, loaded, useDtReal, debugLevel before a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trafficSignals.lua:1635
---@return table  data
function core_trafficSignals.onSerialize() end

--- Hook called every frame: blinks the flashing-light states, advances the timer, pops the queue to advance sequences, applies pending state changes (lights, mailbox, onTrafficSignalUpdate hook) and draws debug if debugLevel > 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trafficSignals.lua:1516
---@param dt number real time (s)
---@param dtSim number simulation time (s)
function core_trafficSignals.onUpdate(dt, dtSim) end

--- Reloads the default definitions (settings/trafficSignals.json: states and types) and adds signalActions (alert=1, stop=2, briefStop=3, yield=4, slow=5) and signalColors.
---Source: lua/ge/extensions/core/trafficSignals.lua:66
function core_trafficSignals.resetControllerDefinitions() end

--- Deletes all signals, controllers and sequences (setupSignals without argument).
---Source: lua/ge/extensions/core/trafficSignals.lua:1455
function core_trafficSignals.resetSignals() end

--- Sets the timer to 0, empties the queue, (re)activates the valid sequences and instances, then emits onTrafficSignalsReset.
---Source: lua/ge/extensions/core/trafficSignals.lua:1287
function core_trafficSignals.resetTimer() end

--- Enables or pauses the system. With autoRun=true and the system not loaded, runs runSignals immediately; otherwise waits for onNavgraphReloaded.
---Source: lua/ge/extensions/core/trafficSignals.lua:1357
---@param val boolean active state
---@param autoRun boolean|nil true: run right away (road graph already ready)
function core_trafficSignals.setActive(val, autoRun) end

--- Merges custom states and types into the controller definitions (tableMerge).
---Source: lua/ge/extensions/core/trafficSignals.lua:1189
---@param data table {states = {...}, types = {...}}
function core_trafficSignals.setControllerDefinitions(data) end

--- Directly turns on or off the 3 lights of a signal object (fields instanceColor, instanceColor1, instanceColor2) without changing the logical state.
---Source: lua/ge/extensions/core/trafficSignals.lua:1376
---@param id integer scene object id (TSStatic)
---@param stateArray boolean[]|nil state of each light; default {false,false,false}
function core_trafficSignals.setLightsManual(id, stateArray) end

--- Directly sets the timer (may change states instantly). See the bug in the notes if val is nil.
---Source: lua/ge/extensions/core/trafficSignals.lua:1309
---@param val number new timer value (s)
function core_trafficSignals.setTimer(val) end

--- Caches the scene's TSStatic objects that have a `signalInstance` dynamic field (instance name), keyed by instance name.
---Source: lua/ge/extensions/core/trafficSignals.lua:51
function core_trafficSignals.setupSignalObjects() end

--- Installs a set of signals (and clears the previous indexes). Without data, clears everything. With data, replaces (or merges if merge) instances, controllers and sequences, removes duplicate ids, then calls setActive(true, autoRun).
---Source: lua/ge/extensions/core/trafficSignals.lua:1387
---@param data table|nil {instances, controllers, sequences} of SignalInstance/Controller/Sequence objects
---@param merge boolean|nil true: adds to the existing elements
---@param autoRun boolean|nil true: run the system immediately
function core_trafficSignals.setupSignals(data, merge, autoRun) end

--- Signal type with its ordered list of states ({state, duration}): traffic light, stop, etc. Fields: id, name, type, isSimple (durations ignored), defaultIndex (default state), totalDuration, states. Reusable by several sequences.
---@class core_trafficSignals_SignalController
local core_trafficSignals_SignalController = {}

--- Applies a signal type from the definitions (copies isSimple, defaultIndex and the states with their durations).
---Source: lua/ge/extensions/core/trafficSignals.lua:695
---@param key string|nil type key in controllerDefinitions.types; default 'none'
function core_trafficSignals_SignalController:applyDefinition(key) end

--- Automatically sets the durations: green = 0.7*speed + 0.6*intersection length (clamped 10..40 s), yellow = 1 + (speed - 4.167)/3.27 (clamped 3..7 s), red = 1 s.
---Source: lua/ge/extensions/core/trafficSignals.lua:740
---@param speedMetresPerSecond number road speed (m/s)
---@param intersectionLength number intersection length (m)
---@param isPermissive boolean|nil not used in the code
function core_trafficSignals_SignalController:autoSetTimings(speedMetresPerSecond, intersectionLength, isPermissive) end

--- Computes the total duration of the states (math.huge if a duration is missing or negative; 0 if isSimple).
---Source: lua/ge/extensions/core/trafficSignals.lua:723
---@return number  total duration (s)
function core_trafficSignals_SignalController:calcDuration() end

--- Removes the controller from the module data.
---Source: lua/ge/extensions/core/trafficSignals.lua:763
function core_trafficSignals_SignalController:exclude() end

--- State data in the definitions (lights, action, flashingLights...).
---Source: lua/ge/extensions/core/trafficSignals.lua:719
---@param state string state name
---@return table|nil  data
function core_trafficSignals_SignalController:getStateData(state) end

--- Adds the controller to the module data.
---Source: lua/ge/extensions/core/trafficSignals.lua:755
function core_trafficSignals_SignalController:include() end

--- Constructor (see newController).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trafficSignals.lua:679
---@param data table|nil {id?, name?, type?, isSimple?, defaultIndex?, states?}
---@return SignalController  controller
function core_trafficSignals_SignalController:new(data) end

--- Restores the fields.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trafficSignals.lua:795
---@param data table|nil data
function core_trafficSignals_SignalController:onDeserialized(data) end

--- Data to save (negative durations are set back to -1).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trafficSignals.lua:776
---@return table  data
function core_trafficSignals_SignalController:onSerialize() end

--- A signal placed in the world (light, sign). Fields: id, name, pos (vec3), dir (vec3), group, controllerId, sequenceId, startDisabled, active, road ({n1, n2, dist, pos, dir, radius}), linkedObjects (ids of linked TSStatic objects), priorityStateIndex (forced state that takes precedence over the sequence), targetPos/intersectionId (intersection center), _invalid (unusable signal: no road or controller). Created by newSignal.
---@class core_trafficSignals_SignalInstance
local core_trafficSignals_SignalInstance = {}

--- Computes the intersection center by averaging the signals of the same sequence located less than 40 m ahead of this signal (at least 2) and fills in targetPos/intersectionId for all of them. Requires the system to be active.
---Source: lua/ge/extensions/core/trafficSignals.lua:346
function core_trafficSignals_SignalInstance:calcIntersectionPos() end

--- Unlinks the linked objects (clears their signalInstance field) or deletes them.
---Source: lua/ge/extensions/core/trafficSignals.lua:182
---@param alsoDelete boolean|nil true: deletes the objects
function core_trafficSignals_SignalInstance:clearSignalObjects(alsoDelete) end

--- Creates a TSStatic (light shape, default art/shapes/objects/trafficlight_overhead1.dae, searched in the level then in art/shapes/), places it, links it to the signal and puts it in the AutoTrafficSignals group.
---Source: lua/ge/extensions/core/trafficSignals.lua:207
---@param shapeFile string|nil .dae file or name fragment
---@param pos vec3|nil position; default camera
---@param rot quat|nil rotation; default camera
---@return userdata|nil  created object; nil if the shape is not found
function core_trafficSignals_SignalInstance:createSignalObject(shapeFile, pos, rot) end

--- Draws the signal's debug cylinder, arrow and text.
---Source: lua/ge/extensions/core/trafficSignals.lua:385
---@param isEditMode boolean editor mode
---@param isSelected boolean selected
---@param showText boolean show texts
---@param capColor ColorF|nil cap color
---@param cylinderScl number|nil cylinder height, default 5
---@param arrowScl number|nil arrow scale, default 2
function core_trafficSignals_SignalInstance:drawDebug(isEditMode, isSelected, showText, capColor, cylinderScl, arrowScl) end

--- Removes the instance from the module data.
---Source: lua/ge/extensions/core/trafficSignals.lua:640
function core_trafficSignals_SignalInstance:exclude() end

--- Finds the nearest road to a position and returns the segment oriented in the signal's direction (one-way road: the road's direction).
---Source: lua/ge/extensions/core/trafficSignals.lua:286
---@param pos vec3|nil position; default self.pos
---@param dir vec3|nil direction; default self.dir
---@return table|nil  {n1, n2, dist, pos, dir, radius} or nil if no road
function core_trafficSignals_SignalInstance:getBestRoad(pos, dir) end

--- Associated controller (via controllerId).
---Source: lua/ge/extensions/core/trafficSignals.lua:463
---@return SignalController|nil  controller
function core_trafficSignals_SignalInstance:getController() end

--- Associated sequence (via sequenceId).
---Source: lua/ge/extensions/core/trafficSignals.lua:467
---@return SignalSequence|nil  sequence
function core_trafficSignals_SignalInstance:getSequence() end

--- Ids of the TSStatic objects linked to this signal (field signalInstance = name).
---Source: lua/ge/extensions/core/trafficSignals.lua:177
---@param refresh boolean|nil true: re-reads the scene
---@return integer[]  ids
function core_trafficSignals_SignalInstance:getSignalObjects(refresh) end

--- Current state (getStateAfterTime(0)).
---Source: lua/ge/extensions/core/trafficSignals.lua:528
---@return string  state name
---@return table  state data
function core_trafficSignals_SignalInstance:getState() end

--- Signal state after `seconds` seconds (active system required), by simulating the sequence.
---Source: lua/ge/extensions/core/trafficSignals.lua:471
---@param seconds number|nil delay (s), default 0
---@param isAbsolute boolean|nil true: counted from the start of the sequence instead of from now
---@return string  state name ('none' if inactive)
---@return table  state data (lights, action...)
function core_trafficSignals_SignalInstance:getStateAfterTime(seconds, isAbsolute) end

--- Position of a vehicle relative to the signal.
---Source: lua/ge/extensions/core/trafficSignals.lua:324
---@param vehId integer vehicle known to map.objects
---@return table|nil  {dot (direction alignment), dist (m), relDist (negative before the signal)}
function core_trafficSignals_SignalInstance:getVehPlacement(vehId) end

--- Adds the instance (and its internal controller/sequence, if any) to the module data.
---Source: lua/ge/extensions/core/trafficSignals.lua:624
function core_trafficSignals_SignalInstance:include() end

--- True if the vehicle has passed the signal point in the right direction and within maxDist.
---Source: lua/ge/extensions/core/trafficSignals.lua:335
---@param vehId integer vehicle
---@param maxDist number|nil max distance (m), default 20
---@param minDot number|nil min dot product of directions, default 0.707
---@return boolean  valid
---@return table|nil  data from getVehPlacement
function core_trafficSignals_SignalInstance:isVehAfterSignal(vehId, maxDist, minDot) end

--- Links a scene object to this signal (dynamic field signalInstance = name).
---Source: lua/ge/extensions/core/trafficSignals.lua:195
---@param objId integer object id
function core_trafficSignals_SignalInstance:linkSignalObject(objId) end

--- Constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trafficSignals.lua:114
---@param data table|nil see newSignal
---@return SignalInstance  instance
function core_trafficSignals_SignalInstance:new(data) end

--- Restores the fields from data (pos/dir converted back to vec3).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trafficSignals.lua:669
---@param data table|nil data
function core_trafficSignals_SignalInstance:onDeserialized(data) end

--- Data to save (id, name, pos, dir, group, controllerId, sequenceId, useCurrentLane, startDisabled).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trafficSignals.lua:653
---@return table  data
function core_trafficSignals_SignalInstance:onSerialize() end

--- Refreshes this signal and its sequence (reactivates, restores the current step).
---Source: lua/ge/extensions/core/trafficSignals.lua:532
function core_trafficSignals_SignalInstance:refresh() end

--- Enables or disables the signal; on activation, queues the expected state (sequence, otherwise the controller's default state) for sending.
---Source: lua/ge/extensions/core/trafficSignals.lua:556
---@param val boolean active
function core_trafficSignals_SignalInstance:setActive(val) end

--- Looks for the road, checks that the controller exists and lists the linked objects; marks the signal _invalid on any problem (error log).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trafficSignals.lua:597
function core_trafficSignals_SignalInstance:setAuxiliaryData() end

--- Changes the controller and refreshes if the system is active.
---Source: lua/ge/extensions/core/trafficSignals.lua:546
---@param id integer|nil controller id
function core_trafficSignals_SignalInstance:setController(id) end

--- Directly turns on/off the lights of all linked objects (without changing the logical state). Mostly internal.
---Source: lua/ge/extensions/core/trafficSignals.lua:146
---@param lightsArray string[]|nil colors; 'black' = off, any other value = on; default all off
function core_trafficSignals_SignalInstance:setLights(lightsArray) end

--- Changes the sequence and refreshes if the system is active.
---Source: lua/ge/extensions/core/trafficSignals.lua:551
---@param id integer|nil sequence id
function core_trafficSignals_SignalInstance:setSequence(id) end

--- Forces the state of this signal from the index in the controller's state list (takes precedence over the sequence; disable the sequence timer first). Without a valid stateIdx (nil or <= 0), the signal returns to its normal state.
---Source: lua/ge/extensions/core/trafficSignals.lua:161
---@param stateIdx integer|nil index (1-based) in controller.states
function core_trafficSignals_SignalInstance:setStrictState(stateIdx) end

--- Alternative setup: sets pos/dir, looks for the road, and creates a controller ('lightsBasic') and/or a sequence if the given ids are missing or invalid.
---Source: lua/ge/extensions/core/trafficSignals.lua:266
---@param pos vec3|nil position
---@param dir vec3|nil direction
---@param controllerId integer|nil existing controller id
---@param sequenceId integer|nil existing sequence id
function core_trafficSignals_SignalInstance:setup(pos, dir, controllerId, sequenceId) end

--- Unlinks a scene object from this signal.
---Source: lua/ge/extensions/core/trafficSignals.lua:201
---@param objId integer object id
function core_trafficSignals_SignalInstance:unlinkSignalObject(objId) end

--- Chains phases ({controllerIds, startTime?, totalDuration}) to drive the controllers of an intersection. Fields: id, name, startTime, totalDuration, phases, timeline ([time] = list of {controllerName, phaseIndex, stateIndex}), timelineTimes (sorted times), controllerStates, currStep, currPhase, stateTime, startDisabled, ignoreTimer.
---@class core_trafficSignals_SignalSequence
local core_trafficSignals_SignalSequence = {}

--- Moves to the next step (loops back to the start). Called by the module queue when the deadline is reached.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trafficSignals.lua:1012
function core_trafficSignals_SignalSequence:advance() end

--- Computes the duration of each phase (longest duration of its controllers) and of the sequence (sum, or max of startTime + duration if startTime is given).
---Source: lua/ge/extensions/core/trafficSignals.lua:840
---@param controllersRef table|nil table [id] = controller to use instead of elementsById (editor)
---@return number  total duration (s)
function core_trafficSignals_SignalSequence:calcDuration(controllersRef) end

--- Adds a phase (at the end or at index idx).
---Source: lua/ge/extensions/core/trafficSignals.lua:822
---@param phase table|nil {controllerIds, startTime?}
---@param idx integer|nil insertion position
function core_trafficSignals_SignalSequence:createPhase(phase, idx) end

--- Deletes a phase.
---Source: lua/ge/extensions/core/trafficSignals.lua:833
---@param idx integer|nil index; default last phase
function core_trafficSignals_SignalSequence:deletePhase(idx) end

--- Indicates whether the sequence follows the main timer; false freezes it (useful with setStep/setPhase/setStrictState).
---Source: lua/ge/extensions/core/trafficSignals.lua:1125
---@param val boolean true: follows the timer
function core_trafficSignals_SignalSequence:enableTimer(val) end

--- Removes the sequence from the module data.
---Source: lua/ge/extensions/core/trafficSignals.lua:1143
function core_trafficSignals_SignalSequence:exclude() end

--- Adds the sequence to the module data.
---Source: lua/ge/extensions/core/trafficSignals.lua:1135
function core_trafficSignals_SignalSequence:include() end

--- Constructor (see newSequence).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trafficSignals.lua:803
---@param data table|nil {id?, name?, startTime?, phases?, startDisabled?, ignoreTimer?}
---@return SignalSequence  sequence
function core_trafficSignals_SignalSequence:new(data) end

--- Restores the fields.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trafficSignals.lua:1169
---@param data table|nil data
function core_trafficSignals_SignalSequence:onDeserialized(data) end

--- Internal: processes the current step and schedules the next one in the queue.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trafficSignals.lua:899
function core_trafficSignals_SignalSequence:onSequenceUpdate() end

--- Data to save (id, name, phases, startTime, startDisabled, ignoreTimer).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trafficSignals.lua:1156
---@return table  data
function core_trafficSignals_SignalSequence:onSerialize() end

--- Resets the sequence to the beginning (controllers' default states) and schedules the first deadline.
---Source: lua/ge/extensions/core/trafficSignals.lua:933
function core_trafficSignals_SignalSequence:resetSequence() end

--- Pushes the state of the modified controllers to the active instances into the send queue.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trafficSignals.lua:884
---@param forceUpdate boolean|nil true: push everything
function core_trafficSignals_SignalSequence:resolveUpdates(forceUpdate) end

--- Activates the sequence (builds timeline and controllerStates, then resetSequence; ignored with a warning if the duration is zero) or deactivates it (instances set to state 'none').
---Source: lua/ge/extensions/core/trafficSignals.lua:1039
---@param val boolean active
function core_trafficSignals_SignalSequence:setActive(val) end

--- Jumps to the first step of the given phase.
---Source: lua/ge/extensions/core/trafficSignals.lua:978
---@param index integer|nil phase, 1-based; default 1
function core_trafficSignals_SignalSequence:setPhase(index) end

--- Jumps to the step with the given timeline index (if it exists).
---Source: lua/ge/extensions/core/trafficSignals.lua:952
---@param index integer|nil step, 1-based; default 1
function core_trafficSignals_SignalSequence:setStep(index) end

--- Forces the state of a sequence controller for all its instances (lights and state). Disable the timer beforehand (enableTimer(false)).
---Source: lua/ge/extensions/core/trafficSignals.lua:1022
---@param ctrlName string controller name
---@param stateIdx integer|nil state index (1-based); default current state
function core_trafficSignals_SignalSequence:setStrictState(ctrlName, stateIdx) end

