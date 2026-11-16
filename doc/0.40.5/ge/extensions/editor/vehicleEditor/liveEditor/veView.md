# `editor_vehicleEditor_liveEditor_veView`

*File: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veView.lua` · VM: Game Engine (GE) · 521 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_liveEditor_veView`: `extensions.load("editor_vehicleEditor_liveEditor_veView")`, then the global `editor_vehicleEditor_liveEditor_veView`

Multiple scene views of the vehicle editor in Live mode. Each "Scene View N" is an ImGui window that displays a separate render camera (ImguiRenderViewControl) centered on the player's vehicle, with the modes 3d, left, right, front, back, top, bottom (the orthographic views draw a grid with debugDrawer). The settings (mode, near/far clip, fov, ortho, offset) are saved in the editor preference vehicleEditor.veView.sceneViews. A right click opens a control menu (mode, Ortho, Render Main, Attach to Object, Show Icons, clips, FOV, add/remove view).

## Notes

- Wheel zoom: in ortho mode, changes the fov (clamped 0.1 to 170); otherwise moves the camera along the view's z axis. Dragging with the left button moves the dragOffset.
- Switching to Ortho sets nearClip 0.6, farClip 100, fov 150 and hides the editor icons; switching back to perspective restores 0.01 / 2000 / 70 and shows the icons.
- Bug: in createViewFromData, attachToObject = im.BoolPtr(data.attachToObject or true) is always true, because "false or true" gives true; the value saved as false is never restored. Same for the value given in the other fields with "or" only when the value is false (editorIconsVisible and ortho use "or false", so those two are correct).
- The views code is described as "buggy and rushed" in a comment in the file.
- The 'Render Main' menu calls setRenderWorldMain(bool) to enable or not the rendering of the main view.
- createNewSceneView is exported only in a comment (M.createNewSceneView is commented out); only addSceneView is public. The createNewViewNextFrame flag is never set to true in the file.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veView.addSceneView()` | Adds a scene view: reuses the first deleted or hidden view, otherwise takes the next identifier, then creates/registers the "Scene View N" window (400x600, vehicleEditor tool) and displays it. Called by the View > Add View menu of veToolbar in Live mode. | 106 |
| `editor_vehicleEditor_liveEditor_veView.onEditorGui()` | Editor hook called every frame: for each registered view, opens the window, creates the render control and draws its content (camera, grid, right-click menu); destroys the control when the window is closed. *(internal)* *(hook)* | 462 |
| `editor_vehicleEditor_liveEditor_veView.onEditorHeadlessChange(enabled, toolName)` | Editor hook called when a tool enters or leaves headless mode. For the 'vehicleEditor' tool: reloads the saved views (enabled = true) or unloads them and destroys the render controls (enabled = false). *(internal)* *(hook)* | 497 |
| `editor_vehicleEditor_liveEditor_veView.onEditorInitialized()` | Editor hook called at initialization: loads the views saved in the preferences (only once). *(internal)* *(hook)* | 507 |

### Parameter details

#### `editor_vehicleEditor_liveEditor_veView.onEditorHeadlessChange(enabled, toolName)`

Editor hook called when a tool enters or leaves headless mode. For the 'vehicleEditor' tool: reloads the saved views (enabled = true) or unloads them and destroys the render controls (enabled = false).

- `enabled` (*boolean*) : true when the tool is activated
- `toolName` (*string*) : tool name, only 'vehicleEditor' is handled

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veView.lua`.*
