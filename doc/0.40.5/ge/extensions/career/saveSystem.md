# `career_saveSystem`

*File: `lua/ge/extensions/career/saveSystem.lua` · VM: Game Engine (GE) · 388 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_saveSystem`: `extensions.load("career_saveSystem")`, then the global `career_saveSystem`

Career save system. Profiles are folders of settings/cloud/saves/<profile>/; each save is a subfolder (autosave1 to autosave4 in rotation, or a chosen name) containing info.json (version, UTC date, creationDate, displayName, corrupted). saveCurrent first writes info.json as "corrupted", triggers the onSaveCurrentProfileAsyncStart then onSaveCurrentProfile(path, thumbnails) hooks so that each extension writes its files, waits for asynchronous extensions, then finalizes info.json and emits onSaveFinished.

## Example

```lua
-- in a career extension
function M.onSaveCurrentProfile(currentSavePath)
  career_saveSystem.jsonWriteFileSafe(currentSavePath .. "/career/monModule.json", data, true)
end
```

## Notes

- Format version: saveSystemVersion = 64; saves whose version is lower than backwardsCompVersion (36) are refused by setProfile (returns false).
- Four autosaves: getOldestAutosave picks the first missing one, otherwise the oldest by date.
- For an asynchronous extension: registerAsyncSaveExtension(name) during onSaveCurrentProfile, then asyncSaveExtensionFinished(name) when done; the save finalizes when all are done.
- jsonWriteFileSafe writes to a .tmp file then renames; on failure, it calls saveFailed() (which clears infoData, so the save will be reported as failed) and returns false.
- Profile names created without an existing info.json are sanitized (lowercase alphanumeric, numeric suffix if already taken); the display name keeps the original name.
- removeProfile and renameProfile do nothing (return nil) for the current profile when the career is active; renameProfile returns nil if the folder rename fails.
- onSerialize / onDeserialized keep the current profile across a Lua reload.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_saveSystem.asyncSaveExtensionFinished(extName)` | Signals that an asynchronous extension has finished; finalizes the save when all are done. | 284 |
| `career_saveSystem.getAllProfiles()` | Lists the profile names (folders of settings/cloud/saves/). | 325 |
| `career_saveSystem.getAllSaveFolders(profile)` | Lists a profile's saves (content of info.json + name field = folder name), sorted by ascending date. | 16 |
| `career_saveSystem.getBackwardsCompVersion()` | Minimum accepted save version (36). | 362 |
| `career_saveSystem.getCurrentDisplayName()` | Display name of the current profile. | 228 |
| `career_saveSystem.getCurrentProfile()` | Returns the current profile and the path of its current save. | 224 |
| `career_saveSystem.getNewestSave(path)` | Finds the most recent (non-corrupted) save folder of a profile path. | 84 |
| `career_saveSystem.getSaveRootDirectory()` | Saves root: 'settings/cloud/saves/'. | 338 |
| `career_saveSystem.getSaveSystemVersion()` | Save format version (64). | 358 |
| `career_saveSystem.jsonWriteFileSafe(filename, obj, pretty, numberPrecision, tempFileName)` | Writes a JSON via a temporary file then renames (atomic write). | 243 |
| `career_saveSystem.onDeserialized(v)` | Lua reload hook: restores the state returned by onSerialize. *(internal)* *(hook)* | 351 |
| `career_saveSystem.onExtensionLoaded()` | Load hook; does nothing. *(internal)* *(hook)* | 335 |
| `career_saveSystem.onSerialize()` | Lua reload hook: returns the current profile, path, display name and creation date. *(internal)* *(hook)* | 342 |
| `career_saveSystem.registerAsyncSaveExtension(extName)` | Declares that an extension will finish its save later (finalization is delayed). | 280 |
| `career_saveSystem.removeProfile(profile)` | Deletes a profile's folder (refused for the current profile if the career is active). | 153 |
| `career_saveSystem.removeSaveFolder(profile, saveFolderName)` | Deletes a profile's save folder, except the current save or an illegal name. | 164 |
| `career_saveSystem.renameProfile(profile, newName)` | Renames a profile's folder (refused if the new name exists, or for the current profile in an active career). | 208 |
| `career_saveSystem.saveCurrent(vehiclesThumbnailUpdate, playSuccessSound, saveName)` | Saves the career into an autosave (the oldest) or into saveName. Without a current profile, does nothing. | 291 |
| `career_saveSystem.saveFailed()` | Marks the current save as failed (clears infoData). | 239 |
| `career_saveSystem.setProfile(profile, specificSaveFolder)` | Selects the current profile (and its most recent save or a specific one). Emits onBeforeSetProfile then onSetProfile(savePath, profile). With profile = nil, deselects. | 120 |

### Parameter details

#### `career_saveSystem.asyncSaveExtensionFinished(extName)`

Signals that an asynchronous extension has finished; finalizes the save when all are done.

- `extName` (*string*) : Extension name.

#### `career_saveSystem.getAllProfiles()`

Lists the profile names (folders of settings/cloud/saves/).

- **returns**: string[] Profile names.

#### `career_saveSystem.getAllSaveFolders(profile)`

Lists a profile's saves (content of info.json + name field = folder name), sorted by ascending date.

- `profile` (*string*) : Profile name.
- **returns**: table[] List of info.json tables.

#### `career_saveSystem.getBackwardsCompVersion()`

Minimum accepted save version (36).

- **returns**: integer Version.

#### `career_saveSystem.getCurrentDisplayName()`

Display name of the current profile.

- **returns**: string|nil Displayed name.

#### `career_saveSystem.getCurrentProfile()`

Returns the current profile and the path of its current save.

- **returns**: string|nil Profile name.
- **returns**: string|nil Path of the current save folder (to use as the root of the career files).

#### `career_saveSystem.getNewestSave(path)`

Finds the most recent (non-corrupted) save folder of a profile path.

- `path` (*string*) : Profile folder.
- **returns**: string Folder path, or empty string if none.

#### `career_saveSystem.getSaveRootDirectory()`

Saves root: 'settings/cloud/saves/'.

- **returns**: string Path.

#### `career_saveSystem.getSaveSystemVersion()`

Save format version (64).

- **returns**: integer Version.

#### `career_saveSystem.jsonWriteFileSafe(filename, obj, pretty, numberPrecision, tempFileName)`

Writes a JSON via a temporary file then renames (atomic write).

- `filename` (*string*) : Target file.
- `obj` (*table*) : Data.
- `pretty` (*boolean|nil*) : Human-readable formatting.
- `numberPrecision` (*integer|nil*) : Number precision.
- `tempFileName` (*string|nil*) : Temporary file, default filename..".tmp".
- **returns**: boolean true if written.

#### `career_saveSystem.onDeserialized(v)`

Lua reload hook: restores the state returned by onSerialize.

- `v` (*table*) : Saved state.

#### `career_saveSystem.onSerialize()`

Lua reload hook: returns the current profile, path, display name and creation date.

- **returns**: table State to keep.

#### `career_saveSystem.registerAsyncSaveExtension(extName)`

Declares that an extension will finish its save later (finalization is delayed).

- `extName` (*string*) : Extension name.

#### `career_saveSystem.removeProfile(profile)`

Deletes a profile's folder (refused for the current profile if the career is active).

- `profile` (*string*) : Profile name.

#### `career_saveSystem.removeSaveFolder(profile, saveFolderName)`

Deletes a profile's save folder, except the current save or an illegal name.

- `profile` (*string*) : Profile name.
- `saveFolderName` (*string*) : Save folder name.
- **returns**: boolean true if deleted.

#### `career_saveSystem.renameProfile(profile, newName)`

Renames a profile's folder (refused if the new name exists, or for the current profile in an active career).

- `profile` (*string*) : Old name.
- `newName` (*string*) : New name.
- **returns**: boolean|nil true if renamed, false if refused, nil in other failure cases.

#### `career_saveSystem.saveCurrent(vehiclesThumbnailUpdate, playSuccessSound, saveName)`

Saves the career into an autosave (the oldest) or into saveName. Without a current profile, does nothing.

- `vehiclesThumbnailUpdate` (*any*) : Passed to extensions via onSaveCurrentProfile (e.g. list of inventoryIds whose thumbnail must be updated).
- `playSuccessSound` (*boolean|nil*) : Plays a sound on success.
- `saveName` (*string|nil*) : Name of a dedicated save instead of an autosave.

#### `career_saveSystem.setProfile(profile, specificSaveFolder)`

Selects the current profile (and its most recent save or a specific one). Emits onBeforeSetProfile then onSetProfile(savePath, profile). With profile = nil, deselects.

- `profile` (*string|nil*) : Profile name.
- `specificSaveFolder` (*string|nil*) : Name of a specific save subfolder.
- **returns**: boolean false if profile is nil or the save is too old, true otherwise.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onBeforeSetProfile` — listened to by 1 module(s)
- `onSaveCurrentProfile` — listened to by 23 module(s)
- `onSaveCurrentProfileAsyncStart` — listened to by 1 module(s)
- `onSaveFinished` — listened to by 2 module(s)
- `onSetProfile`

**UI events (guihooks.trigger):** `toastrMsg`

## Calls into the engine (C++)

- `FS:` `directoryExists`, `directoryList`, `directoryRemove`, `renameFile`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/saveSystem.lua`.*
