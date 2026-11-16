# `editor_mainToolbar`

*File: `lua/ge/extensions/editor/mainToolbar.lua` · VM: Game Engine (GE) · 1572 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_mainToolbar`: `extensions.load("editor_mainToolbar")`, then the global `editor_mainToolbar`

Main toolbar ("Main Toolbar" window) of the World Editor. It contains the general buttons (new/open/save level...), the axis gizmo buttons (grid, rotation and scale snap), the camera, the time of day and the exposure, as well as the list of edit modes groupable into "sets" saved in a file. Other extensions can add buttons to it via the emitted hooks.

## Notes

- Emitted hooks: onEditorGuiGeneralToolbar (general buttons), onEditorGuiEditModesToolbar and onEditorGuiEditModeToolbar (edit modes).
- Draws nothing in headless mode or as long as editor.menuHeight is not set (main menu not drawn yet).
- When the editor is deactivated, restores the auto-exposure and the manual EV of PostEffectLocalExposureObject modified from the bar.
- Preference ui.general.enableVehicleControls: enables/disables the VehicleCommonActionMap and VehicleSpecificActionMap action maps.

**Dependencies (loaded first):** `core_environment`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_mainToolbar.onEditorDeactivated()` | Called when the editor is deactivated: restores the initial exposure if it was modified. *(internal)* *(hook)* | 1553 |
| `editor_mainToolbar.onEditorGuiToolBar()` | Draws the toolbar window every frame and emits the toolbar hooks. *(internal)* *(hook)* | 895 |
| `editor_mainToolbar.onEditorInitialized()` | Registers and shows the "mainToolbar" window and loads the edit mode sets from the file. *(internal)* *(hook)* | 1529 |
| `editor_mainToolbar.onEditorLoadState(state)` | Called when the editor state is loaded. Empty body. *(internal)* *(hook)* | 1550 |
| `editor_mainToolbar.onEditorPreferenceValueChanged(path, value)` | If ui.general.enableVehicleControls changes, enables/disables the vehicle action maps. *(internal)* *(hook)* | 1536 |
| `editor_mainToolbar.onEditorSaveState(state)` | Called when the editor state is saved. Empty body. *(internal)* *(hook)* | 1547 |

### Parameter details

#### `editor_mainToolbar.onEditorLoadState(state)`

Called when the editor state is loaded. Empty body.

- `state` (*table*) : Editor state.

#### `editor_mainToolbar.onEditorPreferenceValueChanged(path, value)`

If ui.general.enableVehicleControls changes, enables/disables the vehicle action maps.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_mainToolbar.onEditorSaveState(state)`

Called when the editor state is saved. Empty body.

- `state` (*table*) : Editor state.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {'core_environment'}. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorGuiEditModeToolbar`
- `onEditorGuiEditModesToolbar`
- `onEditorGuiGeneralToolbar`

## Calls into the engine (C++)

- `FS:` `fileExists`
- `core_environment.` `getTimeOfDay`, `setTimeOfDay`
- `scenetree.` `findObject`
- `worldEditorCppApi.` `getGridSize`, `getRotateSnapAngle`, `setGridSnap`, `setRotateSnap`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/mainToolbar.lua`.*
