# `editor_vehicleEditor_liveEditor_veRawData`

*File: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veRawData.lua` · VM: Game Engine (GE) · 47 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_liveEditor_veRawData`: `extensions.load("editor_vehicleEditor_liveEditor_veRawData")`, then the global `editor_vehicleEditor_liveEditor_veRawData`

'Raw Vehicle Data' window of the live Vehicle Editor: displays as a recursive imgui tree the entire vEditor.vehData table (data of the current vehicle, including the jbeam vdata) via imguiUtils.addRecursiveTreeTable. Useful to a modder to inspect the resolved jbeam structure.

## Notes

- Nothing is drawn until the window is open or if vEditor.vehicle/vehData are absent.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veRawData.onDeserialized(data)` | Restores the open state of the window. *(internal)* *(hook)* | 36 |
| `editor_vehicleEditor_liveEditor_veRawData.onSerialize()` | Returns {windowOpen} to restore the state after Lua reload. *(internal)* *(hook)* | 30 |
| `editor_vehicleEditor_liveEditor_veRawData.onUpdate()` | Called every frame: draws the window and the data tree if it is open. *(internal)* *(hook)* | 15 |
| `editor_vehicleEditor_liveEditor_veRawData.open()` | Opens the window (used by the Vehicle Editor menu). | 26 |

### Parameter details

#### `editor_vehicleEditor_liveEditor_veRawData.onDeserialized(data)`

Restores the open state of the window.

- `data` (*table*) : onSerialize table.

#### `editor_vehicleEditor_liveEditor_veRawData.onSerialize()`

Returns {windowOpen} to restore the state after Lua reload.

- **returns**: table {windowOpen = boolean}

## Fields

| Field | Type | Description |
|---|---|---|
| `menuEntry` | string | 'Raw Vehicle Data': menu label read by editor_veMain. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veRawData.lua`.*
