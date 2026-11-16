# `editor_drivePathEditor_record`

*File: `lua/ge/extensions/editor/drivePathEditor/record.lua` · VM: Game Engine (GE) · 151 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_drivePathEditor_record`: `extensions.load("editor_drivePathEditor_record")`, then the global `editor_drivePathEditor_record`

Path recording for the Drive Path Editor: while the player drives a vehicle, the module samples its position and speed every second, then on stop creates a new "Recorded_<name>" spline linked to that vehicle, simplified by the RDP algorithm.

## Notes

- Constants: sampling rate 1 s, RDP tolerance 3.0, default width 10 m, default speed limit 100, minimum recorded speed 3 m/s, nodes closer than ~2 m (distance² <= 4.1) are merged.
- The created spline has routeSpeedMode = 'off' and speedProfileMode = 1 (per-node speeds); widths = 10, nmls = (0,0,1), velLimits = 100 for all nodes.
- stopRecord assumes a recording has been started: without a recorded vehicle (recordingVehicle nil) the function would raise an error.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_drivePathEditor_record.getRecordingTime()` | Time elapsed since the start of recording. | 36 |
| `editor_drivePathEditor_record.handleRecord()` | To be called every frame: advances the timer and adds a point (position, speed >= 3 m/s) every second. No effect if no vehicle is being recorded. *(internal)* | 39 |
| `editor_drivePathEditor_record.startRecord(vehicle)` | Starts recording: stores the vehicle, makes the player enter it (be:enterVehicle(0, ...)), clears the data and records the first point. | 64 |
| `editor_drivePathEditor_record.stopRecord(sceneVehicles)` | Ends recording: adds a path spline linked to the vehicle, copies positions and speeds, removes nearby duplicates, simplifies via rdp.simplifyNodesVels and resets the state. | 86 |

### Parameter details

#### `editor_drivePathEditor_record.getRecordingTime()`

Time elapsed since the start of recording.

- **returns**: number seconds

#### `editor_drivePathEditor_record.startRecord(vehicle)`

Starts recording: stores the vehicle, makes the player enter it (be:enterVehicle(0, ...)), clears the data and records the first point.

- `vehicle` (*table|nil*) : editor vehicle entry with .veh (vehicle object) and .name

#### `editor_drivePathEditor_record.stopRecord(sceneVehicles)`

Ends recording: adds a path spline linked to the vehicle, copies positions and speeds, removes nearby duplicates, simplifies via rdp.simplifyNodesVels and resets the state.

- `sceneVehicles` (*table*) : scene vehicles; the matching entry receives isLink = true and linkSplineId

## Calls into the engine (C++)

- `be:` `enterVehicle`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/drivePathEditor/record.lua`.*
