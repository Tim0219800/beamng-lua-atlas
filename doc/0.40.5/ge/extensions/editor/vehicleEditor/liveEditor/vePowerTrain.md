# `editor_vehicleEditor_liveEditor_vePowerTrain`

*File: `lua/ge/extensions/editor/vehicleEditor/liveEditor/vePowerTrain.lua` · VM: Game Engine (GE) · 107 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_liveEditor_vePowerTrain`: `extensions.load("editor_vehicleEditor_liveEditor_vePowerTrain")`, then the global `editor_vehicleEditor_liveEditor_vePowerTrain`

'Powertrain' window (Powertrain Inspector) of the live Vehicle Editor. Every frame it asks the vehicle for powertrain.serializeDevicesInfo() (stored in vEditor.powertrainDevices), offers a combo of the devices sorted by name, then displays their jbeam data and live data using powerTrainUtils. Depends on editor_veMain.

## Notes

- Inconsistency: exports `onDeserialize` (without 'd') whereas the extension hook is `onDeserialized`; devicePtr/windowOpen are therefore probably not restored.
- The device list is recomputed when vEditor.resetDeviceString is true (vehicle change or editor activation).

**Dependencies (loaded first):** `editor_veMain`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_liveEditor_vePowerTrain.onDeserialize(data)` | Restores windowOpen and devicePtr (non-standard name). *(internal)* *(hook)* | 74 |
| `editor_vehicleEditor_liveEditor_vePowerTrain.onEditorActivated()` | Called on editor activation: forces the recomputation of the device list. *(internal)* *(hook)* | 96 |
| `editor_vehicleEditor_liveEditor_vePowerTrain.onSerialize()` | Returns {windowOpen, devicePtr}. *(internal)* *(hook)* | 67 |
| `editor_vehicleEditor_liveEditor_vePowerTrain.onUpdate(dt)` | Called every frame: requests the device info from the vehicle and draws the combo, the jbeam data and the live data. *(internal)* *(hook)* | 20 |
| `editor_vehicleEditor_liveEditor_vePowerTrain.onVehicleSwitched(oldVehicle, newVehicle, player)` | On vehicle change, if the editor is active, empties the device list and forces the recomputation of the name list. *(internal)* *(hook)* | 90 |
| `editor_vehicleEditor_liveEditor_vePowerTrain.open()` | Opens the window. | 79 |

### Parameter details

#### `editor_vehicleEditor_liveEditor_vePowerTrain.onDeserialize(data)`

Restores windowOpen and devicePtr (non-standard name).

- `data` (*table*) : onSerialize table.

#### `editor_vehicleEditor_liveEditor_vePowerTrain.onSerialize()`

Returns {windowOpen, devicePtr}.

- **returns**: table {windowOpen = boolean, devicePtr = integer}

#### `editor_vehicleEditor_liveEditor_vePowerTrain.onUpdate(dt)`

Called every frame: requests the device info from the vehicle and draws the combo, the jbeam data and the live data.

- `dt` (*number*) : Time delta.

#### `editor_vehicleEditor_liveEditor_vePowerTrain.onVehicleSwitched(oldVehicle, newVehicle, player)`

On vehicle change, if the editor is active, empties the device list and forces the recomputation of the name list.

- `oldVehicle` (*integer*) : ID of the old vehicle.
- `newVehicle` (*integer*) : ID of the new vehicle.
- `player` (*integer*) : Player index.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {'editor_veMain'}. |
| `menuEntry` | string | 'Powertrain Inspector'. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/liveEditor/vePowerTrain.lua`.*
