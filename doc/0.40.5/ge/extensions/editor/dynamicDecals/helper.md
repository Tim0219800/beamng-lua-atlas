# `editor_dynamicDecals_helper`

*File: `lua/ge/extensions/editor/dynamicDecals/helper.lua` · VM: Game Engine (GE) · 91 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_helper`: `extensions.load("editor_dynamicDecals_helper")`, then the global `editor_dynamicDecals_helper`

Small ImGui and string utility functions shared by the sections of the Dynamic Decals tool: centered text, image preview with its size, image or icon tooltip, formatting of camelCase names. Useful to a modder writing a section or a widget for this tool.

## Notes

- splitAndCapitalizeCamelCase and capitalizeWords return two values (gsub returns the string and the number of replacements); wrap the call in parentheses to keep only the string.
- imageWidget and imageTooltip go through editor.getTempTextureObj(path); a "/" path (missing texture) is displayed as a square.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_helper.capitalizeWords(str)` | Capitalizes the first letter of each word and lowercases the rest. | 60 |
| `editor_dynamicDecals_helper.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 72 |
| `editor_dynamicDecals_helper.iconTooltip(msg, inline)` | Draws an "info" icon with a tooltip containing the message. | 44 |
| `editor_dynamicDecals_helper.imageTooltip(path, overrideTooltipWidth)` | If the previous ImGui item is hovered, displays a tooltip with the image and its size. Default width: preference `dynamicDecalsTool.imageTooltip.texturePreviewSize`. | 32 |
| `editor_dynamicDecals_helper.imageWidget(path, overrideWidth)` | Displays an image (tinted with the editor's BeamNG color) at the given width keeping the ratio, followed by its size "W x H". | 24 |
| `editor_dynamicDecals_helper.registerEditorPreferences(prefsRegistry)` | Registers the float preference `dynamicDecalsTool.imageTooltip.texturePreviewSize` (default 128, from 32 to 512). *(internal)* | 66 |
| `editor_dynamicDecals_helper.setup(tool_in)` | Called by the tool: stores the reference to the tool (required for iconTooltip, which uses tool.getIconSize()). *(internal)* | 76 |
| `editor_dynamicDecals_helper.splitAndCapitalizeCamelCase(str)` | Turns a camelCase string into space-separated words with an initial capital (e.g. "brushStroke" gives "Brush Stroke"). | 52 |
| `editor_dynamicDecals_helper.textColoredCentered(color, string_label)` | Like textUnformattedCentered but with an ImGui color. | 18 |
| `editor_dynamicDecals_helper.textUnformattedCentered(string_label)` | Displays plain text horizontally centered in the available area. Does nothing if the text is nil. | 12 |

### Parameter details

#### `editor_dynamicDecals_helper.capitalizeWords(str)`

Capitalizes the first letter of each word and lowercases the rest.

- `str` (*string*) : Source string.
- **returns**: string Formatted string (followed by the number of substitutions).

#### `editor_dynamicDecals_helper.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_helper.iconTooltip(msg, inline)`

Draws an "info" icon with a tooltip containing the message.

- `msg` (*string*) : Tooltip text.
- `inline` (*boolean|nil*) : If true, places the icon on the same line as the previous item.

#### `editor_dynamicDecals_helper.imageTooltip(path, overrideTooltipWidth)`

If the previous ImGui item is hovered, displays a tooltip with the image and its size. Default width: preference `dynamicDecalsTool.imageTooltip.texturePreviewSize`.

- `path` (*string*) : Texture path.
- `overrideTooltipWidth` (*number|nil*) : Preview width in pixels.

#### `editor_dynamicDecals_helper.imageWidget(path, overrideWidth)`

Displays an image (tinted with the editor's BeamNG color) at the given width keeping the ratio, followed by its size "W x H".

- `path` (*string*) : Texture path.
- `overrideWidth` (*number|nil*) : Width in pixels; default is the full available width.

#### `editor_dynamicDecals_helper.registerEditorPreferences(prefsRegistry)`

Registers the float preference `dynamicDecalsTool.imageTooltip.texturePreviewSize` (default 128, from 32 to 512).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_helper.setup(tool_in)`

Called by the tool: stores the reference to the tool (required for iconTooltip, which uses tool.getIconSize()).

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

#### `editor_dynamicDecals_helper.splitAndCapitalizeCamelCase(str)`

Turns a camelCase string into space-separated words with an initial capital (e.g. "brushStroke" gives "Brush Stroke").

- `str` (*string*) : camelCase string.
- **returns**: string Formatted string (followed by the number of substitutions of the last gsub).

#### `editor_dynamicDecals_helper.textColoredCentered(color, string_label)`

Like textUnformattedCentered but with an ImGui color.

- `color` (*ImVec4*) : Text color.
- `string_label` (*string|nil*) : Text to display.

#### `editor_dynamicDecals_helper.textUnformattedCentered(string_label)`

Displays plain text horizontally centered in the available area. Does nothing if the text is nil.

- `string_label` (*string|nil*) : Text to display.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/helper.lua`.*
