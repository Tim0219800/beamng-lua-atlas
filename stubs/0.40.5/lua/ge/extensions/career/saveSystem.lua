---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/saveSystem.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_saveSystem` : `extensions.load("career_saveSystem")`, puis la globale `career_saveSystem`
---@class career_saveSystem
career_saveSystem = {}

---Source : lua/ge/extensions/career/saveSystem.lua:284
---@param extName any
function career_saveSystem.asyncSaveExtensionFinished(extName) end

---Source : lua/ge/extensions/career/saveSystem.lua:325
function career_saveSystem.getAllProfiles() end

---Source : lua/ge/extensions/career/saveSystem.lua:16
---@param profile any
function career_saveSystem.getAllSaveFolders(profile) end

---Source : lua/ge/extensions/career/saveSystem.lua:362
function career_saveSystem.getBackwardsCompVersion() end

---Source : lua/ge/extensions/career/saveSystem.lua:228
function career_saveSystem.getCurrentDisplayName() end

---Source : lua/ge/extensions/career/saveSystem.lua:224
function career_saveSystem.getCurrentProfile() end

--- Finds the newest save folder for a profile
---Source : lua/ge/extensions/career/saveSystem.lua:84
---@param path any
function career_saveSystem.getNewestSave(path) end

---Source : lua/ge/extensions/career/saveSystem.lua:338
function career_saveSystem.getSaveRootDirectory() end

---Source : lua/ge/extensions/career/saveSystem.lua:358
function career_saveSystem.getSaveSystemVersion() end

---Source : lua/ge/extensions/career/saveSystem.lua:243
---@param filename any
---@param obj any
---@param pretty any
---@param numberPrecision any
---@param tempFileName any
function career_saveSystem.jsonWriteFileSafe(filename, obj, pretty, numberPrecision, tempFileName) end

---Source : lua/ge/extensions/career/saveSystem.lua:351
---@param v any
function career_saveSystem.onDeserialized(v) end

---Source : lua/ge/extensions/career/saveSystem.lua:335
function career_saveSystem.onExtensionLoaded() end

---Source : lua/ge/extensions/career/saveSystem.lua:342
function career_saveSystem.onSerialize() end

---Source : lua/ge/extensions/career/saveSystem.lua:280
---@param extName any
function career_saveSystem.registerAsyncSaveExtension(extName) end

---Source : lua/ge/extensions/career/saveSystem.lua:153
---@param profile any
function career_saveSystem.removeProfile(profile) end

---Source : lua/ge/extensions/career/saveSystem.lua:164
---@param profile any
---@param saveFolderName any
function career_saveSystem.removeSaveFolder(profile, saveFolderName) end

---Source : lua/ge/extensions/career/saveSystem.lua:208
---@param profile any
---@param newName any
function career_saveSystem.renameProfile(profile, newName) end

---Source : lua/ge/extensions/career/saveSystem.lua:291
---@param vehiclesThumbnailUpdate any
---@param playSuccessSound any
---@param saveName any
function career_saveSystem.saveCurrent(vehiclesThumbnailUpdate, playSuccessSound, saveName) end

---Source : lua/ge/extensions/career/saveSystem.lua:239
function career_saveSystem.saveFailed() end

---Source : lua/ge/extensions/career/saveSystem.lua:120
---@param profile any
---@param specificSaveFolder any
function career_saveSystem.setProfile(profile, specificSaveFolder) end

