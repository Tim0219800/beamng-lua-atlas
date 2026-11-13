# `gameplay_rally_voicepack`

*Fichier : `lua/ge/extensions/gameplay/rally/voicepack.lua` · VM : Game Engine (GE) · 1266 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_voicepack` : `extensions.load("gameplay_rally_voicepack")`, puis la globale `gameplay_rally_voicepack`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_voicepack.addLoopMissionSettingToMRU(missionTypeData, value)` |  | 1059 |
| `gameplay_rally_voicepack.addToMRU(entryOrPick, missionDir, missionId)` |  | 1164 |
| `gameplay_rally_voicepack.buildLoopMissionUserSetting(missionTypeData, currentValue)` |  | 1094 |
| `gameplay_rally_voicepack.buildMissionUserSetting(missionDir, missionId, currentValue)` |  | 1213 |
| `gameplay_rally_voicepack.buildPickerEntries(missionDir, opts)` | Builds picker entries for a mission. Returns an array of { label, pick }.<br> Filter: a voicepack appears iff at least one of its candidate notebooks resolves in this mission.<br> opts:<br>   includePreferences = true -> prepends the auto/settings entry.<br>   missionSuffix          -> string appended to mission-scoped voicepack labels (default '(mission)') | 871 |
| `gameplay_rally_voicepack.chooseAudioCandidate(candidates)` |  | 197 |
| `gameplay_rally_voicepack.ensureSettingsInitialized(opts)` |  | 714 |
| `gameplay_rally_voicepack.getAudioCandidates(metadata, basename, pathForBasename, allowedVariants)` |  | 142 |
| `gameplay_rally_voicepack.getAudioCandidatesForEntry(entry, metadata, basename, allowedVariants)` |  | 185 |
| `gameplay_rally_voicepack.getAudioCandidatesForVoicepack(voicepack, metadata, basename, allowedVariants)` |  | 191 |
| `gameplay_rally_voicepack.getAudioFile(voicepack, basename)` |  | 38 |
| `gameplay_rally_voicepack.getCascadeKeys()` | Backwards-compatible cascade accessors. Existing callers can keep using the old<br> tuple shape while the resolver itself is now preference/MRU based. | 849 |
| `gameplay_rally_voicepack.getEntryAssetDirs(entry)` |  | 480 |
| `gameplay_rally_voicepack.getEntryAudioFile(entry, basename)` |  | 46 |
| `gameplay_rally_voicepack.getEntryAudioSourceEntries(entry)` |  | 452 |
| `gameplay_rally_voicepack.getEntryMetadata(entry)` |  | 504 |
| `gameplay_rally_voicepack.getEntryMetadataFile(entry)` |  | 490 |
| `gameplay_rally_voicepack.getEntrySystemPacenoteFile(entry, systemKey, variantIndex)` |  | 210 |
| `gameplay_rally_voicepack.getFile(voicepack, basename)` |  | 34 |
| `gameplay_rally_voicepack.getInfo(voicepack)` |  | 218 |
| `gameplay_rally_voicepack.getLanguage(voicepack)` |  | 226 |
| `gameplay_rally_voicepack.getMetadataFile(voicepack)` |  | 214 |
| `gameplay_rally_voicepack.getPacenoteFile(voicepack, pacenoteHash)` |  | 202 |
| `gameplay_rally_voicepack.getStyles(voicepack)` |  | 232 |
| `gameplay_rally_voicepack.getSystemPacenoteFile(voicepack, systemKey, variantIndex)` |  | 206 |
| `gameplay_rally_voicepack.getVoicepackMRU()` |  | 331 |
| `gameplay_rally_voicepack.invalidateCache()` | Dev/test hook only. Normal preference changes and picker changes must not invalidate this;<br> the expensive directory scan should run once per Lua/module reload unless the toolbox asks<br> for an explicit refresh after content files changed. | 246 |
| `gameplay_rally_voicepack.invalidateMissionCache(missionDir)` |  | 255 |
| `gameplay_rally_voicepack.labelForEntry(entry, dirname, suffix)` | Pretty label for a voicepack info entry, suitable for display in picker dropdowns.<br> Format: "<persona> [(<dialect>)] - <style>[ <suffix>]". Falls back to dirname/style basename<br> when fields are missing. | 704 |
| `gameplay_rally_voicepack.listInventory(missionDir, opts)` |  | 629 |
| `gameplay_rally_voicepack.listMissionNotebookCandidates(missionDir, vpInfo)` | Like resolveMissionNotebook, but returns the full ordered list of candidate basenames whose<br> .notebook.json actually exists in the mission. Used by the rally editor's notebook dropdown<br> to show all loadable notebooks for the chosen voicepack (not just the first one). | 687 |
| `gameplay_rally_voicepack.makeId(scope, dirname, missionId)` |  | 270 |
| `gameplay_rally_voicepack.missionFullDir(missionDir)` |  | 549 |
| `gameplay_rally_voicepack.notebookBasenamesForPick(missionDir, pick)` | Returns the ordered list of notebook basenames (no .notebook.json suffix) loadable for the<br> pick in this mission. Empty list if pick is nil or has no matches. | 1140 |
| `gameplay_rally_voicepack.parseId(id)` |  | 277 |
| `gameplay_rally_voicepack.pickFromSettingValue(value)` |  | 1183 |
| `gameplay_rally_voicepack.picksMatch(a, b)` |  | 1150 |
| `gameplay_rally_voicepack.resolve(missionDir, pick, opts)` |  | 798 |
| `gameplay_rally_voicepack.resolveDir(language, persona, styleLabel)` | Returns (dirname, entry) for the first voicepack matching the given (language, persona,<br> styleLabel) keys. Any of the args may be nil, in which case the first match wins. | 617 |
| `gameplay_rally_voicepack.resolveEffectiveEntry(missionDir, pick, opts)` | Resolves a pick into (dirname, entry, result):<br>   pick.type == 'voicepack' -> exact pick, visible fallback if invalid<br>   pick nil/preferences/auto -> accepted-language/MRU preference resolver<br> Returns (nil, nil, result) when nothing resolves. | 859 |
| `gameplay_rally_voicepack.resolveEntry(missionDir, pick, missionId)` | Returns (entry, dirname) for the given pick. Mission-scope picks resolve from the<br> mission-local voicepack index; everything else from the global index. | 601 |
| `gameplay_rally_voicepack.resolveLoopMissionSettingEntry(missionTypeData, value)` |  | 1077 |
| `gameplay_rally_voicepack.resolveLoopVoicepackPick(missionDir, missionId, value)` |  | 1049 |
| `gameplay_rally_voicepack.resolveMissionNotebook(missionDir, vpInfo)` | Resolves which notebook file in the given mission to use, based on the active voicepack info.<br> The voicepack info.json declares a required "notebooks" array of basenames (no .notebook.json<br> suffix), in preference order.<br> Returns the absolute path to the first existing <missionDir>/rally/notebooks/<name>.notebook.json,<br> or nil if none of the candidates exist. | 673 |
| `gameplay_rally_voicepack.scan()` |  | 530 |
| `gameplay_rally_voicepack.scanMission(missionDir, missionId)` |  | 554 |
| `gameplay_rally_voicepack.settingValueForPick(pick)` |  | 1203 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `audioSubdir` | string |  |
| `defaultVoicepackId` | string |  |
| `globalDir` | string |  |
| `infoBasename` | string | not 'info.json' to avoid clashing with the BeamNG missions system, which scans<br> /gameplay/missions/**/info.json and treats anything it finds as a mission. |
| `missionSubdir` | string |  |
| `mruLimit` | number |  |

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `directoryList`, `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/voicepack.lua`.*
