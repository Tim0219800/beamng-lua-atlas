# `debug_vehicleDebug`

*File: `lua/ge/extensions/debug/vehicleDebug.lua` · VM: Game Engine (GE) · 82 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `debug_vehicleDebug`: `extensions.load("debug_vehicleDebug")`, then the global `debug_vehicleDebug`

Debug display above each active vehicle: when enabled, onUpdate draws with debugDrawer the vehicle's id, its position and the rotation (quaternion) of its reference node, above its bounding box. The state change is signaled to the UI through the guihook vehicleDebugInfoEnabledChanged. The state is kept across a Lua reload.

## Example

```lua
debug_vehicleDebug.setDebugEnabled(true)
```

## Notes

- The three lines of text are drawn at the same position (textPos) with drawTextAdvanced: they may overlap depending on the engine implementation (inferred from code, no vertical offset is applied).
- bdebugRequestViewportSize sends the size of the main ImGui window to the bdebug module on the vehicle side.

**Dependencies (loaded first):** `ui_imgui`

## Functions

| Function | Description | Line |
|---|---|---|
| `debug_vehicleDebug.bdebugRequestViewportSize(vehId)` | Sends the vehicle the size of the main window (bdebug.receiveViewportSize(width, height)). No effect if the vehicle does not exist. | 30 |
| `debug_vehicleDebug.getDebugEnabled()` | Returns the display state. | 21 |
| `debug_vehicleDebug.onDeserialized(serializedData)` | Lua reload hook: restores debugEnabled. *(internal)* *(hook)* | 61 |
| `debug_vehicleDebug.onSerialize()` | Lua reload hook: returns {debugEnabled}. *(internal)* *(hook)* | 67 |
| `debug_vehicleDebug.onUpdate(dt)` | Update hook: draws each active vehicle's debug information if the display is enabled. *(internal)* *(hook)* | 38 |
| `debug_vehicleDebug.setDebugEnabled(value)` | Enables or disables the display and notifies the UI. | 25 |
| `debug_vehicleDebug.toggleDebugEnabled()` | Toggles the display state and notifies the UI (vehicleDebugInfoEnabledChanged). | 16 |

### Parameter details

#### `debug_vehicleDebug.bdebugRequestViewportSize(vehId)`

Sends the vehicle the size of the main window (bdebug.receiveViewportSize(width, height)). No effect if the vehicle does not exist.

- `vehId` (*integer*) : Vehicle id.

#### `debug_vehicleDebug.getDebugEnabled()`

Returns the display state.

- **returns**: boolean true if enabled.

#### `debug_vehicleDebug.onDeserialized(serializedData)`

Lua reload hook: restores debugEnabled.

- `serializedData` (*table|nil*) : State returned by onSerialize.

#### `debug_vehicleDebug.onSerialize()`

Lua reload hook: returns {debugEnabled}.

- **returns**: table State to keep.

#### `debug_vehicleDebug.onUpdate(dt)`

Update hook: draws each active vehicle's debug information if the display is enabled.

- `dt` (*number*) : Time delta (s).

#### `debug_vehicleDebug.setDebugEnabled(value)`

Enables or disables the display and notifies the UI.

- `value` (*boolean*) : New state.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'ui_imgui'}. |

**UI events (guihooks.trigger):** `vehicleDebugInfoEnabledChanged`

## Calls into the engine (C++)

- `debugDrawer:` `drawTextAdvanced`
- `ui_imgui.` `GetMainViewport`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/debug/vehicleDebug.lua`.*
