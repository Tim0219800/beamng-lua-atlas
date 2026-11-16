# `editor_vehicleEditor_liveEditor_veVehicleSpawner`

*File: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veVehicleSpawner.lua` · VM: Game Engine (GE) · 184 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_liveEditor_veVehicleSpawner`: `extensions.load("editor_vehicleEditor_liveEditor_veVehicleSpawner")`, then the global `editor_vehicleEditor_liveEditor_veVehicleSpawner`

'Other/Vehicle Spawner' tool of the live Vehicle Editor. When the editor loads it remembers up to 20 vehicles (Car or Truck) from core_vehicles.getVehicleList. The window lets you spawn a vehicle at the camera position/orientation ('Select Vehicle' window), choose a point on the terrain (wheel = 5° rotation) then line up all the vehicles of the list there (spaced 10 m apart), and delete everything ('Despawn All').

## Notes

- Vehicles spawn with the handbrake released (input.event('parkingbrake', 0, 1)).
- Only the vehicles created by 'Spawn Vehicles' are tracked in vehsData and deleted by 'Despawn All'; those created from 'Select Vehicle' are not recorded.
- Minor bug: `hit = cameraMouseRayCast(...)` is assigned without `local` (global `hit`).
- One button per vehicle of vehsList: at most 20 models offered.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veVehicleSpawner.onDeserialized(data)` | Restores the open state. *(internal)* *(hook)* | 172 |
| `editor_vehicleEditor_liveEditor_veVehicleSpawner.onEditorInitialized()` | Called at editor initialization: fills vehsList with the first 20 Car/Truck vehicles. *(internal)* *(hook)* | 152 |
| `editor_vehicleEditor_liveEditor_veVehicleSpawner.onSerialize()` | Returns {windowOpen}. *(internal)* *(hook)* | 166 |
| `editor_vehicleEditor_liveEditor_veVehicleSpawner.onUpdate()` | Called every frame: draws the window, the start markers and the vehicle selection window. *(internal)* *(hook)* | 113 |
| `editor_vehicleEditor_liveEditor_veVehicleSpawner.open()` | Opens the window. | 148 |

### Parameter details

#### `editor_vehicleEditor_liveEditor_veVehicleSpawner.onDeserialized(data)`

Restores the open state.

- `data` (*table*) : onSerialize table.

#### `editor_vehicleEditor_liveEditor_veVehicleSpawner.onSerialize()`

Returns {windowOpen}.

- **returns**: table {windowOpen = boolean}

## Fields

| Field | Type | Description |
|---|---|---|
| `menuEntry` | string | 'Other/Vehicle Spawner'. |

## Calls into the engine (C++)

- `debugDrawer:` `drawTriSolid`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veVehicleSpawner.lua`.*
