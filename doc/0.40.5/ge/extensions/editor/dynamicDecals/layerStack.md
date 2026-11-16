# `editor_dynamicDecals_layerStack`

*File: `lua/ge/extensions/editor/dynamicDecals/layerStack.lua` · VM: Game Engine (GE) · 850 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_layerStack`: `extensions.load("editor_dynamicDecals_layerStack")`, then the global `editor_dynamicDecals_layerStack`

"Decal Stack / Layers" section (order 140) of the Dynamic Decals tool: hierarchical list of all layers of the design, with an icon colored by type, selection (via the selection module), enabling, duplication, deletion, mask editing, mirror and reorganization by drag and drop (order and parent changes, within groups). The display order is configurable (top to bottom or bottom to top).

## Notes

- Preferences `dynamicDecalsTool.layerStack`: topToBottomLayerStructure (bool, true) and layerTypeIconColor (type -> RGBA table: decal red, fill green, textureFill blue, group yellow, brushStroke cyan, path magenta, linkedSet orange).
- registerLayerElementGui is an empty function (unimplemented extension point).
- The file is about 850 lines long; the layerElement function (drawing of a layer) accounts for most of it.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_layerStack.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 805 |
| `editor_dynamicDecals_layerStack.registerEditorPreferences(prefsRegistry)` | Registers the subcategory `dynamicDecalsTool.layerStack`: topToBottomLayerStructure and layerTypeIconColor (with a graphical color editor per type). *(internal)* | 787 |
| `editor_dynamicDecals_layerStack.registerLayerElementGui()` | Empty function, no effect (extension point intended for layer UI elements). *(internal)* | 840 |
| `editor_dynamicDecals_layerStack.setup(tool_in)` | Called by the tool: gets the API and the modules (fill, textureFill, gizmo, selection, helper, docs), registers the "Decal Stack / Layers" section (order 140, open by default) and the "Layer Stack" documentation page. *(internal)* | 821 |

### Parameter details

#### `editor_dynamicDecals_layerStack.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_layerStack.registerEditorPreferences(prefsRegistry)`

Registers the subcategory `dynamicDecalsTool.layerStack`: topToBottomLayerStructure and layerTypeIconColor (with a graphical color editor per type).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_layerStack.setup(tool_in)`

Called by the tool: gets the API and the modules (fill, textureFill, gizmo, selection, helper, docs), registers the "Decal Stack / Layers" section (order 140, open by default) and the "Layer Stack" documentation page.

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/layerStack.lua`.*
