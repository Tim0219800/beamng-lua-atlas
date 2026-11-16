# `editor_dynamicDecals_layerTypes_fill`

*File: `lua/ge/extensions/editor/dynamicDecals/layerTypes/fill.lua` · VM: Game Engine (GE) · 165 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_layerTypes_fill`: `extensions.load("editor_dynamicDecals_layerTypes_fill")`, then the global `editor_dynamicDecals_layerTypes_fill`

"Fill" layer type of the Dynamic Decals tool: fills the entire vehicle with a solid color, useful as the base of a design. Provides the "Add Fill Layer" window (color palette + color, OK calls api.addFillLayer then adds the color to the history), the toolbar button (order 10), the inspector GUI of the fill type and the documentation page.

## Notes

- colorPaletteMapId: 0 = the layer's own color (fill_color); 1 = vehicle color (vehicleObj.color); 2 = colorPalette0; 3 = colorPalette1. For values other than 0 the color field is disabled and the preview shows the vehicle's palette color.
- The code reads getPlayerVehicle(0) without checking that it is not nil when a palette is chosen.
- The blend mode setting of the fill layer is commented out ("heavily WIP").

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_layerTypes_fill.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 125 |
| `editor_dynamicDecals_layerTypes_fill.openAddLayerWindow()` | Opens the "Add Fill Layer" window. | 129 |
| `editor_dynamicDecals_layerTypes_fill.registerEditorPreferences(prefsRegistry)` | Declares no preference (body commented out). *(internal)* | 119 |
| `editor_dynamicDecals_layerTypes_fill.setup(tool_in)` | Called by the tool: gets the related modules, registers the add window (360x140), the drawing of this window, the inspector GUI of the fill type, the "fill" toolbar item and the documentation page. *(internal)* | 143 |

### Parameter details

#### `editor_dynamicDecals_layerTypes_fill.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_layerTypes_fill.registerEditorPreferences(prefsRegistry)`

Declares no preference (body commented out).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_layerTypes_fill.setup(tool_in)`

Called by the tool: gets the related modules, registers the add window (360x140), the drawing of this window, the inspector GUI of the fill type, the "fill" toolbar item and the documentation page.

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/layerTypes/fill.lua`.*
