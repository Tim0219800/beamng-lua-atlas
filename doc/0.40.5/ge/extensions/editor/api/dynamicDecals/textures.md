# `editor_api_dynamicDecals_textures`

*Fichier : `lua/ge/extensions/editor/api/dynamicDecals/textures.lua` · VM : Game Engine (GE) · 298 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_dynamicDecals_textures` : `extensions.load("editor_api_dynamicDecals_textures")`, puis la globale `editor_api_dynamicDecals_textures`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_dynamicDecals_textures.getAndFlushMissingSidecarFiles()` |  | 282 |
| `editor_api_dynamicDecals_textures.getSidecarTemplate()` |  | 281 |
| `editor_api_dynamicDecals_textures.getTags()` |  | 290 |
| `editor_api_dynamicDecals_textures.getTagsWithRefs()` |  | 291 |
| `editor_api_dynamicDecals_textures.getTextureFiles()` |  | 280 |
| `editor_api_dynamicDecals_textures.getTexturesDirectoryPath()` |  | 292 |
| `editor_api_dynamicDecals_textures.onFileChanged(filepath, type)` | *(hook)* | 244 |
| `editor_api_dynamicDecals_textures.readSidecarFile(textureFilepath)` |  | 76 |
| `editor_api_dynamicDecals_textures.reloadTextureFiles()` |  | 111 |
| `editor_api_dynamicDecals_textures.reloadTextureFilesAsync(callbacks)` | yielding twin of reloadTextureFiles(), for callers running inside a jobsystem job so the<br> scan spreads over several frames instead of blocking one. callbacks:<br>   yield(section)    -- called during discovery and after every processed texture file<br>   onTotal(total)    -- number of texture files that were found<br>   onProgress(count) -- texture files processed since the last call | 162 |
| `editor_api_dynamicDecals_textures.setup()` | public interface | 229 |
| `editor_api_dynamicDecals_textures.setupAsync(callbacks)` | yielding twin of setup(), callbacks are forwarded to reloadTextureFilesAsync() | 237 |
| `editor_api_dynamicDecals_textures.sidecarFileExists(textureFilepath)` |  | 72 |
| `editor_api_dynamicDecals_textures.updateSidecarFile(textureFilepath, data)` |  | 84 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `textureType` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `dynamicDecals_onTextureFileAdded`
- `dynamicDecals_onTextureFileDeleted`

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/dynamicDecals/textures.lua`.*
