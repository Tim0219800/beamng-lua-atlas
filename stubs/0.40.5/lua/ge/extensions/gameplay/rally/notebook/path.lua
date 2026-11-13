---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/path.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/rally/notebook/path.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_rally_notebook_path
local gameplay_rally_notebook_path = {}

--- The codriver concept is fully phased out: voicepack persona/language come from voicepack
---  preferences, and there is no per-notebook codriver list. selectedCodriver() returns a
---  synthetic stub so legacy callers still get a sensible language string for note lookups.
---  Returns the first language key found in any pacenote's notes table, or nil.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:655
function gameplay_rally_notebook_path:_detectFirstNotesLanguage() end

--- Returns the toolbox-driven voicepack pick if a rally manager is currently running.
---  This is the bridge between the in-game picker and the editor (which falls back to settings).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:81
function gameplay_rally_notebook_path:_getRallyManagerPick() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1580
---@param audioModeDir any
function gameplay_rally_notebook_path:_missionPacenoteMetadataFile(audioModeDir) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:645
function gameplay_rally_notebook_path:allToTerrain() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:613
function gameplay_rally_notebook_path:allWaypoints() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:213
---@param pacenotes any
function gameplay_rally_notebook_path:appendPacenotes(pacenotes) end

--- first pacenote needs csImmediate so it fires without waiting for a previous
---  note's distance call; everything else stays on the dynamic default.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:702
function gameplay_rally_notebook_path:autoManageTriggerTypes() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:806
function gameplay_rally_notebook_path:autofillDistanceCalls() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:279
function gameplay_rally_notebook_path:basename() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:285
function gameplay_rally_notebook_path:basenameNoExt() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:868
function gameplay_rally_notebook_path:cacheCompiledPacenotes() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1419
---@param pacenote any
---@param basename any
function gameplay_rally_notebook_path:canSetCustomAudioAnchor(pacenote, basename) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:403
function gameplay_rally_notebook_path:cleanupPacenoteNames() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1126
function gameplay_rally_notebook_path:clearAllTodo() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:888
function gameplay_rally_notebook_path:clearCompilationFailures() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1465
---@param basename any
function gameplay_rally_notebook_path:clearCustomAudioAnchor(basename) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1544
function gameplay_rally_notebook_path:clearCustomSystemPacenoteCache() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1666
function gameplay_rally_notebook_path:clearPacenoteAudioModeOverrides() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:882
function gameplay_rally_notebook_path:clearResolvedAudioObjs() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1415
---@param basename any
function gameplay_rally_notebook_path:customAudioAnchorInfoFor(basename) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1403
---@param pacenote any
function gameplay_rally_notebook_path:customAudioBasenamesFor(pacenote) end

--- The voicepack entry that owns this notebook's custom audio. Prefers the mission
---  voicepack that lists this notebook; falls back to the active voicepack only when no
---  mission voicepack claims it. This keeps the custom-audio widget scoped to the
---  mission-specific pack and out of any global/source pack's audio.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1234
function gameplay_rally_notebook_path:customAudioEntry() end

--- Audio (.ogg) files live in the voicepack's `audio/` subdir; metadata/transcriptions
---  stay at the voicepack root.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1249
function gameplay_rally_notebook_path:customPacenotesAudioDir() end

--- Path for mission-local system pacenote overrides (countdowns etc). Out-of-scope for the
---  mission-voicepack refactor; kept on the old `notebooks/custom/<basename>/` layout for now.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1512
function gameplay_rally_notebook_path:customPacenotesBaseDir() end

--- Returns the directory holding `pacenote_*.ogg` (and metadata.json) for the custom
---  audio owner voicepack (the mission voicepack that owns this notebook). Returns nil
---  when no owner voicepack is resolvable.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1241
function gameplay_rally_notebook_path:customPacenotesDir() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:220
function gameplay_rally_notebook_path:deleteAllPacenotes() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1678
---@param lang any
function gameplay_rally_notebook_path:deletePacenoteLanguage(lang) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:273
function gameplay_rally_notebook_path:dir() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:484
---@param pacenoteToolsState any
---@param globalOpacity any
function gameplay_rally_notebook_path:drawDebugNotebook(pacenoteToolsState, globalOpacity) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:529
---@param pacenoteToolsState any
---@param globalOpacity any
---@param window any
function gameplay_rally_notebook_path:drawDebugNotebookForPartitionAllSnaproad(pacenoteToolsState, globalOpacity, window) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:894
---@param pos any
---@param n any
function gameplay_rally_notebook_path:findNClosestPacenotes(pos, n) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:849
---@param i any
function gameplay_rally_notebook_path:findNextNonIsolated(i) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:741
function gameplay_rally_notebook_path:generateAllFreeform() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:747
---@param corners any
function gameplay_rally_notebook_path:generatePacenotes(corners) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:134
function gameplay_rally_notebook_path:getActiveCompositorName() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:463
---@param selected_pn_id any
function gameplay_rally_notebook_path:getAdjacentPacenoteSet(selected_pn_id) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1146
function gameplay_rally_notebook_path:getAudioMode() end

--- Returns anchor metadata keyed by basename plus the ordered anchor points. Anchors
---  are user-provided landmarks: this audio clip belongs on this pacenote.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1295
function gameplay_rally_notebook_path:getCustomAudioAnchorInfo() end

--- Computes the assignment of clip basenames to pacenotes from manual anchors. Clips
---  between anchor points are interpolated between those landmark pacenotes.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1349
function gameplay_rally_notebook_path:getCustomAudioAssignment() end

--- Builds system pacenotes (countdowns, warnings, start/finish, etc.) for custom mode
---  without a text compositor. The canonical names/order come from
---  notebook/systemPacenotes.lua; the audio for each is resolved by internal name
---  (pacenote_system_<name>_<variant>.ogg) from the active voicepack's audio dir,
---  falling back to its reuseAudioFrom sources (e.g. a global pack) for any clip the
---  mission pack doesn't ship. Variants are discovered by probing increasing indices.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:993
function gameplay_rally_notebook_path:getCustomSystemPacenotesForAudioMode() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:634
function gameplay_rally_notebook_path:getLanguages() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:244
function gameplay_rally_notebook_path:getMissionDir() end

--- a path looks like:
---  /gameplay/missions/gridmap_v2/rallyStage/rally-test-1/aipacenotes/notebooks/primary.notebook.json
---  we want to return this string: gridmap_v2/rallyStage/rally-test-1
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:235
function gameplay_rally_notebook_path:getMissionId() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:260
function gameplay_rally_notebook_path:getMissionType() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:18
function gameplay_rally_notebook_path:getNextUniqueIdentifier() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:173
function gameplay_rally_notebook_path:getOfflineTextCompositor() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1077
---@param desiredPrefix any
function gameplay_rally_notebook_path:getRandomSystemPacenote(desiredPrefix) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:67
function gameplay_rally_notebook_path:getSnaproad() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:919
function gameplay_rally_notebook_path:getSystemPacenotesForAudioMode() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:148
function gameplay_rally_notebook_path:getTextCompositor() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:199
function gameplay_rally_notebook_path:getVisualCompositor2() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:623
---@param wpId any
function gameplay_rally_notebook_path:getWaypoint(wpId) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:228
function gameplay_rally_notebook_path:hasAnyPacenotes() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:23
---@param name any
function gameplay_rally_notebook_path:init(name) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:115
function gameplay_rally_notebook_path:invalidateActiveVoicepackCache() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1408
function gameplay_rally_notebook_path:invalidateCustomAudioMapping() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1173
function gameplay_rally_notebook_path:isAudioModeCustom() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1169
function gameplay_rally_notebook_path:isAudioModeFreeform() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1165
function gameplay_rally_notebook_path:isAudioModeOfflineStructured() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1161
function gameplay_rally_notebook_path:isAudioModeOnlineStructured() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1182
function gameplay_rally_notebook_path:isV2() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1186
function gameplay_rally_notebook_path:isV3() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:331
function gameplay_rally_notebook_path:is_valid() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1595
function gameplay_rally_notebook_path:loadCustomPacenoteMetadata() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1609
function gameplay_rally_notebook_path:loadCustomPacenoteTranscriptions() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1549
function gameplay_rally_notebook_path:loadCustomSystemPacenoteMetadata() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1648
function gameplay_rally_notebook_path:loadFreeformPacenoteMetadata() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1623
function gameplay_rally_notebook_path:loadOfflineStructuredPacenoteMetadata() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1639
function gameplay_rally_notebook_path:loadOnlineStructuredPacenoteMetadata() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1657
function gameplay_rally_notebook_path:loadSystemPacenoteMetadata() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1120
function gameplay_rally_notebook_path:markAllTodo() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1132
---@param pacenote any
function gameplay_rally_notebook_path:markRestTodo(pacenote) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1572
---@param audioModeDir any
---@param pacenoteTextOut any
function gameplay_rally_notebook_path:missionPacenoteAudioFile(audioModeDir, pacenoteTextOut) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1190
---@param audioModeDir any
function gameplay_rally_notebook_path:missionPacenotesDir(audioModeDir) end

--- Finds the mission-scoped voicepack entry that owns this notebook (its `notebooks`
---  list contains this notebook's basename). Custom corner clips belong to that specific
---  mission voicepack, not to whatever global pack the preference-driven active pick may
---  resolve to. Returns nil if no mission voicepack claims this notebook.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1212
function gameplay_rally_notebook_path:missionVoicepackEntryForNotebook() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:378
function gameplay_rally_notebook_path:nextImportIdent() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:557
---@param data any
function gameplay_rally_notebook_path:onDeserialized(data) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:859
function gameplay_rally_notebook_path:onRallySettingsChanged() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:543
function gameplay_rally_notebook_path:onSerialize() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:694
function gameplay_rally_notebook_path:refreshAllFreeformNotes() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:680
function gameplay_rally_notebook_path:refreshAllPacenotes() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:685
function gameplay_rally_notebook_path:refreshAllStructuredNotes() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:723
---@param opts any
function gameplay_rally_notebook_path:refreshPacenotes(opts) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:316
function gameplay_rally_notebook_path:reload() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:711
function gameplay_rally_notebook_path:remeasureAllPacenotes() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:122
function gameplay_rally_notebook_path:resolveActiveVoicepack() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1518
---@param systemPacenotes any
function gameplay_rally_notebook_path:resolveAllCustomSystemPacenotes(systemPacenotes) end

--- Resolves a clip basename to a full path via the custom audio owner voicepack,
---  honouring reuseAudioFrom fallback to a source pack.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1280
---@param basename any
function gameplay_rally_notebook_path:resolveCustomAudioBasename(basename) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:297
---@param fname any
function gameplay_rally_notebook_path:save(fname) end

--- Returns the sorted list of custom-audio clip basenames present on disk in the
---  owner mission voicepack's audio dir. Order is the filename sort (clips are exported
---  in increasing numerical order); the number is used only for ordering, never to match
---  a clip to a specific pacenote. System pacenotes (pacenote_system_*) are excluded
---  by the numeric-prefix pattern.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1260
function gameplay_rally_notebook_path:scanCustomAudioBasenames() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:666
function gameplay_rally_notebook_path:selectedCodriver() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:675
function gameplay_rally_notebook_path:selectedCodriverLanguage() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1094
---@param pacenote_id any
function gameplay_rally_notebook_path:setAdjacentNotes(pacenote_id) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1107
function gameplay_rally_notebook_path:setAllAdjacentNotes() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:639
---@param newRadius any
---@param wpType any
function gameplay_rally_notebook_path:setAllRadii(newRadius, wpType) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1157
---@param mode any
function gameplay_rally_notebook_path:setAudioMode(mode) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1444
---@param pacenote any
---@param basename any
function gameplay_rally_notebook_path:setCustomAudioAnchor(pacenote, basename) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:292
---@param newFname any
function gameplay_rally_notebook_path:setFname(newFname) end

--- Snaproad is supplied lazily by whichever consumer owns the road geometry
---  (the editor's pacenotes window or the runtime RallyManager). distance
---  calculations that walk the road require it, so autofill is triggered as
---  soon as one is attached.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:60
---@param sn any
function gameplay_rally_notebook_path:setSnaproad(sn) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:359
function gameplay_rally_notebook_path:sortPacenotesByName() end

--- Reconcile after a Reaper re-export: refresh the disk scan and drop anchors whose
---  files no longer exist.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1490
function gameplay_rally_notebook_path:syncCustomAudioFromDisk() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:602
function gameplay_rally_notebook_path:upgradeFromV2ToV3() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1672
---@param codriver any
function gameplay_rally_notebook_path:useCodriver(codriver) end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1177
function gameplay_rally_notebook_path:useStructured() end

---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:327
function gameplay_rally_notebook_path:validate() end

