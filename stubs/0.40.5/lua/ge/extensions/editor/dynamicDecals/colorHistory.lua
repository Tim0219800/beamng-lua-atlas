---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/colorHistory.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Color History" section of the Dynamic Decals tool. Keeps in an editor preference (`dynamicDecalsTool.colorHistory.history`) the list of the last used colors (RGBA) and lets you reapply them as a decal or fill layer color, or delete them. The maximum size is the `maxHistoryCount` preference (default 10, from 2 to 128).
--- Access: extension `editor_dynamicDecals_colorHistory`: `extensions.load("editor_dynamicDecals_colorHistory")`, then the global `editor_dynamicDecals_colorHistory`
---@class editor_dynamicDecals_colorHistory
editor_dynamicDecals_colorHistory = {}

--- Adds the color at the head of the history (first removes an identical entry), truncates to maxHistoryCount and saves the preference.
---Source: lua/ge/extensions/editor/dynamicDecals/colorHistory.lua:15
---@param color Point4F Color with fields x, y, z, w (RGBA).
function editor_dynamicDecals_colorHistory.addColorToHistory(color) end

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/colorHistory.lua:61
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_colorHistory.editorPreferenceValueChanged(path, value) end

--- Draws the list: a widget for each color, the buttons "Set as decal color" (api.setDecalColor), "Set as fill layer color" (api.setFillLayerColor) and a delete icon. Used as the section content and as the editor of the `history` preference.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/colorHistory.lua:29
---@param guiId string Suffix to make ImGui identifiers unique.
function editor_dynamicDecals_colorHistory.onGui(guiId) end

--- Registers the subcategory `dynamicDecalsTool.colorHistory`: `history` (table, edited by onGui) and `maxHistoryCount` (int, default 10, min 2, max 128).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/colorHistory.lua:52
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_colorHistory.registerEditorPreferences(prefsRegistry) end

--- Called by the tool: gets the API and docs, registers the "Color History" section (order 122) and its documentation page.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/colorHistory.lua:76
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_colorHistory.setup(tool_in) end

