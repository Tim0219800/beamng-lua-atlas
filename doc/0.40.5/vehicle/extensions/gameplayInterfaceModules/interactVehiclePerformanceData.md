# `gameplayInterfaceModules_interactVehiclePerformanceData`

*File: `lua/vehicle/extensions/gameplayInterfaceModules/interactVehiclePerformanceData.lua` · VM: Vehicle · 60 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplayInterfaceModules_interactVehiclePerformanceData`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactVehiclePerformanceData")`, then the global `gameplayInterfaceModules_interactVehiclePerformanceData`

gameplayInterface module relaying to the vehicle extension `vehiclePerformanceData`: starts/stops performance recordings (up to 5 types), reads the recorded data and the vehicle's static data.

## Example

```lua
gameplayInterface.executeAction(0, 21, 'startRecording', 'acceleration')
gameplayInterface.getSystemData(0, 22, 'getStaticData')
```

## Notes

- Actions 'startRecording' and 'stopRecording'(type1:string, type2?:string, ... type5?:string): call extensions.vehiclePerformanceData.startRecording/stopRecording({the 5 types}).
- Lookup 'getRecordingData'(type1:string, ... type5?:string): directly returns the result of extensions.vehiclePerformanceData.getRecordingData.
- Lookup 'getStaticData'(): returns extensions.vehiclePerformanceData.getStaticData().
- This extension (vehiclePerformanceData) must be loaded in the vehicle VM, otherwise the call raises an error. It is not in this batch.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplayInterfaceModules_interactVehiclePerformanceData.onExtensionLoaded()` | Called at load: fills moduleActions and moduleLookups. *(internal)* *(hook)* | 49 |
| `gameplayInterfaceModules_interactVehiclePerformanceData.requestRegistration(gi)` | Registers the actions and lookups with gameplayInterface. *(internal)* | 45 |

### Parameter details

#### `gameplayInterfaceModules_interactVehiclePerformanceData.requestRegistration(gi)`

Registers the actions and lookups with gameplayInterface.

- `gi` (*table*) : The gameplayInterface module.

## Fields

| Field | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Actions: startRecording, stopRecording. |
| `moduleLookups` | table<string, function> | Lookups: getRecordingData, getStaticData. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/gameplayInterfaceModules/interactVehiclePerformanceData.lua`.*
