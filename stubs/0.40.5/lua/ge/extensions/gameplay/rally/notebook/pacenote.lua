---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/pacenote.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/rally/notebook/pacenote.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_rally_notebook_pacenote
local gameplay_rally_notebook_pacenote = {}

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2081
---@param snaproad any
---@param wp any
---@param fwd any
function gameplay_rally_notebook_pacenote:_moveWaypointTowardsStepper(snaproad, wp, fwd) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:135
function gameplay_rally_notebook_pacenote:allToTerrain() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2378
function gameplay_rally_notebook_pacenote:applyMeasurements() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:851
function gameplay_rally_notebook_pacenote:asCompiled() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1896
function gameplay_rally_notebook_pacenote:audioFnameFreeform() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1970
---@param opts any
function gameplay_rally_notebook_pacenote:audioFnamesStructuredOffline(opts) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1925
---@param opts any
function gameplay_rally_notebook_pacenote:audioFnamesStructuredOnline(opts) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1942
---@param opts any
function gameplay_rally_notebook_pacenote:audioItemsStructuredOffline(opts) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1909
---@param opts any
function gameplay_rally_notebook_pacenote:audioItemsStructuredOnline(opts) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:794
function gameplay_rally_notebook_pacenote:audioLenTotal() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:811
function gameplay_rally_notebook_pacenote:audioObjs() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:827
function gameplay_rally_notebook_pacenote:audioObjsFresh() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2292
function gameplay_rally_notebook_pacenote:canDeleteAudioFiles() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2353
function gameplay_rally_notebook_pacenote:caution() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2359
function gameplay_rally_notebook_pacenote:cautionLevel() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:798
---@param audioMode any
---@param fnames any
function gameplay_rally_notebook_pacenote:checkFilesExist(audioMode, fnames) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1233
function gameplay_rally_notebook_pacenote:clearAdjacentNotes() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:638
function gameplay_rally_notebook_pacenote:clearCachedFgData() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:643
function gameplay_rally_notebook_pacenote:clearCompilationFailures() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:634
function gameplay_rally_notebook_pacenote:clearResolvedAudioObjs() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1220
function gameplay_rally_notebook_pacenote:clearTodo() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2368
function gameplay_rally_notebook_pacenote:corner() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:495
function gameplay_rally_notebook_pacenote:currentStructuredContentOutput() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:487
function gameplay_rally_notebook_pacenote:currentStructuredOutput() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2316
function gameplay_rally_notebook_pacenote:customAudioFileDir() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2297
function gameplay_rally_notebook_pacenote:deleteAudioFiles() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2312
---@param lang any
function gameplay_rally_notebook_pacenote:deleteLanguage(lang) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:647
function gameplay_rally_notebook_pacenote:didCompileFail() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1708
---@param toPacenote any
function gameplay_rally_notebook_pacenote:distanceCornerEndToCornerStart(toPacenote) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1631
function gameplay_rally_notebook_pacenote:drawDebugMeasurement() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1831
---@param pacenoteToolsState any
---@param globalOpacity any
---@param showTextOverride any
function gameplay_rally_notebook_pacenote:drawDebugPacenoteBackground(pacenoteToolsState, globalOpacity, showTextOverride) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1598
---@param drawConfig any
---@param pacenoteToolsState any
function gameplay_rally_notebook_pacenote:drawDebugPacenoteHelper(drawConfig, pacenoteToolsState) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1849
---@param pacenoteToolsState any
---@param pn_sel any
---@param globalOpacity any
function gameplay_rally_notebook_pacenote:drawDebugPacenoteNext(pacenoteToolsState, pn_sel, globalOpacity) end

--- used when no pacenote is selected
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1802
---@param pacenoteToolsState any
---@param globalOpacity any
function gameplay_rally_notebook_pacenote:drawDebugPacenoteNoSelection(pacenoteToolsState, globalOpacity) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1815
---@param pacenoteToolsState any
---@param globalOpacity any
---@param csColor any
---@param showLabel any
---@param textColor any
function gameplay_rally_notebook_pacenote:drawDebugPacenoteNoSelectionRainbow(pacenoteToolsState, globalOpacity, csColor, showLabel, textColor) end

--- used when creating a new pacenote
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1787
---@param pacenoteToolsState any
function gameplay_rally_notebook_pacenote:drawDebugPacenotePartitionAllSnaproad(pacenoteToolsState) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1865
---@param pacenoteToolsState any
---@param pn_sel any
---@param globalOpacity any
function gameplay_rally_notebook_pacenote:drawDebugPacenotePrev(pacenoteToolsState, pn_sel, globalOpacity) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1881
---@param pacenoteToolsState any
---@param globalOpacity any
function gameplay_rally_notebook_pacenote:drawDebugPacenoteSelected(pacenoteToolsState, globalOpacity) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2328
---@param itemType any
function gameplay_rally_notebook_pacenote:findItem(itemType) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2337
---@param itemType any
function gameplay_rally_notebook_pacenote:findItems(itemType) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2259
function gameplay_rally_notebook_pacenote:generateFreeformFromStructured() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:973
function gameplay_rally_notebook_pacenote:getAudioMode() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:969
function gameplay_rally_notebook_pacenote:getAudioModeSetting() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:988
function gameplay_rally_notebook_pacenote:getAudioModeString() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2255
function gameplay_rally_notebook_pacenote:getCachedLength() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1093
function gameplay_rally_notebook_pacenote:getCornerEndWaypoint() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1084
function gameplay_rally_notebook_pacenote:getCornerStartWaypoint() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:619
function gameplay_rally_notebook_pacenote:getCustomAudioFile() end

--- custom-mode audio files: the notebook computes the assignment of clip basenames to
---  pacenotes (live even-distribution plus persisted manual pins). this resolves each
---  basename to a full path via the owner voicepack (honouring reuseAudioFrom fallback).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:608
function gameplay_rally_notebook_pacenote:getCustomAudioFiles() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:624
function gameplay_rally_notebook_pacenote:getCustomDescription() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1692
function gameplay_rally_notebook_pacenote:getDistanceMeasureWaypoint() end

--- used by pacenoteWaypoints.lua
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:106
function gameplay_rally_notebook_pacenote:getNextUniqueIdentifier() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:110
function gameplay_rally_notebook_pacenote:getNextWaypointType() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:547
---@param lang any
function gameplay_rally_notebook_pacenote:getNoteFieldAfter(lang) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:558
---@param lang any
function gameplay_rally_notebook_pacenote:getNoteFieldAfterMeters(lang) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:503
---@param lang any
function gameplay_rally_notebook_pacenote:getNoteFieldBefore(lang) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:514
---@param lang any
function gameplay_rally_notebook_pacenote:getNoteFieldBeforeMeters(lang) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:525
---@param lang any
function gameplay_rally_notebook_pacenote:getNoteFieldFreeform(lang) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:536
---@param lang any
function gameplay_rally_notebook_pacenote:getNoteFieldStructured(lang) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2204
function gameplay_rally_notebook_pacenote:getPosForOrbitCamera() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2173
function gameplay_rally_notebook_pacenote:getSlowCornerReleaseType() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2165
function gameplay_rally_notebook_pacenote:getTriggerType() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2364
function gameplay_rally_notebook_pacenote:hasCorner() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2374
---@param itemType any
function gameplay_rally_notebook_pacenote:hasModifier(itemType) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:50
---@param notebook any
---@param name any
---@param forceId any
function gameplay_rally_notebook_pacenote:init(notebook, name, forceId) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2251
function gameplay_rally_notebook_pacenote:invalidateCamPosCache() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1005
function gameplay_rally_notebook_pacenote:isAudioModeCustom() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1001
function gameplay_rally_notebook_pacenote:isAudioModeFreeform() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:997
function gameplay_rally_notebook_pacenote:isAudioModeStructuredOffline() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:993
function gameplay_rally_notebook_pacenote:isAudioModeStructuredOnline() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2107
function gameplay_rally_notebook_pacenote:isLastPacenote() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2193
function gameplay_rally_notebook_pacenote:isSlowCornerReleaseCeMinus5() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2189
function gameplay_rally_notebook_pacenote:isSlowCornerReleaseCeStatic() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2181
function gameplay_rally_notebook_pacenote:isSlowCornerReleaseCsHalf() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2185
function gameplay_rally_notebook_pacenote:isSlowCornerReleaseCsStatic() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2177
function gameplay_rally_notebook_pacenote:isSlowCornerReleaseCsStaticMinus40() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1029
function gameplay_rally_notebook_pacenote:is_valid() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2324
function gameplay_rally_notebook_pacenote:items() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1216
function gameplay_rally_notebook_pacenote:markTodo() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2069
---@param searchPattern any
function gameplay_rally_notebook_pacenote:matchesSearchPattern(searchPattern) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:442
---@param corner any
function gameplay_rally_notebook_pacenote:measurementTypeForCorner(corner) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:446
---@param measurementType any
function gameplay_rally_notebook_pacenote:measurementVariantForType(measurementType) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2100
---@param snaproads any
---@param wp any
---@param fwd any
---@param step any
function gameplay_rally_notebook_pacenote:moveWaypointTowards(snaproads, wp, fwd, step) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2064
function gameplay_rally_notebook_pacenote:nameComponents() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1728
function gameplay_rally_notebook_pacenote:noteOutputCustom() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:236
---@param lang any
function gameplay_rally_notebook_pacenote:noteOutputFreeform(lang) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1749
function gameplay_rally_notebook_pacenote:noteOutputPreview() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:479
function gameplay_rally_notebook_pacenote:noteOutputStructuredOffline() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:380
---@param lang any
function gameplay_rally_notebook_pacenote:noteOutputStructuredOnline(lang) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1782
function gameplay_rally_notebook_pacenote:noteTextForDrawDebug() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1143
---@param data any
---@param oldIdMap any
function gameplay_rally_notebook_pacenote:onDeserialized(data, oldIdMap) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1102
function gameplay_rally_notebook_pacenote:onSerialize() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1033
function gameplay_rally_notebook_pacenote:pacenoteTextForSelect() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1987
---@param currLap any
---@param maxLap any
function gameplay_rally_notebook_pacenote:playbackAllowed(currLap, maxLap) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2111
function gameplay_rally_notebook_pacenote:refreshFreeform() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2197
function gameplay_rally_notebook_pacenote:refreshStructured() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:774
---@param mode any
---@param audioObjs any
function gameplay_rally_notebook_pacenote:resolveAudioObjs(mode, audioObjs) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1025
function gameplay_rally_notebook_pacenote:selectedCodriver() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1021
function gameplay_rally_notebook_pacenote:selectedCodriverLanguage() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:453
function gameplay_rally_notebook_pacenote:selectedMeasurementVariant() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1228
---@param prevNote any
---@param nextNote any
function gameplay_rally_notebook_pacenote:setAdjacentNotes(prevNote, nextNote) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:127
---@param newRadius any
---@param wpType any
function gameplay_rally_notebook_pacenote:setAllRadii(newRadius, wpType) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1009
---@param mode any
function gameplay_rally_notebook_pacenote:setAudioMode(mode) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2247
---@param len any
function gameplay_rally_notebook_pacenote:setCachedLength(len) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1696
---@param value any
function gameplay_rally_notebook_pacenote:setDistanceMeasureWaypoint(value) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1224
---@param navgraphName any
---@param fallback any
function gameplay_rally_notebook_pacenote:setNavgraph(navgraphName, fallback) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:597
---@param val any
---@param meters any
function gameplay_rally_notebook_pacenote:setNoteFieldAfter(val, meters) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:569
---@param val any
---@param meters any
function gameplay_rally_notebook_pacenote:setNoteFieldBefore(val, meters) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:577
---@param val any
---@param lang any
function gameplay_rally_notebook_pacenote:setNoteFieldFreeform(val, lang) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:587
---@param val any
---@param lang any
function gameplay_rally_notebook_pacenote:setNoteFieldStructured(val, lang) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2169
---@param val any
function gameplay_rally_notebook_pacenote:setSlowCornerReleaseType(val) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2161
---@param val any
function gameplay_rally_notebook_pacenote:setTriggerType(val) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1051
function gameplay_rally_notebook_pacenote:slowCornerAsText() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:457
function gameplay_rally_notebook_pacenote:structuredForProjection() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:352
---@param opts any
function gameplay_rally_notebook_pacenote:structuredPhraseEntriesOffline(opts) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:326
---@param lang any
---@param distBefore any
---@param distAfter any
---@param opts any
function gameplay_rally_notebook_pacenote:structuredPhraseEntriesOnline(lang, distBefore, distAfter, opts) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2136
function gameplay_rally_notebook_pacenote:toggleDistanceBeforeModifier() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2128
function gameplay_rally_notebook_pacenote:toggleIgnoreDistanceCalls() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2132
function gameplay_rally_notebook_pacenote:toggleIncludeLinkWord() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2140
function gameplay_rally_notebook_pacenote:toggleIsolate() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2124
function gameplay_rally_notebook_pacenote:toggleSlowCorner() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1068
function gameplay_rally_notebook_pacenote:triggerTypeAsSmallIndicator() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1059
function gameplay_rally_notebook_pacenote:triggerTypeAsText() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1206
function gameplay_rally_notebook_pacenote:upgradeFromV2ToV3() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1013
function gameplay_rally_notebook_pacenote:useStructured() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:930
function gameplay_rally_notebook_pacenote:validate() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2035
---@param distAway any
function gameplay_rally_notebook_pacenote:vehiclePlacementPosAndRot(distAway) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1701
function gameplay_rally_notebook_pacenote:waypointForAfterLink() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1687
function gameplay_rally_notebook_pacenote:waypointForBeforeLink() end

