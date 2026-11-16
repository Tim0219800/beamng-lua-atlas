---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/audio.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension (core_audio) that loads the game's FMOD banks. On the first update, it scans /art/sound/fmod/<platform> (and the mods subfolder, plus the _headphones folder if headphone mode is enabled), groups the .bank files into bank sets (assets/strings/streams/meta), sorts them (strings first, then 'preload', then by size) and creates an SFXFMODProject per set. It also handles hot-reloading of banks and the FMOD parameter g_GamePause. A modder uses it to register a bank or force a reload.
--- Access: extension `core_audio`: `extensions.load("core_audio")`, then the global `core_audio`
---@class core_audio
core_audio = {}

--- Hook called at the end of a level. Does nothing (empty body, with a comment).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audio.lua:173
function core_audio.onClientEndMission() end

--- Hook called before a level starts. Only adds profiler events (level bank loading is commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audio.lua:165
---@param levelPath string Level path
function core_audio.onClientPreStartMission(levelPath) end

--- Restore hook after a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audio.lua:249
---@param data table Table returned by onSerialize
function core_audio.onDeserialized(data) end

--- Hook called when watched files change: handles hot reloading of .bank files (see notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audio.lua:210
---@param files table<integer, table> List of entries with the filename field (without leading '/')
function core_audio.onFilesChanged(files) end

--- Hook called on the GE's first update: scans and loads the banks (populateBankSets then loadBankSets), unless keepLoadedBanks is true (Lua reload: nothing is done).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audio.lua:150
function core_audio.onFirstUpdate() end

--- Hook called when physics is paused: SFXSystem.setGlobalParameter('g_GamePause', 1).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audio.lua:255
function core_audio.onPhysicsPaused() end

--- Hook called when physics resumes: g_GamePause = 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audio.lua:259
function core_audio.onPhysicsUnpaused() end

--- Hook called when the replay state changes: sets g_GamePause according to simTimeAuthority.getPause(), only if state or paused changed since last time.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audio.lua:263
---@param newState table Table with the fields state and paused
function core_audio.onReplayStateChanged(newState) end

--- Serialization hook before a Lua reload: returns keepLoadedBanks=true, levelProjectsCache and loadedBankCache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audio.lua:241
---@return table  {keepLoadedBanks, levelProjectsCache, loadedBankCache}
function core_audio.onSerialize() end

--- Registers a base FMOD bank (see notes for the behavior before/after initialization).
---Source: lua/ge/extensions/core/audio.lua:15
---@param path string Path of the .bank file, with or without a leading '/' (lowercased)
function core_audio.registerBaseBank(path) end

--- Deletes the created FMOD projects, clears the caches, notifies SFXFMODProject (hotloadingTriggered), rescans and reloads all banks then signals completion (hotloadingCompleted).
---Source: lua/ge/extensions/core/audio.lua:188
function core_audio.triggerBankHotloading() end

