---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Entry point of the editor's "Easy Select" tool. Registers an edit mode (editor.editModes.ezObjectSelect, name "Easy Select", action map "EZObjectSelect") and a tool window, then delegates the work to editor/ezObjectSelect/controller. The cut/copy/paste/duplicate/select all/deselect/delete actions are relayed to the standard mode editor.editModes.objectSelect. The mouse wheel shortcuts are documented: Ctrl+wheel cycles overlapping objects, Shift+wheel rotates the selection around world Z (Ctrl+Shift: in 1 degree steps).
--- Access: extension `editor_ezObjectSelect`: `extensions.load("editor_ezObjectSelect")`, then the global `editor_ezObjectSelect`
---@class editor_ezObjectSelect
editor_ezObjectSelect = {}

--- Hook (game spelling "Aligment"): relays the gizmo alignment change.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ezObjectSelect.lua:164
function editor_ezObjectSelect.onEditorAxisGizmoAligmentChanged() end

--- Hook: relays the axis gizmo mode change to the controller if the mode is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ezObjectSelect.lua:160
---@param mode any New gizmo mode
function editor_ezObjectSelect.onEditorAxisGizmoModeChanged(mode) end

--- If the mode is active, draws the screen debug and the workspace window (controller.drawWorkspace).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ezObjectSelect.lua:86
function editor_ezObjectSelect.onEditorGui() end

--- Loads the preferences, resets the input filters, registers the window (390x460 x uiscale) and the edit mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ezObjectSelect.lua:77
function editor_ezObjectSelect.onEditorInitialized() end

--- Hook: invalidates the cache (inspectorDynFieldChanged).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ezObjectSelect.lua:148
function editor_ezObjectSelect.onEditorInspectorDynFieldChanged() end

--- Hook: invalidates the cache (inspectorFieldChanged).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ezObjectSelect.lua:144
function editor_ezObjectSelect.onEditorInspectorFieldChanged() end

--- Hook: invalidates the selection cache (reason objectAdded).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ezObjectSelect.lua:136
function editor_ezObjectSelect.onEditorObjectAdded() end

--- Hook: invalidates the cache (prefabExploded).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ezObjectSelect.lua:140
function editor_ezObjectSelect.onEditorPrefabExploded() end

--- Hook: for gizmos.general.highlightSelectedMeshes refreshes the selection tint if the mode is active; otherwise relays to the controller.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ezObjectSelect.lua:152
---@param path string Preference path
---@param value any New value
function editor_ezObjectSelect.onEditorPreferenceValueChanged(path, value) end

--- Hook: lets the controller save its preferences.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ezObjectSelect.lua:168
---@param prefsRegistry table Preferences registry
function editor_ezObjectSelect.onEditorRegisterPreferences(prefsRegistry) end

--- Loads the preferences and resets the input filters.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ezObjectSelect.lua:111
function editor_ezObjectSelect.onExtensionLoaded() end

--- Leaves the mode (back to objectSelect) or deactivates the controller, then unregisters the window and the mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ezObjectSelect.lua:95
function editor_ezObjectSelect.onExtensionUnloaded() end

--- Requests centering the camera on the selection (focus).
---Source: lua/ge/extensions/editor/ezObjectSelect.lua:128
function editor_ezObjectSelect.requestFocusShortcut() end

--- Forwards a numpad key to the controller (view preset).
---Source: lua/ge/extensions/editor/ezObjectSelect.lua:132
---@param preset any Preset (inferred from code: value forwarded as-is)
function editor_ezObjectSelect.requestNumpadPreset(preset) end

--- Requests the rotate operation via shortcut.
---Source: lua/ge/extensions/editor/ezObjectSelect.lua:120
function editor_ezObjectSelect.requestRotateShortcut() end

--- Requests the scale operation via shortcut.
---Source: lua/ge/extensions/editor/ezObjectSelect.lua:124
function editor_ezObjectSelect.requestScaleShortcut() end

--- Requests the transform (move) operation via keyboard shortcut.
---Source: lua/ge/extensions/editor/ezObjectSelect.lua:116
function editor_ezObjectSelect.requestTransformShortcut() end

