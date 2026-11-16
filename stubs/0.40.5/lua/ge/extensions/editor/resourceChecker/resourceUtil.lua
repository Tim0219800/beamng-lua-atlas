---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/resourceChecker/resourceUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Engine of the editor's Resource Checker tool: analyzes the materials, textures, meshes and assets of a level or vehicle (material versions, duplicates, persistentId, missing or non-power-of-two textures, unused materials/models/textures, dummies, colmeshes, DDS to PNG export, size statistics). Each check runs in a job (extensions.core_jobsystem.create) that updates a progress value and returns its result to the UI via extensions.editor_resourceChecker.jobData(channel, {type, count, ..., isDone}). Several functions modify or delete files (fixPID, removeDummy, removeUnused, textureExporter): use with caution.
--- Access: extension `editor_resourceChecker_resourceUtil`: `extensions.load("editor_resourceChecker_resourceUtil")`, then the global `editor_resourceChecker_resourceUtil`
---@class editor_resourceChecker_resourceUtil
---@field checkColDataworkJob any Exported but nil (see notes): handle of the checkColData job.
---@field checkUnusedMatsworkJob any Exported but nil (see notes): handle of the checkUnusedMats job.
---@field checkUnusedModelsworkJob any Exported but nil (see notes): handle of the checkUnusedModels job.
---@field checkUsedMatsworkJob any Exported but nil (see notes): handle of the checkUsedMats job.
---@field duplicateDataworkJob any Exported but nil (see notes): handle of the duplicateData job.
---@field matstoRemove table List of unused materials found by checkUnusedMats; replaced by M.matstoRemove at the end of the job. Then used by removeUnused (item 1).
---@field removeDummyworkJob any Exported but nil (see notes): handle of the removeDummy job.
---@field shapestoRemove table List of unused models (shapes) found by checkUnusedModels; used by removeUnused (item 2).
---@field textoRemove table List of unused textures found by unusedTextures; used by removeUnused (item 3).
---@field textureExporterworkJob any Exported but nil (see notes): handle of the textureExporter job.
---@field unusedTexturesworkJob any Exported but nil (see notes): handle of the unusedTextures job.
editor_resourceChecker_resourceUtil = {}

--- Job: computes size statistics of a level's assets (textures, source and cached meshes, terrains, audio, datablocks, others) and the list of files with their size. jobData(3, {typeId, breakdown, totals, sceneCounts, isDone, {files = ...}}).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2778
---@param levelname string Level name.
function editor_resourceChecker_resourceUtil.assetStats(levelname) end

--- Job: looks for the colmeshes (collision) used in a level (prefabs, forest, TSStatic). jobData(3, {9, ...}).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:1739
---@param levelname string Level name.
---@param removal any Not passed to the job (see notes).
function editor_resourceChecker_resourceUtil.checkColData(levelname, removal) end

--- Job: lists the scene's ForestItemData. Result via jobData(3, {2, ...}).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:944
function editor_resourceChecker_resourceUtil.checkForest() end

--- Job: checks the textures referenced by the materials (missing files, incorrect paths). Result via jobData(2, {6, ...}).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:588
---@param convertdata string Folder to analyze.
function editor_resourceChecker_resourceUtil.checkMatTex(convertdata) end

--- Job: lists the shapes used by the scene's TSStatics. Result via jobData(3, {1, ...}).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:875
function editor_resourceChecker_resourceUtil.checkStatic() end

--- Job: lists the scene's TerrainBlocks. Result via jobData(3, {3, ...}).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:993
function editor_resourceChecker_resourceUtil.checkTerrains() end

--- Job: checks the texture files themselves (e.g. power-of-two dimensions, see powerOfTwo). Result via jobData(2, {7, ...}).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:715
---@param convertdata string Folder to analyze.
function editor_resourceChecker_resourceUtil.checkTex(convertdata) end

--- Job: determines which of a level's materials are not used by any object (prefabs, forest, TSStatic, terrains, GroundPlane, GroundCover, DecalRoad, MeshRoad, DecalData). Stores the result in matstoRemove. jobData(3, {4, ...}).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:1277
---@param levelname string Level name.
---@param removal any Removal option (inferred from code).
function editor_resourceChecker_resourceUtil.checkUnusedMats(levelname, removal) end

--- Job: finds the level's unused models (shapes) (prefabs, TSStatic, forest, GroundCover). Stores the result in shapestoRemove. jobData(3, {5, ...}).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:1937
---@param levelname string Level name.
---@param removal any Option (inferred from code).
function editor_resourceChecker_resourceUtil.checkUnusedModels(levelname, removal) end

--- Job: same traversal as checkUnusedMats but to list the used materials. jobData(3, {8, ...}).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:1593
---@param levelname string Level name.
---@param removal any Option (inferred from code).
function editor_resourceChecker_resourceUtil.checkUsedMats(levelname, removal) end

--- Job: looks in the meshes for materials that are referenced but absent from the material files. Result via jobData(2, {8, ...}).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:803
---@param convertdata string Folder to analyze.
function editor_resourceChecker_resourceUtil.checkmissingMats(convertdata) end

--- Job: walks through the materials in /levels, /vehicles, /art and /core to find duplicates of a given material.
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2378
---@param material string Material to search for; E log if nil.
function editor_resourceChecker_resourceUtil.duplicateData(material) end

--- Detects duplicate material names and duplicate mapTo (excluding unmapped_mat) in a list. The result is stored in an internal module state used by verifyDuplicate.
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:236
---@param duplicatelist table Table of {name, mapTo, file}.
function editor_resourceChecker_resourceUtil.findDuplicates(duplicatelist) end

--- Job: removes persistentIds from JSON materials by re-saving them (resaveMaterial). Modifies files. Result via jobData(2, {5, count, "", modifiedFiles, isDone}).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:448
---@param convertdata string Folder to process.
---@param skipCommon boolean false to include the common folders.
function editor_resourceChecker_resourceUtil.fixPID(convertdata, skipCommon) end

--- For a Material object, returns its non-empty filename-type fields, per layer (4 layers for version 0 or 1, activeLayers for 1.5, otherwise 1).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:206
---@param mat userdata Object of class Material.
---@return table<string, string>|nil  "field.layer" keys to file path; nil (and E log) if it is not a Material.
function editor_resourceChecker_resourceUtil.getMaterialTexFields(mat) end

--- Returns the progress of the current job (among all the module's jobs), or nil if none is running.
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2783
---@return number|nil  Progress from 0 to 100.
function editor_resourceChecker_resourceUtil.getProgress() end

--- Walks through all scene objects (scenetree.getAllObjects) and returns those whose getFileName() equals the given file. Used to find the objects created by loading a materials file.
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:145
---@param fileName string Path of the object's source file (e.g. a materials.json).
---@return table  List of SimObjects.
function editor_resourceChecker_resourceUtil.getSimObjects(fileName) end

--- Extension load hook; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2897
function editor_resourceChecker_resourceUtil.onExtensionLoaded() end

--- Unload hook; calls extensions.unload('extensions.editor_resourceChecker_resourceUtil').
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:140
function editor_resourceChecker_resourceUtil.onExtensionUnloaded() end

--- Tests whether a number is a power of two (useful for texture dimensions).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:177
---@param x number Value to test.
---@return boolean  false if x is nil or <= 0 or is not a power of two.
function editor_resourceChecker_resourceUtil.powerOfTwo(x) end

--- Job: removes "dummy" materials (without Stages or with empty Stages[1]) from the materials.json files and rewrites the files. jobData(2, {9, count, "dummy", list, isDone}).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2447
---@param convertdata string Folder to process.
---@param skipCommon boolean false to include the common folders.
function editor_resourceChecker_resourceUtil.removeDummy(convertdata, skipCommon) end

--- Opens a ForestItemData JSON file, removes the entry whose shapeFile matches shape and rewrites the file. Logs a warning if not found.
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:186
---@param shape string shapeFile value to remove.
---@param foresData string Path of the forest JSON file.
function editor_resourceChecker_resourceUtil.removeFromForestJson(shape, foresData) end

--- Job: deletes the selected unused items. item 1 removes materials (matstoRemove), 2 shapes (shapestoRemove, and forest entries), 3 textures (textoRemove). Deletes files: irreversible. jobData(3, {7, ...}).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2329
---@param levelname string Level name.
---@param item integer 1 materials, 2 models, 3 textures.
---@param selected table Table whose keys are the selected entries to delete.
function editor_resourceChecker_resourceUtil.removeUnused(levelname, item, selected) end

--- Reloads a materials.json file, clears the persistentId of each Material then saves it via a temporary PersistenceManager. Rewrites the file.
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:157
---@param file string Path of an existing materials file.
function editor_resourceChecker_resourceUtil.resaveMaterial(file) end

--- Requests all running jobs to stop by setting job.stop = true; the jobs stop at their next checkpoint (abort).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2840
function editor_resourceChecker_resourceUtil.stopProgress() end

--- Job: converts the .dds files found under a folder to .png (convertDDSToPNG) for those that do not already have a .png, writing under exportpath. jobData(2, {10, count, "dummy", files, isDone}).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2492
---@param convertdata string Folder containing the .dds files.
---@param exportpath string Prefix of the PNG output path (concatenated with the folder and the name).
function editor_resourceChecker_resourceUtil.textureExporter(convertdata, exportpath) end

--- Job: finds the unreferenced textures (materials, TerrainMaterials, WaterPlane/Block, River, CloudLayer, ScatterSky, Cubemap, Info). Stores the result in textoRemove. jobData(3, {6, ...}).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2176
---@param levelname string Level name.
---@param removal any Option (inferred from code).
function editor_resourceChecker_resourceUtil.unusedTextures(levelname, removal) end

--- Job: finds materials whose name or mapTo is duplicated. With skipCommon == false, includes /vehicles/common, /art and /core. Result via jobData(2, {3, count, "dummy", list, isDone}).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:394
---@param convertdata string Folder to analyze.
---@param skipCommon boolean false to include the common folders.
function editor_resourceChecker_resourceUtil.verifyDuplicate(convertdata, skipCommon) end

--- Job: counts the materials of version < 1.5 (old) and those at 1.5 (PBR) under a folder, and lists the old ones with their file. Actually loads the material files into the game. Result via jobData(2, {2, nbOld, list, nbPBR, isDone}).
---Source: lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:326
---@param convertdata string Folder to analyze (level or vehicle).
function editor_resourceChecker_resourceUtil.verifyVersion(convertdata) end

