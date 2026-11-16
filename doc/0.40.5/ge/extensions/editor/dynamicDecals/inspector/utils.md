# `editor_dynamicDecals_inspector_utils`

*File: `lua/ge/extensions/editor/dynamicDecals/inspector/utils.lua` · VM: Game Engine (GE) · 152 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_inspector_utils`: `extensions.load("editor_dynamicDecals_inspector_utils")`, then the global `editor_dynamicDecals_inspector_utils`

Reusable ImGui widgets for the layer GUIs of the Dynamic Decals inspector: texture picker (read-only field, folder button, reset button, preview, drag-and-drop target) and four-corner gradient editor for a decal layer. Each modification calls api.setLayer(layer, true). Depends on editor_api_dynamicDecals.

## Notes

- Bug: decalTextureWidgetInspect uses a variable `propert` (typo of `property`, nil global) in the ImGui identifiers; the widgets of two texture properties of the same layer therefore share the same identifier.
- Drag-and-drop accepts the payload "DynDecalTextureDrapDrop" (typo in the name); the payload must be 256 bytes (assert), and contains the texture path.
- The gradient reads decalGradientColor{TopLeft,TopRight,BottomLeft,BottomRight} (ColorI 0..255) and writes them back as ColorI.
- The texture preview is limited by the preference `dynamicDecalsTool.inspector.texturePreviewSize`.

**Dependencies (loaded first):** `editor_api_dynamicDecals`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_inspector_utils.decalColorGradientWidgetInspect(k, layer, guiId)` | Draws a four-corner gradient square with an RGBA color picker at each corner; updates the layer's decalGradientColor* properties. | 56 |
| `editor_dynamicDecals_inspector_utils.decalTextureWidgetInspect(layer, property, guiId, removeTextureOverridePath)` | Draws a texture picker for layer[property]: read-only path, opening of a file dialog (png/jpg/jpeg, default folder /art/decals/dynDecals/), deletion, preview and drop zone. Assigns layer[property] then calls api.setLayer(layer, true). | 17 |
| `editor_dynamicDecals_inspector_utils.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 136 |
| `editor_dynamicDecals_inspector_utils.onGui()` | Empty function. *(internal)* *(hook)* | 126 |
| `editor_dynamicDecals_inspector_utils.registerEditorPreferences(prefsRegistry)` | Declares no preference (body commented out). *(internal)* | 130 |
| `editor_dynamicDecals_inspector_utils.setup(tool_in)` | Called by the tool: stores the tool and the API. *(internal)* | 140 |

### Parameter details

#### `editor_dynamicDecals_inspector_utils.decalColorGradientWidgetInspect(k, layer, guiId)`

Draws a four-corner gradient square with an RGBA color picker at each corner; updates the layer's decalGradientColor* properties.

- `k` (*any*) : Not used in the function body.
- `layer` (*table*) : Decal layer containing the four gradient colors.
- `guiId` (*string*) : ImGui identifier suffix.

#### `editor_dynamicDecals_inspector_utils.decalTextureWidgetInspect(layer, property, guiId, removeTextureOverridePath)`

Draws a texture picker for layer[property]: read-only path, opening of a file dialog (png/jpg/jpeg, default folder /art/decals/dynDecals/), deletion, preview and drop zone. Assigns layer[property] then calls api.setLayer(layer, true).

- `layer` (*table*) : Layer data.
- `property` (*string*) : Name of the field containing the texture path.
- `guiId` (*string*) : ImGui identifier suffix.
- `removeTextureOverridePath` (*string|nil*) : Value put in the property by the delete button; default "/".

#### `editor_dynamicDecals_inspector_utils.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_inspector_utils.registerEditorPreferences(prefsRegistry)`

Declares no preference (body commented out).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_inspector_utils.setup(tool_in)`

Called by the tool: stores the tool and the API.

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before this one: {"editor_api_dynamicDecals"}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/inspector/utils.lua`.*
