---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/voicepack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_rally_voicepack` : `extensions.load("gameplay_rally_voicepack")`, puis la globale `gameplay_rally_voicepack`
---@class gameplay_rally_voicepack
---@field audioSubdir string
---@field defaultVoicepackId string
---@field globalDir string
---@field infoBasename string
---@field missionSubdir string
---@field mruLimit number
gameplay_rally_voicepack = {}

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:1059
---@param missionTypeData any
---@param value any
function gameplay_rally_voicepack.addLoopMissionSettingToMRU(missionTypeData, value) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:1164
---@param entryOrPick any
---@param missionDir any
---@param missionId any
function gameplay_rally_voicepack.addToMRU(entryOrPick, missionDir, missionId) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:1094
---@param missionTypeData any
---@param currentValue any
function gameplay_rally_voicepack.buildLoopMissionUserSetting(missionTypeData, currentValue) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:1213
---@param missionDir any
---@param missionId any
---@param currentValue any
function gameplay_rally_voicepack.buildMissionUserSetting(missionDir, missionId, currentValue) end

--- Builds picker entries for a mission. Returns an array of { label, pick }.
---  Filter: a voicepack appears iff at least one of its candidate notebooks resolves in this mission.
---  opts:
---    includePreferences = true -> prepends the auto/settings entry.
---    missionSuffix          -> string appended to mission-scoped voicepack labels (default '(mission)')
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:871
---@param missionDir any
---@param opts any
function gameplay_rally_voicepack.buildPickerEntries(missionDir, opts) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:197
---@param candidates any
function gameplay_rally_voicepack.chooseAudioCandidate(candidates) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:714
---@param opts any
function gameplay_rally_voicepack.ensureSettingsInitialized(opts) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:142
---@param metadata any
---@param basename any
---@param pathForBasename any
---@param allowedVariants any
function gameplay_rally_voicepack.getAudioCandidates(metadata, basename, pathForBasename, allowedVariants) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:185
---@param entry any
---@param metadata any
---@param basename any
---@param allowedVariants any
function gameplay_rally_voicepack.getAudioCandidatesForEntry(entry, metadata, basename, allowedVariants) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:191
---@param voicepack any
---@param metadata any
---@param basename any
---@param allowedVariants any
function gameplay_rally_voicepack.getAudioCandidatesForVoicepack(voicepack, metadata, basename, allowedVariants) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:38
---@param voicepack any
---@param basename any
function gameplay_rally_voicepack.getAudioFile(voicepack, basename) end

--- Backwards-compatible cascade accessors. Existing callers can keep using the old
---  tuple shape while the resolver itself is now preference/MRU based.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:849
function gameplay_rally_voicepack.getCascadeKeys() end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:480
---@param entry any
function gameplay_rally_voicepack.getEntryAssetDirs(entry) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:46
---@param entry any
---@param basename any
function gameplay_rally_voicepack.getEntryAudioFile(entry, basename) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:452
---@param entry any
function gameplay_rally_voicepack.getEntryAudioSourceEntries(entry) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:504
---@param entry any
function gameplay_rally_voicepack.getEntryMetadata(entry) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:490
---@param entry any
function gameplay_rally_voicepack.getEntryMetadataFile(entry) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:210
---@param entry any
---@param systemKey any
---@param variantIndex any
function gameplay_rally_voicepack.getEntrySystemPacenoteFile(entry, systemKey, variantIndex) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:34
---@param voicepack any
---@param basename any
function gameplay_rally_voicepack.getFile(voicepack, basename) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:218
---@param voicepack any
function gameplay_rally_voicepack.getInfo(voicepack) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:226
---@param voicepack any
function gameplay_rally_voicepack.getLanguage(voicepack) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:214
---@param voicepack any
function gameplay_rally_voicepack.getMetadataFile(voicepack) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:202
---@param voicepack any
---@param pacenoteHash any
function gameplay_rally_voicepack.getPacenoteFile(voicepack, pacenoteHash) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:232
---@param voicepack any
function gameplay_rally_voicepack.getStyles(voicepack) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:206
---@param voicepack any
---@param systemKey any
---@param variantIndex any
function gameplay_rally_voicepack.getSystemPacenoteFile(voicepack, systemKey, variantIndex) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:331
function gameplay_rally_voicepack.getVoicepackMRU() end

--- Dev/test hook only. Normal preference changes and picker changes must not invalidate this;
---  the expensive directory scan should run once per Lua/module reload unless the toolbox asks
---  for an explicit refresh after content files changed.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:246
function gameplay_rally_voicepack.invalidateCache() end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:255
---@param missionDir any
function gameplay_rally_voicepack.invalidateMissionCache(missionDir) end

--- Pretty label for a voicepack info entry, suitable for display in picker dropdowns.
---  Format: "<persona> [(<dialect>)] - <style>[ <suffix>]". Falls back to dirname/style basename
---  when fields are missing.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:704
---@param entry any
---@param dirname any
---@param suffix any
function gameplay_rally_voicepack.labelForEntry(entry, dirname, suffix) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:629
---@param missionDir any
---@param opts any
function gameplay_rally_voicepack.listInventory(missionDir, opts) end

--- Like resolveMissionNotebook, but returns the full ordered list of candidate basenames whose
---  .notebook.json actually exists in the mission. Used by the rally editor's notebook dropdown
---  to show all loadable notebooks for the chosen voicepack (not just the first one).
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:687
---@param missionDir any
---@param vpInfo any
function gameplay_rally_voicepack.listMissionNotebookCandidates(missionDir, vpInfo) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:270
---@param scope any
---@param dirname any
---@param missionId any
function gameplay_rally_voicepack.makeId(scope, dirname, missionId) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:549
---@param missionDir any
function gameplay_rally_voicepack.missionFullDir(missionDir) end

--- Returns the ordered list of notebook basenames (no .notebook.json suffix) loadable for the
---  pick in this mission. Empty list if pick is nil or has no matches.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:1140
---@param missionDir any
---@param pick any
function gameplay_rally_voicepack.notebookBasenamesForPick(missionDir, pick) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:277
---@param id any
function gameplay_rally_voicepack.parseId(id) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:1183
---@param value any
function gameplay_rally_voicepack.pickFromSettingValue(value) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:1150
---@param a any
---@param b any
function gameplay_rally_voicepack.picksMatch(a, b) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:798
---@param missionDir any
---@param pick any
---@param opts any
function gameplay_rally_voicepack.resolve(missionDir, pick, opts) end

--- Returns (dirname, entry) for the first voicepack matching the given (language, persona,
---  styleLabel) keys. Any of the args may be nil, in which case the first match wins.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:617
---@param language any
---@param persona any
---@param styleLabel any
function gameplay_rally_voicepack.resolveDir(language, persona, styleLabel) end

--- Resolves a pick into (dirname, entry, result):
---    pick.type == 'voicepack' -> exact pick, visible fallback if invalid
---    pick nil/preferences/auto -> accepted-language/MRU preference resolver
---  Returns (nil, nil, result) when nothing resolves.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:859
---@param missionDir any
---@param pick any
---@param opts any
function gameplay_rally_voicepack.resolveEffectiveEntry(missionDir, pick, opts) end

--- Returns (entry, dirname) for the given pick. Mission-scope picks resolve from the
---  mission-local voicepack index; everything else from the global index.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:601
---@param missionDir any
---@param pick any
---@param missionId any
function gameplay_rally_voicepack.resolveEntry(missionDir, pick, missionId) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:1077
---@param missionTypeData any
---@param value any
function gameplay_rally_voicepack.resolveLoopMissionSettingEntry(missionTypeData, value) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:1049
---@param missionDir any
---@param missionId any
---@param value any
function gameplay_rally_voicepack.resolveLoopVoicepackPick(missionDir, missionId, value) end

--- Resolves which notebook file in the given mission to use, based on the active voicepack info.
---  The voicepack info.json declares a required "notebooks" array of basenames (no .notebook.json
---  suffix), in preference order.
---  Returns the absolute path to the first existing <missionDir>/rally/notebooks/<name>.notebook.json,
---  or nil if none of the candidates exist.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:673
---@param missionDir any
---@param vpInfo any
function gameplay_rally_voicepack.resolveMissionNotebook(missionDir, vpInfo) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:530
function gameplay_rally_voicepack.scan() end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:554
---@param missionDir any
---@param missionId any
function gameplay_rally_voicepack.scanMission(missionDir, missionId) end

---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:1203
---@param pick any
function gameplay_rally_voicepack.settingValueForPick(pick) end

