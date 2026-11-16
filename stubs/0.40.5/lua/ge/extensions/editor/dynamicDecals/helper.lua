---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/helper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small ImGui and string utility functions shared by the sections of the Dynamic Decals tool: centered text, image preview with its size, image or icon tooltip, formatting of camelCase names. Useful to a modder writing a section or a widget for this tool.
--- Access: extension `editor_dynamicDecals_helper`: `extensions.load("editor_dynamicDecals_helper")`, then the global `editor_dynamicDecals_helper`
---@class editor_dynamicDecals_helper
editor_dynamicDecals_helper = {}

--- Capitalizes the first letter of each word and lowercases the rest.
---Source: lua/ge/extensions/editor/dynamicDecals/helper.lua:60
---@param str string Source string.
---@return string  Formatted string (followed by the number of substitutions).
function editor_dynamicDecals_helper.capitalizeWords(str) end

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/helper.lua:72
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_helper.editorPreferenceValueChanged(path, value) end

--- Draws an "info" icon with a tooltip containing the message.
---Source: lua/ge/extensions/editor/dynamicDecals/helper.lua:44
---@param msg string Tooltip text.
---@param inline boolean|nil If true, places the icon on the same line as the previous item.
function editor_dynamicDecals_helper.iconTooltip(msg, inline) end

--- If the previous ImGui item is hovered, displays a tooltip with the image and its size. Default width: preference `dynamicDecalsTool.imageTooltip.texturePreviewSize`.
---Source: lua/ge/extensions/editor/dynamicDecals/helper.lua:32
---@param path string Texture path.
---@param overrideTooltipWidth number|nil Preview width in pixels.
function editor_dynamicDecals_helper.imageTooltip(path, overrideTooltipWidth) end

--- Displays an image (tinted with the editor's BeamNG color) at the given width keeping the ratio, followed by its size "W x H".
---Source: lua/ge/extensions/editor/dynamicDecals/helper.lua:24
---@param path string Texture path.
---@param overrideWidth number|nil Width in pixels; default is the full available width.
function editor_dynamicDecals_helper.imageWidget(path, overrideWidth) end

--- Registers the float preference `dynamicDecalsTool.imageTooltip.texturePreviewSize` (default 128, from 32 to 512).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/helper.lua:66
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_helper.registerEditorPreferences(prefsRegistry) end

--- Called by the tool: stores the reference to the tool (required for iconTooltip, which uses tool.getIconSize()).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/helper.lua:76
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_helper.setup(tool_in) end

--- Turns a camelCase string into space-separated words with an initial capital (e.g. "brushStroke" gives "Brush Stroke").
---Source: lua/ge/extensions/editor/dynamicDecals/helper.lua:52
---@param str string camelCase string.
---@return string  Formatted string (followed by the number of substitutions of the last gsub).
function editor_dynamicDecals_helper.splitAndCapitalizeCamelCase(str) end

--- Like textUnformattedCentered but with an ImGui color.
---Source: lua/ge/extensions/editor/dynamicDecals/helper.lua:18
---@param color ImVec4 Text color.
---@param string_label string|nil Text to display.
function editor_dynamicDecals_helper.textColoredCentered(color, string_label) end

--- Displays plain text horizontally centered in the available area. Does nothing if the text is nil.
---Source: lua/ge/extensions/editor/dynamicDecals/helper.lua:12
---@param string_label string|nil Text to display.
function editor_dynamicDecals_helper.textUnformattedCentered(string_label) end

