# `editor_dynamicDecals_settings`

*File: `lua/ge/extensions/editor/dynamicDecals/settings.lua` · VM: Game Engine (GE) · 263 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_settings`: `extensions.load("editor_dynamicDecals_settings")`, then the global `editor_dynamicDecals_settings`

"Settings" section (order 1040) of the Dynamic Decals tool. Lets you enable/disable the decal API, choose the cursor position (UV) or the mouse, the UV layer (0 or 1), the materials and meshes of the player vehicle that receive decals, and the texture resolution. Maintains the material name <-> index table used by the other modules.

## Notes

- Changing the UV layer or the texture resolution reprojects all layers (can take a long time).
- updateMaterials does nothing if the API is not defined or if there is no player vehicle.
- getUsedMaterialNames depends on the last updateMaterials: without an update, names may be nil.
- At setup, the list of meshes is fetched in a job delayed by one frame ("otherwise the names are not ready") and stored in shapeMeshes, a variable that is not read afterwards: sectionGui calls api.getShapeMeshes() directly again.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_settings.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 204 |
| `editor_dynamicDecals_settings.getUsedMaterialNames()` | Returns the names of the currently enabled materials (indices of api.getMaterialIndices()). | 246 |
| `editor_dynamicDecals_settings.registerEditorPreferences(prefsRegistry)` | Declares no preference (body commented out). *(internal)* | 198 |
| `editor_dynamicDecals_settings.setup(tool_in)` | Called by the tool: prepares the lists (UV layers, resolutions), initializes the resolution indices from the API if it is ready, updates the materials, starts the mesh reading job and registers the "Settings" section. *(internal)* | 213 |
| `editor_dynamicDecals_settings.updateMaterials()` | Rereads api.getShapeMaterialNames() for the player vehicle and rebuilds the name->index and index->name tables. | 28 |

### Parameter details

#### `editor_dynamicDecals_settings.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_settings.getUsedMaterialNames()`

Returns the names of the currently enabled materials (indices of api.getMaterialIndices()).

- **returns**: string[] List of material names.

#### `editor_dynamicDecals_settings.registerEditorPreferences(prefsRegistry)`

Declares no preference (body commented out).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_settings.setup(tool_in)`

Called by the tool: prepares the lists (UV layers, resolutions), initializes the resolution indices from the API if it is ready, updates the materials, starts the mesh reading job and registers the "Settings" section.

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/settings.lua`.*
