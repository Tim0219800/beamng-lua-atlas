---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/sceneView.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Additional scene views of the editor: each "Scene view N" is an ImGui window that displays the world via an ImguiRenderViewControl, with its own mode (3D, last selected camera, orthographic), near/far planes, FOV, position/rotation, icon and gizmo visibility, and debug draw mask. Also draws a debug grid. The state of the views is saved with the editor layout (onSerialize/onDeserialized) and restored at initialization.
--- Access: extension `editor_sceneView`: `extensions.load("editor_sceneView")`, then the global `editor_sceneView`
---@class editor_sceneView
editor_sceneView = {}

--- Stores the saved data until the editor is initialized (onEditorInitialized uses it).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sceneView.lua:438
---@param data table Value returned by onSerialize.
function editor_sceneView.onDeserialized(data) end

--- Called every frame: creates a pending view ("Add Scene View" menu) then draws each view window, its control menus (mode, clips, FOV, ortho) and updates the render camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sceneView.lua:76
function editor_sceneView.onEditorGui() end

--- Called when the editor initializes: recreates the views from the deserialized data, then adds the "Add Scene View" menu.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sceneView.lua:406
function editor_sceneView.onEditorInitialized() end

--- Serializes the state of all views (mode, clips, fov, pos, rot, display options, debug mask).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sceneView.lua:417
---@return table  { sceneViews = { [name] = state } }
function editor_sceneView.onSerialize() end

