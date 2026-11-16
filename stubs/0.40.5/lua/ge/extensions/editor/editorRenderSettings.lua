---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/editorRenderSettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Editor Render Settings" window of the editor: lets you use graphics settings in the editor that differ from those of the game (anti-aliasing, resolution, quality of meshes/terrain/clusters/clouds, grass, shadows, dynamic reflections, SSAO, DOF, motion blur, FPS limit). Values are stored in the preferences editor.renderSettings.* (followGameSettings, values). On editor activation the game's graphics state is captured, then restored on deactivation, on editor shutdown or on extension unload.
--- Access: extension `editor_editorRenderSettings`: `extensions.load("editor_editorRenderSettings")`, then the global `editor_editorRenderSettings`
---@class editor_editorRenderSettings
editor_editorRenderSettings = {}

--- Captures the game's graphics state; if followGameSettings is false, saves and applies the editor values.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/editorRenderSettings.lua:504
function editor_editorRenderSettings.onEditorActivated() end

--- Restores the game's graphics state captured at activation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/editorRenderSettings.lua:520
function editor_editorRenderSettings.onEditorDeactivated() end

--- Draws the window: "follow game settings" checkbox, sync-from-game button, quality presets, then the sections Antialiasing, Scene Quality, Shadows, Reflections, Post-processing and FPS Limit.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/editorRenderSettings.lua:426
function editor_editorRenderSettings.onEditorGui() end

--- Registers the "editorRenderSettings" window (420x700).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/editorRenderSettings.lua:500
function editor_editorRenderSettings.onEditorInitialized() end

--- Registers the "editor" category and the renderSettings subcategory (followGameSettings = true by default, values = {}).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/editorRenderSettings.lua:492
---@param prefsRegistry table Editor preferences registry
function editor_editorRenderSettings.onEditorRegisterPreferences(prefsRegistry) end

--- Same function as the game state restoration (alias).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/editorRenderSettings.lua:513
function editor_editorRenderSettings.onEditorShutdown() end

--- Same function as the game state restoration (alias).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/editorRenderSettings.lua:513
function editor_editorRenderSettings.onExtensionUnloaded() end

