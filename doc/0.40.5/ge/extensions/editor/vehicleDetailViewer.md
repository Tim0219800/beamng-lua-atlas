# `editor_vehicleDetailViewer`

*File: `lua/ge/extensions/editor/vehicleDetailViewer.lua` · VM: Game Engine (GE) · 629 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleDetailViewer`: `extensions.load("editor_vehicleDetailViewer")`, then the global `editor_vehicleDetailViewer`

Editor tool "Vehicle Detail Viewer" (menu Window > Vehicles, also F11 > Window > Experimental). Opens imgui windows that display orthographic views of the player vehicle (Left, Right, Top, Bottom, Front, Back) rendered into a texture via RenderViewManagerInstance, with zoom, drag panning and double-click reset. Each view is fitted to the vehicle's oriented bounding box (getSpawnWorldOOBB). Layouts can be saved in /settings/vehicleDetails/*.vehicleDetailSetting.json (default: default.vehicleDetailSetting.json).

## Notes

- No rendering takes place until the user has chosen the menu entry (detailViewerActive); when the last window is closed, all views are destroyed.
- The far clip plane is set to 10 m (farClip) and the scale to 200 pixels per meter.
- The views are recreated every time a vehicle spawns (onVehicleSpawned sets `views` to nil); only the player vehicle is displayed.
- onSerialize destroys the render views and converts the imgui pointers to plain data before Lua reload; onDeserialized converts them back.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleDetailViewer.onDeserialized(data)` | Restores the views and recreates the windowOpen imgui pointers. Also used to load a layout file. *(internal)* *(hook)* | 297 |
| `editor_vehicleDetailViewer.onEditorInitialized()` | Adds the 'Vehicle Detail Viewer' menu entry (Vehicles group) which activates the tool. *(internal)* *(hook)* | 614 |
| `editor_vehicleDetailViewer.onExtensionLoaded()` | Called when the extension is loaded: displays a message and lists the available layout files. *(internal)* *(hook)* | 600 |
| `editor_vehicleDetailViewer.onExtensionUnloaded()` | Called on unload: destroys the remaining render views. *(internal)* *(hook)* | 605 |
| `editor_vehicleDetailViewer.onPreRender(dtReal, dtSim, dtRaw)` | Called every frame before rendering: creates the view models for the player vehicle, loads the default layout, draws each view window and triggers the orthographic rendering; cleans up when everything is closed. *(internal)* *(hook)* | 488 |
| `editor_vehicleDetailViewer.onSerialize()` | Before Lua reload: destroys the render views and returns {views} without the non-serializable objects. *(internal)* *(hook)* | 274 |
| `editor_vehicleDetailViewer.onVehicleSpawned(vehicleId)` | Called when a vehicle spawns: forgets the views to recreate them with the new vehicle. *(internal)* *(hook)* | 595 |

### Parameter details

#### `editor_vehicleDetailViewer.onDeserialized(data)`

Restores the views and recreates the windowOpen imgui pointers. Also used to load a layout file.

- `data` (*table|nil*) : Table from onSerialize or content of the layout file.

#### `editor_vehicleDetailViewer.onPreRender(dtReal, dtSim, dtRaw)`

Called every frame before rendering: creates the view models for the player vehicle, loads the default layout, draws each view window and triggers the orthographic rendering; cleans up when everything is closed.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `editor_vehicleDetailViewer.onSerialize()`

Before Lua reload: destroys the render views and returns {views} without the non-serializable objects.

- **returns**: table {views = table}

#### `editor_vehicleDetailViewer.onVehicleSpawned(vehicleId)`

Called when a vehicle spawns: forgets the views to recreate them with the new vehicle.

- `vehicleId` (*integer*) : Vehicle ID.

## Calls into the engine (C++)

- `FS:` `findFiles`, `removeFile`
- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawFrustum`, `drawLine`, `drawSphere`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleDetailViewer.lua`.*
