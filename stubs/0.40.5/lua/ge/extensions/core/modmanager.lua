---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/modmanager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_modmanager`: mod manager. At UI startup (onUiReady), it reads the mods/db.json database, scans /mods/*.zip and /mods/unpacked/*, detects the type of each mod (vehicle, terrain, app, scenario, sound, unknown), mounts them in the virtual file system, then executes the modScript.lua scripts (/scripts/**/modScript.lua and /mods_data/*/modScript.lua). It allows enabling, disabling, deleting, unpacking and repacking (pack) a mod, detects duplicates and file conflicts, and checks for updates via the server. A modder uses it to find which mod a file belongs to, list the active mods, or react to the hooks onModActivated / onModDeactivated / onModManagerReady.
--- Access: extension `core_modmanager`: `extensions.load("core_modmanager")`, then the global `core_modmanager`
---@class core_modmanager
---@field checkUpdate function Job (core_jobsystem.wrap, delay 500) that sends the mod list to the server (s2/v4/modSync) and applies the returned actions: deactivate, update, missing, 404OLD.
---@field dependencies string[] { 'core_versionUpdate' }.
---@field initDB function Job (core_jobsystem.wrap) that scans /mods/, mounts the mods, notifies onFileChanged, loads core_repository, triggers onModManagerReady and runs the modScripts. Called by onUiReady and enableAutoMount.
core_modmanager = {}

--- Mounts and activates all known mods, runs their modScripts, notifies the files and updates the state.
---Source: lua/ge/extensions/core/modmanager.lua:1070
function core_modmanager.activateAllMods() end

--- Activates a mod: mounts it if it is not mounted, runs its modScript.lua, marks it active, emits onModActivated, notifies the added files, loads the extensions with manual unload and updates the state.
---Source: lua/ge/extensions/core/modmanager.lua:1023
---@param modname string Mod key (see getMods). Unknown: log message, nothing else.
function core_modmanager.activateMod(modname) end

--- Like activateMod but with the mod's repository ID (tagid) or the modname.
---Source: lua/ge/extensions/core/modmanager.lua:1061
---@param modID string tagid or modname.
function core_modmanager.activateModId(modID) end

--- Requests an update check at the next start of initDB (if the modAutoUpdates setting is active and the network is allowed).
---Source: lua/ge/extensions/core/modmanager.lua:1486
function core_modmanager.check4Update() end

--- Checks a mod: compares the hashes of all its files with the manifest (modData.hashes) and looks in /vehicles/<name>/ for files that do not belong to the mod (conflicts). Sets mods[modname].valid and .conflict.
---Source: lua/ge/extensions/core/modmanager.lua:268
---@param modname string Mod key.
---@return boolean|nil  true if valid and without conflict; nil if the mod is unknown.
function core_modmanager.checkMod(modname) end

--- Unmounts all mods, deactivates them and notifies the file changes.
---Source: lua/ge/extensions/core/modmanager.lua:773
function core_modmanager.deactivateAllMods() end

--- Unmounts the mod, marks it inactive (active = false), emits onModDeactivated and notifies the removed files.
---Source: lua/ge/extensions/core/modmanager.lua:974
---@param modname string Mod key.
---@param preventStateChange boolean|nil If true, does not update the state (stateChanged).
---@param deferFileChanged boolean|nil If true, does not notify right away: the list is only returned.
---@return table[]|nil  List { filename, type = 'deleted' }, or nil if the mod does not exist.
function core_modmanager.deactivateMod(modname, preventStateChange, deferFileChanged) end

--- Like deactivateMod, by repository ID (tagid) or modname.
---Source: lua/ge/extensions/core/modmanager.lua:1014
---@param modID string tagid or modname.
function core_modmanager.deactivateModId(modID) end

--- Deletes all mods installed from the repository (/mods/repo/) and asks the server to unsubscribe the user from all mods.
---Source: lua/ge/extensions/core/modmanager.lua:1139
function core_modmanager.deleteAllMods() end

--- Unmounts then deletes the mod's file or folder (only under /mods/) and removes it from the database.
---Source: lua/ge/extensions/core/modmanager.lua:1116
---@param modname string Mod key.
---@return boolean|nil  true if deleted, false if the deletion fails, nil if the mod does not exist.
function core_modmanager.deleteMod(modname) end

--- Disables automatic mounting of zips that appear in /mods/.
---Source: lua/ge/extensions/core/modmanager.lua:1497
function core_modmanager.disableAutoMount() end

--- Re-enables automatic mounting and re-runs initDB to catch up on changes.
---Source: lua/ge/extensions/core/modmanager.lua:1501
function core_modmanager.enableAutoMount() end

--- Disables the disableModsAfterUpdate setting and initializes the mod manager.
---Source: lua/ge/extensions/core/modmanager.lua:808
function core_modmanager.enableModsAfterUpdate() end

--- Returns the list of conflicts computed by checkMod.
---Source: lua/ge/extensions/core/modmanager.lua:1437
---@param modname string Mod key.
---@return table[]|nil  Elements { file, path } or nil.
function core_modmanager.getConflict(modname) end

--- Returns a mod's record from the database.
---Source: lua/ge/extensions/core/modmanager.lua:1442
---@param modname string Mod key.
---@return table|nil  Mod record.
function core_modmanager.getModDB(modname) end

--- From the real path of a virtual file, looks for the zip mod in the user folder that contains it. Does not handle unpacked mods.
---Source: lua/ge/extensions/core/modmanager.lua:1461
---@param filename_virtual string Virtual path.
---@return string|nil  modname.
---@return table|nil  Mod record.
function core_modmanager.getModForFilename(filename_virtual) end

--- Finds a mod's record from the path of its original archive (converted to modname).
---Source: lua/ge/extensions/core/modmanager.lua:196
---@param originArchivePath string|nil Path of the archive.
---@return table|nil  Mod record.
function core_modmanager.getModFromOriginArchivePath(originArchivePath) end

--- Finds the mod that provides a virtual file, via the file's original archive. Slow: use with caution.
---Source: lua/ge/extensions/core/modmanager.lua:202
---@param vfsPath string Virtual path (e.g. '/levels/x/info.json').
---@return table|nil  Mod record, nil if the file comes from the base game.
function core_modmanager.getModFromPath(vfsPath) end

--- Old name of getModFromPath, kept for compatibility.
---Source: lua/ge/extensions/core/modmanager.lua:202
---@param vfsPath string Virtual path.
---@return table|nil  Mod record.
function core_modmanager.getModFromPathSUPERSLOW(vfsPath) end

--- Looks for the modname whose tagid (repository ID) equals modID, or whose name is modID.
---Source: lua/ge/extensions/core/modmanager.lua:1004
---@param modID string Repository ID or modname.
---@return string|nil  Found modname.
function core_modmanager.getModNameFromID(modID) end

--- Returns the internal table of all mods (not a copy).
---Source: lua/ge/extensions/core/modmanager.lua:1521
---@return table<string, table>  modname -> record.
function core_modmanager.getMods() end

--- Counts the mods: disabled (not active), zip (active as a file), unpacked (active as a folder).
---Source: lua/ge/extensions/core/modmanager.lua:1506
---@return table  { zip, unpacked, disabled }
function core_modmanager.getStats() end

--- Indicates whether the mod database has been initialized and the mods mounted.
---Source: lua/ge/extensions/core/modmanager.lua:1337
---@return boolean|nil  true when ready, nil before.
function core_modmanager.isReady() end

--- Indicates whether the mod is unpacked (folder in /mods/unpacked/).
---Source: lua/ge/extensions/core/modmanager.lua:1450
---@param modname string Name or path of the mod.
---@return boolean  true if unpacked.
function core_modmanager.modIsUnpacked(modname) end

--- File change hook: if a .zip appears or changes in /mods/ (excluding /mods/unpacked and mods/db.json) and auto-mount is active, calls workOffChangedMod.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/modmanager.lua:1330
---@param filename string Virtual path of the file.
---@param type string 'added', 'modified' or 'deleted'.
function core_modmanager.onFileChanged(filename, type) end

--- Hook called when the UI is ready: loads mods/db.json then runs initDB (unless mods are disabled after an update or it is already ready).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/modmanager.lua:792
function core_modmanager.onUiReady() end

--- Opens the mod's unpacked folder in the system file explorer.
---Source: lua/ge/extensions/core/modmanager.lua:163
---@param filename string Mod key (modname).
function core_modmanager.openEntryInExplorer(filename) end

--- Opens the /mods/ folder in the file explorer.
---Source: lua/ge/extensions/core/modmanager.lua:1446
function core_modmanager.openModFolderInExplorer() end

--- Recreates the zip of an unpacked mod from its folder, deletes the folder and puts the record back in zip mode.
---Source: lua/ge/extensions/core/modmanager.lua:1227
---@param dirPath string Path of the unpacked folder (e.g. '/mods/unpacked/myMod').
---@return boolean|nil  false on error; nil on success (no explicit return).
function core_modmanager.packMod(dirPath) end

--- Sends the current state to the UI: the mod list (ModManagerModsChanged), the vehicle list (ModManagerVehiclesChanged) and the level list (core_levels.requestData).
---Source: lua/ge/extensions/core/modmanager.lua:40
function core_modmanager.requestState() end

--- Extracts a zip mod to /mods/unpacked/<name>, deletes the zip, mounts the folder and updates the mod record (unpackedPath, orgZipFilename, fullpath). Shows progress in the taskbar.
---Source: lua/ge/extensions/core/modmanager.lua:1149
---@param modname string Mod key.
function core_modmanager.unpackMod(modname) end

--- Replaces a mod zip with a new file: deletes the old one (and its record) then renames the new one to the old name, in /mods/. Contains a bug (see notes).
---Source: lua/ge/extensions/core/modmanager.lua:1525
---@param oldFileName string Name of the old zip (relative to /mods/).
---@param newFileName string Name of the new zip (relative to /mods/).
function core_modmanager.updateZipMod(oldFileName, newFileName) end

--- Handles a zip added or modified in /mods/: updates the database, activates the mod if it is not disabled and tells the engine about the changed files. Refuses (and deletes the zip) if an unpacked version of the same mod exists.
---Source: lua/ge/extensions/core/modmanager.lua:1307
---@param filename string Path of the zip.
---@param type string 'added' or 'modified' to act.
function core_modmanager.workOffChangedMod(filename, type) end

