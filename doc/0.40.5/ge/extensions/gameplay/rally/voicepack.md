# `gameplay_rally_voicepack`

*File: `lua/ge/extensions/gameplay/rally/voicepack.lua` · VM: Game Engine (GE) · 1266 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_voicepack`: `extensions.load("gameplay_rally_voicepack")`, then the global `gameplay_rally_voicepack`

Stateless module that manages the rally co-driver "voicepacks": voice packages (.ogg audio + metadata.json + voicepack.json) located either globally (`/lua/ge/extensions/gameplay/rally/compositors/voicepacks/<dirname>/`) or in a mission (`<missionDir>/rally/voicepacks/<dirname>/`). It provides the file paths, reading and caching of the inventory (scan), choosing a voicepack from a "pick" or from the preferences (MRU list of the most recently used, stored in the `rallyCodriverVoicepackMRU` setting), resolution of a mission's notebook, the audio candidates (variants) of a note, and building the dropdown-type user settings (key `rallyVoicepackPick`) for stages and loops.

## Example

```lua
local vp = require('/lua/ge/extensions/gameplay/rally/voicepack')
local dirname, entry, result = vp.resolveEffectiveEntry(missionDir, {type = 'preferences'}, {missionId = missionId})
if entry then print(entry.label, vp.getEntryAudioFile(entry, 'pacenote_123.ogg')) end
```

## Notes

- Ids: 'global:<dirname>' or 'mission:<missionId>:<dirname>' (makeId/parseId). Default value: 'global:ak_2026-04-16'. The MRU is a CSV list of ids, limited to 10.
- A pick is a table {type = 'preferences'|'auto'|'voicepack'|'loopVoicepack', id, scope, missionId, dirname, familyKey}. Setting value: '' for preferences, the id for a voicepack, 'loop:<familyKey>' for a loop.
- The info file is called voicepack.json (and not info.json, because the mission system treats any info.json as a mission). It must contain persona, language, styleLabel and notebooks (non-empty list) otherwise the voicepack is ignored. Optional fields: dialect, compositorStyle, styleDetailLevel, enableAnimalCodrivers, enableSpeedScaling (default true in global), codriverTimingOffsetSeconds (default 0 in global, 0.2 in mission), reuseAudioFrom (list of global dirnames whose audio and metadata to reuse), cornerGapMs, phraseGapMs, linkWordGapMs, pacenoteGapMs.
- Folders starting with `_` are hidden from the scan. Voicepacks with enableAnimalCodrivers == false are excluded from the inventory.
- The global scan is cached for the whole lifetime of the module (invalidateCache is reserved for dev/test); the mission scan is cached per missionDir|missionId pair.
- By default, listInventory excludes the voicepacks for which no candidate notebook exists in the mission (requireMissionNotebook ~= false).
- Resolution order by preferences: MRU (exact id match, otherwise scope + dirname, for each MRU entry in order), then fallback to the smallest styleDetailLevel and the alphabetical order of the label.
- resolveDir walks the table with pairs(): the order is undefined if several voicepacks match.
- resolveLoopMissionSettingEntry returns nil for a 'preferences' pick.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_voicepack.addLoopMissionSettingToMRU(missionTypeData, value)` | Adds to the MRU the voicepack chosen for a loop: directly for a 'voicepack' pick, or the one from the first stage where the family is found. | 1059 |
| `gameplay_rally_voicepack.addToMRU(entryOrPick, missionDir, missionId)` | Puts a voicepack at the head of the MRU (no duplicates, limit 10) and saves the setting. Resolves the entry via resolveEntry if a full entry is not given. | 1164 |
| `gameplay_rally_voicepack.buildLoopMissionUserSetting(missionTypeData, currentValue)` | Builds the user setting (dropdown) for the voicepack of a loop: global voicepacks, plus the mission voicepack families common to all stages of the loop. Selection: current value, otherwise first MRU match, otherwise first item. | 1094 |
| `gameplay_rally_voicepack.buildMissionUserSetting(missionDir, missionId, currentValue)` | Builds the user setting (dropdown) for the voicepack of a stage: "Resolve from Settings" then each available voicepack. Selection: current value, otherwise voicepack resolved by preferences, otherwise first item. | 1213 |
| `gameplay_rally_voicepack.buildPickerEntries(missionDir, opts)` | Builds the entries of a voicepack selector for a mission: optionally "Resolve from Settings" at the top (includePreferences), then each available voicepack with its label and pick. | 871 |
| `gameplay_rally_voicepack.chooseAudioCandidate(candidates)` | Picks a candidate at random (math.random). | 197 |
| `gameplay_rally_voicepack.ensureSettingsInitialized(opts)` | If the MRU is empty, puts defaultVoicepackId in it. Does nothing with opts.writeSettings == false. | 714 |
| `gameplay_rally_voicepack.getAudioCandidates(metadata, basename, pathForBasename, allowedVariants)` | Lists the audio variants of a note from metadata. Without allowedVariants, takes all the indexed variants (`<stem>.ogg` = variant 1 and `<stem>_<n>.ogg`). With allowedVariants, takes only those. Result sorted by variant then by name. | 142 |
| `gameplay_rally_voicepack.getAudioCandidatesForEntry(entry, metadata, basename, allowedVariants)` | getAudioCandidates with the paths resolved by getEntryAudioFile. | 185 |
| `gameplay_rally_voicepack.getAudioCandidatesForVoicepack(voicepack, metadata, basename, allowedVariants)` | getAudioCandidates with the paths of a global voicepack (getAudioFile). | 191 |
| `gameplay_rally_voicepack.getAudioFile(voicepack, basename)` | Path of an audio file of a global voicepack (under audio/). | 38 |
| `gameplay_rally_voicepack.getCascadeKeys()` | Compatibility with the old system: language, persona and styleLabel of the global voicepack resolved by the preferences. | 849 |
| `gameplay_rally_voicepack.getEntryAssetDirs(entry)` | Entry folder followed by those of its audio sources. | 480 |
| `gameplay_rally_voicepack.getEntryAudioFile(entry, basename)` | Path of an entry's audio file: first its own folder, then those of the reuseAudioFrom voicepacks. If the file exists nowhere, returns the local path (if the audio folder exists) or the first source path. | 46 |
| `gameplay_rally_voicepack.getEntryAudioSourceEntries(entry)` | Global entries whose audio is reused (reuseAudioFrom), read once then cached in entry.audioSourceEntries. Ignores duplicates, itself and invalid dirnames (with a warning). | 452 |
| `gameplay_rally_voicepack.getEntryMetadata(entry)` | Merges the metadata.json of the entry then of its sources (the first value of a basename wins), with cache in entry._mergedAudioMetadata. | 504 |
| `gameplay_rally_voicepack.getEntryMetadataFile(entry)` | Path of the entry's metadata.json, or of the first source that has one. | 490 |
| `gameplay_rally_voicepack.getEntrySystemPacenoteFile(entry, systemKey, variantIndex)` | Audio path of a system note for an entry (with reuseAudioFrom fallback). | 210 |
| `gameplay_rally_voicepack.getFile(voicepack, basename)` | Path of a file of a global voicepack. | 34 |
| `gameplay_rally_voicepack.getInfo(voicepack)` | Reads the voicepack.json of a global voicepack (raw, without validation). | 218 |
| `gameplay_rally_voicepack.getLanguage(voicepack)` | Declared language of a global voicepack. | 226 |
| `gameplay_rally_voicepack.getMetadataFile(voicepack)` | Path of the metadata.json of a global voicepack. | 214 |
| `gameplay_rally_voicepack.getPacenoteFile(voicepack, pacenoteHash)` | Audio path of a note by its hash in a global voicepack. | 202 |
| `gameplay_rally_voicepack.getStyles(voicepack)` | `styles` field of the voicepack.json of a global voicepack. | 232 |
| `gameplay_rally_voicepack.getSystemPacenoteFile(voicepack, systemKey, variantIndex)` | Audio path of a system note in a global voicepack. | 206 |
| `gameplay_rally_voicepack.getVoicepackMRU()` | Reads the MRU list (setting rallyCodriverVoicepackMRU, CSV or old JSON). | 331 |
| `gameplay_rally_voicepack.invalidateCache()` | Dev/test hook: forgets the global inventory to force a new scan. Preference changes must not call it. | 246 |
| `gameplay_rally_voicepack.invalidateMissionCache(missionDir)` | Forgets the inventory cache of a mission (or of all if missionDir is nil). | 255 |
| `gameplay_rally_voicepack.labelForEntry(entry, dirname, suffix)` | Display label "persona [(dialect)] - style [suffix]". | 704 |
| `gameplay_rally_voicepack.listInventory(missionDir, opts)` | List sorted by label of the available entries: global ones and, if missionDir is given, those of the mission. Filtered by enableAnimalCodrivers and, by default, by the presence of a candidate notebook in the mission. | 629 |
| `gameplay_rally_voicepack.listMissionNotebookCandidates(missionDir, vpInfo)` | Like resolveMissionNotebook but returns all the candidate notebook names (without suffix) that exist in the mission, in order of preference. | 687 |
| `gameplay_rally_voicepack.makeId(scope, dirname, missionId)` | Builds the id of a voicepack: 'global:<dirname>', 'mission:<missionId>:<dirname>' or 'mission:<dirname>'. | 270 |
| `gameplay_rally_voicepack.missionFullDir(missionDir)` | Folder of a mission's voicepacks: <missionDir>/rally/voicepacks. | 549 |
| `gameplay_rally_voicepack.notebookBasenamesForPick(missionDir, pick)` | Names of notebooks that can be loaded in the mission for a 'voicepack' type pick. | 1140 |
| `gameplay_rally_voicepack.parseId(id)` | Decomposes an id into {scope, dirname, missionId}. | 277 |
| `gameplay_rally_voicepack.pickFromSettingValue(value)` | Converts a setting value into a pick: '', 'preferences', 'auto' give {type='preferences'}; 'loop:<key>' gives a loopVoicepack; a valid id gives a voicepack; anything else falls back to preferences. | 1183 |
| `gameplay_rally_voicepack.picksMatch(a, b)` | Compares two picks: same type; 'preferences' (or 'auto') are equal to each other; otherwise same id, or same dirname with compatible scope and missionId. | 1150 |
| `gameplay_rally_voicepack.resolve(missionDir, pick, opts)` | Resolves the voicepack to use. Pick of type 'voicepack': exact match in the inventory, otherwise fallback to the preferences ('invalidExactFallback' mode). Other pick or nil: preferences (MRU then detail level). | 798 |
| `gameplay_rally_voicepack.resolveDir(language, persona, styleLabel)` | First global voicepack matching a language, a persona and a styleLabel (each criterion optional). The order is undefined (pairs). | 617 |
| `gameplay_rally_voicepack.resolveEffectiveEntry(missionDir, pick, opts)` | Resolves a pick ('auto' is equivalent to 'preferences'; nil = preferences). | 859 |
| `gameplay_rally_voicepack.resolveEntry(missionDir, pick, missionId)` | Finds the entry of a pick (or an id): the mission index for scope 'mission', the global index otherwise. | 601 |
| `gameplay_rally_voicepack.resolveLoopMissionSettingEntry(missionTypeData, value)` | Voicepack entry matching a loop setting value. | 1077 |
| `gameplay_rally_voicepack.resolveLoopVoicepackPick(missionDir, missionId, value)` | Turns a loop setting value into a concrete pick for a mission: a 'voicepack' pick is kept; a 'loopVoicepack' pick is looked up by family in the mission's voicepacks. | 1049 |
| `gameplay_rally_voicepack.resolveMissionNotebook(missionDir, vpInfo)` | Path of the first notebook declared by the voicepack (vpInfo.notebooks) that exists in the mission. | 673 |
| `gameplay_rally_voicepack.scan()` | Scans the global voicepacks (excluding `_` folders) and returns the dirname -> entry index, cached. | 530 |
| `gameplay_rally_voicepack.scanMission(missionDir, missionId)` | Scans a mission's voicepacks (with cache). | 554 |
| `gameplay_rally_voicepack.settingValueForPick(pick)` | Inverse operation of pickFromSettingValue. | 1203 |

### Parameter details

#### `gameplay_rally_voicepack.addLoopMissionSettingToMRU(missionTypeData, value)`

Adds to the MRU the voicepack chosen for a loop: directly for a 'voicepack' pick, or the one from the first stage where the family is found.

- `missionTypeData` (*table*) : Loop mission data (stageN_rallyStage).
- `value` (*string|nil*) : Setting value.

#### `gameplay_rally_voicepack.addToMRU(entryOrPick, missionDir, missionId)`

Puts a voicepack at the head of the MRU (no duplicates, limit 10) and saves the setting. Resolves the entry via resolveEntry if a full entry is not given.

- `entryOrPick` (*table*) : Entry or pick.
- `missionDir` (*string|nil*) : Mission folder.
- `missionId` (*string|nil*) : Mission id.

#### `gameplay_rally_voicepack.buildLoopMissionUserSetting(missionTypeData, currentValue)`

Builds the user setting (dropdown) for the voicepack of a loop: global voicepacks, plus the mission voicepack families common to all stages of the loop. Selection: current value, otherwise first MRU match, otherwise first item.

- `missionTypeData` (*table*) : Loop data.
- `currentValue` (*string|nil*) : Current value.
- **returns**: table|nil {key = 'rallyVoicepackPick', label, type = 'select', values = {{l, v, shortLabel, detail}}, value, currentOption}; nil if there are no entries.

#### `gameplay_rally_voicepack.buildMissionUserSetting(missionDir, missionId, currentValue)`

Builds the user setting (dropdown) for the voicepack of a stage: "Resolve from Settings" then each available voicepack. Selection: current value, otherwise voicepack resolved by preferences, otherwise first item.

- `missionDir` (*string*) : Mission folder.
- `missionId` (*string*) : Mission id.
- `currentValue` (*string|nil*) : Current value.
- **returns**: table|nil Same structure as buildLoopMissionUserSetting; nil if there are no entries.

#### `gameplay_rally_voicepack.buildPickerEntries(missionDir, opts)`

Builds the entries of a voicepack selector for a mission: optionally "Resolve from Settings" at the top (includePreferences), then each available voicepack with its label and pick.

- `missionDir` (*string|nil*) : Mission folder.
- `opts` (*table|nil*) : {includePreferences, includeAuto, missionId, missionSuffix, globalOnly, requireMissionNotebook}.
- **returns**: table[] List of {label, entry, pick}.

#### `gameplay_rally_voicepack.chooseAudioCandidate(candidates)`

Picks a candidate at random (math.random).

- `candidates` (*table[]*) : List of candidates.
- **returns**: table|nil Candidate, nil if the list is empty.

#### `gameplay_rally_voicepack.ensureSettingsInitialized(opts)`

If the MRU is empty, puts defaultVoicepackId in it. Does nothing with opts.writeSettings == false.

- `opts` (*table|nil*) : {writeSettings}.

#### `gameplay_rally_voicepack.getAudioCandidates(metadata, basename, pathForBasename, allowedVariants)`

Lists the audio variants of a note from metadata. Without allowedVariants, takes all the indexed variants (`<stem>.ogg` = variant 1 and `<stem>_<n>.ogg`). With allowedVariants, takes only those. Result sorted by variant then by name.

- `metadata` (*table*) : Table basename -> metadata (content of metadata.json), with audioLen.
- `basename` (*string*) : Base name of the note (with or without .ogg).
- `pathForBasename` (*function|nil*) : Function basename -> path; otherwise fname = basename.
- `allowedVariants` (*integer[]|nil*) : Allowed variant numbers.
- **returns**: table[] List of {basename, fname, audioLen, metadata, variantIndex}.

#### `gameplay_rally_voicepack.getAudioCandidatesForEntry(entry, metadata, basename, allowedVariants)`

getAudioCandidates with the paths resolved by getEntryAudioFile.

- `entry` (*table*) : Voicepack entry.
- `metadata` (*table*) : Audio metadata.
- `basename` (*string*) : Base name.
- `allowedVariants` (*integer[]|nil*) : Allowed variants.
- **returns**: table[] Candidates.

#### `gameplay_rally_voicepack.getAudioCandidatesForVoicepack(voicepack, metadata, basename, allowedVariants)`

getAudioCandidates with the paths of a global voicepack (getAudioFile).

- `voicepack` (*string*) : Voicepack folder.
- `metadata` (*table*) : Audio metadata.
- `basename` (*string*) : Base name.
- `allowedVariants` (*integer[]|nil*) : Allowed variants.
- **returns**: table[] Candidates.

#### `gameplay_rally_voicepack.getAudioFile(voicepack, basename)`

Path of an audio file of a global voicepack (under audio/).

- `voicepack` (*string*) : Voicepack folder name.
- `basename` (*string*) : Audio file name.
- **returns**: string Path.

#### `gameplay_rally_voicepack.getCascadeKeys()`

Compatibility with the old system: language, persona and styleLabel of the global voicepack resolved by the preferences.

- **returns**: string|nil Language.
- **returns**: string|nil Persona.
- **returns**: string|nil styleLabel.

#### `gameplay_rally_voicepack.getEntryAssetDirs(entry)`

Entry folder followed by those of its audio sources.

- `entry` (*table|nil*) : Entry.
- **returns**: string[] Folders.

#### `gameplay_rally_voicepack.getEntryAudioFile(entry, basename)`

Path of an entry's audio file: first its own folder, then those of the reuseAudioFrom voicepacks. If the file exists nowhere, returns the local path (if the audio folder exists) or the first source path.

- `entry` (*table*) : Voicepack entry (from scan/scanMission).
- `basename` (*string*) : Audio file name.
- **returns**: string|nil Path, nil if entry or basename is missing.

#### `gameplay_rally_voicepack.getEntryAudioSourceEntries(entry)`

Global entries whose audio is reused (reuseAudioFrom), read once then cached in entry.audioSourceEntries. Ignores duplicates, itself and invalid dirnames (with a warning).

- `entry` (*table|nil*) : Entry.
- **returns**: table[] Source entries.

#### `gameplay_rally_voicepack.getEntryMetadata(entry)`

Merges the metadata.json of the entry then of its sources (the first value of a basename wins), with cache in entry._mergedAudioMetadata.

- `entry` (*table|nil*) : Entry.
- **returns**: table Table basename -> metadata.

#### `gameplay_rally_voicepack.getEntryMetadataFile(entry)`

Path of the entry's metadata.json, or of the first source that has one.

- `entry` (*table|nil*) : Entry.
- **returns**: string|nil Path.

#### `gameplay_rally_voicepack.getEntrySystemPacenoteFile(entry, systemKey, variantIndex)`

Audio path of a system note for an entry (with reuseAudioFrom fallback).

- `entry` (*table*) : Voicepack entry.
- `systemKey` (*string*) : System note key.
- `variantIndex` (*integer|nil*) : Variant.
- **returns**: string|nil Path.

#### `gameplay_rally_voicepack.getFile(voicepack, basename)`

Path of a file of a global voicepack.

- `voicepack` (*string*) : Voicepack folder name.
- `basename` (*string*) : File name.
- **returns**: string Full path.

#### `gameplay_rally_voicepack.getInfo(voicepack)`

Reads the voicepack.json of a global voicepack (raw, without validation).

- `voicepack` (*string*) : Voicepack folder.
- **returns**: table|nil JSON content, nil if absent.

#### `gameplay_rally_voicepack.getLanguage(voicepack)`

Declared language of a global voicepack.

- `voicepack` (*string*) : Voicepack folder.
- **returns**: string|nil Language.

#### `gameplay_rally_voicepack.getMetadataFile(voicepack)`

Path of the metadata.json of a global voicepack.

- `voicepack` (*string*) : Voicepack folder.
- **returns**: string Path.

#### `gameplay_rally_voicepack.getPacenoteFile(voicepack, pacenoteHash)`

Audio path of a note by its hash in a global voicepack.

- `voicepack` (*string*) : Voicepack folder.
- `pacenoteHash` (*string*) : Note hash.
- **returns**: string Path.

#### `gameplay_rally_voicepack.getStyles(voicepack)`

`styles` field of the voicepack.json of a global voicepack.

- `voicepack` (*string*) : Voicepack folder.
- **returns**: table Styles, empty table if absent.

#### `gameplay_rally_voicepack.getSystemPacenoteFile(voicepack, systemKey, variantIndex)`

Audio path of a system note in a global voicepack.

- `voicepack` (*string*) : Voicepack folder.
- `systemKey` (*string*) : System note key.
- `variantIndex` (*integer|nil*) : Variant; default 1.
- **returns**: string Path.

#### `gameplay_rally_voicepack.getVoicepackMRU()`

Reads the MRU list (setting rallyCodriverVoicepackMRU, CSV or old JSON).

- **returns**: string[] Ids, from most recent to oldest.

#### `gameplay_rally_voicepack.invalidateMissionCache(missionDir)`

Forgets the inventory cache of a mission (or of all if missionDir is nil).

- `missionDir` (*string|nil*) : Mission folder.

#### `gameplay_rally_voicepack.labelForEntry(entry, dirname, suffix)`

Display label "persona [(dialect)] - style [suffix]".

- `entry` (*table*) : Entry.
- `dirname` (*string*) : Fallback for the persona.
- `suffix` (*string|nil*) : Suffix added (e.g. '(mission)').
- **returns**: string Label.

#### `gameplay_rally_voicepack.listInventory(missionDir, opts)`

List sorted by label of the available entries: global ones and, if missionDir is given, those of the mission. Filtered by enableAnimalCodrivers and, by default, by the presence of a candidate notebook in the mission.

- `missionDir` (*string|nil*) : Mission folder.
- `opts` (*table|nil*) : {missionId, globalOnly, requireMissionNotebook}.
- **returns**: table[] Entries.

#### `gameplay_rally_voicepack.listMissionNotebookCandidates(missionDir, vpInfo)`

Like resolveMissionNotebook but returns all the candidate notebook names (without suffix) that exist in the mission, in order of preference.

- `missionDir` (*string|nil*) : Mission folder.
- `vpInfo` (*table|nil*) : Voicepack entry.
- **returns**: string[] Notebook names.

#### `gameplay_rally_voicepack.makeId(scope, dirname, missionId)`

Builds the id of a voicepack: 'global:<dirname>', 'mission:<missionId>:<dirname>' or 'mission:<dirname>'.

- `scope` (*string*) : 'global' or 'mission'.
- `dirname` (*string*) : Folder name.
- `missionId` (*string|nil*) : Mission id (mission scope).
- **returns**: string Id.

#### `gameplay_rally_voicepack.missionFullDir(missionDir)`

Folder of a mission's voicepacks: <missionDir>/rally/voicepacks.

- `missionDir` (*string|nil*) : Mission folder.
- **returns**: string|nil Path.

#### `gameplay_rally_voicepack.notebookBasenamesForPick(missionDir, pick)`

Names of notebooks that can be loaded in the mission for a 'voicepack' type pick.

- `missionDir` (*string*) : Mission folder.
- `pick` (*table|nil*) : Pick.
- **returns**: string[] Names without suffix; empty otherwise.

#### `gameplay_rally_voicepack.parseId(id)`

Decomposes an id into {scope, dirname, missionId}.

- `id` (*string*) : Id.
- **returns**: table|nil Parts, nil if the format is invalid.

#### `gameplay_rally_voicepack.pickFromSettingValue(value)`

Converts a setting value into a pick: '', 'preferences', 'auto' give {type='preferences'}; 'loop:<key>' gives a loopVoicepack; a valid id gives a voicepack; anything else falls back to preferences.

- `value` (*string|nil*) : Setting value.
- **returns**: table Pick.

#### `gameplay_rally_voicepack.picksMatch(a, b)`

Compares two picks: same type; 'preferences' (or 'auto') are equal to each other; otherwise same id, or same dirname with compatible scope and missionId.

- `a` (*table|nil*) : First pick.
- `b` (*table|nil*) : Second pick.
- **returns**: boolean true if equivalent.

#### `gameplay_rally_voicepack.resolve(missionDir, pick, opts)`

Resolves the voicepack to use. Pick of type 'voicepack': exact match in the inventory, otherwise fallback to the preferences ('invalidExactFallback' mode). Other pick or nil: preferences (MRU then detail level).

- `missionDir` (*string|nil*) : Mission folder.
- `pick` (*table|nil*) : Pick.
- `opts` (*table|nil*) : {missionId, globalOnly, requireMissionNotebook, writeSettings}.
- **returns**: table {entry, dirname, reason, mode, detail, candidates}.

#### `gameplay_rally_voicepack.resolveDir(language, persona, styleLabel)`

First global voicepack matching a language, a persona and a styleLabel (each criterion optional). The order is undefined (pairs).

- `language` (*string|nil*) : Language.
- `persona` (*string|nil*) : Persona.
- `styleLabel` (*string|nil*) : Style.
- **returns**: string|nil dirname.
- **returns**: table|nil Entry.

#### `gameplay_rally_voicepack.resolveEffectiveEntry(missionDir, pick, opts)`

Resolves a pick ('auto' is equivalent to 'preferences'; nil = preferences).

- `missionDir` (*string|nil*) : Mission folder.
- `pick` (*table|nil*) : Pick.
- `opts` (*table|nil*) : See resolve.
- **returns**: string|nil dirname.
- **returns**: table|nil Entry.
- **returns**: table Full result of resolve.

#### `gameplay_rally_voicepack.resolveEntry(missionDir, pick, missionId)`

Finds the entry of a pick (or an id): the mission index for scope 'mission', the global index otherwise.

- `missionDir` (*string|nil*) : Mission folder.
- `pick` (*table|string*) : Pick or id.
- `missionId` (*string|nil*) : Mission id.
- **returns**: table|nil Entry.
- **returns**: string|nil dirname.

#### `gameplay_rally_voicepack.resolveLoopMissionSettingEntry(missionTypeData, value)`

Voicepack entry matching a loop setting value.

- `missionTypeData` (*table*) : Loop data.
- `value` (*string|nil*) : Setting value.
- **returns**: table|nil Entry, nil for preferences or if not found.

#### `gameplay_rally_voicepack.resolveLoopVoicepackPick(missionDir, missionId, value)`

Turns a loop setting value into a concrete pick for a mission: a 'voicepack' pick is kept; a 'loopVoicepack' pick is looked up by family in the mission's voicepacks.

- `missionDir` (*string*) : Mission folder.
- `missionId` (*string*) : Mission id.
- `value` (*string*) : Setting value.
- **returns**: table|nil Concrete pick, nil for preferences or if not found.

#### `gameplay_rally_voicepack.resolveMissionNotebook(missionDir, vpInfo)`

Path of the first notebook declared by the voicepack (vpInfo.notebooks) that exists in the mission.

- `missionDir` (*string|nil*) : Mission folder.
- `vpInfo` (*table|nil*) : Voicepack entry or info with `notebooks`.
- **returns**: string|nil Path <missionDir>/rally/notebooks/<name>.notebook.json.

#### `gameplay_rally_voicepack.scan()`

Scans the global voicepacks (excluding `_` folders) and returns the dirname -> entry index, cached.

- **returns**: table<string, table> Index of the global entries.

#### `gameplay_rally_voicepack.scanMission(missionDir, missionId)`

Scans a mission's voicepacks (with cache).

- `missionDir` (*string*) : Mission folder.
- `missionId` (*string|nil*) : Mission id (part of the cache key and of the entries' id).
- **returns**: table<string, table> Index dirname -> entry.

#### `gameplay_rally_voicepack.settingValueForPick(pick)`

Inverse operation of pickFromSettingValue.

- `pick` (*table|nil*) : Pick.
- **returns**: string Setting value.

## Fields

| Field | Type | Description |
|---|---|---|
| `audioSubdir` | string | 'audio': subfolder of the .ogg files. |
| `defaultVoicepackId` | string | 'global:ak_2026-04-16': first MRU element if it is empty. |
| `globalDir` | string | '/lua/ge/extensions/gameplay/rally/compositors/voicepacks/': folder of the global voicepacks (with trailing `/`). |
| `infoBasename` | string | 'voicepack.json'. |
| `missionSubdir` | string | 'rally/voicepacks': subfolder of a mission's voicepacks. |
| `mruLimit` | integer | 10: maximum size of the MRU. |

## Calls into the engine (C++)

- `FS:` `directoryExists`, `directoryList`, `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/voicepack.lua`.*
