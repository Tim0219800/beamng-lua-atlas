# `core_audio`

*File: `lua/ge/extensions/core/audio.lua` · VM: Game Engine (GE) · 293 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_audio`: `extensions.load("core_audio")`, then the global `core_audio`

GE extension (core_audio) that loads the game's FMOD banks. On the first update, it scans /art/sound/fmod/<platform> (and the mods subfolder, plus the _headphones folder if headphone mode is enabled), groups the .bank files into bank sets (assets/strings/streams/meta), sorts them (strings first, then 'preload', then by size) and creates an SFXFMODProject per set. It also handles hot-reloading of banks and the FMOD parameter g_GamePause. A modder uses it to register a bank or force a reload.

## Example

```lua
core_audio.registerBaseBank('/art/sound/fmod/monmod/macollection.bank')
core_audio.triggerBankHotloading()
```

## Notes

- Bug: in registerBaseBank, the variable is declared `inLevelOrLoadingOrLoading` but tested under the name `inLevelOrLoading` (nil global): the "not during a level or loading" guard never has any effect.
- In registerBaseBank, paths are lowercased and prefixed with '/'; before the first load they are remembered in registeredBanks, but the loop that used them (loadBankSets) is commented out: these banks are then never loaded through this list. After init, the bank is loaded immediately via SFXFMODProject.loadBaseBank (only once thanks to loadedBankCache).
- Hot reload: onFilesChanged marks any modified .bank bank as not loaded and only triggers triggerBankHotloading when all known banks are marked as not loaded (waits for the end of the rebuild).
- The fields M.keepLoadedBanks and M.prevReplayState/M.prevReplayPaused are created dynamically (not declared in the module at load time).
- Pause: onPhysicsPaused / onPhysicsUnpaused set the global FMOD parameter g_GamePause to 1 / 0; onReplayStateChanged updates it from simTimeAuthority.getPause().

## Functions

| Function | Description | Line |
|---|---|---|
| `core_audio.onClientEndMission()` | Hook called at the end of a level. Does nothing (empty body, with a comment). *(internal)* *(hook)* | 173 |
| `core_audio.onClientPreStartMission(levelPath)` | Hook called before a level starts. Only adds profiler events (level bank loading is commented out). *(internal)* *(hook)* | 165 |
| `core_audio.onDeserialized(data)` | Restore hook after a Lua reload. *(internal)* *(hook)* | 249 |
| `core_audio.onFilesChanged(files)` | Hook called when watched files change: handles hot reloading of .bank files (see notes). *(internal)* *(hook)* | 210 |
| `core_audio.onFirstUpdate()` | Hook called on the GE's first update: scans and loads the banks (populateBankSets then loadBankSets), unless keepLoadedBanks is true (Lua reload: nothing is done). *(internal)* *(hook)* | 150 |
| `core_audio.onPhysicsPaused()` | Hook called when physics is paused: SFXSystem.setGlobalParameter('g_GamePause', 1). *(internal)* *(hook)* | 255 |
| `core_audio.onPhysicsUnpaused()` | Hook called when physics resumes: g_GamePause = 0. *(internal)* *(hook)* | 259 |
| `core_audio.onReplayStateChanged(newState)` | Hook called when the replay state changes: sets g_GamePause according to simTimeAuthority.getPause(), only if state or paused changed since last time. *(internal)* *(hook)* | 263 |
| `core_audio.onSerialize()` | Serialization hook before a Lua reload: returns keepLoadedBanks=true, levelProjectsCache and loadedBankCache. *(internal)* *(hook)* | 241 |
| `core_audio.registerBaseBank(path)` | Registers a base FMOD bank (see notes for the behavior before/after initialization). | 15 |
| `core_audio.triggerBankHotloading()` | Deletes the created FMOD projects, clears the caches, notifies SFXFMODProject (hotloadingTriggered), rescans and reloads all banks then signals completion (hotloadingCompleted). | 188 |

### Parameter details

#### `core_audio.onClientPreStartMission(levelPath)`

Hook called before a level starts. Only adds profiler events (level bank loading is commented out).

- `levelPath` (*string*) : Level path

#### `core_audio.onDeserialized(data)`

Restore hook after a Lua reload.

- `data` (*table*) : Table returned by onSerialize

#### `core_audio.onFilesChanged(files)`

Hook called when watched files change: handles hot reloading of .bank files (see notes).

- `files` (*table<integer, table>*) : List of entries with the filename field (without leading '/')

#### `core_audio.onReplayStateChanged(newState)`

Hook called when the replay state changes: sets g_GamePause according to simTimeAuthority.getPause(), only if state or paused changed since last time.

- `newState` (*table*) : Table with the fields state and paused

#### `core_audio.onSerialize()`

Serialization hook before a Lua reload: returns keepLoadedBanks=true, levelProjectsCache and loadedBankCache.

- **returns**: table {keepLoadedBanks, levelProjectsCache, loadedBankCache}

#### `core_audio.registerBaseBank(path)`

Registers a base FMOD bank (see notes for the behavior before/after initialization).

- `path` (*string*) : Path of the .bank file, with or without a leading '/' (lowercased)

## Calls into the engine (C++)

- `FS:` `findFiles`, `stat`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/audio.lua`.*
