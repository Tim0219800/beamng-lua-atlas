# `editor_cameraTransform`

*File: `lua/ge/extensions/editor/cameraTransform.lua` · VM: Game Engine (GE) · 64 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_cameraTransform`: `extensions.load("editor_cameraTransform")`, then the global `editor_cameraTransform`

Small editor window "Camera Transform" (Camera menu). It reads the camera position/rotation as JSON (commands.getCameraTransformJson), lets you edit it or copy it to the clipboard, and teleport the free camera to an entered JSON (commands.setFreeCameraTransformJson).

## Notes

- The text buffer is 512 characters (im.ArrayChar(512)): a longer JSON would be truncated.
- The module only exports hooks; onEditorActivated and onEditorDeactivated are empty.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_cameraTransform.onEditorActivated()` | Called when the editor is activated; does nothing. *(internal)* *(hook)* | 46 |
| `editor_cameraTransform.onEditorDeactivated()` | Called when the editor is deactivated; does nothing. *(internal)* *(hook)* | 50 |
| `editor_cameraTransform.onEditorGui()` | Draws the window: "Get Camera Transform", "GoTo" and "Copy" buttons, and a text field containing the transform JSON. Called every frame by the editor. *(internal)* *(hook)* | 18 |
| `editor_cameraTransform.onEditorInitialized()` | Adds the "Camera Transform" menu entry (Camera group) and registers the 600x200 window. *(internal)* *(hook)* | 54 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/cameraTransform.lua`.*
