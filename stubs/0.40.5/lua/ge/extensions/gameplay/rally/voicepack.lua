---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/voicepack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Stateless module that manages the rally co-driver "voicepacks": voice packages (.ogg audio + metadata.json + voicepack.json) located either globally (`/lua/ge/extensions/gameplay/rally/compositors/voicepacks/<dirname>/`) or in a mission (`<missionDir>/rally/voicepacks/<dirname>/`). It provides the file paths, reading and caching of the inventory (scan), choosing a voicepack from a "pick" or from the preferences (MRU list of the most recently used, stored in the `rallyCodriverVoicepackMRU` setting), resolution of a mission's notebook, the audio candidates (variants) of a note, and building the dropdown-type user settings (key `rallyVoicepackPick`) for stages and loops.
--- Access: extension `gameplay_rally_voicepack`: `extensions.load("gameplay_rally_voicepack")`, then the global `gameplay_rally_voicepack`
---@class gameplay_rally_voicepack
---@field audioSubdir string 'audio': subfolder of the .ogg files.
---@field defaultVoicepackId string 'global:ak_2026-04-16': first MRU element if it is empty.
---@field globalDir string '/lua/ge/extensions/gameplay/rally/compositors/voicepacks/': folder of the global voicepacks (with trailing `/`).
---@field infoBasename string 'voicepack.json'.
---@field missionSubdir string 'rally/voicepacks': subfolder of a mission's voicepacks.
---@field mruLimit integer 10: maximum size of the MRU.
gameplay_rally_voicepack = {}

--- Adds to the MRU the voicepack chosen for a loop: directly for a 'voicepack' pick, or the one from the first stage where the family is found.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:1059
---@param missionTypeData table Loop mission data (stageN_rallyStage).
---@param value string|nil Setting value.
function gameplay_rally_voicepack.addLoopMissionSettingToMRU(missionTypeData, value) end

--- Puts a voicepack at the head of the MRU (no duplicates, limit 10) and saves the setting. Resolves the entry via resolveEntry if a full entry is not given.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:1164
---@param entryOrPick table Entry or pick.
---@param missionDir string|nil Mission folder.
---@param missionId string|nil Mission id.
function gameplay_rally_voicepack.addToMRU(entryOrPick, missionDir, missionId) end

--- Builds the user setting (dropdown) for the voicepack of a loop: global voicepacks, plus the mission voicepack families common to all stages of the loop. Selection: current value, otherwise first MRU match, otherwise first item.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:1094
---@param missionTypeData table Loop data.
---@param currentValue string|nil Current value.
---@return table|nil  {key = 'rallyVoicepackPick', label, type = 'select', values = {{l, v, shortLabel, detail}}, value, currentOption}; nil if there are no entries.
function gameplay_rally_voicepack.buildLoopMissionUserSetting(missionTypeData, currentValue) end

--- Builds the user setting (dropdown) for the voicepack of a stage: "Resolve from Settings" then each available voicepack. Selection: current value, otherwise voicepack resolved by preferences, otherwise first item.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:1213
---@param missionDir string Mission folder.
---@param missionId string Mission id.
---@param currentValue string|nil Current value.
---@return table|nil  Same structure as buildLoopMissionUserSetting; nil if there are no entries.
function gameplay_rally_voicepack.buildMissionUserSetting(missionDir, missionId, currentValue) end

--- Builds the entries of a voicepack selector for a mission: optionally "Resolve from Settings" at the top (includePreferences), then each available voicepack with its label and pick.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:871
---@param missionDir string|nil Mission folder.
---@param opts table|nil {includePreferences, includeAuto, missionId, missionSuffix, globalOnly, requireMissionNotebook}.
---@return table[]  List of {label, entry, pick}.
function gameplay_rally_voicepack.buildPickerEntries(missionDir, opts) end

--- Picks a candidate at random (math.random).
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:197
---@param candidates table[] List of candidates.
---@return table|nil  Candidate, nil if the list is empty.
function gameplay_rally_voicepack.chooseAudioCandidate(candidates) end

--- If the MRU is empty, puts defaultVoicepackId in it. Does nothing with opts.writeSettings == false.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:714
---@param opts table|nil {writeSettings}.
function gameplay_rally_voicepack.ensureSettingsInitialized(opts) end

--- Lists the audio variants of a note from metadata. Without allowedVariants, takes all the indexed variants (`<stem>.ogg` = variant 1 and `<stem>_<n>.ogg`). With allowedVariants, takes only those. Result sorted by variant then by name.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:142
---@param metadata table Table basename -> metadata (content of metadata.json), with audioLen.
---@param basename string Base name of the note (with or without .ogg).
---@param pathForBasename function|nil Function basename -> path; otherwise fname = basename.
---@param allowedVariants integer[]|nil Allowed variant numbers.
---@return table[]  List of {basename, fname, audioLen, metadata, variantIndex}.
function gameplay_rally_voicepack.getAudioCandidates(metadata, basename, pathForBasename, allowedVariants) end

--- getAudioCandidates with the paths resolved by getEntryAudioFile.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:185
---@param entry table Voicepack entry.
---@param metadata table Audio metadata.
---@param basename string Base name.
---@param allowedVariants integer[]|nil Allowed variants.
---@return table[]  Candidates.
function gameplay_rally_voicepack.getAudioCandidatesForEntry(entry, metadata, basename, allowedVariants) end

--- getAudioCandidates with the paths of a global voicepack (getAudioFile).
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:191
---@param voicepack string Voicepack folder.
---@param metadata table Audio metadata.
---@param basename string Base name.
---@param allowedVariants integer[]|nil Allowed variants.
---@return table[]  Candidates.
function gameplay_rally_voicepack.getAudioCandidatesForVoicepack(voicepack, metadata, basename, allowedVariants) end

--- Path of an audio file of a global voicepack (under audio/).
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:38
---@param voicepack string Voicepack folder name.
---@param basename string Audio file name.
---@return string  Path.
function gameplay_rally_voicepack.getAudioFile(voicepack, basename) end

--- Compatibility with the old system: language, persona and styleLabel of the global voicepack resolved by the preferences.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:849
---@return string|nil  Language.
---@return string|nil  Persona.
---@return string|nil  styleLabel.
function gameplay_rally_voicepack.getCascadeKeys() end

--- Entry folder followed by those of its audio sources.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:480
---@param entry table|nil Entry.
---@return string[]  Folders.
function gameplay_rally_voicepack.getEntryAssetDirs(entry) end

--- Path of an entry's audio file: first its own folder, then those of the reuseAudioFrom voicepacks. If the file exists nowhere, returns the local path (if the audio folder exists) or the first source path.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:46
---@param entry table Voicepack entry (from scan/scanMission).
---@param basename string Audio file name.
---@return string|nil  Path, nil if entry or basename is missing.
function gameplay_rally_voicepack.getEntryAudioFile(entry, basename) end

--- Global entries whose audio is reused (reuseAudioFrom), read once then cached in entry.audioSourceEntries. Ignores duplicates, itself and invalid dirnames (with a warning).
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:452
---@param entry table|nil Entry.
---@return table[]  Source entries.
function gameplay_rally_voicepack.getEntryAudioSourceEntries(entry) end

--- Merges the metadata.json of the entry then of its sources (the first value of a basename wins), with cache in entry._mergedAudioMetadata.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:504
---@param entry table|nil Entry.
---@return table  Table basename -> metadata.
function gameplay_rally_voicepack.getEntryMetadata(entry) end

--- Path of the entry's metadata.json, or of the first source that has one.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:490
---@param entry table|nil Entry.
---@return string|nil  Path.
function gameplay_rally_voicepack.getEntryMetadataFile(entry) end

--- Audio path of a system note for an entry (with reuseAudioFrom fallback).
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:210
---@param entry table Voicepack entry.
---@param systemKey string System note key.
---@param variantIndex integer|nil Variant.
---@return string|nil  Path.
function gameplay_rally_voicepack.getEntrySystemPacenoteFile(entry, systemKey, variantIndex) end

--- Path of a file of a global voicepack.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:34
---@param voicepack string Voicepack folder name.
---@param basename string File name.
---@return string  Full path.
function gameplay_rally_voicepack.getFile(voicepack, basename) end

--- Reads the voicepack.json of a global voicepack (raw, without validation).
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:218
---@param voicepack string Voicepack folder.
---@return table|nil  JSON content, nil if absent.
function gameplay_rally_voicepack.getInfo(voicepack) end

--- Declared language of a global voicepack.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:226
---@param voicepack string Voicepack folder.
---@return string|nil  Language.
function gameplay_rally_voicepack.getLanguage(voicepack) end

--- Path of the metadata.json of a global voicepack.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:214
---@param voicepack string Voicepack folder.
---@return string  Path.
function gameplay_rally_voicepack.getMetadataFile(voicepack) end

--- Audio path of a note by its hash in a global voicepack.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:202
---@param voicepack string Voicepack folder.
---@param pacenoteHash string Note hash.
---@return string  Path.
function gameplay_rally_voicepack.getPacenoteFile(voicepack, pacenoteHash) end

--- `styles` field of the voicepack.json of a global voicepack.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:232
---@param voicepack string Voicepack folder.
---@return table  Styles, empty table if absent.
function gameplay_rally_voicepack.getStyles(voicepack) end

--- Audio path of a system note in a global voicepack.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:206
---@param voicepack string Voicepack folder.
---@param systemKey string System note key.
---@param variantIndex integer|nil Variant; default 1.
---@return string  Path.
function gameplay_rally_voicepack.getSystemPacenoteFile(voicepack, systemKey, variantIndex) end

--- Reads the MRU list (setting rallyCodriverVoicepackMRU, CSV or old JSON).
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:331
---@return string[]  Ids, from most recent to oldest.
function gameplay_rally_voicepack.getVoicepackMRU() end

--- Dev/test hook: forgets the global inventory to force a new scan. Preference changes must not call it.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:246
function gameplay_rally_voicepack.invalidateCache() end

--- Forgets the inventory cache of a mission (or of all if missionDir is nil).
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:255
---@param missionDir string|nil Mission folder.
function gameplay_rally_voicepack.invalidateMissionCache(missionDir) end

--- Display label "persona [(dialect)] - style [suffix]".
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:704
---@param entry table Entry.
---@param dirname string Fallback for the persona.
---@param suffix string|nil Suffix added (e.g. '(mission)').
---@return string  Label.
function gameplay_rally_voicepack.labelForEntry(entry, dirname, suffix) end

--- List sorted by label of the available entries: global ones and, if missionDir is given, those of the mission. Filtered by enableAnimalCodrivers and, by default, by the presence of a candidate notebook in the mission.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:629
---@param missionDir string|nil Mission folder.
---@param opts table|nil {missionId, globalOnly, requireMissionNotebook}.
---@return table[]  Entries.
function gameplay_rally_voicepack.listInventory(missionDir, opts) end

--- Like resolveMissionNotebook but returns all the candidate notebook names (without suffix) that exist in the mission, in order of preference.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:687
---@param missionDir string|nil Mission folder.
---@param vpInfo table|nil Voicepack entry.
---@return string[]  Notebook names.
function gameplay_rally_voicepack.listMissionNotebookCandidates(missionDir, vpInfo) end

--- Builds the id of a voicepack: 'global:<dirname>', 'mission:<missionId>:<dirname>' or 'mission:<dirname>'.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:270
---@param scope string 'global' or 'mission'.
---@param dirname string Folder name.
---@param missionId string|nil Mission id (mission scope).
---@return string  Id.
function gameplay_rally_voicepack.makeId(scope, dirname, missionId) end

--- Folder of a mission's voicepacks: <missionDir>/rally/voicepacks.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:549
---@param missionDir string|nil Mission folder.
---@return string|nil  Path.
function gameplay_rally_voicepack.missionFullDir(missionDir) end

--- Names of notebooks that can be loaded in the mission for a 'voicepack' type pick.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:1140
---@param missionDir string Mission folder.
---@param pick table|nil Pick.
---@return string[]  Names without suffix; empty otherwise.
function gameplay_rally_voicepack.notebookBasenamesForPick(missionDir, pick) end

--- Decomposes an id into {scope, dirname, missionId}.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:277
---@param id string Id.
---@return table|nil  Parts, nil if the format is invalid.
function gameplay_rally_voicepack.parseId(id) end

--- Converts a setting value into a pick: '', 'preferences', 'auto' give {type='preferences'}; 'loop:<key>' gives a loopVoicepack; a valid id gives a voicepack; anything else falls back to preferences.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:1183
---@param value string|nil Setting value.
---@return table  Pick.
function gameplay_rally_voicepack.pickFromSettingValue(value) end

--- Compares two picks: same type; 'preferences' (or 'auto') are equal to each other; otherwise same id, or same dirname with compatible scope and missionId.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:1150
---@param a table|nil First pick.
---@param b table|nil Second pick.
---@return boolean  true if equivalent.
function gameplay_rally_voicepack.picksMatch(a, b) end

--- Resolves the voicepack to use. Pick of type 'voicepack': exact match in the inventory, otherwise fallback to the preferences ('invalidExactFallback' mode). Other pick or nil: preferences (MRU then detail level).
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:798
---@param missionDir string|nil Mission folder.
---@param pick table|nil Pick.
---@param opts table|nil {missionId, globalOnly, requireMissionNotebook, writeSettings}.
---@return table  {entry, dirname, reason, mode, detail, candidates}.
function gameplay_rally_voicepack.resolve(missionDir, pick, opts) end

--- First global voicepack matching a language, a persona and a styleLabel (each criterion optional). The order is undefined (pairs).
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:617
---@param language string|nil Language.
---@param persona string|nil Persona.
---@param styleLabel string|nil Style.
---@return string|nil  dirname.
---@return table|nil  Entry.
function gameplay_rally_voicepack.resolveDir(language, persona, styleLabel) end

--- Resolves a pick ('auto' is equivalent to 'preferences'; nil = preferences).
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:859
---@param missionDir string|nil Mission folder.
---@param pick table|nil Pick.
---@param opts table|nil See resolve.
---@return string|nil  dirname.
---@return table|nil  Entry.
---@return table  Full result of resolve.
function gameplay_rally_voicepack.resolveEffectiveEntry(missionDir, pick, opts) end

--- Finds the entry of a pick (or an id): the mission index for scope 'mission', the global index otherwise.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:601
---@param missionDir string|nil Mission folder.
---@param pick table|string Pick or id.
---@param missionId string|nil Mission id.
---@return table|nil  Entry.
---@return string|nil  dirname.
function gameplay_rally_voicepack.resolveEntry(missionDir, pick, missionId) end

--- Voicepack entry matching a loop setting value.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:1077
---@param missionTypeData table Loop data.
---@param value string|nil Setting value.
---@return table|nil  Entry, nil for preferences or if not found.
function gameplay_rally_voicepack.resolveLoopMissionSettingEntry(missionTypeData, value) end

--- Turns a loop setting value into a concrete pick for a mission: a 'voicepack' pick is kept; a 'loopVoicepack' pick is looked up by family in the mission's voicepacks.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:1049
---@param missionDir string Mission folder.
---@param missionId string Mission id.
---@param value string Setting value.
---@return table|nil  Concrete pick, nil for preferences or if not found.
function gameplay_rally_voicepack.resolveLoopVoicepackPick(missionDir, missionId, value) end

--- Path of the first notebook declared by the voicepack (vpInfo.notebooks) that exists in the mission.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:673
---@param missionDir string|nil Mission folder.
---@param vpInfo table|nil Voicepack entry or info with `notebooks`.
---@return string|nil  Path <missionDir>/rally/notebooks/<name>.notebook.json.
function gameplay_rally_voicepack.resolveMissionNotebook(missionDir, vpInfo) end

--- Scans the global voicepacks (excluding `_` folders) and returns the dirname -> entry index, cached.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:530
---@return table<string, table>  Index of the global entries.
function gameplay_rally_voicepack.scan() end

--- Scans a mission's voicepacks (with cache).
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:554
---@param missionDir string Mission folder.
---@param missionId string|nil Mission id (part of the cache key and of the entries' id).
---@return table<string, table>  Index dirname -> entry.
function gameplay_rally_voicepack.scanMission(missionDir, missionId) end

--- Inverse operation of pickFromSettingValue.
---Source: lua/ge/extensions/gameplay/rally/voicepack.lua:1203
---@param pick table|nil Pick.
---@return string  Setting value.
function gameplay_rally_voicepack.settingValueForPick(pick) end

