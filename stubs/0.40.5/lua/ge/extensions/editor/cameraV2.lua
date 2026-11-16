---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/cameraV2.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor extension that enables "Camera V2", an alternative set of mouse controls for the World Editor free camera (pan, orbit, zoom, planar WASD). It registers as a camera controller (core/cameraControllerRegistry, id "editor.cameraV2") only when the camera.general.activeCamera preference is "cameraV2" or when setTemporaryEnabled(true) has been called, and the editor is active. It declares the camera.cameraV2.* preferences, shows a debug window and can recover a camera with invalid coordinates. The real work is delegated to editor/cameraV2/controller.
--- Access: extension `editor_cameraV2`: `extensions.load("editor_cameraV2")`, then the global `editor_cameraV2`
---@class editor_cameraV2
editor_cameraV2 = {}

--- If Camera V2 is registered, relays controller.consumeFocusDoubleClick() (focus double click consumed or not).
---Source: lua/ge/extensions/editor/cameraV2.lua:542
---@return boolean  false if Camera V2 is not active
function editor_cameraV2.consumeFocusDoubleClick() end

--- Called when the editor is activated; reevaluates the Camera V2 activation state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cameraV2.lua:504
function editor_cameraV2.onEditorActivated() end

--- Called when the editor is deactivated; turns off planar translation and unregisters the controller.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cameraV2.lua:508
function editor_cameraV2.onEditorDeactivated() end

--- Draws the "Camera V2 Debug" window (Recover Camera button, controller state, cursor/center ray distances, height above terrain, zoom settings) if showDebugWindow is not false and the controller is registered.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cameraV2.lua:546
function editor_cameraV2.onEditorGui() end

--- Registers the "cameraV2Debug" debug window (360x250 scaled) then evaluates the activation state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cameraV2.lua:496
function editor_cameraV2.onEditorInitialized() end

--- Reacts to preference changes: activeCamera reevaluates activation, wasdMode resynchronizes the WASD mode, showDebugWindow shows/hides the window, any other camera.cameraV2.* preference cancels the controller's current gesture.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cameraV2.lua:513
---@param path string Preference path
---@param value any New value
function editor_cameraV2.onEditorPreferenceValueChanged(path, value) end

--- Preferences registration hook: creates the "camera" category, the "general" subcategory (activeCamera: stock or cameraV2) and "cameraV2" (preferences above), and reorders the subcategories.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cameraV2.lua:420
---@param prefsRegistry table Editor preferences registry
function editor_cameraV2.onEditorRegisterPreferences(prefsRegistry) end

--- On unload: turns off planar mode, unregisters the controller and the debug window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cameraV2.lua:552
function editor_cameraV2.onExtensionUnloaded() end

--- Called every frame. If Camera V2 is active: validates/recovers the pose, updates the controller with dt limited to 0.05 s, draws the altitude reference and the pivot markers (red orbit sphere, blue pan cylinder).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cameraV2.lua:529
---@param dtReal number|nil Real-time delta in seconds; defaults to ui_imgui.GetIO().DeltaTime
function editor_cameraV2.onUpdate(dtReal) end

--- Forces Camera V2 to be enabled regardless of the preference (useful for a tool that wants these controls temporarily). Updates the controller registration state.
---Source: lua/ge/extensions/editor/cameraV2.lua:205
---@param enabled boolean true to enable, anything else is treated as false
function editor_cameraV2.setTemporaryEnabled(enabled) end

