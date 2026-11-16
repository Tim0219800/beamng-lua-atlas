# `editor_dynamicDecals_textures`

*File: `lua/ge/extensions/editor/dynamicDecals/textures.lua` · VM: Game Engine (GE) · 595 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_textures`: `extensions.load("editor_dynamicDecals_textures")`, then the global `editor_dynamicDecals_textures`

Decal texture browser of the Dynamic Decals tool (interface). Adds the "Textures" (order 10) and "Tags" (order 20) tabs to the browser, an inspector for the selection `editor.selection["dynamicDecalTexture"]` (editing of the sidecar file's metadata/tags), multiple selection (Shift = range, Ctrl = add), a context menu to assign a texture to a property and a notification when missing metadata files have been created. The file logic is in editor_api_dynamicDecals_textures.

## Notes

- Files whose name starts with "_" are excluded from the list.
- Preferences `dynamicDecalsTool.textureBrowser`: loadImagesPerFrameCount (int 3), enableVirtualScrolling (bool true: only visible textures are loaded), texturePreviewSize (float 128, from 32 to 512).
- setup creates the textures folder (FS:directoryCreate) and calls the API's textures.setup().
- The same notification block is duplicated in setup and in onTextureFileAdded.
- onTextureFileDeleted modifies the list during ipairs; harmless for a single deleted file.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_textures.dynamicDecals_onTextureFileAdded(filepath)` | Hook called when a texture file is added to the watched folder: if missing metadata files were created, adds a notification with selection buttons. *(internal)* | 544 |
| `editor_dynamicDecals_textures.dynamicDecals_onTextureFileDeleted(filepath)` | Hook called when a texture file is deleted: removes it from the `dynamicDecalTexture` selection (which becomes nil if empty). *(internal)* | 572 |
| `editor_dynamicDecals_textures.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 257 |
| `editor_dynamicDecals_textures.getTexturesDirectoryPath()` | Returns the decal textures folder (delegates to editor_api_dynamicDecals_textures). | 585 |
| `editor_dynamicDecals_textures.registerEditorPreferences(prefsRegistry)` | Registers the subcategory `dynamicDecalsTool.textureBrowser` (loadImagesPerFrameCount, enableVirtualScrolling, texturePreviewSize). *(internal)* | 249 |
| `editor_dynamicDecals_textures.setup(tool_in)` | Called by the tool: gets the related modules, registers the Textures and Tags tabs, the "Browser / Textures" doc page and the inspector of the dynamicDecalTexture type, creates the textures folder, initializes the textures API and notifies about missing metadata files. *(internal)* | 492 |

### Parameter details

#### `editor_dynamicDecals_textures.dynamicDecals_onTextureFileAdded(filepath)`

Hook called when a texture file is added to the watched folder: if missing metadata files were created, adds a notification with selection buttons.

- `filepath` (*string*) : Path of the added file (not used directly).

#### `editor_dynamicDecals_textures.dynamicDecals_onTextureFileDeleted(filepath)`

Hook called when a texture file is deleted: removes it from the `dynamicDecalTexture` selection (which becomes nil if empty).

- `filepath` (*string*) : Path of the deleted file.

#### `editor_dynamicDecals_textures.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_textures.getTexturesDirectoryPath()`

Returns the decal textures folder (delegates to editor_api_dynamicDecals_textures).

- **returns**: string Path of the textures folder.

#### `editor_dynamicDecals_textures.registerEditorPreferences(prefsRegistry)`

Registers the subcategory `dynamicDecalsTool.textureBrowser` (loadImagesPerFrameCount, enableVirtualScrolling, texturePreviewSize).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_textures.setup(tool_in)`

Called by the tool: gets the related modules, registers the Textures and Tags tabs, the "Browser / Textures" doc page and the inspector of the dynamicDecalTexture type, creates the textures folder, initializes the textures API and notifies about missing metadata files.

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

## Calls into the engine (C++)

- `FS:` `directoryCreate`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/textures.lua`.*
