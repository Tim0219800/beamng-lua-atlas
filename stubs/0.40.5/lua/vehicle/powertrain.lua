---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manager of the vehicle's powertrain: at init it reads the `powertrain` section of the jbeam (v.data.powertrain), creates each device via the factory matching its `type` (game files lua/vehicle/powertrain/*.lua or the vehicle's lua/powertrain/*.lua), links them into a tree thanks to `inputName`/`inputIndex`, validates, computes cumulative inertias, and stores them by name. At each physics step it updates the speeds (from the wheels to the engine) then the torques (from the engine to the wheels). A modder mostly uses it to find a device (getDevice, getDevicesByType, getDevicesByCategory) and read/write its fields (RPM, torque, temperature…).
--- Access: global `powertrain`
---@class powertrain
---@field cumulativeGearRatio number Largest cumulative ratio (cumulativeGearRatio) found among all devices when building the tree.
---@field currentEnvPressure number Outside pressure (obj:getEnvPressure, Pa).
---@field currentEnvTemperature number Outside temperature in kelvin.
---@field currentEnvTemperatureCelsius number Outside temperature in °C.
---@field currentGravity number Current gravity in m/s².
---@field engineData table Empty table reset at init; reserved for engine data (filled elsewhere, not used in this file).
---@field invCurrentEnvPressure number 1 / currentEnvPressure.
---@field invCurrentEnvTemperature number 1 / currentEnvTemperature.
---@field invCurrentEnvTemperatureCelsius number 1 / currentEnvTemperatureCelsius (can be very large near 0 °C).
---@field invCurrentGravity number 1 / currentGravity.
---@field stabilityCoef number Stability coefficient, initial value 250 (used by the devices, not modified in this file).
---@field torqueReactionCoefs table<integer, number> Torque reaction coefficients per torsion reactor (index = torsionReactorIdx of the rotators). Double buffer swapped at each update. Is {0} if the powertrain is not initialized so that index 1 (default reactor) exists.
---@field update function nop until init has succeeded, then the function update(dt) (physics step); called by main.lua in onPhysicsStep.
---@field wheels table<string, table> Vehicle wheels/rotators by name (wheels.wheelRotators). Entries receive isPropulsed = true if a propulsed device drives them.
powertrain = {}

--- Called by main.lua when a beam breaks: notifies the devices that have a beamBroke method, then breaks the devices whose breakTriggerBeam matches (breakDevice).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain.lua:812
---@param id integer Identifier (cid) of the broken beam.
function powertrain.beamBroke(id) end

--- Marks a device as broken: device:onBreak(), breaks its trigger beams (obj:breakBeam), shows the UI message vehicle.powertrain.deviceBroken and reports the damage to damageTracker. No effect if already broken.
---Source: lua/vehicle/powertrain.lua:798
---@param device table Powertrain device.
function powertrain.breakDevice(device) end

--- Recomputes the cumulative inertia by traversing the devices from the leaves to the root (device:calculateInertia()). To be called again after changing inertias or the structure.
---Source: lua/vehicle/powertrain.lua:326
function powertrain.calculateTreeInertia() end

--- Returns a readable string (dumps) of a deep copy of the device, with parent and children replaced by their name, useful for debugging.
---Source: lua/vehicle/powertrain.lua:132
---@param device table|nil Device to describe.
---@return string  Dump text, or "nil".
function powertrain.dumpsDeviceData(device) end

--- Returns the list (without duplicates) of the engine devices that drive at least one wheel.
---Source: lua/vehicle/powertrain.lua:968
---@return table[]  Engine devices.
function powertrain.getAllWheelPropulsionDevices() end

--- Recursively traverses a device's children and returns the driven wheels (device.wheel of the wheel shafts). If outputID is given, only follows the child connected to that port.
---Source: lua/vehicle/powertrain.lua:933
---@param parentDevice table Starting device.
---@param outputID integer|nil Output port to follow; -1 or nil = all.
---@return table[]  List of wheels (wheel tables).
function powertrain.getChildWheels(parentDevice, outputID) end

--- Returns the device with this name.
---Source: lua/vehicle/powertrain.lua:909
---@param name string|nil Device name.
---@return table|nil  The device, or nil (also if name is nil).
function powertrain.getDevice(name) end

--- Returns the table of all devices keyed by name.
---Source: lua/vehicle/powertrain.lua:901
---@return table<string, table>  Devices by name (empty if no powertrain).
function powertrain.getDevices() end

--- Returns the list of devices whose deviceCategories contains the category.
---Source: lua/vehicle/powertrain.lua:923
---@param category string Category (e.g. 'engine', 'gearbox', 'hydraulicPowerSource').
---@return table[]  Array of devices.
function powertrain.getDevicesByCategory(category) end

--- Returns the list of devices whose `type` equals the given value (order not guaranteed: pairs traversal).
---Source: lua/vehicle/powertrain.lua:913
---@param deviceType string jbeam type (e.g. 'combustionEngine', 'differential', 'shaft').
---@return table[]  Array of devices (empty if none).
function powertrain.getDevicesByType(deviceType) end

--- Returns a unique, increasing engine identifier (0, 1, 2…), reset to -1 at each init.
---Source: lua/vehicle/powertrain.lua:1041
---@return integer  Engine identifier.
function powertrain.getEngineSoundID() end

--- Multiplies the gearRatios going up from the bottom device to the top device. Returns nil if the devices are not connected (or if an argument is nil).
---Source: lua/vehicle/powertrain.lua:1014
---@param topDevice table Upstream device (closest to the engine).
---@param bottomDevice table Downstream device (descendant of topDevice).
---@return number|nil  Cumulative ratio between the two.
function powertrain.getGearRatioBetweenDevices(topDevice, bottomDevice) end

--- Searches among the hydraulic sources (category hydraulicPowerSource) for a named consumer.
---Source: lua/vehicle/powertrain.lua:985
---@param consumerName string Consumer name.
---@return table|nil  Consumer found or nil.
function powertrain.getHydraulicConsumer(consumerName) end

--- Returns the array (indexed 1..N) of the devices ordered from the root to the leaves.
---Source: lua/vehicle/powertrain.lua:905
---@return table  Ordered list of devices (do not modify).
function powertrain.getOrderedDevices() end

--- Aggregates the wear/integrity state of the devices concerned by part keys of the form "powertrainDevice:<name>:<subSystem>".
---Source: lua/vehicle/powertrain.lua:1075
---@param partTypeData string[]|nil List of part type keys.
---@return table  {integrityValue (min of the devices, default 1), integrityState, visualValue=1, visualState}.
---@return boolean  true if at least one device has provided an integrity.
---@return boolean  Always false (visual condition not provided).
function powertrain.getPartCondition(partTypeData) end

--- Returns, for each vehicle wheel driven by an engine, the name of that engine.
---Source: lua/vehicle/powertrain.lua:957
---@return table<string, string>  wheelName -> engine device name.
function powertrain.getPoweredWheelNames() end

--- Walks up a device's parents until it finds a device of category engine.
---Source: lua/vehicle/powertrain.lua:1000
---@param device table Starting device.
---@return table|nil  The ancestor engine (or the device itself), nil if none.
function powertrain.getPropulsionDeviceForDevice(device) end

--- Returns the engine-category device that drives the wheel (table computed at init).
---Source: lua/vehicle/powertrain.lua:953
---@param wheelName string Wheel name.
---@return table|nil  Engine device or nil.
function powertrain.getPropulsionDeviceForWheel(wheelName) end

--- Merges the states returned by device:getState() of all devices (state saving).
---Source: lua/vehicle/powertrain.lua:1101
---@return table|nil  Merged table reused at each call, nil if no device has data.
function powertrain.getState() end

--- Builds the powertrain from v.data.powertrain: discovers the device factories (FS:findFiles on lua/vehicle/powertrain and <vehicle>/lua/powertrain), instantiates each device (factory.new(jbeamData)), links them into a tree, computes visual positions, validation, inertias, break beams, torsion reactors, restores the previous modes and sends the tree to the UI. Called by main.lua (initSystems) and by reset() if a device does not support reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain.lua:426
function powertrain.init() end

--- Calls device:initSounds(jbeamData) on each device that has one. Called by main.lua after audio init.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain.lua:725
function powertrain.initSounds() end

--- Indicates whether the powertrain needs the physics step (true when a powertrain has been built). Used by main.lua:updateCorePhysicsStepEnabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain.lua:1097
---@return boolean  hasPowertrain.
function powertrain.isPhysicsStepUsed() end

--- Hook relayed by main.lua to the devices (attachEnergy and attachSpeed arguments inverted for compatibility).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain.lua:838
---@param nodeId integer Local coupler node.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer Node of the other vehicle.
---@param attachSpeed number Speed at attachment.
---@param attachEnergy number Energy at attachment.
function powertrain.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy) end

--- Hook relayed by main.lua to the devices when a coupler detaches.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain.lua:847
---@param nodeId integer Local coupler node.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer Node of the other vehicle.
---@param breakForce number Detachment force.
function powertrain.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Hook relayed by main.lua: passes to device:onCouplerFound the devices that implement it.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain.lua:829
---@param nodeId integer Local coupler node.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer Node of the other vehicle.
---@param nodeDist number Distance between the nodes.
function powertrain.onCouplerFound(nodeId, obj2id, obj2nodeId, nodeDist) end

--- Resets the deformation group damages and calls device:reset(jbeamData) on each device, recomputes inertias, sends the tree back to the UI and resets the torque reaction coefficients. If a device has no reset(), falls back to init(). Called by main.lua on vehicle reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain.lua:737
function powertrain.reset() end

--- Calls device:resetSounds(jbeamData) on the devices (or initSounds if a full reset is needed).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain.lua:780
function powertrain.resetSounds() end

--- Sends the UI the event PowertrainDeviceTreeChanged {devices, maxPower, maxTorque} (type, modes, visual position, children, current mode of each device). No effect if the first player is not seated.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain.lua:272
function powertrain.sendDeviceTree() end

--- Asks each device to send its torque curves (device:sendTorqueData()); no effect if the first player is not seated.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain.lua:308
function powertrain.sendTorqueData() end

--- Old code tied to an imgui tool, used on the GE side: serializes a subset of fields of all devices (name, type, engineLoad, outputAV1/2, outputTorque1/2, mode, isBroken, ratios, clutches…).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain.lua:78
---@return string  Serialized table (serialize).
function powertrain.serializeDevicesInfo() end

--- Sets a device's mode (device:setMode), stores this choice to restore it after an init and shows a UI message "<name> Mode: <mode>".
---Source: lua/vehicle/powertrain.lua:856
---@param name string Device name.
---@param mode string Mode to apply (must exist in the device's modes).
function powertrain.setDeviceMode(name, mode) end

--- Applies a part condition (odometer, integrity, visual) to the devices designated by partTypeData via device:setPartCondition.
---Source: lua/vehicle/powertrain.lua:1059
---@param partTypeData string[]|nil Keys "powertrainDevice:<name>:<subSystem>".
---@param odometer number Cumulative distance/wear to apply (inferred from code).
---@param integrity number|table Integrity; if a table, the value is integrity.powertrain[deviceName].
---@param visual any Visual condition passed to the device.
function powertrain.setPartCondition(partTypeData, odometer, integrity, visual) end

--- Passes `data` to device:setState(data) of each device that implements it.
---Source: lua/vehicle/powertrain.lua:1120
---@param data table|nil State produced by getState; ignored if nil.
function powertrain.setState(data) end

--- Records the vehicle folder, used to look for device-specific factories. Called by main.lua before init.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain.lua:1037
---@param path string Vehicle folder.
function powertrain.setVehiclePath(path) end

--- Switches all differentials (type 'differential') that have defaultToggle true to the next mode.
---Source: lua/vehicle/powertrain.lua:893
function powertrain.toggleDefaultDiffs() end

--- Switches the named device to the next mode of its availableModes list (cyclic) via setDeviceMode.
---Source: lua/vehicle/powertrain.lua:867
---@param name string Device name.
---@return string|nil  New mode, nil if the device does not exist.
function powertrain.toggleDeviceMode(name) end

--- Called every graphics frame by main.lua. Updates the environment fields, applies the new deformation group damages to the devices (applyDeformGroupDamage), calls device:updateGFX and updateSounds, integrates the visual shaft angle (electrics.values[electricsName]) then sends the data of the UI stream 'powertrainDeviceData' if requested.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain.lua:176
---@param dt number Time step in seconds.
function powertrain.updateGFX(dt) end

--- Last step of the graphics frame (end of onGraphicsStep): calls device:updateGFXLastStage(dt) on the devices that implement it.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain.lua:229
---@param dt number Time step in seconds.
function powertrain.updateGFXLastStage(dt) end

--- Asks each device to republish its simplified control buttons (device:updateSimpleControlButtons()).
---Source: lua/vehicle/powertrain.lua:318
function powertrain.updateSimpleControlButtons() end

---@type number
i = nil
