# `editor_dynamicDecals_fonts`

*File: `lua/ge/extensions/editor/dynamicDecals/fonts.lua` · VM: Game Engine (GE) · 533 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_fonts`: `extensions.load("editor_dynamicDecals_fonts")`, then the global `editor_dynamicDecals_fonts`

Font management of the Dynamic Decals tool. Generates, via FontRasterizer.createFontBitmap, glyph atlases (256 px high bitmaps, SDF option with padding, onedge value and distance scale) in /art/dynamicDecals/fonts/ from a font file (default source folder /ui/common/). The generated atlases (`<name>.font.json` with header and glyphs) are listed, previewed in the "Fonts" section, in a preview window and in a "Fonts" tab of the browser; a chosen glyph can serve as a decal texture (api.setDecalLayerFontPath / setDecalLayerFontCharacter). Text layers (path layers) use them.

## Notes

- An atlas is only listed if its `.font.json` file contains a `header` key.
- checkOrGenerateFontBitmaps returns true if the path is empty (≤ 1 character) or if the atlas already exists, otherwise the result of the generation.
- If generation fails, a message is added to the notifications (error level) and to the log.
- The code reads the list of atlases in destinationDirectory ("/art/dynamicDecals/fonts/") with a depth of 1.
- editModeUpdate removes elements from fontGenNotifications during ipairs: an element may be skipped.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_fonts.checkOrGenerateFontBitmaps(fontPath)` | Makes sure an atlas exists for the given font, generates it otherwise (atlas name = file name without extension). | 502 |
| `editor_dynamicDecals_fonts.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 470 |
| `editor_dynamicDecals_fonts.getFontDirectory()` | Returns the source folder of the fonts (/ui/common/). | 517 |
| `editor_dynamicDecals_fonts.getGeneratedFontAtlases()` | Returns the list (sorted case-insensitively) of already generated font atlas names. | 521 |
| `editor_dynamicDecals_fonts.registerEditorPreferences(prefsRegistry)` | Registers `dynamicDecalsTool.fonts`: glyphPreviewSize and glyphPreviewSizeInPreviewWindow (float, default 128, from 32 to 1024) and markMissingGlyphs (bool, true). *(internal)* | 462 |
| `editor_dynamicDecals_fonts.setup(tool_in)` | Called by the tool: lists the existing atlases, registers the "Fonts" section (order 1030), the "Fonts" tab of the browser (order 40), the preview window, the update and UI callbacks, then tells the API the atlas folder (api.setFontTextureAtlasPath). *(internal)* | 483 |

### Parameter details

#### `editor_dynamicDecals_fonts.checkOrGenerateFontBitmaps(fontPath)`

Makes sure an atlas exists for the given font, generates it otherwise (atlas name = file name without extension).

- `fontPath` (*string*) : Path of the .ttf file.
- **returns**: boolean false if creation failed, true otherwise.

#### `editor_dynamicDecals_fonts.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_fonts.getFontDirectory()`

Returns the source folder of the fonts (/ui/common/).

- **returns**: string Folder path.

#### `editor_dynamicDecals_fonts.getGeneratedFontAtlases()`

Returns the list (sorted case-insensitively) of already generated font atlas names.

- **returns**: string[] Font names.

#### `editor_dynamicDecals_fonts.registerEditorPreferences(prefsRegistry)`

Registers `dynamicDecalsTool.fonts`: glyphPreviewSize and glyphPreviewSizeInPreviewWindow (float, default 128, from 32 to 1024) and markMissingGlyphs (bool, true).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_fonts.setup(tool_in)`

Called by the tool: lists the existing atlases, registers the "Fonts" section (order 1030), the "Fonts" tab of the browser (order 40), the preview window, the update and UI callbacks, then tells the API the atlas folder (api.setFontTextureAtlasPath).

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

## Fields

| Field | Type | Description |
|---|---|---|
| `supportedFontFileFormats` | table | File dialog filters for choosing a font: all files, font files (.ttf, .TTF) and TTF files. |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/fonts.lua`.*
