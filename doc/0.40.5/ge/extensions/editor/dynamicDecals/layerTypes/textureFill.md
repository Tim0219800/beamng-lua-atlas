# `editor_dynamicDecals_layerTypes_textureFill`

*File: `lua/ge/extensions/editor/dynamicDecals/layerTypes/textureFill.lua` · VM: Game Engine (GE) · 203 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_layerTypes_textureFill`: `extensions.load("editor_dynamicDecals_layerTypes_textureFill")`, then the global `editor_dynamicDecals_layerTypes_textureFill`

"Texture Fill" layer type of the Dynamic Decals tool: fills the vehicle with a pattern based on an input texture, with color (or vehicle palette), scale and offset. Provides the "Add Texture Fill Layer" window (OK calls api.addTextureFillLayer), the toolbar button (order 20), the inspector GUI of the textureFill type (fillTexturePath, colorPaletteMapId, color, scale, offset) and the doc page.

## Notes

- colorPaletteMapId: 0 = layer color; 1 = vehicle color; 2 = colorPalette0; 3 = colorPalette1. With a value other than 0 the color field is disabled.
- The add window reuses the API's "fill layer" settings (api.getFillLayerColor / setFillLayerColorPaletteMapId) for the color, but the texture properties (api.getFillTexturePath, getTextureFillLayerScale, getTextureFillOffset) for the rest.
- The code reads getPlayerVehicle(0) without checking that it is not nil when a palette is chosen.
- lockFillTextureLayerScaleRatio is declared but never used; the blend mode setting is commented out ("heavily WIP").

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_layerTypes_textureFill.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 161 |
| `editor_dynamicDecals_layerTypes_textureFill.openAddLayerWindow()` | Opens the "Add Texture Fill Layer" window. | 165 |
| `editor_dynamicDecals_layerTypes_textureFill.registerEditorPreferences(prefsRegistry)` | Declares no preference (body commented out). *(internal)* | 155 |
| `editor_dynamicDecals_layerTypes_textureFill.setup(tool_in)` | Called by the tool: gets the related modules, registers the drawing of the add window, the inspector GUI of the textureFill type, the "textureFill" toolbar item, the documentation page and the window (450x310). *(internal)* | 181 |

### Parameter details

#### `editor_dynamicDecals_layerTypes_textureFill.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_layerTypes_textureFill.registerEditorPreferences(prefsRegistry)`

Declares no preference (body commented out).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_layerTypes_textureFill.setup(tool_in)`

Called by the tool: gets the related modules, registers the drawing of the add window, the inspector GUI of the textureFill type, the "textureFill" toolbar item, the documentation page and the window (450x310).

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/layerTypes/textureFill.lua`.*
