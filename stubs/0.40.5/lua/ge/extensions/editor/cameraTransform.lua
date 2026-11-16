---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/cameraTransform.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small editor window "Camera Transform" (Camera menu). It reads the camera position/rotation as JSON (commands.getCameraTransformJson), lets you edit it or copy it to the clipboard, and teleport the free camera to an entered JSON (commands.setFreeCameraTransformJson).
--- Access: extension `editor_cameraTransform`: `extensions.load("editor_cameraTransform")`, then the global `editor_cameraTransform`
---@class editor_cameraTransform
editor_cameraTransform = {}

--- Called when the editor is activated; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cameraTransform.lua:46
function editor_cameraTransform.onEditorActivated() end

--- Called when the editor is deactivated; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cameraTransform.lua:50
function editor_cameraTransform.onEditorDeactivated() end

--- Draws the window: "Get Camera Transform", "GoTo" and "Copy" buttons, and a text field containing the transform JSON. Called every frame by the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cameraTransform.lua:18
function editor_cameraTransform.onEditorGui() end

--- Adds the "Camera Transform" menu entry (Camera group) and registers the 600x200 window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cameraTransform.lua:54
function editor_cameraTransform.onEditorInitialized() end

