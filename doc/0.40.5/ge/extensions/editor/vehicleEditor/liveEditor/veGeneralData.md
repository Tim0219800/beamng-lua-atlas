# `editor_vehicleEditor_liveEditor_veGeneralData`

*File: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veGeneralData.lua` · VM: Game Engine (GE) · 112 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_liveEditor_veGeneralData`: `extensions.load("editor_vehicleEditor_liveEditor_veGeneralData")`, then the global `editor_vehicleEditor_liveEditor_veGeneralData`

'General Data' window of the live Vehicle Editor. Every frame, it sends the vehicle VM a command that returns (via obj:queueGameEngineLua) a table in vEditor.generalData: position, rotation, direction, roll/pitch/yaw, speed, accelerations (sensors.gx2/gy2/gz2), air/ground speed, temperature, pressure, air density and damage. It displays them with readable units.

## Notes

- Displayed units: position m, speed m/s, acceleration m/s², temperature converted from K to °C (-273.15), pressure converted from Pa to kPa (*0.001), density kg/m³, damage in $.
- The data arrives one frame late (asynchronous queueLuaCommand command).
- The command is sent every frame the window is open (im.Begin true).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veGeneralData.onDeserialized(data)` | Restores the open state. *(internal)* *(hook)* | 101 |
| `editor_vehicleEditor_liveEditor_veGeneralData.onSerialize()` | Returns {windowOpen}. *(internal)* *(hook)* | 95 |
| `editor_vehicleEditor_liveEditor_veGeneralData.onUpdate()` | Called every frame: requests the data from the vehicle and draws the two-column table. *(internal)* *(hook)* | 20 |
| `editor_vehicleEditor_liveEditor_veGeneralData.open()` | Opens the window. | 91 |

### Parameter details

#### `editor_vehicleEditor_liveEditor_veGeneralData.onDeserialized(data)`

Restores the open state.

- `data` (*table*) : onSerialize table.

#### `editor_vehicleEditor_liveEditor_veGeneralData.onSerialize()`

Returns {windowOpen}.

- **returns**: table {windowOpen = boolean}

## Fields

| Field | Type | Description |
|---|---|---|
| `menuEntry` | string | 'General Data'. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veGeneralData.lua`.*
