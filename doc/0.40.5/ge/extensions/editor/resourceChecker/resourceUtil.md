# `editor_resourceChecker_resourceUtil`

*Fichier : `lua/ge/extensions/editor/resourceChecker/resourceUtil.lua` · VM : Game Engine (GE) · 2942 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_resourceChecker_resourceUtil` : `extensions.load("editor_resourceChecker_resourceUtil")`, puis la globale `editor_resourceChecker_resourceUtil`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_resourceChecker_resourceUtil.assetStats(levelname)` |  | 2778 |
| `editor_resourceChecker_resourceUtil.checkColData(levelname, removal)` |  | 1739 |
| `editor_resourceChecker_resourceUtil.checkForest()` |  | 944 |
| `editor_resourceChecker_resourceUtil.checkMatTex(convertdata)` |  | 588 |
| `editor_resourceChecker_resourceUtil.checkStatic()` |  | 875 |
| `editor_resourceChecker_resourceUtil.checkTerrains()` |  | 993 |
| `editor_resourceChecker_resourceUtil.checkTex(convertdata)` |  | 715 |
| `editor_resourceChecker_resourceUtil.checkUnusedMats(levelname, removal)` |  | 1277 |
| `editor_resourceChecker_resourceUtil.checkUnusedModels(levelname, removal)` |  | 1937 |
| `editor_resourceChecker_resourceUtil.checkUsedMats(levelname, removal)` |  | 1593 |
| `editor_resourceChecker_resourceUtil.checkmissingMats(convertdata)` |  | 803 |
| `editor_resourceChecker_resourceUtil.duplicateData(material)` |  | 2378 |
| `editor_resourceChecker_resourceUtil.findDuplicates(duplicatelist)` | look for duplicates | 236 |
| `editor_resourceChecker_resourceUtil.fixPID(convertdata, skipCommon)` |  | 448 |
| `editor_resourceChecker_resourceUtil.getMaterialTexFields(mat)` | get material layers fields | 206 |
| `editor_resourceChecker_resourceUtil.getProgress()` | interface | 2783 |
| `editor_resourceChecker_resourceUtil.getSimObjects(fileName)` | get scene tree all objects | 145 |
| `editor_resourceChecker_resourceUtil.onExtensionLoaded()` | interface *(hook)* | 2897 |
| `editor_resourceChecker_resourceUtil.onExtensionUnloaded()` | *(hook)* | 140 |
| `editor_resourceChecker_resourceUtil.powerOfTwo(x)` |  | 177 |
| `editor_resourceChecker_resourceUtil.removeDummy(convertdata, skipCommon)` |  | 2447 |
| `editor_resourceChecker_resourceUtil.removeFromForestJson(shape, foresData)` |  | 186 |
| `editor_resourceChecker_resourceUtil.removeUnused(levelname, item, selected)` |  | 2329 |
| `editor_resourceChecker_resourceUtil.resaveMaterial(file)` |  | 157 |
| `editor_resourceChecker_resourceUtil.stopProgress()` |  | 2840 |
| `editor_resourceChecker_resourceUtil.textureExporter(convertdata, exportpath)` |  | 2492 |
| `editor_resourceChecker_resourceUtil.unusedTextures(levelname, removal)` |  | 2176 |
| `editor_resourceChecker_resourceUtil.verifyDuplicate(convertdata, skipCommon)` |  | 394 |
| `editor_resourceChecker_resourceUtil.verifyVersion(convertdata)` |  | 326 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `checkColDataworkJob` | any |  |
| `checkUnusedMatsworkJob` | any |  |
| `checkUnusedModelsworkJob` | any |  |
| `checkUsedMatsworkJob` | any |  |
| `duplicateDataworkJob` | any |  |
| `matstoRemove` | table |  |
| `removeDummyworkJob` | any |  |
| `shapestoRemove` | table |  |
| `textoRemove` | table |  |
| `textureExporterworkJob` | any |  |
| `unusedTexturesworkJob` | any |  |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `fileSize`, `findFiles`, `getFileRealPath`, `getUserPath`, `isLinkFile`, `removeFile`, `stat`
- `obj:` `getField`, `getFields`, `getFileName`, `getName`
- `scenetree.` `findClassObjects`, `findObject`, `getAllObjects`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/resourceChecker/resourceUtil.lua`.*
