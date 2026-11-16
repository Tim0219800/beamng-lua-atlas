---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/export.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Export" section of the Dynamic Decals tool. Two blocks: "Export Skin" (player vehicle name + skin name, calls api.exportSkin to generate textures, material and JBeam) and "Export Textures" (name, folder, default /art/dynamicDecals/export/textures, then api.exportTextures as PNG). Displays the output paths and warns if a file already exists.
--- Access: extension `editor_dynamicDecals_export`: `extensions.load("editor_dynamicDecals_export")`, then the global `editor_dynamicDecals_export`
---@class editor_dynamicDecals_export
editor_dynamicDecals_export = {}

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/export.lua:191
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_export.editorPreferenceValueChanged(path, value) end

--- Declares no preference (body commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/export.lua:185
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_export.registerEditorPreferences(prefsRegistry) end

--- Called by the tool: gets the API and docs, prepares the format list (dds, png) for ImGui, computes the export paths, registers the "Export" section (order 25) and its documentation page.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/export.lua:196
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_export.setup(tool_in) end

