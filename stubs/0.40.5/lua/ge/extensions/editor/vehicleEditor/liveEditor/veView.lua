---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veView.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Multiple scene views of the vehicle editor in Live mode. Each "Scene View N" is an ImGui window that displays a separate render camera (ImguiRenderViewControl) centered on the player's vehicle, with the modes 3d, left, right, front, back, top, bottom (the orthographic views draw a grid with debugDrawer). The settings (mode, near/far clip, fov, ortho, offset) are saved in the editor preference vehicleEditor.veView.sceneViews. A right click opens a control menu (mode, Ortho, Render Main, Attach to Object, Show Icons, clips, FOV, add/remove view).
--- Access: extension `editor_vehicleEditor_liveEditor_veView`: `extensions.load("editor_vehicleEditor_liveEditor_veView")`, then the global `editor_vehicleEditor_liveEditor_veView`
---@class editor_vehicleEditor_liveEditor_veView
editor_vehicleEditor_liveEditor_veView = {}

--- Adds a scene view: reuses the first deleted or hidden view, otherwise takes the next identifier, then creates/registers the "Scene View N" window (400x600, vehicleEditor tool) and displays it. Called by the View > Add View menu of veToolbar in Live mode.
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veView.lua:106
function editor_vehicleEditor_liveEditor_veView.addSceneView() end

--- Editor hook called every frame: for each registered view, opens the window, creates the render control and draws its content (camera, grid, right-click menu); destroys the control when the window is closed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veView.lua:462
function editor_vehicleEditor_liveEditor_veView.onEditorGui() end

--- Editor hook called when a tool enters or leaves headless mode. For the 'vehicleEditor' tool: reloads the saved views (enabled = true) or unloads them and destroys the render controls (enabled = false).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veView.lua:497
---@param enabled boolean true when the tool is activated
---@param toolName string tool name, only 'vehicleEditor' is handled
function editor_vehicleEditor_liveEditor_veView.onEditorHeadlessChange(enabled, toolName) end

--- Editor hook called at initialization: loads the views saved in the preferences (only once).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veView.lua:507
function editor_vehicleEditor_liveEditor_veView.onEditorInitialized() end

