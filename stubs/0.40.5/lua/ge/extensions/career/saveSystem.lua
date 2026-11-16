---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/saveSystem.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career save system. Profiles are folders of settings/cloud/saves/<profile>/; each save is a subfolder (autosave1 to autosave4 in rotation, or a chosen name) containing info.json (version, UTC date, creationDate, displayName, corrupted). saveCurrent first writes info.json as "corrupted", triggers the onSaveCurrentProfileAsyncStart then onSaveCurrentProfile(path, thumbnails) hooks so that each extension writes its files, waits for asynchronous extensions, then finalizes info.json and emits onSaveFinished.
--- Access: extension `career_saveSystem`: `extensions.load("career_saveSystem")`, then the global `career_saveSystem`
---@class career_saveSystem
career_saveSystem = {}

--- Signals that an asynchronous extension has finished; finalizes the save when all are done.
---Source: lua/ge/extensions/career/saveSystem.lua:284
---@param extName string Extension name.
function career_saveSystem.asyncSaveExtensionFinished(extName) end

--- Lists the profile names (folders of settings/cloud/saves/).
---Source: lua/ge/extensions/career/saveSystem.lua:325
---@return string[]  Profile names.
function career_saveSystem.getAllProfiles() end

--- Lists a profile's saves (content of info.json + name field = folder name), sorted by ascending date.
---Source: lua/ge/extensions/career/saveSystem.lua:16
---@param profile string Profile name.
---@return table[]  List of info.json tables.
function career_saveSystem.getAllSaveFolders(profile) end

--- Minimum accepted save version (36).
---Source: lua/ge/extensions/career/saveSystem.lua:362
---@return integer  Version.
function career_saveSystem.getBackwardsCompVersion() end

--- Display name of the current profile.
---Source: lua/ge/extensions/career/saveSystem.lua:228
---@return string|nil  Displayed name.
function career_saveSystem.getCurrentDisplayName() end

--- Returns the current profile and the path of its current save.
---Source: lua/ge/extensions/career/saveSystem.lua:224
---@return string|nil  Profile name.
---@return string|nil  Path of the current save folder (to use as the root of the career files).
function career_saveSystem.getCurrentProfile() end

--- Finds the most recent (non-corrupted) save folder of a profile path.
---Source: lua/ge/extensions/career/saveSystem.lua:84
---@param path string Profile folder.
---@return string  Folder path, or empty string if none.
function career_saveSystem.getNewestSave(path) end

--- Saves root: 'settings/cloud/saves/'.
---Source: lua/ge/extensions/career/saveSystem.lua:338
---@return string  Path.
function career_saveSystem.getSaveRootDirectory() end

--- Save format version (64).
---Source: lua/ge/extensions/career/saveSystem.lua:358
---@return integer  Version.
function career_saveSystem.getSaveSystemVersion() end

--- Writes a JSON via a temporary file then renames (atomic write).
---Source: lua/ge/extensions/career/saveSystem.lua:243
---@param filename string Target file.
---@param obj table Data.
---@param pretty boolean|nil Human-readable formatting.
---@param numberPrecision integer|nil Number precision.
---@param tempFileName string|nil Temporary file, default filename..".tmp".
---@return boolean  true if written.
function career_saveSystem.jsonWriteFileSafe(filename, obj, pretty, numberPrecision, tempFileName) end

--- Lua reload hook: restores the state returned by onSerialize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/saveSystem.lua:351
---@param v table Saved state.
function career_saveSystem.onDeserialized(v) end

--- Load hook; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/saveSystem.lua:335
function career_saveSystem.onExtensionLoaded() end

--- Lua reload hook: returns the current profile, path, display name and creation date.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/saveSystem.lua:342
---@return table  State to keep.
function career_saveSystem.onSerialize() end

--- Declares that an extension will finish its save later (finalization is delayed).
---Source: lua/ge/extensions/career/saveSystem.lua:280
---@param extName string Extension name.
function career_saveSystem.registerAsyncSaveExtension(extName) end

--- Deletes a profile's folder (refused for the current profile if the career is active).
---Source: lua/ge/extensions/career/saveSystem.lua:153
---@param profile string Profile name.
function career_saveSystem.removeProfile(profile) end

--- Deletes a profile's save folder, except the current save or an illegal name.
---Source: lua/ge/extensions/career/saveSystem.lua:164
---@param profile string Profile name.
---@param saveFolderName string Save folder name.
---@return boolean  true if deleted.
function career_saveSystem.removeSaveFolder(profile, saveFolderName) end

--- Renames a profile's folder (refused if the new name exists, or for the current profile in an active career).
---Source: lua/ge/extensions/career/saveSystem.lua:208
---@param profile string Old name.
---@param newName string New name.
---@return boolean|nil  true if renamed, false if refused, nil in other failure cases.
function career_saveSystem.renameProfile(profile, newName) end

--- Saves the career into an autosave (the oldest) or into saveName. Without a current profile, does nothing.
---Source: lua/ge/extensions/career/saveSystem.lua:291
---@param vehiclesThumbnailUpdate any Passed to extensions via onSaveCurrentProfile (e.g. list of inventoryIds whose thumbnail must be updated).
---@param playSuccessSound boolean|nil Plays a sound on success.
---@param saveName string|nil Name of a dedicated save instead of an autosave.
function career_saveSystem.saveCurrent(vehiclesThumbnailUpdate, playSuccessSound, saveName) end

--- Marks the current save as failed (clears infoData).
---Source: lua/ge/extensions/career/saveSystem.lua:239
function career_saveSystem.saveFailed() end

--- Selects the current profile (and its most recent save or a specific one). Emits onBeforeSetProfile then onSetProfile(savePath, profile). With profile = nil, deselects.
---Source: lua/ge/extensions/career/saveSystem.lua:120
---@param profile string|nil Profile name.
---@param specificSaveFolder string|nil Name of a specific save subfolder.
---@return boolean  false if profile is nil or the save is too old, true otherwise.
function career_saveSystem.setProfile(profile, specificSaveFolder) end

