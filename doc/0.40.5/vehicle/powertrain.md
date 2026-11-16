# `powertrain`

*File: `lua/vehicle/powertrain.lua` · VM: Vehicle · 1261 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `powertrain`

Manager of the vehicle's powertrain: at init it reads the `powertrain` section of the jbeam (v.data.powertrain), creates each device via the factory matching its `type` (game files lua/vehicle/powertrain/*.lua or the vehicle's lua/powertrain/*.lua), links them into a tree thanks to `inputName`/`inputIndex`, validates, computes cumulative inertias, and stores them by name. At each physics step it updates the speeds (from the wheels to the engine) then the torques (from the engine to the wheels). A modder mostly uses it to find a device (getDevice, getDevicesByType, getDevicesByCategory) and read/write its fields (RPM, torque, temperature…).

## Example

```lua
local engine = powertrain.getDevice('mainEngine')
if engine then print(engine.outputAV1 * 30 / math.pi) end -- RPM
for _, e in ipairs(powertrain.getDevicesByType('combustionEngine')) do print(e.name, e.engineLoad) end
powertrain.setDeviceMode('differential_F', 'locked')
local wheelsDrivenBy = powertrain.getChildWheels(engine)
```

## Notes

- Structure of a device (common fields set by powertrain.init): name, type, inputName (name of the parent), inputIndex (output port of the parent used), parent (table of the parent device, or a fake parent {isFake=true, outputTorque0..2, deviceCategories} for the root), children (list), gearRatio, cumulativeGearRatio (product of the ratios from the parent to this device), cumulativeInertia, isPhysicallyDisconnected, isPropulsed (inherited from the parent), connectedWheel, outputPorts (table index -> true), deviceCategories (table category -> true, e.g. engine, gearbox), uiName, uiSimpleModeControl, visualPosition, deformGroups / deformGroupDamages, mode / availableModes, isBroken, breakTriggerBeam. Outputs are read in device.outputAV1/outputTorque1 (port 1), outputAV2/outputTorque2 (port 2)… The field names parentOutputAVName/parentOutputTorqueName are inferred from inputIndex.
- Methods called by the manager on each device (if present): velocityUpdate(dt) and torqueUpdate(dt) (mandatory, physics), calculateInertia(), validate(), reset(jbeamData), initSounds(jbeamData), resetSounds(jbeamData), updateGFX(dt), updateSounds(dt), updateGFXLastStage(dt), applyDeformGroupDamage(damage, groupType), onBreak(), beamBroke(id), setMode(mode), onCouplerFound/Attached/Detached, sendTorqueData(), updateSimpleControlButtons(), getState()/setState(data), getPartCondition(subsystem)/setPartCondition(...). If a device has no reset(), the powertrain's reset() does a full init again.
- Traversal order: orderedDevices is ordered from the root (engine) to the leaves (wheels). update(dt) does velocityUpdate from the leaves to the root (decreasing index) then torqueUpdate from the root to the leaves (increasing index). Called by main.lua: update in onPhysicsStep (after wheels.updateWheelVelocities), updateGFX and updateGFXLastStage in onGraphicsStep.
- Known device types = names of the files in lua/vehicle/powertrain (shaft, differential, combustionEngine, electricMotor, automaticGearbox, manualGearbox, etc.) + those of the vehicle's lua/powertrain folder; excluded from the list (companions created by an engine): combustionEngineThermals, supercharger, turbocharger, nitrousOxideInjection, hydraulicCylinder. combustionEngineMF is hard-coded (the code notes a TODO/hack). An unknown type aborts init with an error log ("Powertrain will not work!").
- A device's jbeam keys are merged with the jbeam section of the same name (tableMergeRecursive(jbeamData, v.data[jbeamData.name])). Keys read here: name, type, inputName, inputIndex, gearRatio (default 1), uiName, uiSimpleModeControl (default true), visualPositionRelativeParent {x,y,z}, visualPositionRelativeChildren, breakTriggerBeam (name or list of beam names), deformGroups / deformGroups_<type> (list of deformation groups; separator "_" or ":"), visualShaftAVName (default inputAV), electricsName / visualShaftAngle (visible angle published in electrics.values[electricsName] in degrees).
- A device is marked broken via breakDevice: calls device:onBreak(), breaks the breakTriggerBeam beams, shows a UI message and notifies damageTracker. It is triggered automatically when a breakTriggerBeam beam breaks (beamBroke).
- Environment fields updated at each updateGFX: currentGravity (m/s², obj:getGravity), currentEnvTemperature (K), currentEnvTemperatureCelsius (°C), currentEnvPressure (Pa), and their inverses invCurrent* (guarded against division by zero with guardZero).
- If the vehicle has no powertrain section (trailers, old mods), hasPowertrain stays false: update stays nop, isPhysicsStepUsed() returns false, reset/initSounds do nothing.
- Notes on the fields flagged by the extraction: `update` is nop by default (nop is a global function defined outside the file, it is not nil) and is replaced by the real update function after a successful init; the flagged global `i` is a false positive (local loop variable).
- onCouplerAttached passes the arguments to the devices in the order (nodeId, obj2id, obj2nodeId, attachEnergy, attachSpeed), inverted compared to the main.lua hook (attachSpeed, attachEnergy), for backward compatibility.

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain.beamBroke(id)` | Called by main.lua when a beam breaks: notifies the devices that have a beamBroke method, then breaks the devices whose breakTriggerBeam matches (breakDevice). *(internal)* | 812 |
| `powertrain.breakDevice(device)` | Marks a device as broken: device:onBreak(), breaks its trigger beams (obj:breakBeam), shows the UI message vehicle.powertrain.deviceBroken and reports the damage to damageTracker. No effect if already broken. | 798 |
| `powertrain.calculateTreeInertia()` | Recomputes the cumulative inertia by traversing the devices from the leaves to the root (device:calculateInertia()). To be called again after changing inertias or the structure. | 326 |
| `powertrain.dumpsDeviceData(device)` | Returns a readable string (dumps) of a deep copy of the device, with parent and children replaced by their name, useful for debugging. | 132 |
| `powertrain.getAllWheelPropulsionDevices()` | Returns the list (without duplicates) of the engine devices that drive at least one wheel. | 968 |
| `powertrain.getChildWheels(parentDevice, outputID)` | Recursively traverses a device's children and returns the driven wheels (device.wheel of the wheel shafts). If outputID is given, only follows the child connected to that port. | 933 |
| `powertrain.getDevice(name)` | Returns the device with this name. | 909 |
| `powertrain.getDevices()` | Returns the table of all devices keyed by name. | 901 |
| `powertrain.getDevicesByCategory(category)` | Returns the list of devices whose deviceCategories contains the category. | 923 |
| `powertrain.getDevicesByType(deviceType)` | Returns the list of devices whose `type` equals the given value (order not guaranteed: pairs traversal). | 913 |
| `powertrain.getEngineSoundID()` | Returns a unique, increasing engine identifier (0, 1, 2…), reset to -1 at each init. | 1041 |
| `powertrain.getGearRatioBetweenDevices(topDevice, bottomDevice)` | Multiplies the gearRatios going up from the bottom device to the top device. Returns nil if the devices are not connected (or if an argument is nil). | 1014 |
| `powertrain.getHydraulicConsumer(consumerName)` | Searches among the hydraulic sources (category hydraulicPowerSource) for a named consumer. | 985 |
| `powertrain.getOrderedDevices()` | Returns the array (indexed 1..N) of the devices ordered from the root to the leaves. | 905 |
| `powertrain.getPartCondition(partTypeData)` | Aggregates the wear/integrity state of the devices concerned by part keys of the form "powertrainDevice:<name>:<subSystem>". | 1075 |
| `powertrain.getPoweredWheelNames()` | Returns, for each vehicle wheel driven by an engine, the name of that engine. | 957 |
| `powertrain.getPropulsionDeviceForDevice(device)` | Walks up a device's parents until it finds a device of category engine. | 1000 |
| `powertrain.getPropulsionDeviceForWheel(wheelName)` | Returns the engine-category device that drives the wheel (table computed at init). | 953 |
| `powertrain.getState()` | Merges the states returned by device:getState() of all devices (state saving). | 1101 |
| `powertrain.init()` | Builds the powertrain from v.data.powertrain: discovers the device factories (FS:findFiles on lua/vehicle/powertrain and <vehicle>/lua/powertrain), instantiates each device (factory.new(jbeamData)), links them into a tree, computes visual positions, validation, inertias, break beams, torsion reactors, restores the previous modes and sends the tree to the UI. Called by main.lua (initSystems) and by reset() if a device does not support reset. *(internal)* | 426 |
| `powertrain.initSounds()` | Calls device:initSounds(jbeamData) on each device that has one. Called by main.lua after audio init. *(internal)* | 725 |
| `powertrain.isPhysicsStepUsed()` | Indicates whether the powertrain needs the physics step (true when a powertrain has been built). Used by main.lua:updateCorePhysicsStepEnabled. *(internal)* | 1097 |
| `powertrain.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy)` | Hook relayed by main.lua to the devices (attachEnergy and attachSpeed arguments inverted for compatibility). *(internal)* *(hook)* | 838 |
| `powertrain.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook relayed by main.lua to the devices when a coupler detaches. *(internal)* *(hook)* | 847 |
| `powertrain.onCouplerFound(nodeId, obj2id, obj2nodeId, nodeDist)` | Hook relayed by main.lua: passes to device:onCouplerFound the devices that implement it. *(internal)* *(hook)* | 829 |
| `powertrain.reset()` | Resets the deformation group damages and calls device:reset(jbeamData) on each device, recomputes inertias, sends the tree back to the UI and resets the torque reaction coefficients. If a device has no reset(), falls back to init(). Called by main.lua on vehicle reset. *(internal)* | 737 |
| `powertrain.resetSounds()` | Calls device:resetSounds(jbeamData) on the devices (or initSounds if a full reset is needed). *(internal)* | 780 |
| `powertrain.sendDeviceTree()` | Sends the UI the event PowertrainDeviceTreeChanged {devices, maxPower, maxTorque} (type, modes, visual position, children, current mode of each device). No effect if the first player is not seated. *(internal)* | 272 |
| `powertrain.sendTorqueData()` | Asks each device to send its torque curves (device:sendTorqueData()); no effect if the first player is not seated. *(internal)* | 308 |
| `powertrain.serializeDevicesInfo()` | Old code tied to an imgui tool, used on the GE side: serializes a subset of fields of all devices (name, type, engineLoad, outputAV1/2, outputTorque1/2, mode, isBroken, ratios, clutches…). *(internal)* | 78 |
| `powertrain.setDeviceMode(name, mode)` | Sets a device's mode (device:setMode), stores this choice to restore it after an init and shows a UI message "<name> Mode: <mode>". | 856 |
| `powertrain.setPartCondition(partTypeData, odometer, integrity, visual)` | Applies a part condition (odometer, integrity, visual) to the devices designated by partTypeData via device:setPartCondition. | 1059 |
| `powertrain.setState(data)` | Passes `data` to device:setState(data) of each device that implements it. | 1120 |
| `powertrain.setVehiclePath(path)` | Records the vehicle folder, used to look for device-specific factories. Called by main.lua before init. *(internal)* | 1037 |
| `powertrain.toggleDefaultDiffs()` | Switches all differentials (type 'differential') that have defaultToggle true to the next mode. | 893 |
| `powertrain.toggleDeviceMode(name)` | Switches the named device to the next mode of its availableModes list (cyclic) via setDeviceMode. | 867 |
| `powertrain.updateGFX(dt)` | Called every graphics frame by main.lua. Updates the environment fields, applies the new deformation group damages to the devices (applyDeformGroupDamage), calls device:updateGFX and updateSounds, integrates the visual shaft angle (electrics.values[electricsName]) then sends the data of the UI stream 'powertrainDeviceData' if requested. *(internal)* | 176 |
| `powertrain.updateGFXLastStage(dt)` | Last step of the graphics frame (end of onGraphicsStep): calls device:updateGFXLastStage(dt) on the devices that implement it. *(internal)* | 229 |
| `powertrain.updateSimpleControlButtons()` | Asks each device to republish its simplified control buttons (device:updateSimpleControlButtons()). | 318 |

### Parameter details

#### `powertrain.beamBroke(id)`

Called by main.lua when a beam breaks: notifies the devices that have a beamBroke method, then breaks the devices whose breakTriggerBeam matches (breakDevice).

- `id` (*integer*) : Identifier (cid) of the broken beam.

#### `powertrain.breakDevice(device)`

Marks a device as broken: device:onBreak(), breaks its trigger beams (obj:breakBeam), shows the UI message vehicle.powertrain.deviceBroken and reports the damage to damageTracker. No effect if already broken.

- `device` (*table*) : Powertrain device.

#### `powertrain.dumpsDeviceData(device)`

Returns a readable string (dumps) of a deep copy of the device, with parent and children replaced by their name, useful for debugging.

- `device` (*table|nil*) : Device to describe.
- **returns**: string Dump text, or "nil".

#### `powertrain.getAllWheelPropulsionDevices()`

Returns the list (without duplicates) of the engine devices that drive at least one wheel.

- **returns**: table[] Engine devices.

#### `powertrain.getChildWheels(parentDevice, outputID)`

Recursively traverses a device's children and returns the driven wheels (device.wheel of the wheel shafts). If outputID is given, only follows the child connected to that port.

- `parentDevice` (*table*) : Starting device.
- `outputID` (*integer|nil*) : Output port to follow; -1 or nil = all.
- **returns**: table[] List of wheels (wheel tables).

#### `powertrain.getDevice(name)`

Returns the device with this name.

- `name` (*string|nil*) : Device name.
- **returns**: table|nil The device, or nil (also if name is nil).

#### `powertrain.getDevices()`

Returns the table of all devices keyed by name.

- **returns**: table<string, table> Devices by name (empty if no powertrain).

#### `powertrain.getDevicesByCategory(category)`

Returns the list of devices whose deviceCategories contains the category.

- `category` (*string*) : Category (e.g. 'engine', 'gearbox', 'hydraulicPowerSource').
- **returns**: table[] Array of devices.

#### `powertrain.getDevicesByType(deviceType)`

Returns the list of devices whose `type` equals the given value (order not guaranteed: pairs traversal).

- `deviceType` (*string*) : jbeam type (e.g. 'combustionEngine', 'differential', 'shaft').
- **returns**: table[] Array of devices (empty if none).

#### `powertrain.getEngineSoundID()`

Returns a unique, increasing engine identifier (0, 1, 2…), reset to -1 at each init.

- **returns**: integer Engine identifier.

#### `powertrain.getGearRatioBetweenDevices(topDevice, bottomDevice)`

Multiplies the gearRatios going up from the bottom device to the top device. Returns nil if the devices are not connected (or if an argument is nil).

- `topDevice` (*table*) : Upstream device (closest to the engine).
- `bottomDevice` (*table*) : Downstream device (descendant of topDevice).
- **returns**: number|nil Cumulative ratio between the two.

#### `powertrain.getHydraulicConsumer(consumerName)`

Searches among the hydraulic sources (category hydraulicPowerSource) for a named consumer.

- `consumerName` (*string*) : Consumer name.
- **returns**: table|nil Consumer found or nil.

#### `powertrain.getOrderedDevices()`

Returns the array (indexed 1..N) of the devices ordered from the root to the leaves.

- **returns**: table Ordered list of devices (do not modify).

#### `powertrain.getPartCondition(partTypeData)`

Aggregates the wear/integrity state of the devices concerned by part keys of the form "powertrainDevice:<name>:<subSystem>".

- `partTypeData` (*string[]|nil*) : List of part type keys.
- **returns**: table {integrityValue (min of the devices, default 1), integrityState, visualValue=1, visualState}.
- **returns**: boolean true if at least one device has provided an integrity.
- **returns**: boolean Always false (visual condition not provided).

#### `powertrain.getPoweredWheelNames()`

Returns, for each vehicle wheel driven by an engine, the name of that engine.

- **returns**: table<string, string> wheelName -> engine device name.

#### `powertrain.getPropulsionDeviceForDevice(device)`

Walks up a device's parents until it finds a device of category engine.

- `device` (*table*) : Starting device.
- **returns**: table|nil The ancestor engine (or the device itself), nil if none.

#### `powertrain.getPropulsionDeviceForWheel(wheelName)`

Returns the engine-category device that drives the wheel (table computed at init).

- `wheelName` (*string*) : Wheel name.
- **returns**: table|nil Engine device or nil.

#### `powertrain.getState()`

Merges the states returned by device:getState() of all devices (state saving).

- **returns**: table|nil Merged table reused at each call, nil if no device has data.

#### `powertrain.isPhysicsStepUsed()`

Indicates whether the powertrain needs the physics step (true when a powertrain has been built). Used by main.lua:updateCorePhysicsStepEnabled.

- **returns**: boolean hasPowertrain.

#### `powertrain.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy)`

Hook relayed by main.lua to the devices (attachEnergy and attachSpeed arguments inverted for compatibility).

- `nodeId` (*integer*) : Local coupler node.
- `obj2id` (*integer*) : Id of the other vehicle.
- `obj2nodeId` (*integer*) : Node of the other vehicle.
- `attachSpeed` (*number*) : Speed at attachment.
- `attachEnergy` (*number*) : Energy at attachment.

#### `powertrain.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)`

Hook relayed by main.lua to the devices when a coupler detaches.

- `nodeId` (*integer*) : Local coupler node.
- `obj2id` (*integer*) : Id of the other vehicle.
- `obj2nodeId` (*integer*) : Node of the other vehicle.
- `breakForce` (*number*) : Detachment force.

#### `powertrain.onCouplerFound(nodeId, obj2id, obj2nodeId, nodeDist)`

Hook relayed by main.lua: passes to device:onCouplerFound the devices that implement it.

- `nodeId` (*integer*) : Local coupler node.
- `obj2id` (*integer*) : Id of the other vehicle.
- `obj2nodeId` (*integer*) : Node of the other vehicle.
- `nodeDist` (*number*) : Distance between the nodes.

#### `powertrain.serializeDevicesInfo()`

Old code tied to an imgui tool, used on the GE side: serializes a subset of fields of all devices (name, type, engineLoad, outputAV1/2, outputTorque1/2, mode, isBroken, ratios, clutches…).

- **returns**: string Serialized table (serialize).

#### `powertrain.setDeviceMode(name, mode)`

Sets a device's mode (device:setMode), stores this choice to restore it after an init and shows a UI message "<name> Mode: <mode>".

- `name` (*string*) : Device name.
- `mode` (*string*) : Mode to apply (must exist in the device's modes).

#### `powertrain.setPartCondition(partTypeData, odometer, integrity, visual)`

Applies a part condition (odometer, integrity, visual) to the devices designated by partTypeData via device:setPartCondition.

- `partTypeData` (*string[]|nil*) : Keys "powertrainDevice:<name>:<subSystem>".
- `odometer` (*number*) : Cumulative distance/wear to apply (inferred from code).
- `integrity` (*number|table*) : Integrity; if a table, the value is integrity.powertrain[deviceName].
- `visual` (*any*) : Visual condition passed to the device.

#### `powertrain.setState(data)`

Passes `data` to device:setState(data) of each device that implements it.

- `data` (*table|nil*) : State produced by getState; ignored if nil.

#### `powertrain.setVehiclePath(path)`

Records the vehicle folder, used to look for device-specific factories. Called by main.lua before init.

- `path` (*string*) : Vehicle folder.

#### `powertrain.toggleDeviceMode(name)`

Switches the named device to the next mode of its availableModes list (cyclic) via setDeviceMode.

- `name` (*string*) : Device name.
- **returns**: string|nil New mode, nil if the device does not exist.

#### `powertrain.updateGFX(dt)`

Called every graphics frame by main.lua. Updates the environment fields, applies the new deformation group damages to the devices (applyDeformGroupDamage), calls device:updateGFX and updateSounds, integrates the visual shaft angle (electrics.values[electricsName]) then sends the data of the UI stream 'powertrainDeviceData' if requested.

- `dt` (*number*) : Time step in seconds.

#### `powertrain.updateGFXLastStage(dt)`

Last step of the graphics frame (end of onGraphicsStep): calls device:updateGFXLastStage(dt) on the devices that implement it.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `cumulativeGearRatio` | number | Largest cumulative ratio (cumulativeGearRatio) found among all devices when building the tree. |
| `currentEnvPressure` | number | Outside pressure (obj:getEnvPressure, Pa). |
| `currentEnvTemperature` | number | Outside temperature in kelvin. |
| `currentEnvTemperatureCelsius` | number | Outside temperature in °C. |
| `currentGravity` | number | Current gravity in m/s². |
| `engineData` | table | Empty table reset at init; reserved for engine data (filled elsewhere, not used in this file). |
| `invCurrentEnvPressure` | number | 1 / currentEnvPressure. |
| `invCurrentEnvTemperature` | number | 1 / currentEnvTemperature. |
| `invCurrentEnvTemperatureCelsius` | number | 1 / currentEnvTemperatureCelsius (can be very large near 0 °C). |
| `invCurrentGravity` | number | 1 / currentGravity. |
| `stabilityCoef` | number | Stability coefficient, initial value 250 (used by the devices, not modified in this file). |
| `torqueReactionCoefs` | table<integer, number> | Torque reaction coefficients per torsion reactor (index = torsionReactorIdx of the rotators). Double buffer swapped at each update. Is {0} if the powertrain is not initialized so that index 1 (default reactor) exists. |
| `update` | function | nop until init has succeeded, then the function update(dt) (physics step); called by main.lua in onPhysicsStep. |
| `wheels` | table<string, table> | Vehicle wheels/rotators by name (wheels.wheelRotators). Entries receive isPropulsed = true if a propulsed device drives them. |

**Globals assigned:** `i`

**UI events (guihooks.trigger):** `PowertrainDeviceTreeChanged`

## Calls into the engine (C++)

- `FS:` `findFiles`
- `obj:` `breakBeam`, `getEnvPressure`, `getEnvTemperature`, `getGravity`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain.lua`.*
