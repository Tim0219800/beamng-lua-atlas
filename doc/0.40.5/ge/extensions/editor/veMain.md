# `editor_veMain`

*File: `lua/ge/extensions/editor/veMain.lua` · VM: Game Engine (GE) · 446 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_veMain`: `extensions.load("editor_veMain")`, then the global `editor_veMain`

Core of the Vehicle Editor (vehicle editor, static and live modes). The extension also registers itself as the global `vEditor`: it stores there the current vehicle (vEditor.vehicle, vEditor.vdata, vEditor.vehData, vEditor.vehiclePos), the selected nodes/beams and the menus. It automatically loads all `ve*.lua` extensions of the vehicleEditor/, staticEditor/ and liveEditor/ folders, builds the menus from their `menuEntry`/`open`, and emits the `onVehicleEditorRenderJBeams` hook every frame so that debug tools draw with debugDrawer.

## Example

```lua
extensions.load("editor_veMain")
editor_veMain.toggleActive() -- enters/exits the Vehicle Editor
local veh = vEditor.vehicle -- player vehicle tracked by the editor
```

## Notes

- The other editor tools read the state via the global vEditor (rawset(_G, 'vEditor', M)); vEditor.vehiclePos is updated on every onPreRender.
- The live/static extensions are discovered by FS:findFiles on the pattern 've*.lua': a new ve*.lua file with menuEntry (string) and open (function) appears automatically in the menu. menuEntry values with '/' create submenus (e.g. 'Other/Crash Tester').
- vEditor.EDITOR_MODE_STATIC = 1, EDITOR_MODE_LIVE = 2; default mode = live.
- Inconsistency: the module exports `onDeserialize` (without 'd') whereas the extension system calls `onDeserialized`; the editor mode saved by onSerialize is therefore probably not restored.
- The 'Mirror Debug' screen is hard-coded into the list of live apps (BeamNGVehicle.mirrorDebugEnabled = true).

**Dependencies (loaded first):** `core_vehicle_manager`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_veMain.onDeserialize(data)` | Restores vEditor.editorMode from data.editorMode. Non-standard name (the extension hook is onDeserialized). *(internal)* *(hook)* | 427 |
| `editor_veMain.onEditorHeadlessChange(enabled, toolName)` | Editor hook called when a headless tool is activated/deactivated. If toolName matches the current vehicle editor (vehicleEditorStatic/vehicleEditorLive), prepares the editor (setupEditor) and sets vEditor.editorActive, or removes the 'VehicleEditor' action map. *(internal)* *(hook)* | 318 |
| `editor_veMain.onEditorHeadlessMainMenuBar()` | Called by the editor in headless mode to draw the menu bar: menus File (Exit Vehicle Editor...), View (Reset Layout) and FPS / GpuWait / Poly indicators. *(internal)* *(hook)* | 405 |
| `editor_veMain.onEditorInitialized()` | Called when the editor is initialized: adds the 'Vehicle Editor' entry (Vehicles group) to the Window menu. *(internal)* *(hook)* | 310 |
| `editor_veMain.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)` | When the color, colorPalette0 or colorPalette1 field of a BeamNGVehicle is modified in the inspector, converts the color and applies the paint via core_vehicle_partmgmt.setConfigPaints. *(internal)* *(hook)* | 341 |
| `editor_veMain.onPreRender(dtReal, dtSim, dtRaw)` | Called every frame before rendering. If no vehicle is tracked, initializes vEditor from the player vehicle (be:getPlayerVehicleID(0)). Otherwise updates vEditor.vehiclePos then emits the hook `onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)`. *(internal)* *(hook)* | 251 |
| `editor_veMain.onSerialize()` | Serialization before Lua reload: returns {editorMode = vEditor.editorMode}. *(internal)* *(hook)* | 421 |
| `editor_veMain.onVehicleDestroyed()` | Called when a vehicle is destroyed: sets vEditor.vehicle, vehData, vdata, nodeCIDToName and vehiclePos back to nil (without checking which vehicle it is). *(internal)* *(hook)* | 333 |
| `editor_veMain.onVehicleSwitched(oldVehicle, newVehicle, player)` | Called when the player vehicle changes: reloads the data (vEditor.vehData, vdata, nodeCIDToName, vehicle) for newVehicle. *(internal)* *(hook)* | 314 |
| `editor_veMain.saveCurrentWindowLayout()` | Saves the Vehicle Editor's current window layout via editor_layoutManager.saveCurrentWindowLayout. | 417 |
| `editor_veMain.toggleActive()` | Activates the Vehicle Editor if inactive (activates the world editor, the headless mode, loads the apps), otherwise exits it (deactivateEditor(false)) while disabling core_vehicle_manager.setDebug. | 302 |

### Parameter details

#### `editor_veMain.onDeserialize(data)`

Restores vEditor.editorMode from data.editorMode. Non-standard name (the extension hook is onDeserialized).

- `data` (*table*) : Table returned by onSerialize.

#### `editor_veMain.onEditorHeadlessChange(enabled, toolName)`

Editor hook called when a headless tool is activated/deactivated. If toolName matches the current vehicle editor (vehicleEditorStatic/vehicleEditorLive), prepares the editor (setupEditor) and sets vEditor.editorActive, or removes the 'VehicleEditor' action map.

- `enabled` (*boolean*) : true if the tool is activated.
- `toolName` (*string*) : Name of the headless tool.

#### `editor_veMain.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)`

When the color, colorPalette0 or colorPalette1 field of a BeamNGVehicle is modified in the inspector, converts the color and applies the paint via core_vehicle_partmgmt.setConfigPaints.

- `selectedIds` (*table<integer, integer>*) : IDs of the selected objects.
- `fieldName` (*string*) : Name of the modified field.
- `fieldValue` (*string*) : New value (color string).
- `arrayIndex` (*any*) : Array index of the field (unused).

#### `editor_veMain.onPreRender(dtReal, dtSim, dtRaw)`

Called every frame before rendering. If no vehicle is tracked, initializes vEditor from the player vehicle (be:getPlayerVehicleID(0)). Otherwise updates vEditor.vehiclePos then emits the hook `onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)`.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `editor_veMain.onSerialize()`

Serialization before Lua reload: returns {editorMode = vEditor.editorMode}.

- **returns**: table Data to restore.

#### `editor_veMain.onVehicleSwitched(oldVehicle, newVehicle, player)`

Called when the player vehicle changes: reloads the data (vEditor.vehData, vdata, nodeCIDToName, vehicle) for newVehicle.

- `oldVehicle` (*integer*) : ID of the old vehicle.
- `newVehicle` (*integer*) : ID of the new vehicle.
- `player` (*integer*) : Player index.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded beforehand: {'core_vehicle_manager'}. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onVehicleEditorRenderJBeams` — listened to by 5 module(s)

## Calls into the engine (C++)

- `FS:` `findFiles`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/veMain.lua`.*
