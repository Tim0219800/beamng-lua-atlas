---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/fonts.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Font management of the Dynamic Decals tool. Generates, via FontRasterizer.createFontBitmap, glyph atlases (256 px high bitmaps, SDF option with padding, onedge value and distance scale) in /art/dynamicDecals/fonts/ from a font file (default source folder /ui/common/). The generated atlases (`<name>.font.json` with header and glyphs) are listed, previewed in the "Fonts" section, in a preview window and in a "Fonts" tab of the browser; a chosen glyph can serve as a decal texture (api.setDecalLayerFontPath / setDecalLayerFontCharacter). Text layers (path layers) use them.
--- Access: extension `editor_dynamicDecals_fonts`: `extensions.load("editor_dynamicDecals_fonts")`, then the global `editor_dynamicDecals_fonts`
---@class editor_dynamicDecals_fonts
---@field supportedFontFileFormats table File dialog filters for choosing a font: all files, font files (.ttf, .TTF) and TTF files.
editor_dynamicDecals_fonts = {}

--- Makes sure an atlas exists for the given font, generates it otherwise (atlas name = file name without extension).
---Source: lua/ge/extensions/editor/dynamicDecals/fonts.lua:502
---@param fontPath string Path of the .ttf file.
---@return boolean  false if creation failed, true otherwise.
function editor_dynamicDecals_fonts.checkOrGenerateFontBitmaps(fontPath) end

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/fonts.lua:470
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_fonts.editorPreferenceValueChanged(path, value) end

--- Returns the source folder of the fonts (/ui/common/).
---Source: lua/ge/extensions/editor/dynamicDecals/fonts.lua:517
---@return string  Folder path.
function editor_dynamicDecals_fonts.getFontDirectory() end

--- Returns the list (sorted case-insensitively) of already generated font atlas names.
---Source: lua/ge/extensions/editor/dynamicDecals/fonts.lua:521
---@return string[]  Font names.
function editor_dynamicDecals_fonts.getGeneratedFontAtlases() end

--- Registers `dynamicDecalsTool.fonts`: glyphPreviewSize and glyphPreviewSizeInPreviewWindow (float, default 128, from 32 to 1024) and markMissingGlyphs (bool, true).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/fonts.lua:462
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_fonts.registerEditorPreferences(prefsRegistry) end

--- Called by the tool: lists the existing atlases, registers the "Fonts" section (order 1030), the "Fonts" tab of the browser (order 40), the preview window, the update and UI callbacks, then tells the API the atlas folder (api.setFontTextureAtlasPath).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/fonts.lua:483
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_fonts.setup(tool_in) end

