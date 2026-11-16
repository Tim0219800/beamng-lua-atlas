---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/camera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Camera" section of the editor's Dynamic Decals tool. Shows one button per camera preset (default, front, back, left, right, top) that switches to the player vehicle's orbit camera with a given default rotation. Presets are stored in the editor preference `dynamicDecalsTool.camera.presets` (name -> {x,y,z}) and are editable in the preferences window.
--- Access: extension `editor_dynamicDecals_camera`: `extensions.load("editor_dynamicDecals_camera")`, then the global `editor_dynamicDecals_camera`
---@class editor_dynamicDecals_camera
editor_dynamicDecals_camera = {}

--- Hook called when a tool preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/camera.lua:119
---@param path string Path of the modified preference.
---@param value any New value.
function editor_dynamicDecals_camera.editorPreferenceValueChanged(path, value) end

--- Registers the preferences subcategory `dynamicDecalsTool.camera` with the `presets` table (defaults: default {145,-5,0}, front {180,0,0}, back {0,0,0}, left {-90,0,0}, right {90,0,0}, top {90,-90,0}) and its graphical editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/camera.lua:103
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_camera.registerEditorPreferences(prefsRegistry) end

--- Called by the dynamicDecalsTool tool: stores the tool, the editor_api_dynamicDecals API and the docs module, registers the "Camera" section (order 125) with a help button, and registers the documentation page.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/camera.lua:123
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_camera.setup(tool_in) end

