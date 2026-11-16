# `editor_sceneView`

*File: `lua/ge/extensions/editor/sceneView.lua` · VM: Game Engine (GE) · 448 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_sceneView`: `extensions.load("editor_sceneView")`, then the global `editor_sceneView`

Additional scene views of the editor: each "Scene view N" is an ImGui window that displays the world via an ImguiRenderViewControl, with its own mode (3D, last selected camera, orthographic), near/far planes, FOV, position/rotation, icon and gizmo visibility, and debug draw mask. Also draws a debug grid. The state of the views is saved with the editor layout (onSerialize/onDeserialized) and restored at initialization.

## Notes

- Default values of a view: nearClip 0.01, farClip 2500, fov 70, renderDebugDrawMask -1 (everything).
- Trap: `data.attachToObject or true` is always true, so the saved value false is lost on reload.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_sceneView.onDeserialized(data)` | Stores the saved data until the editor is initialized (onEditorInitialized uses it). *(internal)* *(hook)* | 438 |
| `editor_sceneView.onEditorGui()` | Called every frame: creates a pending view ("Add Scene View" menu) then draws each view window, its control menus (mode, clips, FOV, ortho) and updates the render camera. *(internal)* *(hook)* | 76 |
| `editor_sceneView.onEditorInitialized()` | Called when the editor initializes: recreates the views from the deserialized data, then adds the "Add Scene View" menu. *(internal)* *(hook)* | 406 |
| `editor_sceneView.onSerialize()` | Serializes the state of all views (mode, clips, fov, pos, rot, display options, debug mask). *(internal)* *(hook)* | 417 |

### Parameter details

#### `editor_sceneView.onDeserialized(data)`

Stores the saved data until the editor is initialized (onEditorInitialized uses it).

- `data` (*table*) : Value returned by onSerialize.

#### `editor_sceneView.onSerialize()`

Serializes the state of all views (mode, clips, fov, pos, rot, display options, debug mask).

- **returns**: table { sceneViews = { [name] = state } }

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawTextAdvanced`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/sceneView.lua`.*
