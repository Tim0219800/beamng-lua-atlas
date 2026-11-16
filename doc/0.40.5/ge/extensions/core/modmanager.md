# `core_modmanager`

*File: `lua/ge/extensions/core/modmanager.lua` · VM: Game Engine (GE) · 1609 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_modmanager`: `extensions.load("core_modmanager")`, then the global `core_modmanager`

GE extension `core_modmanager`: mod manager. At UI startup (onUiReady), it reads the mods/db.json database, scans /mods/*.zip and /mods/unpacked/*, detects the type of each mod (vehicle, terrain, app, scenario, sound, unknown), mounts them in the virtual file system, then executes the modScript.lua scripts (/scripts/**/modScript.lua and /mods_data/*/modScript.lua). It allows enabling, disabling, deleting, unpacking and repacking (pack) a mod, detects duplicates and file conflicts, and checks for updates via the server. A modder uses it to find which mod a file belongs to, list the active mods, or react to the hooks onModActivated / onModDeactivated / onModManagerReady.

## Example

```lua
-- which mod does this file belong to?
local mod = core_modmanager.getModFromPath('/vehicles/monAuto/info.json')
if mod then log('I','', mod.modname .. ' active=' .. tostring(mod.active)) end
-- react to a mod activation
function M.onModActivated(modData) log('I','','mod activated: ' .. tostring(modData.modname)) end
```

## Notes

- `mods` database: table modname -> { modname, fullpath, dirname, filename, modType, mountPoint, active, dateAdded, stat, unpackedPath, orgZipFilename, modID, modInfoPath, modData (content of mod_info/<ID>/info.json: title, tagid, hashes, attachments, icon...), valid, conflict }. modname = lowercase path without '/mods/', 'repo/', 'unpacked/', '/' or '.zip'. Saved in mods/db.json (header version 1.1, not written in safe mode) on every state change.
- Emitted hooks: onBeforeMountEntry(filename, mountPoint), onModActivated(copy of the mod's record), onModDeactivated(copy), onModManagerReady (once), onModManagerStateChanged (on every stateChanged), onModManagerModsMounted (after the modScripts). UI events: ModManagerModsChanged, ModManagerVehiclesChanged, ModManagerReady, modmanagerError, toastrMsg, checkUpdateCheckedMod, checkingUpdatesEnd.
- The modScript.lua files are launched by dofile during initialization (and when a mod is activated). During this phase, extensions.load is wrapped: a modScript that loads an extension must call setExtensionUnloadMode(ext, 'manual') otherwise a warning is logged; the extension is set to 'manual' mode anyway.
- If the disableModsAfterUpdate setting is true (automatically enabled after a game update when mods exist), initDB mounts nothing and simply signals ready. enableModsAfterUpdate() disables it and relaunches onUiReady.
- getModFromPath is flagged as 'very slow' by the code (FS:getOriginArchivePathRelative); core_levels calls it with a 2nd argument (true) which is ignored. getModFromPath returns nil for a base game file.
- The fields M.initDB and M.checkUpdate do exist (jobs wrapped by core_jobsystem.wrap); the static analysis wrongly flagged them as nil. Calling them launches an asynchronous job.
- Probable bug in unpackMod: `zipOldCopy = deepcopy(mods[filename])` is indexed by path instead of modname (so nil), and the extraction error message uses `v` out of scope (nil). The restoration `mods[modname] = zipOldCopy` then erases the mod on failure.
- Probable bug in packMod: the error messages use the variable `filename`, never defined in this function (nil).
- Bug in updateZipMod: the search loop uses `m.filename` whereas the loop variable is `md` (m is nil, runtime error if the old mod is not found by name); the log message also uses `oldFileNamex` (typo, nil).
- deleteMod / safeDelete only act on paths starting with '/mods/' and containing no '..'. deleteAllMods only deletes mods under /mods/repo/, then calls core_online.apiCall('s2/v4/modUnsubscribeAll').
- In deleteMod, the `rmMountedFilesChange` notification list is computed but never sent (onFileChanged is not called), unlike deactivateMod.
- A mod's type is inferred from its files: 'vehicle' (*.jbeam or vehicles/), 'terrain' (*.mis or main.level.json), 'app' (ui/), 'scenario' (scenarios/ without .mis), 'sound' (*.sbeam without jbeam/mis), otherwise 'unknown'. If the files are not already under vehicles/ or levels/, mountPoint is set to 'vehicles/' or 'levels/' (old format).

**Dependencies (loaded first):** `core_versionUpdate`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_modmanager.activateAllMods()` | Mounts and activates all known mods, runs their modScripts, notifies the files and updates the state. | 1070 |
| `core_modmanager.activateMod(modname)` | Activates a mod: mounts it if it is not mounted, runs its modScript.lua, marks it active, emits onModActivated, notifies the added files, loads the extensions with manual unload and updates the state. | 1023 |
| `core_modmanager.activateModId(modID)` | Like activateMod but with the mod's repository ID (tagid) or the modname. | 1061 |
| `core_modmanager.check4Update()` | Requests an update check at the next start of initDB (if the modAutoUpdates setting is active and the network is allowed). | 1486 |
| `core_modmanager.checkMod(modname)` | Checks a mod: compares the hashes of all its files with the manifest (modData.hashes) and looks in /vehicles/<name>/ for files that do not belong to the mod (conflicts). Sets mods[modname].valid and .conflict. | 268 |
| `core_modmanager.deactivateAllMods()` | Unmounts all mods, deactivates them and notifies the file changes. | 773 |
| `core_modmanager.deactivateMod(modname, preventStateChange, deferFileChanged)` | Unmounts the mod, marks it inactive (active = false), emits onModDeactivated and notifies the removed files. | 974 |
| `core_modmanager.deactivateModId(modID)` | Like deactivateMod, by repository ID (tagid) or modname. | 1014 |
| `core_modmanager.deleteAllMods()` | Deletes all mods installed from the repository (/mods/repo/) and asks the server to unsubscribe the user from all mods. | 1139 |
| `core_modmanager.deleteMod(modname)` | Unmounts then deletes the mod's file or folder (only under /mods/) and removes it from the database. | 1116 |
| `core_modmanager.disableAutoMount()` | Disables automatic mounting of zips that appear in /mods/. | 1497 |
| `core_modmanager.enableAutoMount()` | Re-enables automatic mounting and re-runs initDB to catch up on changes. | 1501 |
| `core_modmanager.enableModsAfterUpdate()` | Disables the disableModsAfterUpdate setting and initializes the mod manager. | 808 |
| `core_modmanager.getConflict(modname)` | Returns the list of conflicts computed by checkMod. | 1437 |
| `core_modmanager.getModDB(modname)` | Returns a mod's record from the database. | 1442 |
| `core_modmanager.getModForFilename(filename_virtual)` | From the real path of a virtual file, looks for the zip mod in the user folder that contains it. Does not handle unpacked mods. | 1461 |
| `core_modmanager.getModFromOriginArchivePath(originArchivePath)` | Finds a mod's record from the path of its original archive (converted to modname). | 196 |
| `core_modmanager.getModFromPath(vfsPath)` | Finds the mod that provides a virtual file, via the file's original archive. Slow: use with caution. | 202 |
| `core_modmanager.getModFromPathSUPERSLOW(vfsPath)` | Old name of getModFromPath, kept for compatibility. | 202 |
| `core_modmanager.getModNameFromID(modID)` | Looks for the modname whose tagid (repository ID) equals modID, or whose name is modID. | 1004 |
| `core_modmanager.getMods()` | Returns the internal table of all mods (not a copy). | 1521 |
| `core_modmanager.getStats()` | Counts the mods: disabled (not active), zip (active as a file), unpacked (active as a folder). | 1506 |
| `core_modmanager.isReady()` | Indicates whether the mod database has been initialized and the mods mounted. | 1337 |
| `core_modmanager.modIsUnpacked(modname)` | Indicates whether the mod is unpacked (folder in /mods/unpacked/). | 1450 |
| `core_modmanager.onFileChanged(filename, type)` | File change hook: if a .zip appears or changes in /mods/ (excluding /mods/unpacked and mods/db.json) and auto-mount is active, calls workOffChangedMod. *(internal)* *(hook)* | 1330 |
| `core_modmanager.onUiReady()` | Hook called when the UI is ready: loads mods/db.json then runs initDB (unless mods are disabled after an update or it is already ready). *(internal)* *(hook)* | 792 |
| `core_modmanager.openEntryInExplorer(filename)` | Opens the mod's unpacked folder in the system file explorer. | 163 |
| `core_modmanager.openModFolderInExplorer()` | Opens the /mods/ folder in the file explorer. | 1446 |
| `core_modmanager.packMod(dirPath)` | Recreates the zip of an unpacked mod from its folder, deletes the folder and puts the record back in zip mode. | 1227 |
| `core_modmanager.requestState()` | Sends the current state to the UI: the mod list (ModManagerModsChanged), the vehicle list (ModManagerVehiclesChanged) and the level list (core_levels.requestData). | 40 |
| `core_modmanager.unpackMod(modname)` | Extracts a zip mod to /mods/unpacked/<name>, deletes the zip, mounts the folder and updates the mod record (unpackedPath, orgZipFilename, fullpath). Shows progress in the taskbar. | 1149 |
| `core_modmanager.updateZipMod(oldFileName, newFileName)` | Replaces a mod zip with a new file: deletes the old one (and its record) then renames the new one to the old name, in /mods/. Contains a bug (see notes). | 1525 |
| `core_modmanager.workOffChangedMod(filename, type)` | Handles a zip added or modified in /mods/: updates the database, activates the mod if it is not disabled and tells the engine about the changed files. Refuses (and deletes the zip) if an unpacked version of the same mod exists. | 1307 |

### Parameter details

#### `core_modmanager.activateMod(modname)`

Activates a mod: mounts it if it is not mounted, runs its modScript.lua, marks it active, emits onModActivated, notifies the added files, loads the extensions with manual unload and updates the state.

- `modname` (*string*) : Mod key (see getMods). Unknown: log message, nothing else.

#### `core_modmanager.activateModId(modID)`

Like activateMod but with the mod's repository ID (tagid) or the modname.

- `modID` (*string*) : tagid or modname.

#### `core_modmanager.checkMod(modname)`

Checks a mod: compares the hashes of all its files with the manifest (modData.hashes) and looks in /vehicles/<name>/ for files that do not belong to the mod (conflicts). Sets mods[modname].valid and .conflict.

- `modname` (*string*) : Mod key.
- **returns**: boolean|nil true if valid and without conflict; nil if the mod is unknown.

#### `core_modmanager.deactivateMod(modname, preventStateChange, deferFileChanged)`

Unmounts the mod, marks it inactive (active = false), emits onModDeactivated and notifies the removed files.

- `modname` (*string*) : Mod key.
- `preventStateChange` (*boolean|nil*) : If true, does not update the state (stateChanged).
- `deferFileChanged` (*boolean|nil*) : If true, does not notify right away: the list is only returned.
- **returns**: table[]|nil List { filename, type = 'deleted' }, or nil if the mod does not exist.

#### `core_modmanager.deactivateModId(modID)`

Like deactivateMod, by repository ID (tagid) or modname.

- `modID` (*string*) : tagid or modname.

#### `core_modmanager.deleteMod(modname)`

Unmounts then deletes the mod's file or folder (only under /mods/) and removes it from the database.

- `modname` (*string*) : Mod key.
- **returns**: boolean|nil true if deleted, false if the deletion fails, nil if the mod does not exist.

#### `core_modmanager.getConflict(modname)`

Returns the list of conflicts computed by checkMod.

- `modname` (*string*) : Mod key.
- **returns**: table[]|nil Elements { file, path } or nil.

#### `core_modmanager.getModDB(modname)`

Returns a mod's record from the database.

- `modname` (*string*) : Mod key.
- **returns**: table|nil Mod record.

#### `core_modmanager.getModForFilename(filename_virtual)`

From the real path of a virtual file, looks for the zip mod in the user folder that contains it. Does not handle unpacked mods.

- `filename_virtual` (*string*) : Virtual path.
- **returns**: string|nil modname.
- **returns**: table|nil Mod record.

#### `core_modmanager.getModFromOriginArchivePath(originArchivePath)`

Finds a mod's record from the path of its original archive (converted to modname).

- `originArchivePath` (*string|nil*) : Path of the archive.
- **returns**: table|nil Mod record.

#### `core_modmanager.getModFromPath(vfsPath)`

Finds the mod that provides a virtual file, via the file's original archive. Slow: use with caution.

- `vfsPath` (*string*) : Virtual path (e.g. '/levels/x/info.json').
- **returns**: table|nil Mod record, nil if the file comes from the base game.

#### `core_modmanager.getModFromPathSUPERSLOW(vfsPath)`

Old name of getModFromPath, kept for compatibility.

- `vfsPath` (*string*) : Virtual path.
- **returns**: table|nil Mod record.

#### `core_modmanager.getModNameFromID(modID)`

Looks for the modname whose tagid (repository ID) equals modID, or whose name is modID.

- `modID` (*string*) : Repository ID or modname.
- **returns**: string|nil Found modname.

#### `core_modmanager.getMods()`

Returns the internal table of all mods (not a copy).

- **returns**: table<string, table> modname -> record.

#### `core_modmanager.getStats()`

Counts the mods: disabled (not active), zip (active as a file), unpacked (active as a folder).

- **returns**: table { zip, unpacked, disabled }

#### `core_modmanager.isReady()`

Indicates whether the mod database has been initialized and the mods mounted.

- **returns**: boolean|nil true when ready, nil before.

#### `core_modmanager.modIsUnpacked(modname)`

Indicates whether the mod is unpacked (folder in /mods/unpacked/).

- `modname` (*string*) : Name or path of the mod.
- **returns**: boolean true if unpacked.

#### `core_modmanager.onFileChanged(filename, type)`

File change hook: if a .zip appears or changes in /mods/ (excluding /mods/unpacked and mods/db.json) and auto-mount is active, calls workOffChangedMod.

- `filename` (*string*) : Virtual path of the file.
- `type` (*string*) : 'added', 'modified' or 'deleted'.

#### `core_modmanager.openEntryInExplorer(filename)`

Opens the mod's unpacked folder in the system file explorer.

- `filename` (*string*) : Mod key (modname).

#### `core_modmanager.packMod(dirPath)`

Recreates the zip of an unpacked mod from its folder, deletes the folder and puts the record back in zip mode.

- `dirPath` (*string*) : Path of the unpacked folder (e.g. '/mods/unpacked/myMod').
- **returns**: boolean|nil false on error; nil on success (no explicit return).

#### `core_modmanager.unpackMod(modname)`

Extracts a zip mod to /mods/unpacked/<name>, deletes the zip, mounts the folder and updates the mod record (unpackedPath, orgZipFilename, fullpath). Shows progress in the taskbar.

- `modname` (*string*) : Mod key.

#### `core_modmanager.updateZipMod(oldFileName, newFileName)`

Replaces a mod zip with a new file: deletes the old one (and its record) then renames the new one to the old name, in /mods/. Contains a bug (see notes).

- `oldFileName` (*string*) : Name of the old zip (relative to /mods/).
- `newFileName` (*string*) : Name of the new zip (relative to /mods/).

#### `core_modmanager.workOffChangedMod(filename, type)`

Handles a zip added or modified in /mods/: updates the database, activates the mod if it is not disabled and tells the engine about the changed files. Refuses (and deletes the zip) if an unpacked version of the same mod exists.

- `filename` (*string*) : Path of the zip.
- `type` (*string*) : 'added' or 'modified' to act.

## Fields

| Field | Type | Description |
|---|---|---|
| `checkUpdate` | function | Job (core_jobsystem.wrap, delay 500) that sends the mod list to the server (s2/v4/modSync) and applies the returned actions: deactivate, update, missing, 404OLD. |
| `dependencies` | string[] | { 'core_versionUpdate' }. |
| `initDB` | function | Job (core_jobsystem.wrap) that scans /mods/, mounts the mods, notifies onFileChanged, loads core_repository, triggers onModManagerReady and runs the modScripts. Called by onUiReady and enableAutoMount. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onBeforeMountEntry`
- `onModActivated` — listened to by 4 module(s)
- `onModDeactivated` — listened to by 4 module(s)
- `onModManagerModsMounted`
- `onModManagerReady` — listened to by 10 module(s)
- `onModManagerStateChanged` — listened to by 3 module(s)

**UI events (guihooks.trigger):** `ModManagerModsChanged`, `ModManagerReady`, `ModManagerVehiclesChanged`, `checkUpdateCheckedMod`, `checkingUpdatesEnd`, `modmanagerError`, `toastrMsg`

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `fileSize`, `findFiles`, `getFileRealPath`, `getGamePath`, `getOriginArchivePathRelative`, `getUserPath`, `hashFile`, `hashFileSHA1`, `isMounted`, `mount`, `mountList`, `remove`, `removeFile`, `renameFile`, `stat`, `triggerFilesChanged`, `unmount`, `unmountList`

**Loads extensions:** `core_repository`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/modmanager.lua`.*
