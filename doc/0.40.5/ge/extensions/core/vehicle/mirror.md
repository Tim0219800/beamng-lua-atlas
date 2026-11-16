# `core_vehicle_mirror`

*File: `lua/ge/extensions/core/vehicle/mirror.lua` · VM: Game Engine (GE) · 322 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_vehicle_mirror`: `extensions.load("core_vehicle_mirror")`, then the global `core_vehicle_mirror`

GE extension `core_vehicle_mirror`: adjustment of a vehicle's mirror angles. Reads the mirror list from vdata.mirrors, applies an angle offset (offsetNormal) to the mirrors through veh:getMirror(id), stores the settings per model and per config in settings/mirrorOffsets.json, reapplies them each time the vehicle spawns, handles mouse dragging (vehicleEvent) and moves the driver camera to a mirror (focusOnMirror). Also contains a small ImGui debug window.

## Example

```lua
local offsets = core_vehicle_mirror.getAnglesOffset()   -- [meshName] = {name, id, angleOffset = {x, z}, clampX, clampZ, position, icon, row, label}
core_vehicle_mirror.setAngleOffset('mirror_L', 5, -3, nil, true)   -- x, z in degrees, save
```

## Notes

- Angles are in degrees (x: up/down, z: left/right), clamped by default to ±20° (MAXDEGREE) or by clampX/clampZ defined in the mirror's jbeam. They are saved by `veh.JBeam`, then by config name ('custom' if the config is a serialized table), then by mirror mesh name.
- The targeted vehicle is that of core_vehicle_configTarget (or the vehicle passed as an argument).
- BUG: M.onExtensionUnloaded and M.onClientEndMission are assigned to local variables that are never defined (they equal nil); these hooks therefore do not exist.
- onVehicleSpawned tests `if #offset` on a table with text keys: #offset equals 0, which is truthy in Lua, so the test always passes; it does not depend on the content.
- Note the name conflict with core_vehicleMirrors (separate file, in core/): core_vehicle_mirror handles mirror orientation, core_vehicleMirrors the (inactive) rendering of their reflections.

**Dependencies (loaded first):** `ui_imgui`, `core_vehicle_configTarget`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_vehicle_mirror.focusOnMirror(mirror_name)` | Switches to the driver camera and, if the mirror is outside the field of view, orients the camera (relativeYaw/relativePitch) toward it. Without a name, restores the orientation from before the focus. | 250 |
| `core_vehicle_mirror.getAnglesOffset(vid, v)` | Lists the vehicle's mirrors with their current angle offset (stored setting or 0) and their limits. | 73 |
| `core_vehicle_mirror.onDeserialized(data)` | Hook: restores the debug window and recomputes the screen ratio. *(internal)* *(hook)* | 49 |
| `core_vehicle_mirror.onExtensionLoaded()` | Hook: loads the settings from settings/mirrorOffsets.json. *(internal)* *(hook)* | 297 |
| `core_vehicle_mirror.onSerialize()` | Hook: saves the open state of the debug window. *(internal)* *(hook)* | 43 |
| `core_vehicle_mirror.onSettingsChanged()` | Hook: recomputes the mouse degrees/pixel ratio from the resolution (20° over the average of width+height). *(internal)* *(hook)* | 54 |
| `core_vehicle_mirror.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook: applies the ongoing mouse drag and shows the debug window if open. *(internal)* *(hook)* | 166 |
| `core_vehicle_mirror.onVehicleDestroyed(vid)` | Hook: a vehicle is destroyed (does nothing). *(internal)* *(hook)* | 59 |
| `core_vehicle_mirror.onVehicleSpawned(vid, veh)` | Hook: a vehicle spawns; reapplies the stored settings of all its mirrors. *(internal)* *(hook)* | 62 |
| `core_vehicle_mirror.setAngleOffset(mirrorName, x, z, v, save)` | Applies an angle offset to a mirror (offsetNormal = (0,1,0) rotated by x and z) and stores the setting for the model/config. | 119 |
| `core_vehicle_mirror.setDebug(newValue)` | Opens or closes the "core_vehicle_mirror Debugger" ImGui window (X/Z sliders per mirror). | 215 |
| `core_vehicle_mirror.vehicleEvent(evtType, vid, mirror_name)` | Mouse event on a mirror in the world: 'onDown' starts a drag adjustment, 'onUp' ends it and saves. Any other value: error log. | 223 |

### Parameter details

#### `core_vehicle_mirror.focusOnMirror(mirror_name)`

Switches to the driver camera and, if the mirror is outside the field of view, orients the camera (relativeYaw/relativePitch) toward it. Without a name, restores the orientation from before the focus.

- `mirror_name` (*string|nil*) : mirror mesh name; nil = return to the previous orientation

#### `core_vehicle_mirror.getAnglesOffset(vid, v)`

Lists the vehicle's mirrors with their current angle offset (stored setting or 0) and their limits.

- `vid` (*integer|nil*) : vehicle id; nil = that of `v`
- `v` (*userdata|nil*) : vehicle object; nil = configured vehicle
- **returns**: table<string, table> [meshName] = {name, id, angleOffset = {x, z}, clampX, clampZ, position (UiColumn), icon, row (UiRow), label}; {} if no mirrors

#### `core_vehicle_mirror.onDeserialized(data)`

Hook: restores the debug window and recomputes the screen ratio.

- `data` (*table*) : data from onSerialize

#### `core_vehicle_mirror.onSerialize()`

Hook: saves the open state of the debug window.

- **returns**: table {windowOpen}

#### `core_vehicle_mirror.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook: applies the ongoing mouse drag and shows the debug window if open.

- `dtReal` (*number*) : real time (s)
- `dtSim` (*number*) : simulation time (s)
- `dtRaw` (*number*) : raw time (s)

#### `core_vehicle_mirror.onVehicleDestroyed(vid)`

Hook: a vehicle is destroyed (does nothing).

- `vid` (*integer*) : vehicle

#### `core_vehicle_mirror.onVehicleSpawned(vid, veh)`

Hook: a vehicle spawns; reapplies the stored settings of all its mirrors.

- `vid` (*integer*) : vehicle
- `veh` (*userdata*) : vehicle object

#### `core_vehicle_mirror.setAngleOffset(mirrorName, x, z, v, save)`

Applies an angle offset to a mirror (offsetNormal = (0,1,0) rotated by x and z) and stores the setting for the model/config.

- `mirrorName` (*string*) : mirror mesh name
- `x` (*number*) : X angle in degrees
- `z` (*number*) : Z angle in degrees
- `v` (*userdata|nil*) : vehicle; nil = configured vehicle
- `save` (*boolean|nil*) : true: writes settings/mirrorOffsets.json

#### `core_vehicle_mirror.setDebug(newValue)`

Opens or closes the "core_vehicle_mirror Debugger" ImGui window (X/Z sliders per mirror).

- `newValue` (*boolean*) : true to open

#### `core_vehicle_mirror.vehicleEvent(evtType, vid, mirror_name)`

Mouse event on a mirror in the world: 'onDown' starts a drag adjustment, 'onUp' ends it and saves. Any other value: error log.

- `evtType` (*string*) : 'onDown' or 'onUp'
- `vid` (*integer*) : vehicle
- `mirror_name` (*string*) : mirror mesh name

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'ui_imgui', 'core_vehicle_configTarget'} |
| `onClientEndMission` | nil | Equals nil (undefined local variable, see notes). ⚠ reference `onClientEndMission` not defined in the file (probably nil) |
| `onExtensionUnloaded` | nil | Equals nil (undefined local variable, see notes). ⚠ reference `onExtensionUnloaded` not defined in the file (probably nil) |

## Calls into the engine (C++)

- `Engine.` `sceneGetCameraFrustum`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/vehicle/mirror.lua`.*
