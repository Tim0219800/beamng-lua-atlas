# `editor_vehicleEditor_veToolbar`

*File: `lua/ge/extensions/editor/vehicleEditor/veToolbar.lua` · VM: Game Engine (GE) · 377 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_veToolbar`: `extensions.load("editor_vehicleEditor_veToolbar")`, then the global `editor_vehicleEditor_veToolbar`

Toolbar of the Vehicle Editor. It shows two tabs, "Static Editor" and "Live Editor" (a click changes vEditor.editorMode), each with Apps and View menus (window layouts, adding a view). The Live tab adds a Vehicles menu (spawn a Car or Truck vehicle at the camera position, remove one or all) and Camera Speed and Time of day sliders. It also handles the Save Layout, Delete Layout and Reset Layouts windows.

## Notes

- Shows nothing as long as vEditor does not exist or vEditor.editorActive is false.
- The Time of day slider reads core_environment.getTimeOfDay() (time field between 0 and 1, displayed 0 to 100) and writes with core_environment.setTimeOfDay(tod). The Camera Speed slider (2 to 100) reads core_camera.getSpeed() and writes with editor.setCameraSpeed.
- Spawn from the menu: core_vehicles.spawnNewVehicle(model.key, {pos = camera, rot = getCameraQuat()}) then queueLuaCommand("input.event('parkingbrake', 0, 1)") to engage the parking brake.
- Layouts go through editor_layoutManager (getWindowLayouts, loadWindowLayout, saveWindowLayout, deleteWindowLayout, resetLayouts) with vEditor.getEditorName().
- The second bar "Toolbar2" (current edit mode) is drawn only if the preference ui.general.singleLineToolbar is false; onEditorGuiEditModeToolbar is then broadcast to extensions.
- Minor bug: the code tests a variable noDisplay that is never defined (always nil) before the goto safeFinish.
- In onEditorGuiToolBar, the comment states that the toolbar window (toolName 'vehicleEditor') is not restored with the Static/Live layouts, so it is forcibly shown again.

**Dependencies (loaded first):** `core_environment`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_veToolbar.onEditorGuiToolBar()` | Editor hook called when the main toolbar must be drawn. Draws the "veToolbar" window with the Static/Live tabs, the menus and the layout windows, then optionally the bar of the current edit mode. No effect if the vehicle editor is not active. *(internal)* *(hook)* | 262 |
| `editor_vehicleEditor_veToolbar.onEditorInitialized()` | Editor hook called at initialization: builds the sorted list of Car or Truck vehicles (core_vehicles.getVehicleList()), registers the veToolbar window (800x40, 'vehicleEditor' tool) and shows it. *(internal)* *(hook)* | 353 |

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {'core_environment'}: extension loaded before this one. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorGuiEditModeToolbar`

## Calls into the engine (C++)

- `core_environment.` `getTimeOfDay`, `setTimeOfDay`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/veToolbar.lua`.*
