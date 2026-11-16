---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/mainToolbar.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Main toolbar ("Main Toolbar" window) of the World Editor. It contains the general buttons (new/open/save level...), the axis gizmo buttons (grid, rotation and scale snap), the camera, the time of day and the exposure, as well as the list of edit modes groupable into "sets" saved in a file. Other extensions can add buttons to it via the emitted hooks.
--- Access: extension `editor_mainToolbar`: `extensions.load("editor_mainToolbar")`, then the global `editor_mainToolbar`
---@class editor_mainToolbar
---@field dependencies table<integer, string> {'core_environment'}.
editor_mainToolbar = {}

--- Called when the editor is deactivated: restores the initial exposure if it was modified.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mainToolbar.lua:1553
function editor_mainToolbar.onEditorDeactivated() end

--- Draws the toolbar window every frame and emits the toolbar hooks.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mainToolbar.lua:895
function editor_mainToolbar.onEditorGuiToolBar() end

--- Registers and shows the "mainToolbar" window and loads the edit mode sets from the file.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mainToolbar.lua:1529
function editor_mainToolbar.onEditorInitialized() end

--- Called when the editor state is loaded. Empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mainToolbar.lua:1550
---@param state table Editor state.
function editor_mainToolbar.onEditorLoadState(state) end

--- If ui.general.enableVehicleControls changes, enables/disables the vehicle action maps.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mainToolbar.lua:1536
---@param path string Preference path.
---@param value any New value.
function editor_mainToolbar.onEditorPreferenceValueChanged(path, value) end

--- Called when the editor state is saved. Empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mainToolbar.lua:1547
---@param state table Editor state.
function editor_mainToolbar.onEditorSaveState(state) end

