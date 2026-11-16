# `editor_cameraV2`

*File: `lua/ge/extensions/editor/cameraV2.lua` · VM: Game Engine (GE) · 564 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_cameraV2`: `extensions.load("editor_cameraV2")`, then the global `editor_cameraV2`

Editor extension that enables "Camera V2", an alternative set of mouse controls for the World Editor free camera (pan, orbit, zoom, planar WASD). It registers as a camera controller (core/cameraControllerRegistry, id "editor.cameraV2") only when the camera.general.activeCamera preference is "cameraV2" or when setTemporaryEnabled(true) has been called, and the editor is active. It declares the camera.cameraV2.* preferences, shows a debug window and can recover a camera with invalid coordinates. The real work is delegated to editor/cameraV2/controller.

## Notes

- camera.cameraV2.* preferences (default): swapPanOrbitButtons (bool, true: right click = pan, wheel click = orbit), orbitAroundViewCenter (bool, true), wasdMode ('standard' or 'pan', default 'standard'), wasdPanSpeedMultiplier (0.5), wasdPanFastSpeedMultiplier (1.5), showDebugWindow (bool, false), zoomFactorPerNotch (1.5), zoomMinDistance (0.25 m), zoomMaxDistance (2500 m), zoomResponse (20), inertiaDuration (0.35 s).
- If the camera pose is invalid (NaN, > 1e7 m, invalid quaternion) onUpdate calls recoverCamera() and aborts the frame if recovery fails.
- onUpdate limits the dt passed to the controller to 0.05 s.
- When the camera is above 1500 m in height, a red reference cylinder is drawn from the origin (placed on the terrain) up to zoomMaxDistance.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_cameraV2.consumeFocusDoubleClick()` | If Camera V2 is registered, relays controller.consumeFocusDoubleClick() (focus double click consumed or not). | 542 |
| `editor_cameraV2.onEditorActivated()` | Called when the editor is activated; reevaluates the Camera V2 activation state. *(internal)* *(hook)* | 504 |
| `editor_cameraV2.onEditorDeactivated()` | Called when the editor is deactivated; turns off planar translation and unregisters the controller. *(internal)* *(hook)* | 508 |
| `editor_cameraV2.onEditorGui()` | Draws the "Camera V2 Debug" window (Recover Camera button, controller state, cursor/center ray distances, height above terrain, zoom settings) if showDebugWindow is not false and the controller is registered. *(internal)* *(hook)* | 546 |
| `editor_cameraV2.onEditorInitialized()` | Registers the "cameraV2Debug" debug window (360x250 scaled) then evaluates the activation state. *(internal)* *(hook)* | 496 |
| `editor_cameraV2.onEditorPreferenceValueChanged(path, value)` | Reacts to preference changes: activeCamera reevaluates activation, wasdMode resynchronizes the WASD mode, showDebugWindow shows/hides the window, any other camera.cameraV2.* preference cancels the controller's current gesture. *(internal)* *(hook)* | 513 |
| `editor_cameraV2.onEditorRegisterPreferences(prefsRegistry)` | Preferences registration hook: creates the "camera" category, the "general" subcategory (activeCamera: stock or cameraV2) and "cameraV2" (preferences above), and reorders the subcategories. *(internal)* *(hook)* | 420 |
| `editor_cameraV2.onExtensionUnloaded()` | On unload: turns off planar mode, unregisters the controller and the debug window. *(internal)* *(hook)* | 552 |
| `editor_cameraV2.onUpdate(dtReal)` | Called every frame. If Camera V2 is active: validates/recovers the pose, updates the controller with dt limited to 0.05 s, draws the altitude reference and the pivot markers (red orbit sphere, blue pan cylinder). *(internal)* *(hook)* | 529 |
| `editor_cameraV2.setTemporaryEnabled(enabled)` | Forces Camera V2 to be enabled regardless of the preference (useful for a tool that wants these controls temporarily). Updates the controller registration state. | 205 |

### Parameter details

#### `editor_cameraV2.consumeFocusDoubleClick()`

If Camera V2 is registered, relays controller.consumeFocusDoubleClick() (focus double click consumed or not).

- **returns**: boolean false if Camera V2 is not active

#### `editor_cameraV2.onEditorPreferenceValueChanged(path, value)`

Reacts to preference changes: activeCamera reevaluates activation, wasdMode resynchronizes the WASD mode, showDebugWindow shows/hides the window, any other camera.cameraV2.* preference cancels the controller's current gesture.

- `path` (*string*) : Preference path
- `value` (*any*) : New value

#### `editor_cameraV2.onEditorRegisterPreferences(prefsRegistry)`

Preferences registration hook: creates the "camera" category, the "general" subcategory (activeCamera: stock or cameraV2) and "cameraV2" (preferences above), and reorders the subcategories.

- `prefsRegistry` (*table*) : Editor preferences registry

#### `editor_cameraV2.onUpdate(dtReal)`

Called every frame. If Camera V2 is active: validates/recovers the pose, updates the controller with dt limited to 0.05 s, draws the altitude reference and the pivot markers (red orbit sphere, blue pan cylinder).

- `dtReal` (*number|nil*) : Real-time delta in seconds; defaults to ui_imgui.GetIO().DeltaTime

#### `editor_cameraV2.setTemporaryEnabled(enabled)`

Forces Camera V2 to be enabled regardless of the preference (useful for a tool that wants these controls temporarily). Updates the controller registration state.

- `enabled` (*boolean*) : true to enable, anything else is treated as false

## Calls into the engine (C++)

- `Engine.` `castRay`
- `debugDrawer:` `drawCylinder`, `drawSphere`
- `ui_imgui.` `Button`, `GetIO`, `ImVec2`, `ImVec4`, `PopStyleColor`, `PushStyleColor2`, `RadioButton1`, `SameLine`, `Separator`, `TextColored`, `TextUnformatted`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/cameraV2.lua`.*
