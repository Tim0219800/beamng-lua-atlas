# `editor_vehicleEditor_api_powerTrainUtils`

*File: `lua/ge/extensions/editor/vehicleEditor/api/powerTrainUtils.lua` · VM: Game Engine (GE) · 144 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_api_powerTrainUtils`: `extensions.load("editor_vehicleEditor_api_powerTrainUtils")`, then the global `editor_vehicleEditor_api_powerTrainUtils`

Shared imgui display functions for the Vehicle Editor's powertrain inspector (vePowerTrain). They show the jbeam data of a device (recursive tree) and its live data (angular velocities, torques, ratios, clutch...), with fields specific to the device type (combustionEngine, differential, shaft, manualGearbox, frictionClutch, torqueConverter, automaticGearbox, cvtGearbox, dctGearbox).

## Notes

- The `device` values come from powertrain.serializeDevicesInfo() on the vehicle side, copied into vEditor.powertrainDevices.
- showJbeamData reads vEditor.vdata.powertrain[deviceID]; deviceID is the 0-based Lua index used by vePowerTrain.
- For manualGearbox, the loop `for i=0,#device.gearDamages` uses the # operator on a table that may start at 0.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_api_powerTrainUtils.displayLivedata(device)` | Displays the common live data: inputAV, outputAV1/2, outputTorque1/2, isBroken, mode, virtualMassAV, isPhysicallyDisconnected, gearRatio, cumulativeGearRatio, cumulativeInertia. | 102 |
| `editor_vehicleEditor_api_powerTrainUtils.displayLivedataByType(deviceType, device)` | Displays in two columns the live fields specific to the device type (for example engineLoad for an engine, diffAngle/outputAV2/outputTorque2 for a differential, clutchAngle/lockSpring for a clutch). | 11 |
| `editor_vehicleEditor_api_powerTrainUtils.initialize(editorInstance)` | Assigns the global `vEditor` to the given instance. *(internal)* | 133 |
| `editor_vehicleEditor_api_powerTrainUtils.showJbeamData(deviceID)` | Displays in a tree node 'All jbeam data' all the jbeam data of the device vEditor.vdata.powertrain[deviceID]. | 126 |

### Parameter details

#### `editor_vehicleEditor_api_powerTrainUtils.displayLivedata(device)`

Displays the common live data: inputAV, outputAV1/2, outputTorque1/2, isBroken, mode, virtualMassAV, isPhysicallyDisconnected, gearRatio, cumulativeGearRatio, cumulativeInertia.

- `device` (*table*) : Serialized live data of the device.

#### `editor_vehicleEditor_api_powerTrainUtils.displayLivedataByType(deviceType, device)`

Displays in two columns the live fields specific to the device type (for example engineLoad for an engine, diffAngle/outputAV2/outputTorque2 for a differential, clutchAngle/lockSpring for a clutch).

- `deviceType` (*string*) : Type of the device (device.type).
- `device` (*table*) : Serialized live data of the device.

#### `editor_vehicleEditor_api_powerTrainUtils.initialize(editorInstance)`

Assigns the global `vEditor` to the given instance.

- `editorInstance` (*table*) : Editor instance (normally editor_veMain).

#### `editor_vehicleEditor_api_powerTrainUtils.showJbeamData(deviceID)`

Displays in a tree node 'All jbeam data' all the jbeam data of the device vEditor.vdata.powertrain[deviceID].

- `deviceID` (*integer*) : Index of the device in vdata.powertrain (0-based).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/api/powerTrainUtils.lua`.*
