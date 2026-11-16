# `editor_vehicleEditor_staticEditor_veStaticRenderView`

*File: `lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua` · VM: Game Engine (GE) · 822 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_staticEditor_veStaticRenderView`: `extensions.load("editor_vehicleEditor_staticEditor_veStaticRenderView")`, then the global `editor_vehicleEditor_staticEditor_veStaticRenderView`

Render views of the Vehicle Editor's Static Editor. Each "Static Render View##N" window has two RenderViews (the main view and a small axes gizmo), in 3D or orthographic mode (Left -X, Right +X, Back -Y, Front +Y, Bottom -Z, Top +Z). The file handles the camera (keyboard movement, mouse), the grid drawn with the debugDrawer, the clickable axis arrows, the context menu and saving the views to settings/vehicleEditorStatic/staticRenderView.json. Other extensions (vePartTree) use it to get the mouse ray in the main view.

## Notes

- Camera constants: base speed 5 in perspective and 2 in orthographic, "fast" multiplier 2.5; the grid is 10 m with 0.25 m cells.
- The functions moveLeft/moveRight/moveForward/moveBackward(val) and setCameraSpeed(s) are meant to be called by keyboard actions (keybindings): val is the axis or key value (0 released, 1 pressed). setCameraSpeed(s) sets camSpeedMult = s * (2.5 - 1) + 1.
- Views exist only while their window is open: a closed window destroys its RenderViews ("hacky way" according to the code); when leaving the static editor (onEditorHeadlessChange with enabled = false) the settings are saved and all views are destroyed.
- The relevant "headless" mode is vEditor.EDITOR_NAMES[vEditor.EDITOR_MODE_STATIC].
- Bug: the extension exports onDeserialize (without "d") whereas the engine calls onDeserialized; this hook is therefore ignored (it is empty anyway). onSerialize saves the settings and returns nil.
- The "Mode: ..." text is drawn at the top left of each view by onPreRender via debugDrawer:drawTextAdvanced.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_staticEditor_veStaticRenderView.createRenderViewUI()` | Creates a new render view (window + RenderViews): reuses the first entry whose window is hidden or deleted, otherwise creates a new entry, registers the window (400x600, vehicleEditor tool) if needed, shows it and saves the settings. Called by the View > Add View menu of veToolbar. | 191 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.destroyAllRenderViews()` | Destroys all RenderView objects (main and gizmo) of all views, without closing the ImGui windows. Called when leaving the editor. *(internal)* | 757 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.getMainRenderViewMouseRay()` | Returns the mouse ray in the main view of the hovered window (rv:getUnprojectedRayPosDir on the mouse coordinates converted into the viewport), or nil if no window is hovered or the mouse is not over the image. | 748 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.moveBackward(val)` | Sets the intensity of the backward camera movement (camMove.backward). Intended for a keyboard action. | 801 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.moveForward(val)` | Sets the intensity of the forward camera movement (camMove.forward). | 800 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.moveLeft(val)` | Sets the intensity of the leftward camera movement (camMove.left). | 798 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.moveRight(val)` | Sets the intensity of the rightward camera movement (camMove.right). | 799 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.onDeserialize(data)` | Empty function exported under the name onDeserialize (probably a typo for onDeserialized, so never called by the engine). *(internal)* *(hook)* | 793 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorGui(dt)` | Editor hook called every frame: reads the camera inputs, then for each view opens the window, creates the RenderViews as needed (getOrCreateView, enterFocusObjectsMode) and draws the content; destroys the RenderViews of a closed window. *(internal)* *(hook)* | 686 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorHeadlessChange(enabled, toolName)` | Editor hook called when a headless tool is enabled or disabled. For the static editor, on exit: saves the settings and destroys the RenderViews. *(internal)* *(hook)* | 765 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorInitialized()` | Editor hook called at initialization: reloads the saved views from settings/vehicleEditorStatic/staticRenderView.json. *(internal)* *(hook)* | 779 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.onPreRender()` | Hook called every frame before rendering: draws the grid (debugDrawer), the view mode text and the axis arrows of each open view. *(internal)* *(hook)* | 434 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.onSerialize()` | Hook called before a Lua reload: saves the view settings to the settings file and returns nil. *(internal)* *(hook)* | 787 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.setCameraSpeed(s)` | Sets the camera speed multiplier: camSpeedMult = s * (camFastSpeedMult - 1) + 1, with camFastSpeedMult = 2.5. | 802 |

### Parameter details

#### `editor_vehicleEditor_staticEditor_veStaticRenderView.getMainRenderViewMouseRay()`

Returns the mouse ray in the main view of the hovered window (rv:getUnprojectedRayPosDir on the mouse coordinates converted into the viewport), or nil if no window is hovered or the mouse is not over the image.

- **returns**: any result of RenderView:getUnprojectedRayPosDir(x, y), used by vePartTree as (ok, position, direction); nil if outside the view

#### `editor_vehicleEditor_staticEditor_veStaticRenderView.moveBackward(val)`

Sets the intensity of the backward camera movement (camMove.backward). Intended for a keyboard action.

- `val` (*number*) : input value (0 released, positive pressed)

#### `editor_vehicleEditor_staticEditor_veStaticRenderView.moveForward(val)`

Sets the intensity of the forward camera movement (camMove.forward).

- `val` (*number*) : input value

#### `editor_vehicleEditor_staticEditor_veStaticRenderView.moveLeft(val)`

Sets the intensity of the leftward camera movement (camMove.left).

- `val` (*number*) : input value

#### `editor_vehicleEditor_staticEditor_veStaticRenderView.moveRight(val)`

Sets the intensity of the rightward camera movement (camMove.right).

- `val` (*number*) : input value

#### `editor_vehicleEditor_staticEditor_veStaticRenderView.onDeserialize(data)`

Empty function exported under the name onDeserialize (probably a typo for onDeserialized, so never called by the engine).

- `data` (*any*) : unused

#### `editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorGui(dt)`

Editor hook called every frame: reads the camera inputs, then for each view opens the window, creates the RenderViews as needed (getOrCreateView, enterFocusObjectsMode) and draws the content; destroys the RenderViews of a closed window.

- `dt` (*number*) : time delta (s) used for camera movement

#### `editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorHeadlessChange(enabled, toolName)`

Editor hook called when a headless tool is enabled or disabled. For the static editor, on exit: saves the settings and destroys the RenderViews.

- `enabled` (*boolean*) : true on entering the tool, false on leaving
- `toolName` (*string*) : name of the tool concerned

#### `editor_vehicleEditor_staticEditor_veStaticRenderView.onSerialize()`

Hook called before a Lua reload: saves the view settings to the settings file and returns nil.

- **returns**: nil nothing to restore

#### `editor_vehicleEditor_staticEditor_veStaticRenderView.setCameraSpeed(s)`

Sets the camera speed multiplier: camSpeedMult = s * (camFastSpeedMult - 1) + 1, with camFastSpeedMult = 2.5.

- `s` (*number*) : 0 for normal speed, 1 for fast speed (2.5x)

## Calls into the engine (C++)

- `debugDrawer:` `drawCylinder`, `drawLine`, `drawText`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua`.*
