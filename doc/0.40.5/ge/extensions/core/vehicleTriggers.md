# `core_vehicleTriggers`

*File: `lua/ge/extensions/core/vehicleTriggers.lua` · VM: Game Engine (GE) · 1625 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_vehicleTriggers`: `extensions.load("core_vehicleTriggers")`, then the global `core_vehicleTriggers`

Handles the player's interaction with vehicle triggers (door handles, hood, etc. defined in the JBeam): raycast from the cursor or the crosshair, hover, display of the crosshair and action labels in the UI, then execution of action links (vehicle inputActions or common actions) when the player presses triggerAction0/1/2. Also handles split-screen mode (one ray per player) and enables or disables the C++ trigger rendering system (VehicleTrigger). A modder mostly uses it to fire a trigger by script (triggerEvent), test whether interaction is possible (isEnabled) or listen to the onVehicleTriggerActionLabel and onVehicleTriggersExecuteLink hooks.

## Example

```lua
-- simulate pressing the 'door_FL' trigger of vehicle vehId
local vd = core_vehicle_manager.getVehicleData(vehId)
core_vehicleTriggers.triggerEvent('action0', 1, 'door_FL', vehId, vd.vdata, 0) -- press
core_vehicleTriggers.triggerEvent('action0', 0, 'door_FL', vehId, vd.vdata, 0) -- release
```

## Notes

- Interaction flow: the aiming mode is "cursor" (ray from the cursor position) or "crosshair" (ray from the screen center); crosshair mode is only allowed if the active camera and the settings permit it, otherwise it falls back to cursor mode.
- isEnabled() recomputes M.state.allowInteraction: false if a modal popup is open, if a photo mode capture is in progress, if the CEF interface is hidden, if the game is paused outside the /play route (or in the vehicle config), if the mouse is locked, or if the cursor is invisible in cursor mode. In split-screen, these cursor conditions are ignored.
- The M.state field (table) is exported and readable by other extensions (used by core_vehicleTriggersDebug): currentlyUsedTriggers (held trigger, by player index), aimMode, allowInteraction, debugEnabled, hoveredHitPosWorld, etc.
- Ray distance: 3 m for a unicycle (walker) or an occupant/driver camera, 50 m otherwise.
- onUpdate sets renderFilterObjectId to 0 (the previous code is deliberately overwritten: "temporary change"): the triggers of all vehicles, including attached trailers, are interactive.
- A trigger link can invert the value through isInverted (value multiplied by -1); versions: v2 link (namespace 'vehicle' or 'common') or legacy targetEvent format.
- For a v2 'common' link without commonLua, the action goes through ActionMap.triggerBindingByNameDigital (value > 0.9 = press), on the C++ side.
- The label computation (placement) is limited to 20 Hz (newFPSLimiter(20)) but the raycast is done every frame.
- getTriggerRaycastDistance: the "free camera" and "normal" branches return the same value (50); the free branch is redundant.
- onActionEvent returns false if interaction is disabled, true if no trigger is hit, and nil in the other cases (unreliable return value).
- triggerEventWithoutVdata does not check that getVehicleData returns a non-nil value: a Lua error is possible if the vehicle does not exist.

**Dependencies (loaded first):** `core_vehicle_triggerLabelPlacement`, `core_input_actionFilter`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_vehicleTriggers.disableDebugUI()` | Disables the triggers debug mode: unloads the core_vehicleTriggersDebug extension (no effect if already disabled). | 1557 |
| `core_vehicleTriggers.enableDebugUI()` | Enables debug mode: sets state.debugEnabled to true and loads the core_vehicleTriggersDebug extension ("Vehicle event debug" window). Also enables extra logs when executing links. | 1553 |
| `core_vehicleTriggers.getCursorPercent01()` | Cursor position in the window's client area, as a fraction from 0 to 1. | 357 |
| `core_vehicleTriggers.getTriggerRaycastDistance(player)` | Maximum raycast distance for a player: 3 m for a walker (unicycle) or an occupant camera, 50 m otherwise. | 420 |
| `core_vehicleTriggers.isEnabled()` | Indicates whether interaction with triggers is allowed at this moment (see notes) and updates state.allowInteraction. | 788 |
| `core_vehicleTriggers.onActionEvent(actionNumber, inputValue, player)` | Called by the input actions triggerAction0, 1 and 2. On release (value 0), releases the held trigger; otherwise performs a raycast for the player, and executes the hit trigger's links through triggerEvent. Remembers the held trigger as long as the key stays pressed. *(internal)* *(hook)* | 1517 |
| `core_vehicleTriggers.onCefVisibilityChanged(cefVisible)` | Hook called when the CEF interface is shown or hidden. Remembers the state; if it is hidden, removes the VehicleInteraction action maps and hides the crosshair. *(internal)* *(hook)* | 1544 |
| `core_vehicleTriggers.onCursorVisibilityChanged(visible)` | Hook called when cursor visibility changes; the cursor is considered permanently visible if VehicleTrigger.debug is active. *(internal)* *(hook)* | 720 |
| `core_vehicleTriggers.onDeserialized(data)` | Hook called after an extensions reload: clears the action map's player masks and restores the debug state. *(internal)* *(hook)* | 1570 |
| `core_vehicleTriggers.onExtensionUnloaded()` | Hook called on unload: removes the interaction action maps, clears the masks and turns off VehicleTrigger.renderingEnabled and VehicleTrigger.enabled. *(internal)* *(hook)* | 1577 |
| `core_vehicleTriggers.onInputBindingsChanged()` | Hook called when input bindings change: forces recomputation of the player controlling the mouse. *(internal)* *(hook)* | 1584 |
| `core_vehicleTriggers.onMouseLocked(locked)` | Hook called when the mouse is locked or released (e.g. free camera); a locked mouse disables interaction. *(internal)* *(hook)* | 725 |
| `core_vehicleTriggers.onRecentDevicesChanged(recentDevices)` | Hook called with devices sorted by recent activity; the last non-keyboard device of the mouse player (mouse or gamepad) decides whether they aim with the cursor or the crosshair. *(internal)* *(hook)* | 1590 |
| `core_vehicleTriggers.onSerialize()` | Hook called before an extensions reload: removes the action maps and the crosshair, returns {debugEnabled}. *(internal)* *(hook)* | 1561 |
| `core_vehicleTriggers.onSplitScreenLayoutChanged()` | Hook called when the split-screen layout changes: clears the center and view rectangle caches. *(internal)* *(hook)* | 1261 |
| `core_vehicleTriggers.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame. Refreshes the context, computes whether interaction is allowed, enables or disables VehicleTrigger (enabled, renderingEnabled, proximityRenderingEnabled), looks for the hovered trigger, updates labels, key legend, crosshair delay and UI stream. In split-screen, delegates to a per-player version. *(internal)* *(hook)* | 1382 |
| `core_vehicleTriggers.triggerEvent(actionStr, actionValue, triggerId, vehicleId, vdata, player)` | Executes all links associated with a trigger's action in vdata.triggerEventLinksDict[triggerId][actionStr]. Each link fires the onVehicleTriggersExecuteLink hook then a vehicle input command or a common action. Does nothing if the trigger or action has no link. | 1488 |
| `core_vehicleTriggers.triggerEventWithoutVdata(actionNum, actionValue, triggerId, vehicleId, player)` | Variant of triggerEvent that retrieves vdata itself from vehicleId. Called by C++ (typically virtual reality controllers). *(internal)* | 1509 |
| `core_vehicleTriggers.worldPosToScreenPercent01(worldPos, out)` | Projects a world position onto the screen with the active camera, as a fraction 0 to 1 (origin at top left). | 396 |

### Parameter details

#### `core_vehicleTriggers.getCursorPercent01()`

Cursor position in the window's client area, as a fraction from 0 to 1.

- **returns**: table|nil {x, y} between 0 and 1, or nil if the position is not available.

#### `core_vehicleTriggers.getTriggerRaycastDistance(player)`

Maximum raycast distance for a player: 3 m for a walker (unicycle) or an occupant camera, 50 m otherwise.

- `player` (*integer|nil*) : Player index (0 by default).
- **returns**: number Distance in meters.

#### `core_vehicleTriggers.isEnabled()`

Indicates whether interaction with triggers is allowed at this moment (see notes) and updates state.allowInteraction.

- **returns**: boolean true if interaction is allowed.

#### `core_vehicleTriggers.onActionEvent(actionNumber, inputValue, player)`

Called by the input actions triggerAction0, 1 and 2. On release (value 0), releases the held trigger; otherwise performs a raycast for the player, and executes the hit trigger's links through triggerEvent. Remembers the held trigger as long as the key stays pressed.

- `actionNumber` (*integer*) : Action number (0, 1 or 2); becomes the string 'action0', etc.
- `inputValue` (*number*) : Input value (0 = released, non-zero = pressed).
- `player` (*integer|nil*) : Player index (0 by default).
- **returns**: boolean|nil false if interaction is disabled, true if no trigger is hit, otherwise nil.

#### `core_vehicleTriggers.onCefVisibilityChanged(cefVisible)`

Hook called when the CEF interface is shown or hidden. Remembers the state; if it is hidden, removes the VehicleInteraction action maps and hides the crosshair.

- `cefVisible` (*boolean*) : true if the interface is visible.

#### `core_vehicleTriggers.onCursorVisibilityChanged(visible)`

Hook called when cursor visibility changes; the cursor is considered permanently visible if VehicleTrigger.debug is active.

- `visible` (*boolean*) : true if the cursor is visible.

#### `core_vehicleTriggers.onDeserialized(data)`

Hook called after an extensions reload: clears the action map's player masks and restores the debug state.

- `data` (*table|nil*) : Data returned by onSerialize ({debugEnabled}).

#### `core_vehicleTriggers.onMouseLocked(locked)`

Hook called when the mouse is locked or released (e.g. free camera); a locked mouse disables interaction.

- `locked` (*boolean*) : true if the mouse is locked.

#### `core_vehicleTriggers.onRecentDevicesChanged(recentDevices)`

Hook called with devices sorted by recent activity; the last non-keyboard device of the mouse player (mouse or gamepad) decides whether they aim with the cursor or the crosshair.

- `recentDevices` (*string[]*) : Device names, most recent first.

#### `core_vehicleTriggers.onSerialize()`

Hook called before an extensions reload: removes the action maps and the crosshair, returns {debugEnabled}.

- **returns**: table {debugEnabled = boolean}

#### `core_vehicleTriggers.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame. Refreshes the context, computes whether interaction is allowed, enables or disables VehicleTrigger (enabled, renderingEnabled, proximityRenderingEnabled), looks for the hovered trigger, updates labels, key legend, crosshair delay and UI stream. In split-screen, delegates to a per-player version.

- `dtReal` (*number*) : Elapsed real time (s).
- `dtSim` (*number*) : Simulation elapsed time (s).
- `dtRaw` (*number*) : Raw elapsed time (s).

#### `core_vehicleTriggers.triggerEvent(actionStr, actionValue, triggerId, vehicleId, vdata, player)`

Executes all links associated with a trigger's action in vdata.triggerEventLinksDict[triggerId][actionStr]. Each link fires the onVehicleTriggersExecuteLink hook then a vehicle input command or a common action. Does nothing if the trigger or action has no link.

- `actionStr` (*string*) : Action name: 'action0', 'action1' or 'action2'.
- `actionValue` (*number*) : Value sent (1 = press, 0 = release).
- `triggerId` (*string|integer*) : Trigger identifier in the JBeam (inferred from code: key of triggerEventLinksDict).
- `vehicleId` (*integer*) : Vehicle object identifier.
- `vdata` (*table*) : Vehicle data (core_vehicle_manager.getVehicleData(id).vdata) containing triggerEventLinksDict and inputActions.
- `player` (*integer|nil*) : Index of the player that originated the action.

#### `core_vehicleTriggers.triggerEventWithoutVdata(actionNum, actionValue, triggerId, vehicleId, player)`

Variant of triggerEvent that retrieves vdata itself from vehicleId. Called by C++ (typically virtual reality controllers).

- `actionNum` (*integer*) : Action number (0, 1 or 2).
- `actionValue` (*number*) : Value sent.
- `triggerId` (*string|integer*) : Trigger identifier.
- `vehicleId` (*integer*) : Vehicle identifier.
- `player` (*integer|nil*) : Player index.

#### `core_vehicleTriggers.worldPosToScreenPercent01(worldPos, out)`

Projects a world position onto the screen with the active camera, as a fraction 0 to 1 (origin at top left).

- `worldPos` (*vec3*) : World position.
- `out` (*table|nil*) : Table reused for the result (created if absent).
- **returns**: table|nil {x, y}; nil if the point is behind the camera or if the camera context is unavailable.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before this one: core_vehicle_triggerLabelPlacement and core_input_actionFilter. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onVehicleTriggerActionLabel` — listened to by 1 module(s)
- `onVehicleTriggersExecuteLink` — listened to by 1 module(s)

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`, `triggerRaycastClosest`, `triggerRaycastClosestRay`
- `debugDrawer:` `drawLine`
- `scenetree.` `findObject`

**Loads extensions:** `core_vehicleTriggersDebug`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/vehicleTriggers.lua`.*
