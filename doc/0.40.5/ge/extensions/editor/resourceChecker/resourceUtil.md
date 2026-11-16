# `editor_resourceChecker_resourceUtil`

*File: `lua/ge/extensions/editor/resourceChecker/resourceUtil.lua` · VM: Game Engine (GE) · 2942 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_resourceChecker_resourceUtil`: `extensions.load("editor_resourceChecker_resourceUtil")`, then the global `editor_resourceChecker_resourceUtil`

Engine of the editor's Resource Checker tool: analyzes the materials, textures, meshes and assets of a level or vehicle (material versions, duplicates, persistentId, missing or non-power-of-two textures, unused materials/models/textures, dummies, colmeshes, DDS to PNG export, size statistics). Each check runs in a job (extensions.core_jobsystem.create) that updates a progress value and returns its result to the UI via extensions.editor_resourceChecker.jobData(channel, {type, count, ..., isDone}). Several functions modify or delete files (fixPID, removeDummy, removeUnused, textureExporter): use with caution.

## Example

```lua
local ru = extensions.editor_resourceChecker_resourceUtil
ru.verifyVersion('/levels/mon_niveau/')
-- later, in the UI:
local p = ru.getProgress()
if p then print(p) end -- 0..100, nil if no job is running
```

## Notes

- The check functions return nothing: the result arrives asynchronously via extensions.editor_resourceChecker.jobData(...). This module therefore depends on the editor_resourceChecker extension.
- isDone is 1 on success and 2 on error (invalid path or missing level name) in the returned data.
- Material paths must contain a "/" otherwise the function logs an error (ensureValidPath).
- The exported xxxworkJob fields are nil when the module loads (copy of local variables not yet assigned): the jobs themselves are private locals, getProgress and stopProgress are the only reliable interface.
- removeUnusedworkJob is not exported, but getProgress/stopProgress handle it. checkColData accepts a removal parameter that is not passed to the job (inferred from code).
- textureExporter: the log('E'/'I', 'text') calls pass the message as the tag (two-argument call with a single message); if convertDDSToPNG fails, the file is still counted and listed.
- The functions that parse material files handle materials.cs (TorqueScript, home-made parser) and *materials.json.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_resourceChecker_resourceUtil.assetStats(levelname)` | Job: computes size statistics of a level's assets (textures, source and cached meshes, terrains, audio, datablocks, others) and the list of files with their size. jobData(3, {typeId, breakdown, totals, sceneCounts, isDone, {files = ...}}). | 2778 |
| `editor_resourceChecker_resourceUtil.checkColData(levelname, removal)` | Job: looks for the colmeshes (collision) used in a level (prefabs, forest, TSStatic). jobData(3, {9, ...}). | 1739 |
| `editor_resourceChecker_resourceUtil.checkForest()` | Job: lists the scene's ForestItemData. Result via jobData(3, {2, ...}). | 944 |
| `editor_resourceChecker_resourceUtil.checkMatTex(convertdata)` | Job: checks the textures referenced by the materials (missing files, incorrect paths). Result via jobData(2, {6, ...}). | 588 |
| `editor_resourceChecker_resourceUtil.checkStatic()` | Job: lists the shapes used by the scene's TSStatics. Result via jobData(3, {1, ...}). | 875 |
| `editor_resourceChecker_resourceUtil.checkTerrains()` | Job: lists the scene's TerrainBlocks. Result via jobData(3, {3, ...}). | 993 |
| `editor_resourceChecker_resourceUtil.checkTex(convertdata)` | Job: checks the texture files themselves (e.g. power-of-two dimensions, see powerOfTwo). Result via jobData(2, {7, ...}). | 715 |
| `editor_resourceChecker_resourceUtil.checkUnusedMats(levelname, removal)` | Job: determines which of a level's materials are not used by any object (prefabs, forest, TSStatic, terrains, GroundPlane, GroundCover, DecalRoad, MeshRoad, DecalData). Stores the result in matstoRemove. jobData(3, {4, ...}). | 1277 |
| `editor_resourceChecker_resourceUtil.checkUnusedModels(levelname, removal)` | Job: finds the level's unused models (shapes) (prefabs, TSStatic, forest, GroundCover). Stores the result in shapestoRemove. jobData(3, {5, ...}). | 1937 |
| `editor_resourceChecker_resourceUtil.checkUsedMats(levelname, removal)` | Job: same traversal as checkUnusedMats but to list the used materials. jobData(3, {8, ...}). | 1593 |
| `editor_resourceChecker_resourceUtil.checkmissingMats(convertdata)` | Job: looks in the meshes for materials that are referenced but absent from the material files. Result via jobData(2, {8, ...}). | 803 |
| `editor_resourceChecker_resourceUtil.duplicateData(material)` | Job: walks through the materials in /levels, /vehicles, /art and /core to find duplicates of a given material. | 2378 |
| `editor_resourceChecker_resourceUtil.findDuplicates(duplicatelist)` | Detects duplicate material names and duplicate mapTo (excluding unmapped_mat) in a list. The result is stored in an internal module state used by verifyDuplicate. | 236 |
| `editor_resourceChecker_resourceUtil.fixPID(convertdata, skipCommon)` | Job: removes persistentIds from JSON materials by re-saving them (resaveMaterial). Modifies files. Result via jobData(2, {5, count, "", modifiedFiles, isDone}). | 448 |
| `editor_resourceChecker_resourceUtil.getMaterialTexFields(mat)` | For a Material object, returns its non-empty filename-type fields, per layer (4 layers for version 0 or 1, activeLayers for 1.5, otherwise 1). | 206 |
| `editor_resourceChecker_resourceUtil.getProgress()` | Returns the progress of the current job (among all the module's jobs), or nil if none is running. | 2783 |
| `editor_resourceChecker_resourceUtil.getSimObjects(fileName)` | Walks through all scene objects (scenetree.getAllObjects) and returns those whose getFileName() equals the given file. Used to find the objects created by loading a materials file. | 145 |
| `editor_resourceChecker_resourceUtil.onExtensionLoaded()` | Extension load hook; does nothing. *(internal)* *(hook)* | 2897 |
| `editor_resourceChecker_resourceUtil.onExtensionUnloaded()` | Unload hook; calls extensions.unload('extensions.editor_resourceChecker_resourceUtil'). *(internal)* *(hook)* | 140 |
| `editor_resourceChecker_resourceUtil.powerOfTwo(x)` | Tests whether a number is a power of two (useful for texture dimensions). | 177 |
| `editor_resourceChecker_resourceUtil.removeDummy(convertdata, skipCommon)` | Job: removes "dummy" materials (without Stages or with empty Stages[1]) from the materials.json files and rewrites the files. jobData(2, {9, count, "dummy", list, isDone}). | 2447 |
| `editor_resourceChecker_resourceUtil.removeFromForestJson(shape, foresData)` | Opens a ForestItemData JSON file, removes the entry whose shapeFile matches shape and rewrites the file. Logs a warning if not found. | 186 |
| `editor_resourceChecker_resourceUtil.removeUnused(levelname, item, selected)` | Job: deletes the selected unused items. item 1 removes materials (matstoRemove), 2 shapes (shapestoRemove, and forest entries), 3 textures (textoRemove). Deletes files: irreversible. jobData(3, {7, ...}). | 2329 |
| `editor_resourceChecker_resourceUtil.resaveMaterial(file)` | Reloads a materials.json file, clears the persistentId of each Material then saves it via a temporary PersistenceManager. Rewrites the file. | 157 |
| `editor_resourceChecker_resourceUtil.stopProgress()` | Requests all running jobs to stop by setting job.stop = true; the jobs stop at their next checkpoint (abort). | 2840 |
| `editor_resourceChecker_resourceUtil.textureExporter(convertdata, exportpath)` | Job: converts the .dds files found under a folder to .png (convertDDSToPNG) for those that do not already have a .png, writing under exportpath. jobData(2, {10, count, "dummy", files, isDone}). | 2492 |
| `editor_resourceChecker_resourceUtil.unusedTextures(levelname, removal)` | Job: finds the unreferenced textures (materials, TerrainMaterials, WaterPlane/Block, River, CloudLayer, ScatterSky, Cubemap, Info). Stores the result in textoRemove. jobData(3, {6, ...}). | 2176 |
| `editor_resourceChecker_resourceUtil.verifyDuplicate(convertdata, skipCommon)` | Job: finds materials whose name or mapTo is duplicated. With skipCommon == false, includes /vehicles/common, /art and /core. Result via jobData(2, {3, count, "dummy", list, isDone}). | 394 |
| `editor_resourceChecker_resourceUtil.verifyVersion(convertdata)` | Job: counts the materials of version < 1.5 (old) and those at 1.5 (PBR) under a folder, and lists the old ones with their file. Actually loads the material files into the game. Result via jobData(2, {2, nbOld, list, nbPBR, isDone}). | 326 |

### Parameter details

#### `editor_resourceChecker_resourceUtil.assetStats(levelname)`

Job: computes size statistics of a level's assets (textures, source and cached meshes, terrains, audio, datablocks, others) and the list of files with their size. jobData(3, {typeId, breakdown, totals, sceneCounts, isDone, {files = ...}}).

- `levelname` (*string*) : Level name.

#### `editor_resourceChecker_resourceUtil.checkColData(levelname, removal)`

Job: looks for the colmeshes (collision) used in a level (prefabs, forest, TSStatic). jobData(3, {9, ...}).

- `levelname` (*string*) : Level name.
- `removal` (*any*) : Not passed to the job (see notes).

#### `editor_resourceChecker_resourceUtil.checkMatTex(convertdata)`

Job: checks the textures referenced by the materials (missing files, incorrect paths). Result via jobData(2, {6, ...}).

- `convertdata` (*string*) : Folder to analyze.

#### `editor_resourceChecker_resourceUtil.checkTex(convertdata)`

Job: checks the texture files themselves (e.g. power-of-two dimensions, see powerOfTwo). Result via jobData(2, {7, ...}).

- `convertdata` (*string*) : Folder to analyze.

#### `editor_resourceChecker_resourceUtil.checkUnusedMats(levelname, removal)`

Job: determines which of a level's materials are not used by any object (prefabs, forest, TSStatic, terrains, GroundPlane, GroundCover, DecalRoad, MeshRoad, DecalData). Stores the result in matstoRemove. jobData(3, {4, ...}).

- `levelname` (*string*) : Level name.
- `removal` (*any*) : Removal option (inferred from code).

#### `editor_resourceChecker_resourceUtil.checkUnusedModels(levelname, removal)`

Job: finds the level's unused models (shapes) (prefabs, TSStatic, forest, GroundCover). Stores the result in shapestoRemove. jobData(3, {5, ...}).

- `levelname` (*string*) : Level name.
- `removal` (*any*) : Option (inferred from code).

#### `editor_resourceChecker_resourceUtil.checkUsedMats(levelname, removal)`

Job: same traversal as checkUnusedMats but to list the used materials. jobData(3, {8, ...}).

- `levelname` (*string*) : Level name.
- `removal` (*any*) : Option (inferred from code).

#### `editor_resourceChecker_resourceUtil.checkmissingMats(convertdata)`

Job: looks in the meshes for materials that are referenced but absent from the material files. Result via jobData(2, {8, ...}).

- `convertdata` (*string*) : Folder to analyze.

#### `editor_resourceChecker_resourceUtil.duplicateData(material)`

Job: walks through the materials in /levels, /vehicles, /art and /core to find duplicates of a given material.

- `material` (*string*) : Material to search for; E log if nil.

#### `editor_resourceChecker_resourceUtil.findDuplicates(duplicatelist)`

Detects duplicate material names and duplicate mapTo (excluding unmapped_mat) in a list. The result is stored in an internal module state used by verifyDuplicate.

- `duplicatelist` (*table*) : Table of {name, mapTo, file}.

#### `editor_resourceChecker_resourceUtil.fixPID(convertdata, skipCommon)`

Job: removes persistentIds from JSON materials by re-saving them (resaveMaterial). Modifies files. Result via jobData(2, {5, count, "", modifiedFiles, isDone}).

- `convertdata` (*string*) : Folder to process.
- `skipCommon` (*boolean*) : false to include the common folders.

#### `editor_resourceChecker_resourceUtil.getMaterialTexFields(mat)`

For a Material object, returns its non-empty filename-type fields, per layer (4 layers for version 0 or 1, activeLayers for 1.5, otherwise 1).

- `mat` (*userdata*) : Object of class Material.
- **returns**: table<string, string>|nil "field.layer" keys to file path; nil (and E log) if it is not a Material.

#### `editor_resourceChecker_resourceUtil.getProgress()`

Returns the progress of the current job (among all the module's jobs), or nil if none is running.

- **returns**: number|nil Progress from 0 to 100.

#### `editor_resourceChecker_resourceUtil.getSimObjects(fileName)`

Walks through all scene objects (scenetree.getAllObjects) and returns those whose getFileName() equals the given file. Used to find the objects created by loading a materials file.

- `fileName` (*string*) : Path of the object's source file (e.g. a materials.json).
- **returns**: table List of SimObjects.

#### `editor_resourceChecker_resourceUtil.powerOfTwo(x)`

Tests whether a number is a power of two (useful for texture dimensions).

- `x` (*number*) : Value to test.
- **returns**: boolean false if x is nil or <= 0 or is not a power of two.

#### `editor_resourceChecker_resourceUtil.removeDummy(convertdata, skipCommon)`

Job: removes "dummy" materials (without Stages or with empty Stages[1]) from the materials.json files and rewrites the files. jobData(2, {9, count, "dummy", list, isDone}).

- `convertdata` (*string*) : Folder to process.
- `skipCommon` (*boolean*) : false to include the common folders.

#### `editor_resourceChecker_resourceUtil.removeFromForestJson(shape, foresData)`

Opens a ForestItemData JSON file, removes the entry whose shapeFile matches shape and rewrites the file. Logs a warning if not found.

- `shape` (*string*) : shapeFile value to remove.
- `foresData` (*string*) : Path of the forest JSON file.

#### `editor_resourceChecker_resourceUtil.removeUnused(levelname, item, selected)`

Job: deletes the selected unused items. item 1 removes materials (matstoRemove), 2 shapes (shapestoRemove, and forest entries), 3 textures (textoRemove). Deletes files: irreversible. jobData(3, {7, ...}).

- `levelname` (*string*) : Level name.
- `item` (*integer*) : 1 materials, 2 models, 3 textures.
- `selected` (*table*) : Table whose keys are the selected entries to delete.

#### `editor_resourceChecker_resourceUtil.resaveMaterial(file)`

Reloads a materials.json file, clears the persistentId of each Material then saves it via a temporary PersistenceManager. Rewrites the file.

- `file` (*string*) : Path of an existing materials file.

#### `editor_resourceChecker_resourceUtil.textureExporter(convertdata, exportpath)`

Job: converts the .dds files found under a folder to .png (convertDDSToPNG) for those that do not already have a .png, writing under exportpath. jobData(2, {10, count, "dummy", files, isDone}).

- `convertdata` (*string*) : Folder containing the .dds files.
- `exportpath` (*string*) : Prefix of the PNG output path (concatenated with the folder and the name).

#### `editor_resourceChecker_resourceUtil.unusedTextures(levelname, removal)`

Job: finds the unreferenced textures (materials, TerrainMaterials, WaterPlane/Block, River, CloudLayer, ScatterSky, Cubemap, Info). Stores the result in textoRemove. jobData(3, {6, ...}).

- `levelname` (*string*) : Level name.
- `removal` (*any*) : Option (inferred from code).

#### `editor_resourceChecker_resourceUtil.verifyDuplicate(convertdata, skipCommon)`

Job: finds materials whose name or mapTo is duplicated. With skipCommon == false, includes /vehicles/common, /art and /core. Result via jobData(2, {3, count, "dummy", list, isDone}).

- `convertdata` (*string*) : Folder to analyze.
- `skipCommon` (*boolean*) : false to include the common folders.

#### `editor_resourceChecker_resourceUtil.verifyVersion(convertdata)`

Job: counts the materials of version < 1.5 (old) and those at 1.5 (PBR) under a folder, and lists the old ones with their file. Actually loads the material files into the game. Result via jobData(2, {2, nbOld, list, nbPBR, isDone}).

- `convertdata` (*string*) : Folder to analyze (level or vehicle).

## Fields

| Field | Type | Description |
|---|---|---|
| `checkColDataworkJob` | any | Exported but nil (see notes): handle of the checkColData job. |
| `checkUnusedMatsworkJob` | any | Exported but nil (see notes): handle of the checkUnusedMats job. |
| `checkUnusedModelsworkJob` | any | Exported but nil (see notes): handle of the checkUnusedModels job. |
| `checkUsedMatsworkJob` | any | Exported but nil (see notes): handle of the checkUsedMats job. |
| `duplicateDataworkJob` | any | Exported but nil (see notes): handle of the duplicateData job. |
| `matstoRemove` | table | List of unused materials found by checkUnusedMats; replaced by M.matstoRemove at the end of the job. Then used by removeUnused (item 1). |
| `removeDummyworkJob` | any | Exported but nil (see notes): handle of the removeDummy job. |
| `shapestoRemove` | table | List of unused models (shapes) found by checkUnusedModels; used by removeUnused (item 2). |
| `textoRemove` | table | List of unused textures found by unusedTextures; used by removeUnused (item 3). |
| `textureExporterworkJob` | any | Exported but nil (see notes): handle of the textureExporter job. |
| `unusedTexturesworkJob` | any | Exported but nil (see notes): handle of the unusedTextures job. |

## Calls into the engine (C++)

- `FS:` `fileExists`, `fileSize`, `findFiles`, `getFileRealPath`, `getUserPath`, `isLinkFile`, `removeFile`, `stat`
- `obj:` `getField`, `getFields`, `getFileName`, `getName`
- `scenetree.` `findClassObjects`, `findObject`, `getAllObjects`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/resourceChecker/resourceUtil.lua`.*
