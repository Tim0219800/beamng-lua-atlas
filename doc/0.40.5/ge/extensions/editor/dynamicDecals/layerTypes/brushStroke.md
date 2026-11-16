# `editor_dynamicDecals_layerTypes_brushStroke`

*File: `lua/ge/extensions/editor/dynamicDecals/layerTypes/brushStroke.lua` · VM: Game Engine (GE) · 609 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_layerTypes_brushStroke`: `extensions.load("editor_dynamicDecals_layerTypes_brushStroke")`, then the global `editor_dynamicDecals_layerTypes_brushStroke`

"Brush Stroke" layer type of the Dynamic Decals tool: a virtual brush stroke that places a decal every frame during movement and interpolates decals between frames. It shares the properties of a decal layer. This module provides the "Brush Stroke Properties" section (number of interpolation steps, order 1070), the inspector GUI of the brushStroke type (uid, name, enabled, color, scale, rotation, alpha mask, SDF, textures, dataPoints, etc.) and the documentation pages (Brush Stroke Layers, Properties).

## Notes

- In the inspector, the data points (dataPoints) are drawn in the 3D world with debugDrawer:drawSphere and drawTextAdvanced (point index), size/color according to the preferences `dynamicDecalsTool.general.dataPointSphereSize` / `dataPointSphereColor`.
- The "Properties" page lists api.properties["Brush Stroke Layer"] and a "Highlight" button opens the "Decal Properties" section and highlights the matching widget.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_layerTypes_brushStroke.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 544 |
| `editor_dynamicDecals_layerTypes_brushStroke.registerEditorPreferences(prefsRegistry)` | Declares no preference (body commented out). *(internal)* | 538 |
| `editor_dynamicDecals_layerTypes_brushStroke.setup(tool_in)` | Called by the tool: gets the related modules, registers the "Brush Stroke Properties" section, the inspector GUI of the brushStroke type and the documentation pages. *(internal)* | 589 |

### Parameter details

#### `editor_dynamicDecals_layerTypes_brushStroke.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_layerTypes_brushStroke.registerEditorPreferences(prefsRegistry)`

Declares no preference (body commented out).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_layerTypes_brushStroke.setup(tool_in)`

Called by the tool: gets the related modules, registers the "Brush Stroke Properties" section, the inspector GUI of the brushStroke type and the documentation pages.

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/layerTypes/brushStroke.lua`.*
