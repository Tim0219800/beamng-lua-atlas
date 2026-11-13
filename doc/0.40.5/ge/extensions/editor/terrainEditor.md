# `editor_terrainEditor`

*Fichier : `lua/ge/extensions/editor/terrainEditor.lua` · VM : Game Engine (GE) · 3379 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_terrainEditor` : `extensions.load("editor_terrainEditor")`, puis la globale `editor_terrainEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_terrainEditor.beginChangeBrushSizeWithKeys(direction)` |  | 3376 |
| `editor_terrainEditor.changeBrushSize(value, step)` |  | 2482 |
| `editor_terrainEditor.checkForTerrainMaterialFileFormat()` |  | 2798 |
| `editor_terrainEditor.copyMaterialProxyWithInputs(mtlProxy)` |  | 621 |
| `editor_terrainEditor.createMaterialProxy(index, pid, mtlObject, name, dirty, isNew)` |  | 671 |
| `editor_terrainEditor.deleteMaterialInJson(name)` |  | 3346 |
| `editor_terrainEditor.dragDropTarget(mtlProxy, map, cbData)` | drag'n'drop | 409 |
| `editor_terrainEditor.endChangeBrushSizeWithKeys()` |  | 3377 |
| `editor_terrainEditor.fixGroundmodelName(name, mtlObject, isNew)` | Background: in the past the groundmodel name was actually the internalName of the terrain material, but now we have a new groundmodel field in the<br> terrain material where we store the groundmodel name and use the internalName for the actual name of the terrain material<br> to fix this improper usage, we now check if the groundmodel field is empty and we set it from the internalName | 649 |
| `editor_terrainEditor.fixedFileFormat()` |  | 3375 |
| `editor_terrainEditor.getErrors()` |  | 3373 |
| `editor_terrainEditor.getLevelPath()` |  | 3374 |
| `editor_terrainEditor.getMatFilePath()` |  | 3371 |
| `editor_terrainEditor.getMaterialsInJson()` |  | 3367 |
| `editor_terrainEditor.getMtlIdByName(matName)` |  | 223 |
| `editor_terrainEditor.getPaintMaterialProxies()` |  | 3369 |
| `editor_terrainEditor.getSelectedPaintMaterialProxy()` |  | 3368 |
| `editor_terrainEditor.getTerrainBlock()` |  | 3366 |
| `editor_terrainEditor.getTerrainBlockMaterialIndex(name)` |  | 3355 |
| `editor_terrainEditor.getTerrainBlockProxies()` |  | 3370 |
| `editor_terrainEditor.getTerrainEditor()` |  | 3365 |
| `editor_terrainEditor.getTerrainFolder()` |  | 3372 |
| `editor_terrainEditor.getUniqueMtlName(initialName, counter)` |  | 721 |
| `editor_terrainEditor.getVars()` |  | 3364 |
| `editor_terrainEditor.onClientEndMission()` | *(hook)* | 3285 |
| `editor_terrainEditor.onEditorBeforeSaveLevel()` | *(hook)* | 3120 |
| `editor_terrainEditor.onEditorDeactivated()` | *(hook)* | 3282 |
| `editor_terrainEditor.onEditorDeleteSelection()` | Handle terrain deletion - clean up stale state to prevent crashes *(hook)* | 3297 |
| `editor_terrainEditor.onEditorGui()` | *(hook)* | 2399 |
| `editor_terrainEditor.onEditorInitialized()` | public interface *(hook)* | 3258 |
| `editor_terrainEditor.onEditorObjectAdded(id)` | *(hook)* | 3289 |
| `editor_terrainEditor.onEditorPreferenceValueChanged(path, value)` | *(hook)* | 3145 |
| `editor_terrainEditor.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 3215 |
| `editor_terrainEditor.removeMap(mtlProxy, mapType)` |  | 1026 |
| `editor_terrainEditor.saveMaterials()` |  | 1031 |
| `editor_terrainEditor.saveTerrainAndMaterials()` |  | 1036 |
| `editor_terrainEditor.selectPaintMaterial(matProxy)` |  | 884 |
| `editor_terrainEditor.setActiveTerrainBlock(id)` | the terrain block the tools operate on, until the user picks another one | 1059 |
| `editor_terrainEditor.setMaterialsDirty()` |  | 530 |
| `editor_terrainEditor.setTerrainDirty()` |  | 525 |
| `editor_terrainEditor.setupVars()` |  | 2389 |
| `editor_terrainEditor.updateEditorTerrainBlocks(preferredId)` |  | 1108 |
| `editor_terrainEditor.updateMap(mtlProxy, map, path)` |  | 377 |
| `editor_terrainEditor.updateMaterialLibrary()` | TODO: move this to terrainMaterialsEditor.lua | 733 |
| `editor_terrainEditor.updatePaintMaterialProxies()` |  | 900 |
| `editor_terrainEditor.updateTerrainBlockProxies()` |  | 1046 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorAfterSaveTerrain`
- `onEditorBeforeSaveTerrain`

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `findFiles`, `stat`
- `debugDrawer:` `drawSphere`
- `obj:` `getClassName`, `getField`, `registerObject`, `setField`, `setPosition`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/terrainEditor.lua`.*
