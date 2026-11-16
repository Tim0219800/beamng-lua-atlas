# `editor_vehicleEditor_liveEditor_veCrashTester`

*File: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veCrashTester.lua` · VM: Game Engine (GE) · 162 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_liveEditor_veCrashTester`: `extensions.load("editor_vehicleEditor_liveEditor_veCrashTester")`, then the global `editor_vehicleEditor_liveEditor_veCrashTester`

'Other/Crash Tester' tool of the live Vehicle Editor. You choose a starting point on the terrain (wheel = rotation in 5° steps), a number of vehicles (1 to 15) and a target speed (10 to 200 km/h). 'Run Test!' spawns randomly picked cars/trucks (core_vehicles.getVehicleList, Type Car or Truck), spaced 10 m apart, handbrake released and launched at the target speed via applyClusterVelocityScaleAdd. 'Stop Test!' deletes the vehicles.

## Notes

- Starting speed = targetSpeed / 3.6 (km/h to m/s) in the direction startDir * (0,1,0).
- Minor bug: `hit = cameraMouseRayCast(...)` is assigned without `local`, so a global `hit` is created.
- vehsData.done is never updated: only deletion via Stop Test! removes the vehicles.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veCrashTester.onDeserialized(data)` | Restores the open state. *(internal)* *(hook)* | 151 |
| `editor_vehicleEditor_liveEditor_veCrashTester.onSerialize()` | Returns {windowOpen}. *(internal)* *(hook)* | 145 |
| `editor_vehicleEditor_liveEditor_veCrashTester.onUpdate()` | Called every frame: draws the window (sliders, buttons) and the start markers (red triangles via debugDrawer:drawTriSolid). *(internal)* *(hook)* | 111 |
| `editor_vehicleEditor_liveEditor_veCrashTester.open()` | Opens the window. | 141 |

### Parameter details

#### `editor_vehicleEditor_liveEditor_veCrashTester.onDeserialized(data)`

Restores the open state.

- `data` (*table*) : onSerialize table.

#### `editor_vehicleEditor_liveEditor_veCrashTester.onSerialize()`

Returns {windowOpen}.

- **returns**: table {windowOpen = boolean}

## Fields

| Field | Type | Description |
|---|---|---|
| `menuEntry` | string | 'Other/Crash Tester' ('Other' submenu). |

## Calls into the engine (C++)

- `debugDrawer:` `drawTriSolid`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veCrashTester.lua`.*
