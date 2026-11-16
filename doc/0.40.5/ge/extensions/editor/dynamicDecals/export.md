# `editor_dynamicDecals_export`

*File: `lua/ge/extensions/editor/dynamicDecals/export.lua` · VM: Game Engine (GE) · 219 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_export`: `extensions.load("editor_dynamicDecals_export")`, then the global `editor_dynamicDecals_export`

"Export" section of the Dynamic Decals tool. Two blocks: "Export Skin" (player vehicle name + skin name, calls api.exportSkin to generate textures, material and JBeam) and "Export Textures" (name, folder, default /art/dynamicDecals/export/textures, then api.exportTextures as PNG). Displays the output paths and warns if a file already exists.

## Notes

- The files exported for textures are <folder>/<name>_color, _metallic, _roughness, _colorPalette as .png; _normal is disabled.
- The DDS format is disabled: exportTextures forces "png" regardless of the format passed.
- Spaces in the skin / export name are replaced by "_".
- The vehicle name is read from getPlayerVehicle(0).jbeam and the field is read-only; if no vehicle exists, the last value (empty initially) is kept.
- The default value skinExport_Vehicle ("vivace") is not used.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_export.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 191 |
| `editor_dynamicDecals_export.registerEditorPreferences(prefsRegistry)` | Declares no preference (body commented out). *(internal)* | 185 |
| `editor_dynamicDecals_export.setup(tool_in)` | Called by the tool: gets the API and docs, prepares the format list (dds, png) for ImGui, computes the export paths, registers the "Export" section (order 25) and its documentation page. *(internal)* | 196 |

### Parameter details

#### `editor_dynamicDecals_export.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_export.registerEditorPreferences(prefsRegistry)`

Declares no preference (body commented out).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_export.setup(tool_in)`

Called by the tool: gets the API and docs, prepares the format list (dds, png) for ImGui, computes the export paths, registers the "Export" section (order 25) and its documentation page.

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/export.lua`.*
