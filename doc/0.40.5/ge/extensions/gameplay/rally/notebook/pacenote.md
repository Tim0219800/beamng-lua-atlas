# `gameplay_rally_notebook_pacenote`

*Fichier : `lua/ge/extensions/gameplay/rally/notebook/pacenote.lua` · VM : Game Engine (GE) · 2391 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/notebook/pacenote")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_notebook_pacenote")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_moveWaypointTowardsStepper(snaproad, wp, fwd)` |  | 2081 |
| `C:allToTerrain()` |  | 135 |
| `C:applyMeasurements()` |  | 2378 |
| `C:asCompiled()` |  | 851 |
| `C:audioFnameFreeform()` |  | 1896 |
| `C:audioFnamesStructuredOffline(opts)` |  | 1970 |
| `C:audioFnamesStructuredOnline(opts)` |  | 1925 |
| `C:audioItemsStructuredOffline(opts)` |  | 1942 |
| `C:audioItemsStructuredOnline(opts)` |  | 1909 |
| `C:audioLenTotal()` |  | 794 |
| `C:audioObjs()` |  | 811 |
| `C:audioObjsFresh()` |  | 827 |
| `C:canDeleteAudioFiles()` |  | 2292 |
| `C:caution()` |  | 2353 |
| `C:cautionLevel()` |  | 2359 |
| `C:checkFilesExist(audioMode, fnames)` |  | 798 |
| `C:clearAdjacentNotes()` |  | 1233 |
| `C:clearCachedFgData()` |  | 638 |
| `C:clearCompilationFailures()` |  | 643 |
| `C:clearResolvedAudioObjs()` |  | 634 |
| `C:clearTodo()` |  | 1220 |
| `C:corner()` |  | 2368 |
| `C:currentStructuredContentOutput()` |  | 495 |
| `C:currentStructuredOutput()` |  | 487 |
| `C:customAudioFileDir()` |  | 2316 |
| `C:deleteAudioFiles()` |  | 2297 |
| `C:deleteLanguage(lang)` |  | 2312 |
| `C:didCompileFail()` |  | 647 |
| `C:distanceCornerEndToCornerStart(toPacenote)` |  | 1708 |
| `C:drawDebugMeasurement()` |  | 1631 |
| `C:drawDebugPacenoteBackground(pacenoteToolsState, globalOpacity, showTextOverride)` |  | 1831 |
| `C:drawDebugPacenoteHelper(drawConfig, pacenoteToolsState)` |  | 1598 |
| `C:drawDebugPacenoteNext(pacenoteToolsState, pn_sel, globalOpacity)` |  | 1849 |
| `C:drawDebugPacenoteNoSelection(pacenoteToolsState, globalOpacity)` | used when no pacenote is selected | 1802 |
| `C:drawDebugPacenoteNoSelectionRainbow(pacenoteToolsState, globalOpacity, csColor, showLabel, textColor)` |  | 1815 |
| `C:drawDebugPacenotePartitionAllSnaproad(pacenoteToolsState)` | used when creating a new pacenote | 1787 |
| `C:drawDebugPacenotePrev(pacenoteToolsState, pn_sel, globalOpacity)` |  | 1865 |
| `C:drawDebugPacenoteSelected(pacenoteToolsState, globalOpacity)` |  | 1881 |
| `C:findItem(itemType)` |  | 2328 |
| `C:findItems(itemType)` |  | 2337 |
| `C:generateFreeformFromStructured()` |  | 2259 |
| `C:getAudioMode()` |  | 973 |
| `C:getAudioModeSetting()` |  | 969 |
| `C:getAudioModeString()` |  | 988 |
| `C:getCachedLength()` |  | 2255 |
| `C:getCornerEndWaypoint()` |  | 1093 |
| `C:getCornerStartWaypoint()` |  | 1084 |
| `C:getCustomAudioFile()` |  | 619 |
| `C:getCustomAudioFiles()` | custom-mode audio files: the notebook computes the assignment of clip basenames to<br> pacenotes (live even-distribution plus persisted manual pins). this resolves each<br> basename to a full path via the owner voicepack (honouring reuseAudioFrom fallback). | 608 |
| `C:getCustomDescription()` |  | 624 |
| `C:getDistanceMeasureWaypoint()` |  | 1692 |
| `C:getNextUniqueIdentifier()` | used by pacenoteWaypoints.lua | 106 |
| `C:getNextWaypointType()` |  | 110 |
| `C:getNoteFieldAfter(lang)` |  | 547 |
| `C:getNoteFieldAfterMeters(lang)` |  | 558 |
| `C:getNoteFieldBefore(lang)` |  | 503 |
| `C:getNoteFieldBeforeMeters(lang)` |  | 514 |
| `C:getNoteFieldFreeform(lang)` |  | 525 |
| `C:getNoteFieldStructured(lang)` |  | 536 |
| `C:getPosForOrbitCamera()` |  | 2204 |
| `C:getSlowCornerReleaseType()` |  | 2173 |
| `C:getTriggerType()` |  | 2165 |
| `C:hasCorner()` |  | 2364 |
| `C:hasModifier(itemType)` |  | 2374 |
| `C:init(notebook, name, forceId)` |  | 50 |
| `C:invalidateCamPosCache()` |  | 2251 |
| `C:isAudioModeCustom()` |  | 1005 |
| `C:isAudioModeFreeform()` |  | 1001 |
| `C:isAudioModeStructuredOffline()` |  | 997 |
| `C:isAudioModeStructuredOnline()` |  | 993 |
| `C:isLastPacenote()` |  | 2107 |
| `C:isSlowCornerReleaseCeMinus5()` |  | 2193 |
| `C:isSlowCornerReleaseCeStatic()` |  | 2189 |
| `C:isSlowCornerReleaseCsHalf()` |  | 2181 |
| `C:isSlowCornerReleaseCsStatic()` |  | 2185 |
| `C:isSlowCornerReleaseCsStaticMinus40()` |  | 2177 |
| `C:is_valid()` |  | 1029 |
| `C:items()` |  | 2324 |
| `C:markTodo()` |  | 1216 |
| `C:matchesSearchPattern(searchPattern)` |  | 2069 |
| `C:measurementTypeForCorner(corner)` |  | 442 |
| `C:measurementVariantForType(measurementType)` |  | 446 |
| `C:moveWaypointTowards(snaproads, wp, fwd, step)` |  | 2100 |
| `C:nameComponents()` |  | 2064 |
| `C:noteOutputCustom()` |  | 1728 |
| `C:noteOutputFreeform(lang)` |  | 236 |
| `C:noteOutputPreview()` |  | 1749 |
| `C:noteOutputStructuredOffline()` |  | 479 |
| `C:noteOutputStructuredOnline(lang)` |  | 380 |
| `C:noteTextForDrawDebug()` |  | 1782 |
| `C:onDeserialized(data, oldIdMap)` |  | 1143 |
| `C:onSerialize()` |  | 1102 |
| `C:pacenoteTextForSelect()` |  | 1033 |
| `C:playbackAllowed(currLap, maxLap)` |  | 1987 |
| `C:refreshFreeform()` |  | 2111 |
| `C:refreshStructured()` |  | 2197 |
| `C:resolveAudioObjs(mode, audioObjs)` |  | 774 |
| `C:selectedCodriver()` |  | 1025 |
| `C:selectedCodriverLanguage()` |  | 1021 |
| `C:selectedMeasurementVariant()` |  | 453 |
| `C:setAdjacentNotes(prevNote, nextNote)` |  | 1228 |
| `C:setAllRadii(newRadius, wpType)` |  | 127 |
| `C:setAudioMode(mode)` |  | 1009 |
| `C:setCachedLength(len)` |  | 2247 |
| `C:setDistanceMeasureWaypoint(value)` |  | 1696 |
| `C:setNavgraph(navgraphName, fallback)` |  | 1224 |
| `C:setNoteFieldAfter(val, meters)` |  | 597 |
| `C:setNoteFieldBefore(val, meters)` |  | 569 |
| `C:setNoteFieldFreeform(val, lang)` |  | 577 |
| `C:setNoteFieldStructured(val, lang)` |  | 587 |
| `C:setSlowCornerReleaseType(val)` |  | 2169 |
| `C:setTriggerType(val)` |  | 2161 |
| `C:slowCornerAsText()` |  | 1051 |
| `C:structuredForProjection()` |  | 457 |
| `C:structuredPhraseEntriesOffline(opts)` |  | 352 |
| `C:structuredPhraseEntriesOnline(lang, distBefore, distAfter, opts)` |  | 326 |
| `C:toggleDistanceBeforeModifier()` |  | 2136 |
| `C:toggleIgnoreDistanceCalls()` |  | 2128 |
| `C:toggleIncludeLinkWord()` |  | 2132 |
| `C:toggleIsolate()` |  | 2140 |
| `C:toggleSlowCorner()` |  | 2124 |
| `C:triggerTypeAsSmallIndicator()` |  | 1068 |
| `C:triggerTypeAsText()` |  | 1059 |
| `C:upgradeFromV2ToV3()` |  | 1206 |
| `C:useStructured()` |  | 1013 |
| `C:validate()` |  | 930 |
| `C:vehiclePlacementPosAndRot(distAway)` |  | 2035 |
| `C:waypointForAfterLink()` |  | 1701 |
| `C:waypointForBeforeLink()` |  | 1687 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `removeFile`
- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/notebook/pacenote.lua`.*
