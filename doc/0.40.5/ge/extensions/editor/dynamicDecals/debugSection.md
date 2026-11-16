# `editor_dynamicDecals_debugSection`

*File: `lua/ge/extensions/editor/dynamicDecals/debugSection.lua` · VM: Game Engine (GE) · 193 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_debugSection`: `extensions.load("editor_dynamicDecals_debugSection")`, then the global `editor_dynamicDecals_debugSection`

"Debug" section (order 1010) of the Dynamic Decals tool: a series of test buttons for developers. They call the editor_api_dynamicDecals API (layer reprojection, brush bake, layerStack dump, material names, surface depth/normal, vehicle material update), the other modules of the tool (textures, gizmo, notification, docs, widgets, settings) and a dynamic material generator for all vehicles.

## Notes

- The "Generate Materials" button walks /vehicles/*, reads <vehicle>/main.materials.json and, for each used material (settings.getUsedMaterialNames) whose `mapTo` matches, creates a "<name>.skin.dynamicTextures" material whose stage 2 uses the textures @DynamicTextureBaseColor / ColorPalette / Metallic / Roughness. The result is written to <vehicle>/dynamicDecals/main.materials.json: writes into game files, use with caution.
- This code assumes that dynamicDecal Stages[2] exists in every material read; otherwise it raises an error.
- The "Reproject Layers every frame" checkbox calls api.reprojectLayers() on every frame the section is displayed: expensive.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_debugSection.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 172 |
| `editor_dynamicDecals_debugSection.registerEditorPreferences(prefsRegistry)` | Declares no preference (the body is entirely commented out). *(internal)* | 166 |
| `editor_dynamicDecals_debugSection.setup(tool_in)` | Called by the tool: gets the API and the textures, gizmo, notification, docs, widgets, settings modules, then registers the "Debug" section (order 1010). *(internal)* | 176 |

### Parameter details

#### `editor_dynamicDecals_debugSection.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_debugSection.registerEditorPreferences(prefsRegistry)`

Declares no preference (the body is entirely commented out).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_debugSection.setup(tool_in)`

Called by the tool: gets the API and the textures, gizmo, notification, docs, widgets, settings modules, then registers the "Debug" section (order 1010).

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/debugSection.lua`.*
