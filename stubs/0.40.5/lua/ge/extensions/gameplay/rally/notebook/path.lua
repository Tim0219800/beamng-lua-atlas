---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/path.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Notebook instance. Fields: _uid, id, name ("Primary" by default), description, authors, metadata, version, created_at, updated_at, pacenotes (sortedList), fname, validation_issues, audioMode (structuredOffline by default), snaproad, caches (compositors, voicepack, metadata, custom audio mapping).
---@class gameplay_rally_notebook_path
local gameplay_rally_notebook_path = {}

--- First language key found in the pacenotes' notes, or nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:655
---@return string|nil  Language.
function gameplay_rally_notebook_path:_detectFirstNotesLanguage() end

--- Current voicepack choice: the editor's if this notebook is the current one, otherwise that of the active RallyManager. Also returns a "writes settings" boolean (see notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:81
---@return table|nil  Choices.
---@return boolean  writesSettings.
function gameplay_rally_notebook_path:_getRallyManagerPick() end

--- Path of the metadata file of a mode folder.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1580
---@param audioModeDir string Mode subfolder.
---@return string  Path.
function gameplay_rally_notebook_path:_missionPacenoteMetadataFile(audioModeDir) end

--- Snaps all waypoints back to the terrain.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:645
function gameplay_rally_notebook_path:allToTerrain() end

--- Table of all waypoints keyed by identifier.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:613
---@return table<integer, table>  Waypoints.
function gameplay_rally_notebook_path:allWaypoints() end

--- Creates one pacenote per entry and deserializes it.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:213
---@param pacenotes table[] Serialized pacenote data.
function gameplay_rally_notebook_path:appendPacenotes(pacenotes) end

--- Forces csImmediate for the first pacenote and dynamic for the others.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:702
function gameplay_rally_notebook_path:autoManageTriggerTypes() end

--- Recomputes the distance calls: clears the before/after fields (except blocked or isolated fields), then for each pair of consecutive non-isolated pacenotes sets a link word (the next one's "before") or a distance (the current one's "after") according to the compositor. Stops if the snaproad or the compositor is missing.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:806
function gameplay_rally_notebook_path:autofillDistanceCalls() end

--- Notebook file name (with extensions).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:279
---@return string|nil  Name.
function gameplay_rally_notebook_path:basename() end

--- Name without the two extensions (.notebook.json).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:285
---@return string|nil  Name.
function gameplay_rally_notebook_path:basenameNoExt() end

--- Recompiles all pacenotes (visual order numbers, clears caches) and logs the ones that fail.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:868
function gameplay_rally_notebook_path:cacheCompiledPacenotes() end

--- Checks that an anchor is possible: clip present on disk and monotonic order with the other anchors.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1419
---@param pacenote table Pacenote.
---@param basename string Clip.
---@return boolean  Possible.
---@return string|nil  Reason for the refusal.
function gameplay_rally_notebook_path:canSetCustomAudioAnchor(pacenote, basename) end

--- Renames each pacenote "<base> <index>" according to its position and rebuilds the name index.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:403
function gameplay_rally_notebook_path:cleanupPacenoteNames() end

--- Removes the to-do mark from all pacenotes.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1126
function gameplay_rally_notebook_path:clearAllTodo() end

--- Resets the compile failures of all pacenotes.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:888
function gameplay_rally_notebook_path:clearCompilationFailures() end

--- Removes a clip's anchor.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1465
---@param basename string Clip.
---@return boolean  true if something changed.
function gameplay_rally_notebook_path:clearCustomAudioAnchor(basename) end

--- Clears the cache of the system overrides and their metadata.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1544
function gameplay_rally_notebook_path:clearCustomSystemPacenoteCache() end

--- Puts all pacenotes back in auto audio mode (follow the notebook's).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1666
function gameplay_rally_notebook_path:clearPacenoteAudioModeOverrides() end

--- Clears the resolved audioObjs of all pacenotes.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:882
function gameplay_rally_notebook_path:clearResolvedAudioObjs() end

--- Anchor info of a clip.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1415
---@param basename string Clip name.
---@return table|nil  Info.
function gameplay_rally_notebook_path:customAudioAnchorInfoFor(basename) end

--- Clips assigned to a pacenote.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1403
---@param pacenote table|nil Pacenote.
---@return string[]  Clip names.
function gameplay_rally_notebook_path:customAudioBasenamesFor(pacenote) end

--- Voicepack that owns the custom audio: the mission's, otherwise the active voicepack.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1234
---@return table|nil  Entry.
function gameplay_rally_notebook_path:customAudioEntry() end

--- audio/ subfolder of the owning voicepack.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1249
---@return string|nil  Path.
function gameplay_rally_notebook_path:customPacenotesAudioDir() end

--- Folder of the mission overrides of the system pacenotes: <mission>/<notebooksPath>/custom/<notebook>.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1512
---@return string  Path.
function gameplay_rally_notebook_path:customPacenotesBaseDir() end

--- Root folder of the owning voicepack (clips, metadata, transcriptions).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1241
---@return string|nil  Path.
function gameplay_rally_notebook_path:customPacenotesDir() end

--- Replaces the list with an empty sortedList.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:220
function gameplay_rally_notebook_path:deleteAllPacenotes() end

--- Removes a language from all pacenotes.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1678
---@param lang string Language.
function gameplay_rally_notebook_path:deletePacenoteLanguage(lang) end

--- Folder of the notebook file.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:273
---@return string|nil  Path.
function gameplay_rally_notebook_path:dir() end

--- 3D drawing of the notebook in the editor: the selection (and neighbors according to preferences), or all pacenotes in rainbow colors if nothing is selected.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:484
---@param pacenoteToolsState table|nil Tools state.
---@param globalOpacity number Opacity.
function gameplay_rally_notebook_path:drawDebugNotebook(pacenoteToolsState, globalOpacity) end

--- Draws the pacenotes that overlap the given distance window (pacenote creation).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:529
---@param pacenoteToolsState table State.
---@param globalOpacity number Opacity.
---@param window table|nil { startDistance, endDistance } along the road.
function gameplay_rally_notebook_path:drawDebugNotebookForPartitionAllSnaproad(pacenoteToolsState, globalOpacity, window) end

--- The n pacenotes whose cornerStart waypoint is closest to pos (see notes about a possible nil).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:894
---@param pos vec3 Position.
---@param n integer Number.
---@return table[]  Pacenotes sorted by distance.
function gameplay_rally_notebook_path:findNClosestPacenotes(pos, n) end

--- Next non-isolated pacenote after index i.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:849
---@param i integer Index in the sorted list.
---@return table|nil  Pacenote.
function gameplay_rally_notebook_path:findNextNonIsolated(i) end

--- Generates the freeform text from the structured one for all pacenotes.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:741
function gameplay_rally_notebook_path:generateAllFreeform() end

--- Clears the pacenotes and creates one per detected corner (cs/ce waypoints placed on the snaproad if available, normals aligned, sortOrder = 5*i), then sorts, renames and fills in the distances.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:747
---@param corners table[] Corners from pacenoteGenerator.detectCorners (pos, posEnd).
function gameplay_rally_notebook_path:generatePacenotes(corners) end

--- Name of the compositor style declared by the active voicepack (compositorStyle); nil if absent or, in custom mode, if the style module does not exist.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:134
---@return string|nil  Style name.
function gameplay_rally_notebook_path:getActiveCompositorName() end

--- Previous, selected and next pacenotes of an identifier.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:463
---@param selected_pn_id integer|nil Selection identifier.
---@return table|nil  Previous.
---@return table|nil  Selected.
---@return table|nil  Next.
function gameplay_rally_notebook_path:getAdjacentPacenoteSet(selected_pn_id) end

--- The notebook's audio mode (saved property, not overridden by the voicepack).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1146
---@return integer|nil  RallyEnums.pacenoteAudioMode.
function gameplay_rally_notebook_path:getAudioMode() end

--- Info about the placed anchors (clip -> pacenote): points sorted by clip and a table by name, with the flags duplicate, nonMonotonic, invalid.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1295
---@return table  { points, byBasename }.
function gameplay_rally_notebook_path:getCustomAudioAnchorInfo() end

--- Distributes the clips over the pacenotes: anchored clips go to their pacenote, the others are linearly interpolated between neighboring anchors (implicit bounds 0 and end).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1349
---@return table<integer, string[]>  Pacenote identifier -> clips.
function gameplay_rally_notebook_path:getCustomAudioAssignment() end

--- Custom mode version without compositor: looks for pacenote_system_<name>_<n>.ogg in the active voicepack for each name of systemPacenotes.required (variants probed by increasing indices).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:993
---@return table  System pacenotes.
---@return table  Metadata.
function gameplay_rally_notebook_path:getCustomSystemPacenotesForAudioMode() end

--- List of a single language { language, codrivers = {} } (detected or default language).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:634
---@return table[]  Languages.
function gameplay_rally_notebook_path:getLanguages() end

--- Mission folder (two levels above the notebook file); nil without fname.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:244
---@return string|nil  Path.
function gameplay_rally_notebook_path:getMissionDir() end

--- Mission identifier (part of the folder after /missions/), e.g. gridmap_v2/rallyStage/rally-test-1; nil without a file.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:235
---@return string|nil  Identifier.
function gameplay_rally_notebook_path:getMissionId() end

--- missionType field of the mission's info.json, or nil.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:260
---@return string|nil  Type.
function gameplay_rally_notebook_path:getMissionType() end

--- Increments and returns the notebook's identifier counter.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:18
---@return integer  Unique identifier.
function gameplay_rally_notebook_path:getNextUniqueIdentifier() end

--- Same for the offline compositor (separate instance).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:173
---@return table|nil  TextCompositor.
function gameplay_rally_notebook_path:getOfflineTextCompositor() end

--- Draws a weighted variant of a system pacenote.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1077
---@param desiredPrefix string Name of the system pacenote.
---@return table|nil  Variant.
---@return table|nil  Metadata.
function gameplay_rally_notebook_path:getRandomSystemPacenote(desiredPrefix) end

--- Attached snaproad.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:67
---@return table|nil  Snaproad.
function gameplay_rally_notebook_path:getSnaproad() end

--- System pacenotes (countdown, warnings…) according to the audio mode, with mission custom overrides; returns the name -> variants table and the audio metadata.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:919
---@return table  System pacenotes.
---@return table|nil  Metadata.
function gameplay_rally_notebook_path:getSystemPacenotesForAudioMode() end

--- Text compositor (created and loaded on demand, cached); nil and 'E' log if no voicepack matches (except in custom mode).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:148
---@return table|nil  TextCompositor.
function gameplay_rally_notebook_path:getTextCompositor() end

--- Visual compositor built on the text compositor; nil if there is no text compositor.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:199
---@return table|nil  VisualCompositor.
function gameplay_rally_notebook_path:getVisualCompositor2() end

--- Waypoint with the given identifier, or nil.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:623
---@param wpId integer Identifier.
---@return table|nil  Waypoint.
function gameplay_rally_notebook_path:getWaypoint(wpId) end

--- true if there is at least one pacenote.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:228
---@return boolean  Result.
function gameplay_rally_notebook_path:hasAnyPacenotes() end

--- Constructor: default fields, empty pacenote list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:23
---@param name string|nil Notebook name.
function gameplay_rally_notebook_path:init(name) end

--- Clears the cache of the active voicepack and of the offline metadata.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:115
function gameplay_rally_notebook_path:invalidateActiveVoicepackCache() end

--- Clears the custom caches (mapping, disk scan, metadata, transcriptions).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1408
function gameplay_rally_notebook_path:invalidateCustomAudioMapping() end

--- true if custom mode.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1173
---@return boolean  Result.
function gameplay_rally_notebook_path:isAudioModeCustom() end

--- true if freeform mode.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1169
---@return boolean  Result.
function gameplay_rally_notebook_path:isAudioModeFreeform() end

--- true if structuredOffline mode.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1165
---@return boolean  Result.
function gameplay_rally_notebook_path:isAudioModeOfflineStructured() end

--- true if structuredOnline mode.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1161
---@return boolean  Result.
function gameplay_rally_notebook_path:isAudioModeOnlineStructured() end

--- true if the notebook version is 2 or absent.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1182
---@return boolean  Result.
function gameplay_rally_notebook_path:isV2() end

--- true if the version is 3.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1186
---@return boolean  Result.
function gameplay_rally_notebook_path:isV3() end

--- true if validation_issues is empty.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:331
---@return boolean  Result.
function gameplay_rally_notebook_path:is_valid() end

--- Metadata (durations…) of the custom clips, cached ({} if absent).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1595
---@return table  Metadata.
function gameplay_rally_notebook_path:loadCustomPacenoteMetadata() end

--- Transcriptions of the custom clips (clip -> { description }), cached.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1609
---@return table  Transcriptions.
function gameplay_rally_notebook_path:loadCustomPacenoteTranscriptions() end

--- Metadata of the system overrides: merge of the shared file and the mission file.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1549
---@return table  Metadata.
function gameplay_rally_notebook_path:loadCustomSystemPacenoteMetadata() end

--- Metadata of the mission's freeform folder; nil if absent.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1648
---@return table|nil  Metadata.
function gameplay_rally_notebook_path:loadFreeformPacenoteMetadata() end

--- Metadata of the active voicepack (structured offline mode), cached per voicepack.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1623
---@return table  Metadata.
function gameplay_rally_notebook_path:loadOfflineStructuredPacenoteMetadata() end

--- Metadata of the mission's structured online folder; nil if the file does not exist.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1639
---@return table|nil  Metadata.
function gameplay_rally_notebook_path:loadOnlineStructuredPacenoteMetadata() end

--- Metadata of the mission's system folder; nil if absent.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1657
---@return table|nil  Metadata.
function gameplay_rally_notebook_path:loadSystemPacenoteMetadata() end

--- Marks all pacenotes as to do.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1120
function gameplay_rally_notebook_path:markAllTodo() end

--- Marks the given pacenote and all following ones as to do.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1132
---@param pacenote table Starting pacenote.
function gameplay_rally_notebook_path:markRestTodo(pacenote) end

--- Path of a text's audio file: <mode folder>/<name derived from the text hash>. nil without compositor.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1572
---@param audioModeDir string Mode subfolder.
---@param pacenoteTextOut string Pacenote text.
---@return string|nil  Path.
function gameplay_rally_notebook_path:missionPacenoteAudioFile(audioModeDir, pacenoteTextOut) end

--- Folder of the generated audio: <mission>/<notebooksPath>/<generatedPacenotesDir>/<notebook>/<audioModeDir>.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1190
---@param audioModeDir string Mode subfolder (rallyUtil.structuredDir, freeformDir, systemDir).
---@return string|nil  Path.
function gameplay_rally_notebook_path:missionPacenotesDir(audioModeDir) end

--- Mission voicepack entry whose notebooks list contains this notebook.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1212
---@return table|nil  Entry.
function gameplay_rally_notebook_path:missionVoicepackEntryForNotebook() end

--- Next import letter ("Import_X"); 'A' by default.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:378
---@return string  Letter.
function gameplay_rally_notebook_path:nextImportIdent() end

--- Reloads the notebook from JSON data (version, metadata, audio mode, pacenotes); migrates v2 to v3.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:557
---@param data table|nil Data.
function gameplay_rally_notebook_path:onDeserialized(data) end

--- Called when settings change: invalidates the voicepack and compositors, then recompiles the pacenotes.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:859
function gameplay_rally_notebook_path:onRallySettingsChanged() end

--- Data to save: name, description, authors, metadata, dates, pacenotes, audioMode, version.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:543
---@return table  JSON table.
function gameplay_rally_notebook_path:onSerialize() end

--- Trims the freeform text of each pacenote.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:694
function gameplay_rally_notebook_path:refreshAllFreeformNotes() end

--- Refreshes the structured then freeform texts of all pacenotes.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:680
function gameplay_rally_notebook_path:refreshAllPacenotes() end

--- Forgets the cached text compositor and recomposes the structured text of each pacenote (no effect in custom mode).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:685
function gameplay_rally_notebook_path:refreshAllStructuredNotes() end

--- Full chain: names (cleanupNames), trigger types, remeasure (remeasure), distances, texts. Logs the duration.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:723
---@param opts table|nil cleanupNames=false and/or remeasure=false to skip a step.
function gameplay_rally_notebook_path:refreshPacenotes(opts) end

--- Rereads the notebook file and deserializes it.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:316
function gameplay_rally_notebook_path:reload() end

--- For each pacenote, partitions the snaproad over it and measures the corner (no effect without snaproad).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:711
function gameplay_rally_notebook_path:remeasureAllPacenotes() end

--- Resolves (cache per mission + choice) the effective voicepack via voicepack.resolveEffectiveEntry.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:122
---@return any  Voicepack.
---@return table|nil  Voicepack entry.
---@return any  Third result of resolveEffectiveEntry.
function gameplay_rally_notebook_path:resolveActiveVoicepack() end

--- Looks for the audio overrides of the system pacenotes (<name>_<i>.ogg, or <name>.ogg if a single variant) in the game's shared folder then in the mission (the mission wins); result is cached.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1518
---@param systemPacenotes table name -> variants.
---@return table<string, string>  Key name_i -> path.
function gameplay_rally_notebook_path:resolveAllCustomSystemPacenotes(systemPacenotes) end

--- Full path of a clip via the owning voicepack (with reuseAudioFrom fallback).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1280
---@param basename string|nil Clip name.
---@return string|nil  Path.
function gameplay_rally_notebook_path:resolveCustomAudioBasename(basename) end

--- Writes the notebook as JSON (updates updated_at).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:297
---@param fname string|nil Path (default self.fname).
---@return boolean  Success.
function gameplay_rally_notebook_path:save(fname) end

--- Sorted list (cache) of the numbered pacenote_*.ogg clips present in the custom audio folder; system clips are excluded.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1260
---@return string[]  File names.
function gameplay_rally_notebook_path:scanCustomAudioBasenames() end

--- Dummy co-driver (see notes).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:666
---@return table  { id, name, language, voice }.
function gameplay_rally_notebook_path:selectedCodriver() end

--- Language of the dummy co-driver.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:675
---@return string  Language.
function gameplay_rally_notebook_path:selectedCodriverLanguage() end

--- Sets the neighbors (previous/next) of the pacenote with the given identifier and clears those of the others.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1094
---@param pacenote_id integer Identifier.
function gameplay_rally_notebook_path:setAdjacentNotes(pacenote_id) end

--- Sets the neighbors of all pacenotes.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1107
function gameplay_rally_notebook_path:setAllAdjacentNotes() end

--- Sets the radius of the waypoints of all pacenotes.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:639
---@param newRadius number Radius in meters.
---@param wpType string|nil Waypoint type to filter on.
function gameplay_rally_notebook_path:setAllRadii(newRadius, wpType) end

--- Sets the notebook's audio mode.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1157
---@param mode integer RallyEnums.pacenoteAudioMode.
function gameplay_rally_notebook_path:setAudioMode(mode) end

--- Places a clip's anchor on a pacenote (removes the clip's old anchor), invalidates the caches.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1444
---@param pacenote table Pacenote.
---@param basename string Clip.
---@return boolean  Success.
function gameplay_rally_notebook_path:setCustomAudioAnchor(pacenote, basename) end

--- Sets the notebook file and invalidates the voicepack cache.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:292
---@param newFname string Path.
function gameplay_rally_notebook_path:setFname(newFname) end

--- Attaches the snaproad (provided by the editor or the RallyManager) and, if non-nil, reruns autofillDistanceCalls().
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:60
---@param sn table|nil Snaproad.
function gameplay_rally_notebook_path:setSnaproad(sn) end

--- Sorts the pacenotes by trailing number of the name (then by name), updates sortOrder and invalidates the custom audio mapping.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:359
function gameplay_rally_notebook_path:sortPacenotesByName() end

--- After a new audio export: rescans the disk and removes the anchors whose file has disappeared.
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1490
function gameplay_rally_notebook_path:syncCustomAudioFromDisk() end

--- Migration v2 to v3: migrates each pacenote, sets the version to "3" and reruns autofill.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:602
function gameplay_rally_notebook_path:upgradeFromV2ToV3() end

--- Only resets the compile failures (the co-driver is no longer saved).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1672
---@param codriver any Not used.
function gameplay_rally_notebook_path:useCodriver(codriver) end

--- true if the mode is structured (online or offline).
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:1177
---@return boolean  Result.
function gameplay_rally_notebook_path:useStructured() end

--- Empties validation_issues (no real rule).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/path.lua:327
function gameplay_rally_notebook_path:validate() end

