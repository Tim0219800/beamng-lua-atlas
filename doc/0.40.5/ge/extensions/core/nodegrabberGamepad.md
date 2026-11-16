# `core_nodegrabberGamepad`

*File: `lua/ge/extensions/core/nodegrabberGamepad.lua` · VM: Game Engine (GE) · 262 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_nodegrabberGamepad`: `extensions.load("core_nodegrabberGamepad")`, then the global `core_nodegrabberGamepad`

GE extension `core_nodegrabberGamepad`: drives the 'nodegrabber' (grab and pull a vehicle node with the mouse or controller) for controller and mouse inputs. It enables the 'Nodegrabber' action map, temporarily switches the player's camera to the 'relative' camera placed like the current camera, sets the pull strength (0 to 100) and displays the key legend. Calls are normally triggered by input actions (nodegrabberPadMode, nodegrabberGrab, nodegrabberStrength...), not by mod code.

## Example

```lua
-- example action binding (input side): core_nodegrabberGamepad.toggleActive() toggles controller mode
core_nodegrabberGamepad.addStrength(5)
```

## Notes

- M.state is exported and mutable: { active (controller mode), actionMapActive, mouseActive, grabbing, previousCameraName, previousRelativeData, vehId, strength = 30 }.
- Controller mode (active) places the camera in 'relative' with the same position/rotation/FOV as the current camera (relative to a vehicle frame built on the ref/left/back nodes of the relative camera, or 0/1/2 by default), and restores the previous camera on deactivation. It does not start if a global camera is active.
- The strength (state.strength) is clamped to [0, 100] and is set by buttons (steps of 5) or analog axis (50 units per second, via onUpdate). A UI message 'ui.nodegrabber.strength' with the integer percentage is displayed when the rounded value changes.
- grab(value, deviceName): for a device whose name starts with 'mouse', the nodegrabber mouse button is simulated; otherwise setGrab applies the force proportional to value (0..1) × strength.
- Any interaction is canceled (resetInteraction) when: the extension is unloaded, the level ends, the CEF UI becomes visible, a menu opens, the followed vehicle is reset/replaced/reloaded, the nodegrabberRender/nodegrabberGrab actions become blocked, or the camera changes (except to 'relative'). onSerialize also resets the interaction, but there is no onDeserialized: the returned state is not restored.
- Dependency: ui_bindingsLegend (key legend: priority 8.2 for the controller, 10.2 for the mouse).

**Dependencies (loaded first):** `ui_bindingsLegend`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_nodegrabberGamepad.addStrength(value)` | Adds `value` to the pull strength (clamped to 0..100), applies it to the nodegrabber and displays the UI message if the rounded value changed. | 203 |
| `core_nodegrabberGamepad.changeStrength(value, filterType)` | Strength-setting input action: binary button (filterType 0) = addStrength(value × 5); analog axis = stores the value and onUpdate applies it continuously. | 209 |
| `core_nodegrabberGamepad.fixCurrentNode()` | Restores the normal force and fixes (pins) the currently targeted node via be.nodeGrabber:fixCurrentNode. | 198 |
| `core_nodegrabberGamepad.grab(value, deviceName)` | 'grab' input action: grabs or releases depending on the device (mouse = simulated click; other = setGrab). | 180 |
| `core_nodegrabberGamepad.onActionFilterUpdated()` | When action filters change: cancels the interaction if nodegrabberRender or nodegrabberGrab is blocked. *(internal)* *(hook)* | 253 |
| `core_nodegrabberGamepad.onBeforeVehicleReplaced(vehicleId)` | Before a vehicle is replaced: cancels the interaction if concerned. *(internal)* *(hook)* | 251 |
| `core_nodegrabberGamepad.onCameraModeChanged(cameraName)` | When the camera mode changes: disables controller mode (except grab and mouse) if the new camera is not 'relative'. *(internal)* *(hook)* | 258 |
| `core_nodegrabberGamepad.onCefVisibilityChanged(cefVisible)` | When the CEF UI changes visibility: cancels the interaction if it becomes invisible. *(internal)* *(hook)* | 245 |
| `core_nodegrabberGamepad.onClientEndMission()` | At the end of the level: cancels any interaction. *(internal)* *(hook)* | 244 |
| `core_nodegrabberGamepad.onDespawnObject(vehicleId, isReloading)` | When an object is deleted: cancels the interaction only if it is a reload (isReloading). *(internal)* *(hook)* | 252 |
| `core_nodegrabberGamepad.onExtensionUnloaded()` | On unload: cancels any interaction. *(internal)* *(hook)* | 243 |
| `core_nodegrabberGamepad.onGlobalCameraSet(cameraName)` | When a global camera is activated: disables controller mode (except grab and mouse). *(internal)* *(hook)* | 259 |
| `core_nodegrabberGamepad.onMenuActionMapEnabled(enabled)` | When the menu action map activates: cancels the interaction. *(internal)* *(hook)* | 246 |
| `core_nodegrabberGamepad.onNodegrab(grabbed)` | Called by the native nodegrabber when a node is grabbed or released: updates state.grabbing, the mouse legend and the node display. *(internal)* *(hook)* | 169 |
| `core_nodegrabberGamepad.onSerialize()` | Before a Lua reload: cancels any interaction and returns M.state. *(internal)* *(hook)* | 237 |
| `core_nodegrabberGamepad.onUpdate(dtReal)` | Per-frame hook: in active controller mode and if the strength axis is non-zero, adds strengthAxis × 50 × dtReal to the strength. *(internal)* *(hook)* | 217 |
| `core_nodegrabberGamepad.onVehicleResetted(vehicleId)` | When a vehicle is reset: cancels the interaction if it is the followed vehicle or the player vehicle. *(internal)* *(hook)* | 250 |
| `core_nodegrabberGamepad.setGrab(value)` | Grabs (value > 0, with force value × strength) or releases (restores the normal force) the targeted node. | 188 |
| `core_nodegrabberGamepad.setMouseActive(enabled)` | Enables or disables mouse mode. Enabling mouse mode first disables controller mode. | 159 |
| `core_nodegrabberGamepad.toggleActive()` | Enables or disables the nodegrabber controller mode (relative camera, controller mode, action map and legend). | 176 |

### Parameter details

#### `core_nodegrabberGamepad.addStrength(value)`

Adds `value` to the pull strength (clamped to 0..100), applies it to the nodegrabber and displays the UI message if the rounded value changed.

- `value` (*number*) : Strength change.

#### `core_nodegrabberGamepad.changeStrength(value, filterType)`

Strength-setting input action: binary button (filterType 0) = addStrength(value × 5); analog axis = stores the value and onUpdate applies it continuously.

- `value` (*number*) : Input value.
- `filterType` (*integer*) : 0 for a button, other for an axis.

#### `core_nodegrabberGamepad.grab(value, deviceName)`

'grab' input action: grabs or releases depending on the device (mouse = simulated click; other = setGrab).

- `value` (*number*) : Axis or button value (0 = released).
- `deviceName` (*string*) : Name of the input device (starting with 'mouse' for a mouse).

#### `core_nodegrabberGamepad.onBeforeVehicleReplaced(vehicleId)`

Before a vehicle is replaced: cancels the interaction if concerned.

- `vehicleId` (*integer*) : Vehicle id.

#### `core_nodegrabberGamepad.onCameraModeChanged(cameraName)`

When the camera mode changes: disables controller mode (except grab and mouse) if the new camera is not 'relative'.

- `cameraName` (*string*) : Name of the new camera mode.

#### `core_nodegrabberGamepad.onCefVisibilityChanged(cefVisible)`

When the CEF UI changes visibility: cancels the interaction if it becomes invisible.

- `cefVisible` (*boolean*) : UI visible.

#### `core_nodegrabberGamepad.onDespawnObject(vehicleId, isReloading)`

When an object is deleted: cancels the interaction only if it is a reload (isReloading).

- `vehicleId` (*integer*) : Object id.
- `isReloading` (*boolean*) : true if it is a vehicle reload.

#### `core_nodegrabberGamepad.onGlobalCameraSet(cameraName)`

When a global camera is activated: disables controller mode (except grab and mouse).

- `cameraName` (*string|nil*) : Name of the global camera.

#### `core_nodegrabberGamepad.onMenuActionMapEnabled(enabled)`

When the menu action map activates: cancels the interaction.

- `enabled` (*boolean*) : Menu action map active.

#### `core_nodegrabberGamepad.onNodegrab(grabbed)`

Called by the native nodegrabber when a node is grabbed or released: updates state.grabbing, the mouse legend and the node display.

- `grabbed` (*boolean*) : true if a node is currently grabbed.

#### `core_nodegrabberGamepad.onSerialize()`

Before a Lua reload: cancels any interaction and returns M.state.

- **returns**: table M.state.

#### `core_nodegrabberGamepad.onUpdate(dtReal)`

Per-frame hook: in active controller mode and if the strength axis is non-zero, adds strengthAxis × 50 × dtReal to the strength.

- `dtReal` (*number*) : Elapsed real time (s).

#### `core_nodegrabberGamepad.onVehicleResetted(vehicleId)`

When a vehicle is reset: cancels the interaction if it is the followed vehicle or the player vehicle.

- `vehicleId` (*integer*) : Vehicle id.

#### `core_nodegrabberGamepad.setGrab(value)`

Grabs (value > 0, with force value × strength) or releases (restores the normal force) the targeted node.

- `value` (*number*) : Intensity 0..1 (> 0 = grab).

#### `core_nodegrabberGamepad.setMouseActive(enabled)`

Enables or disables mouse mode. Enabling mouse mode first disables controller mode.

- `enabled` (*boolean*) : true to enable.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | { 'ui_bindingsLegend' }. |
| `state` | table | Nodegrabber state (see notes). |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/nodegrabberGamepad.lua`.*
