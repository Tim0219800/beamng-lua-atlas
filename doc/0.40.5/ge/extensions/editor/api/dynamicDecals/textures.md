# `editor_api_dynamicDecals_textures`

*File: `lua/ge/extensions/editor/api/dynamicDecals/textures.lua` · VM: Game Engine (GE) · 298 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_dynamicDecals_textures`: `extensions.load("editor_api_dynamicDecals_textures")`, then the global `editor_api_dynamicDecals_textures`

Texture management for the editor's dynamic decals system. Scans /art/dynamicDecals/textures (*.jpg and *.png), reads/writes for each a "sidecar" file <texture>.dynDecalTexture.json (version, type, isSdfCompatible, tags, vehicle), maintains the tag indexes and migrates old sidecars via editor_api_dynamicDecals_sidecarFileMigration. A missing sidecar is created from a default template.

## Notes

- Current sidecar version: 2. Extension: .dynDecalTexture.json.
- reloadTextureFiles contains an "if true then return end" before the sort: textureFiles is therefore never sorted nor are the tags sorted by usage (dead code behind it).
- getAndFlushMissingSidecarFiles sets missingSidecarFiles to nil after reading; if called before any scan, shallowcopy(nil) may fail (inferred from code).
- addTexture (via onFileChanged) creates the default sidecar but does not add it to the tag indexes (direct jsonWriteFile).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_dynamicDecals_textures.getAndFlushMissingSidecarFiles()` | Returns a copy of the list of textures whose sidecar was missing at the last scan, then clears the internal list. | 282 |
| `editor_api_dynamicDecals_textures.getSidecarTemplate()` | Default sidecar template (version 2, type color, isSdfCompatible=false, empty tags, empty vehicle). | 281 |
| `editor_api_dynamicDecals_textures.getTags()` | List of known distinct tags. | 290 |
| `editor_api_dynamicDecals_textures.getTagsWithRefs()` | Table tag -> list of textures carrying this tag. | 291 |
| `editor_api_dynamicDecals_textures.getTextureFiles()` | List of known texture paths (nil before the first scan). | 280 |
| `editor_api_dynamicDecals_textures.getTexturesDirectoryPath()` | Textures folder with trailing slash: /art/dynamicDecals/textures/. | 292 |
| `editor_api_dynamicDecals_textures.onFileChanged(filepath, type)` | File watching hook. For a png/jpg under the textures folder: 'added'/'modified' adds the texture (creates its sidecar if absent) and emits dynamicDecals_onTextureFileAdded(filepath); 'deleted' removes its tags and the texture, and emits dynamicDecals_onTextureFileDeleted(filepath). *(internal)* *(hook)* | 244 |
| `editor_api_dynamicDecals_textures.readSidecarFile(textureFilepath)` | Reads a texture's JSON sidecar, nil if it does not exist. | 76 |
| `editor_api_dynamicDecals_textures.reloadTextureFiles()` | Rediscovers all textures, rebuilds the tags, migrates sidecars of version < 2 and creates the missing sidecars (listed in missingSidecarFiles). | 111 |
| `editor_api_dynamicDecals_textures.reloadTextureFilesAsync(callbacks)` | Yielding equivalent of reloadTextureFiles, for a job: the discovery and each processed texture call callbacks.yield. | 162 |
| `editor_api_dynamicDecals_textures.setup()` | Fetches the migration extension, scans the textures (blocking) and creates the textures folder if missing. | 229 |
| `editor_api_dynamicDecals_textures.setupAsync(callbacks)` | Version of setup() to run in a job (jobsystem): the scan is spread over several frames. The callbacks are passed to reloadTextureFilesAsync. | 237 |
| `editor_api_dynamicDecals_textures.sidecarFileExists(textureFilepath)` | Tests whether a texture's sidecar exists. | 72 |
| `editor_api_dynamicDecals_textures.updateSidecarFile(textureFilepath, data)` | Writes the sidecar and updates the tag indexes (removes the texture's old tags, adds the new ones). | 84 |

### Parameter details

#### `editor_api_dynamicDecals_textures.getAndFlushMissingSidecarFiles()`

Returns a copy of the list of textures whose sidecar was missing at the last scan, then clears the internal list.

- **returns**: string[] Texture paths

#### `editor_api_dynamicDecals_textures.getSidecarTemplate()`

Default sidecar template (version 2, type color, isSdfCompatible=false, empty tags, empty vehicle).

- **returns**: table Template (shared table, copy before modifying)

#### `editor_api_dynamicDecals_textures.getTags()`

List of known distinct tags.

- **returns**: string[]|nil Tags (nil before the first scan)

#### `editor_api_dynamicDecals_textures.getTagsWithRefs()`

Table tag -> list of textures carrying this tag.

- **returns**: table<string, string[]>|nil Tag index

#### `editor_api_dynamicDecals_textures.getTextureFiles()`

List of known texture paths (nil before the first scan).

- **returns**: string[]|nil Paths

#### `editor_api_dynamicDecals_textures.getTexturesDirectoryPath()`

Textures folder with trailing slash: /art/dynamicDecals/textures/.

- **returns**: string Path

#### `editor_api_dynamicDecals_textures.onFileChanged(filepath, type)`

File watching hook. For a png/jpg under the textures folder: 'added'/'modified' adds the texture (creates its sidecar if absent) and emits dynamicDecals_onTextureFileAdded(filepath); 'deleted' removes its tags and the texture, and emits dynamicDecals_onTextureFileDeleted(filepath).

- `filepath` (*string*) : Modified file
- `type` (*string*) : 'added', 'modified' or 'deleted'

#### `editor_api_dynamicDecals_textures.readSidecarFile(textureFilepath)`

Reads a texture's JSON sidecar, nil if it does not exist.

- `textureFilepath` (*string*) : Texture path
- **returns**: table|nil Sidecar content

#### `editor_api_dynamicDecals_textures.reloadTextureFilesAsync(callbacks)`

Yielding equivalent of reloadTextureFiles, for a job: the discovery and each processed texture call callbacks.yield.

- `callbacks` (*table*) : yield(section) during discovery and after each file; onTotal(total) number of textures found; onProgress(count) textures processed since the last call

#### `editor_api_dynamicDecals_textures.setupAsync(callbacks)`

Version of setup() to run in a job (jobsystem): the scan is spread over several frames. The callbacks are passed to reloadTextureFilesAsync.

- `callbacks` (*table*) : yield, onTotal, onProgress (see reloadTextureFilesAsync)

#### `editor_api_dynamicDecals_textures.sidecarFileExists(textureFilepath)`

Tests whether a texture's sidecar exists.

- `textureFilepath` (*string*) : Texture path
- **returns**: boolean true if the sidecar exists

#### `editor_api_dynamicDecals_textures.updateSidecarFile(textureFilepath, data)`

Writes the sidecar and updates the tag indexes (removes the texture's old tags, adds the new ones).

- `textureFilepath` (*string*) : Texture path
- `data` (*table*) : Sidecar content (see getSidecarTemplate)

## Fields

| Field | Type | Description |
|---|---|---|
| `textureType` | table<string, integer> | greyscale=0, color=1, sdf=2 (obsolete), fillTexture=3 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `dynamicDecals_onTextureFileAdded`
- `dynamicDecals_onTextureFileDeleted`

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/dynamicDecals/textures.lua`.*
