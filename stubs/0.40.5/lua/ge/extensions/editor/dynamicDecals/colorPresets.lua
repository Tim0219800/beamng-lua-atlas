---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/colorPresets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Color Presets" section of the Dynamic Decals tool. List of named colors stored in the preference `dynamicDecalsTool.colorPresets.presets` (about 42 by default: "iconic oraNGe", Aquamarine, Burgundy, Jet Black...). Each entry {name, value={r,g,b,a}} can be edited, renamed, deleted, filtered by name, and applied as a decal or fill layer color.
--- Access: extension `editor_dynamicDecals_colorPresets`: `extensions.load("editor_dynamicDecals_colorPresets")`, then the global `editor_dynamicDecals_colorPresets`
---@class editor_dynamicDecals_colorPresets
editor_dynamicDecals_colorPresets = {}

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/colorPresets.lua:152
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_colorPresets.editorPreferenceValueChanged(path, value) end

--- Draws the search filter, the preset list (color widget, name, buttons delete / apply as decal color via api.setDecalColor / apply as fill layer color via api.setFillLayerColor) and the add button. Serves both as section content and as the editor of the `presets` preference.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/colorPresets.lua:30
---@param guiId string Suffix for unique ImGui identifiers.
function editor_dynamicDecals_colorPresets.onGui(guiId) end

--- Registers the subcategory `dynamicDecalsTool.colorPresets` with the `presets` table (default list of named colors) and its graphical editor (onGui).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/colorPresets.lua:101
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_colorPresets.registerEditorPreferences(prefsRegistry) end

--- Called by the tool: gets the API and docs, registers the "Color Presets" section (order 121) and its documentation page.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/colorPresets.lua:169
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_colorPresets.setup(tool_in) end

