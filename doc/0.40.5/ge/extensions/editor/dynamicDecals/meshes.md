# `editor_dynamicDecals_meshes`

*File: `lua/ge/extensions/editor/dynamicDecals/meshes.lua` · VM: Game Engine (GE) · 62 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_meshes`: `extensions.load("editor_dynamicDecals_meshes")`, then the global `editor_dynamicDecals_meshes`

Module (experimental, disabled) of the Dynamic Decals tool to change the shape file (.dae) onto which decals are projected. The section code exists but the registration of the "Meshes (Experimental)" section is commented out in setup: no interface is visible.

## Notes

- sectionGui calls api.getShapepath() (different casing from api.getShapePath() used just before): probable typo that would raise an error if the section were enabled.
- The logTag is indeed "editor_dynamicDecals_meshes".

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_meshes.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 46 |
| `editor_dynamicDecals_meshes.registerEditorPreferences(prefsRegistry)` | Declares no preference (body commented out). *(internal)* | 40 |
| `editor_dynamicDecals_meshes.setup(tool_in)` | Called by the tool: stores the tool, the API and the settings module. Registers no section (commented line). *(internal)* | 50 |

### Parameter details

#### `editor_dynamicDecals_meshes.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_meshes.registerEditorPreferences(prefsRegistry)`

Declares no preference (body commented out).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_meshes.setup(tool_in)`

Called by the tool: stores the tool, the API and the settings module. Registers no section (commented line).

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/meshes.lua`.*
