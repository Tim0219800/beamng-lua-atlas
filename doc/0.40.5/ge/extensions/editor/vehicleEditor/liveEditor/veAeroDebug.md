# `editor_vehicleEditor_liveEditor_veAeroDebug`

*File: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua` · VM: Game Engine (GE) · 191 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_liveEditor_veAeroDebug`: `extensions.load("editor_vehicleEditor_liveEditor_veAeroDebug")`, then the global `editor_vehicleEditor_liveEditor_veAeroDebug`

'Vehicle Aero Debug' window of the live Vehicle Editor. Enables the `aeroDebug` vehicle extension (extensions.aeroDebug.enable()), reads getAeroData() and displays the total aerodynamic force and moment (world frame and vehicle frame), then the downforce of the front/rear axles. Lets you associate the 4 wheels (FL, FR, RL, RR) via combos; an automatic fill is attempted if the wheel names are FL/FR/RL/RR. Depends on editor_veMain.

## Notes

- Units: forces in N, moments in N·m, downforce percentages between axles.
- aeroDebug is disabled on the vehicle side on vehicle change (old vehicle) and when the editor is deactivated.
- The wheel values are sent to the vehicle via aeroDebug.setWheelNames(FL, FR, RL, RR) built by string concatenation; names containing a quote would break the command.

**Dependencies (loaded first):** `editor_veMain`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veAeroDebug.onDeserialized(data)` | Restores the open state. *(internal)* *(hook)* | 175 |
| `editor_vehicleEditor_liveEditor_veAeroDebug.onEditorActivated()` | Called when entering the editor (does nothing). *(internal)* *(hook)* | 166 |
| `editor_vehicleEditor_liveEditor_veAeroDebug.onEditorDeactivated()` | Called when leaving the editor: disables aeroDebug on the current vehicle. *(internal)* *(hook)* | 160 |
| `editor_vehicleEditor_liveEditor_veAeroDebug.onSerialize()` | Returns {windowOpen}. *(internal)* *(hook)* | 169 |
| `editor_vehicleEditor_liveEditor_veAeroDebug.onUpdate(dt)` | Called every frame: enables/queries aeroDebug on the vehicle and draws the force tables and the axle configuration. *(internal)* *(hook)* | 61 |
| `editor_vehicleEditor_liveEditor_veAeroDebug.onVehicleSwitched(oldVehicle, newVehicle, player)` | Disables aeroDebug on the old vehicle and resets the aero data and the combos initialization. *(internal)* *(hook)* | 150 |
| `editor_vehicleEditor_liveEditor_veAeroDebug.open()` | Opens the window. | 145 |

### Parameter details

#### `editor_vehicleEditor_liveEditor_veAeroDebug.onDeserialized(data)`

Restores the open state.

- `data` (*table*) : onSerialize table.

#### `editor_vehicleEditor_liveEditor_veAeroDebug.onSerialize()`

Returns {windowOpen}.

- **returns**: table {windowOpen = boolean}

#### `editor_vehicleEditor_liveEditor_veAeroDebug.onUpdate(dt)`

Called every frame: enables/queries aeroDebug on the vehicle and draws the force tables and the axle configuration.

- `dt` (*number*) : Time delta.

#### `editor_vehicleEditor_liveEditor_veAeroDebug.onVehicleSwitched(oldVehicle, newVehicle, player)`

Disables aeroDebug on the old vehicle and resets the aero data and the combos initialization.

- `oldVehicle` (*integer*) : ID of the old vehicle.
- `newVehicle` (*integer*) : ID of the new vehicle.
- `player` (*integer*) : Player index.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {'editor_veMain'}. |
| `menuEntry` | string | 'Aero Debug'. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua`.*
