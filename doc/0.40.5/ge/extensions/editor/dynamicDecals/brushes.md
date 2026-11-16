# `editor_dynamicDecals_brushes`

*File: `lua/ge/extensions/editor/dynamicDecals/brushes.lua` · VM: Game Engine (GE) · 638 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_brushes`: `extensions.load("editor_dynamicDecals_brushes")`, then the global `editor_dynamicDecals_brushes`

Brush management for the Dynamic Decals tool: a preset saves the current state of the decal properties (color/alpha/metallic/normal/roughness textures, color, gradient, rotation, scale, skew, UV, alpha mask, SDF, mirror, intensities, wrap...). Brushes are stored in /art/dynamicDecals/brushes/brushes.json, listed in the browser's "Brushes" tab (order 30) and inspectable (Use / Delete / Save). A modder uses it to save or reload a decal setting.

## Notes

- The brushes.json file is read at setup if it exists, otherwise the list is empty (no file is created before the first save).
- saveBrush without a name uses the file name (without extension) of the current color texture. Each call adds a new entry, without a duplicate check.
- The SDF properties (sdfThickness, sdfSoftness, sdfOutline*) are only saved if the color texture is SDF-compatible (decal.isTexturesSdfCompatible).
- loadBrush applies each property via getValueOrDefault, which falls back to the default value of api.propertiesMap for a missing value. The alphaMaskInvert and decalUseGradientColor lines are commented out: these two saved properties are not restored on load (and the presumed setters do not exist under that name).
- deleteBrush sets the id field of all brushes to nil before writing the file.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_brushes.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 609 |
| `editor_dynamicDecals_brushes.getBrushes()` | Returns the list of brushes loaded in memory. | 599 |
| `editor_dynamicDecals_brushes.inspectorGui(brush)` | Draws the inspector of a selected brush: Use (loadBrush), Delete and Save buttons (visible only if brush.dirty), then the preview and the properties. *(internal)* | 306 |
| `editor_dynamicDecals_brushes.loadBrush(brush)` | Applies to the API (api.set*) all properties of a brush: alpha mask, blend mode, color, textures, rotation, scale, skew, gradient, UV, SDF, etc. | 135 |
| `editor_dynamicDecals_brushes.registerEditorPreferences(prefsRegistry)` | Declares no preference (body commented out). *(internal)* | 603 |
| `editor_dynamicDecals_brushes.saveBrush(name)` | Creates a brush from the current API state (api.get*), adds it to the list and writes brushes.json. | 55 |
| `editor_dynamicDecals_brushes.setup(tool_in)` | Called by the tool: gets API, browser, selection and layerTypes_decal, loads brushes.json if present, registers the "Brushes" tab of the browser. *(internal)* | 613 |

### Parameter details

#### `editor_dynamicDecals_brushes.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_brushes.getBrushes()`

Returns the list of brushes loaded in memory.

- **returns**: table[] List of brushes (the internal table, not a copy).

#### `editor_dynamicDecals_brushes.inspectorGui(brush)`

Draws the inspector of a selected brush: Use (loadBrush), Delete and Save buttons (visible only if brush.dirty), then the preview and the properties.

- `brush` (*table*) : Selected brush (editor.selection["dynamicDecalBrush"]).

#### `editor_dynamicDecals_brushes.loadBrush(brush)`

Applies to the API (api.set*) all properties of a brush: alpha mask, blend mode, color, textures, rotation, scale, skew, gradient, UV, SDF, etc.

- `brush` (*table*) : Brush (brushes.json entry, see saveBrush for the fields).

#### `editor_dynamicDecals_brushes.registerEditorPreferences(prefsRegistry)`

Declares no preference (body commented out).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_brushes.saveBrush(name)`

Creates a brush from the current API state (api.get*), adds it to the list and writes brushes.json.

- `name` (*string|nil*) : Brush name; defaults to the color texture name.

#### `editor_dynamicDecals_brushes.setup(tool_in)`

Called by the tool: gets API, browser, selection and layerTypes_decal, loads brushes.json if present, registers the "Brushes" tab of the browser.

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/brushes.lua`.*
