# `editor_dynamicDecals_debugTextures`

*File: `lua/ge/extensions/editor/dynamicDecals/debugTextures.lua` · VM: Game Engine (GE) · 63 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_debugTextures`: `extensions.load("editor_dynamicDecals_debugTextures")`, then the global `editor_dynamicDecals_debugTextures`

"Debug Textures" debug section of the Dynamic Decals tool. Shows, in collapsible headers, the internal textures of the editor_api_dynamicDecals API: dynamic, baked, highlight, decal (brush input) and masks. The maximum width of the previews comes from the preference `dynamicDecalsTool.debugTextures.maxImageWidgetWidth` (default 512).

## Notes

- The variable textureSet is never set (its assignment is commented out), so the "Combined Textures" header never appears.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_debugTextures.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 48 |
| `editor_dynamicDecals_debugTextures.registerEditorPreferences(prefsRegistry)` | Registers the float preference `dynamicDecalsTool.debugTextures.maxImageWidgetWidth` (default 512). *(internal)* | 42 |
| `editor_dynamicDecals_debugTextures.setup(tool_in)` | Called by the tool: gets the API and registers the "Debug Textures" section (order 1130). *(internal)* | 52 |

### Parameter details

#### `editor_dynamicDecals_debugTextures.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_debugTextures.registerEditorPreferences(prefsRegistry)`

Registers the float preference `dynamicDecalsTool.debugTextures.maxImageWidgetWidth` (default 512).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_debugTextures.setup(tool_in)`

Called by the tool: gets the API and registers the "Debug Textures" section (order 1130).

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/debugTextures.lua`.*
