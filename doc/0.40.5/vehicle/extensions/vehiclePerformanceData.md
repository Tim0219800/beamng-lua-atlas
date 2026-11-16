# `vehiclePerformanceData`

*File: `lua/vehicle/extensions/vehiclePerformanceData.lua` · VM: Vehicle · 363 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `vehiclePerformanceData`: `extensions.load (vehicle VM)("vehiclePerformanceData")`, then the global `vehiclePerformanceData`

Collection of vehicle performance data, mostly used by the UI/the game for spec sheets and certifications. Two parts: static data (weight, driven wheel distribution, gearbox type, fuels, induction type) via getStaticData, and dynamic recordings (peak power, torque, longitudinal and lateral acceleration) started by startRecording and read by getRecordingData. The extension only enables its updateGFX during a recording.

## Example

```lua
local T = vehiclePerformanceData.recordingTypes
vehiclePerformanceData.startRecording({T.power, T.torque})
-- ... accelerate ...
local d = vehiclePerformanceData.getRecordingData({T.power})
local power = d.power.propulsionPowerCombined
vehiclePerformanceData.stopRecording({T.power, T.torque})
```

## Notes

- Valid recordingTypes: power, torque, speed (does nothing), longitudinalAcceleration, lateralAcceleration. The keys are equal to the values (strings of the same name).
- Results: power -> recordingData.power.propulsionPowerCombined = peak of the sum (combustionTorque or outputTorque1) x outputAV1 over the driven-wheel devices (W if N·m x rad/s); torque -> propulsionTorqueCombined (peak, N·m); accelerations -> maxAcceleration = peak of |sensors.gy2| (longitudinal) or |sensors.gx2| (lateral), in m/s² judging by the sensor names (inferred).
- Apparent bug: longitudinal acceleration uses sensors.gy2 and lateral uses sensors.gx2; this is consistent with the vehicle frame (Y forward) but to be confirmed on the sensor side.
- getStaticData returns: weight (obj:calcBeamStats().total_weight), powertrainLayout {poweredWheelsFront, poweredWheelsRear}, transmissionStyle (table gearbox type -> true), propulsionType (always nil: empty function), fuelType (table "fuelTank:<energyType>", "electricBattery" or storage type -> true, n2oTank ignored), inductionType (naturalAspiration / turbocharger / supercharger / N2O -> true).
- startRecording replaces the data of the requested type (recordingData[type] = {}). stopRecording does not delete the data, it can be read afterwards with getRecordingData.
- M.updateGFX is nil by default; startRecording assigns it and calls extensions.hookUpdate('updateGFX') so that the hook is taken into account, stopRecording sets it back to nil when nothing is active anymore. This is why `updateGFX` is listed as a nil field.
- The measurement functions depend on powertrain.getAllWheelPropulsionDevices() and on a combustion engine (turbocharger/supercharger/nitrousOxideInjection must exist in getInductionType).

## Functions

| Function | Description | Line |
|---|---|---|
| `vehiclePerformanceData.getRecordingData(recordingTypes)` | Returns the data collected for the requested types. | 262 |
| `vehiclePerformanceData.getStaticData()` | Computes and returns the vehicle's static data (weight, layout, gearbox, fuels, induction). | 270 |
| `vehiclePerformanceData.onExtensionLoaded()` | Load hook: initializes the recording tables and associates each type with its start/stop/update routines. *(internal)* *(hook)* | 281 |
| `vehiclePerformanceData.startRecording(recordingTypes)` | Starts the requested recordings (initializes their data, calls their start routine) and enables the updateGFX hook if needed. | 233 |
| `vehiclePerformanceData.stopRecording(recordingTypes)` | Stops the requested recordings; disables updateGFX if none is active anymore. The data stays readable. | 248 |

### Parameter details

#### `vehiclePerformanceData.getRecordingData(recordingTypes)`

Returns the data collected for the requested types.

- `recordingTypes` (*string[]*) : List of recordingTypes values.
- **returns**: table<string, table> Table type -> data (nil for a type never started).

#### `vehiclePerformanceData.getStaticData()`

Computes and returns the vehicle's static data (weight, layout, gearbox, fuels, induction).

- **returns**: table Table with the keys of staticTypes.

#### `vehiclePerformanceData.startRecording(recordingTypes)`

Starts the requested recordings (initializes their data, calls their start routine) and enables the updateGFX hook if needed.

- `recordingTypes` (*string[]*) : List of recordingTypes values.

#### `vehiclePerformanceData.stopRecording(recordingTypes)`

Stops the requested recordings; disables updateGFX if none is active anymore. The data stays readable.

- `recordingTypes` (*string[]*) : List of recordingTypes values.

## Fields

| Field | Type | Description |
|---|---|---|
| `recordingTypes` | table<string, string> | Dynamic recording types: power, torque, speed, longitudinalAcceleration, lateralAcceleration. |
| `staticTypes` | table<string, string> | Static data names: weight, powertrainLayout, transmissionStyle, propulsionType, fuelType, inductionType. |
| `updateGFX` | function|nil | nil at rest; set by startRecording while a recording is active. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `updateGFX`

## Calls into the engine (C++)

- `obj:` `calcBeamStats`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/vehiclePerformanceData.lua`.*
