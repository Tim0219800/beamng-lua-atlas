# `gameplay_rally_notebook_pacenote`

*File: `lua/ge/extensions/gameplay/rally/notebook/pacenote.lua` · VM: Game Engine (GE) · 2391 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/notebook/pacenote")` (file under extensions/ but not a regular extension)

A rally pacenote (one co-driver note): class instantiated by the notebook (notebook, path.lua). It carries two waypoints (cornerStart and cornerEnd) in a sortedList, structured content with six slots (structured.lua), per-language texts (distance before/after, free text), an audio mode (auto, freeform, structuredOnline, structuredOffline, custom), a trigger type, geometric measurements of the corner and caches (compilation, length, camera position). It composes the text and audio files via the notebook's compositors and voicepack, produces the "compiled" object played by the co-driver (audioObjs, visual event), validates itself, serializes itself and draws itself in the editor (debugDrawer). Useful to a modder for reading or modifying a loaded notebook.

## Example

```lua
local Pacenote = require('/lua/ge/extensions/gameplay/rally/notebook/pacenote')
local pn = Pacenote(notebook, 'Pacenote 12')
print(pn:noteOutputPreview(), pn:getAudioModeString())
local corner = pn:corner() -- nil or { type='corner', ... }
```

## Notes

- The module returns a constructor: Pacenote(notebook, name, forceId). The notebook must provide getNextUniqueIdentifier, getLanguages, selectedCodriverLanguage, getTextCompositor, getOfflineTextCompositor, getVisualCompositor2, resolveActiveVoicepack, load*PacenoteMetadata, etc.
- C.noteFields = { before, beforeMeters, note, after, afterMeters }: keys of the fields of a per-language text (self.notes[lang]).
- self.notes is no longer saved: onSerialize does not write the texts; the structured text is rebuilt on load. A notebook in freeform mode therefore loses its free text on save ('W' warning logged).
- Probable bug: playbackAllowed uses the variable `context` whereas its definition is commented out (local context = {currLap, maxLap}); setfenv(func, context) therefore receives nil (global) and the "Lua code" branch fails or behaves in an undefined way. Only nil/empty, true/t, false/f are reliable.
- validate() fills self.validation_issues and returns nothing; use is_valid() afterwards (true if no issues).
- The drawing modes (drawDebugPacenote*) depend on pacenoteToolsState (selected_pn_id, selected_wp_id, shift, showMeasurements) provided by the editor; they are meaningless outside the editor.
- setNavgraph is a stub that logs 'setNavgraph() not implemented'.
- The "after" distance is measured from cornerEnd by default, or from cornerStart if distanceMeasureWaypoint == 'cs' (default value 'ce', not serialized as long as it is 'ce').

## Class `C`

Pacenote instance. Fields: notebook, id, pk (stable random identifier), name, todo, playback_rules (text condition), isolate, triggerType, slowCornerReleaseType, slowCorner, ignoreDistanceCalls, includeLinkWord, distanceBeforeModifier, distanceMeasureWaypoint, audioMode, notes (by language), structured, pacenoteWaypoints (sortedList), metadata (metadata.system hides the structured mode), measurements {corner1, corner2, splitPoint, variants, selectedType, selected}, sortOrder, validation_issues, halfpoint, prevNote/nextNote, customAudioAnchors.

The module returns a constructor: `local obj = require("gameplay_rally_notebook_pacenote")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_moveWaypointTowardsStepper(snaproad, wp, fwd)` | Moves a waypoint forward by 2 m along the road, reruns the notebook's autofillDistanceCalls and realigns the normal. | 2081 |
| `C:allToTerrain()` | Snaps each waypoint to the terrain with zSnap.zSnapWithCurrentMethod. | 135 |
| `C:applyMeasurements()` | Since measurements are projection data, only refreshes the structured text (refreshStructured) without changing the canonical items. | 2378 |
| `C:asCompiled()` | Compiles the pacenote (cached): audioObjs and durations for the four modes, preview text, before/after distances and the visual event (visualPacenoteEvent) produced by the visual compositor. Returns nil if _compileFailed. | 851 |
| `C:audioFnameFreeform()` | Path of the freeform text's audio file in the mission's freeform folder. | 1896 |
| `C:audioFnamesStructuredOffline(opts)` | File names of the structured offline mode. | 1970 |
| `C:audioFnamesStructuredOnline(opts)` | File names (first candidate if several) of the structured online mode. | 1925 |
| `C:audioItemsStructuredOffline(opts)` | Audio items of the structured offline mode, according to the active voicepack; empty list without voicepack or compositor. | 1942 |
| `C:audioItemsStructuredOnline(opts)` | Audio items of the structured online mode: { candidates, category } or { fname, category } per phrase. | 1909 |
| `C:audioLenTotal()` | Total audio duration (s) of the active mode's audioObjs. | 794 |
| `C:audioObjs()` | audioObjs of the current audio mode from asCompiled (resolved, cached); nil if compilation failed or the mode is unknown. | 811 |
| `C:audioObjsFresh()` | Recomputes the audioObjs of the current mode without going through the compile cache. | 827 |
| `C:canDeleteAudioFiles()` | true in structuredOnline or freeform mode (generated files). | 2292 |
| `C:caution()` | Item in slot 1 if it is of type caution. | 2353 |
| `C:cautionLevel()` | Caution level (1 to 3) or nil. | 2359 |
| `C:checkFilesExist(audioMode, fnames)` | true if all file names are non-empty and exist (FS:fileExists). | 798 |
| `C:clearAdjacentNotes()` | Forgets the adjacent pacenotes. | 1233 |
| `C:clearCachedFgData()` | Clears the compilation cache and the resolved audioObjs; call after modifying the content. | 638 |
| `C:clearCompilationFailures()` | Resets the compilation failure flag to false. | 643 |
| `C:clearResolvedAudioObjs()` | Clears the cache of resolved audioObjs (variant draw). | 634 |
| `C:clearTodo()` | Removes the to-do mark. | 1220 |
| `C:corner()` | Item in slot 4 if it is of type corner. | 2368 |
| `C:currentStructuredContentOutput()` | Like currentStructuredOutput but without the before/after distances. | 495 |
| `C:currentStructuredOutput()` | Current structured texts (online), or the stored structured field as a fallback. | 487 |
| `C:customAudioFileDir()` | The notebook's custom audio folder. | 2316 |
| `C:deleteAudioFiles()` | Deletes (FS:removeFile) the pacenote's generated audio files according to the mode; no effect if not deletable. | 2297 |
| `C:deleteLanguage(lang)` | Deletes the texts of a language. | 2312 |
| `C:didCompileFail()` | true if the compilation was marked as failed. | 647 |
| `C:distanceCornerEndToCornerStart(toPacenote)` | Distance along the road between this pacenote's "after" link waypoint and the next one's cornerStart, via snaproad:distanceBetweenPositions. Returns 0.0 if a waypoint is missing and nil if no snaproad is available. | 1708 |
| `C:drawDebugMeasurement()` | Draws the measured arcs (fitted circle, points p1 p2 p3, fit quality) of the selected variant; ignores arcs with a diameter >= 750 m; marks the break points of multiple segments. | 1631 |
| `C:drawDebugPacenoteBackground(pacenoteToolsState, globalOpacity, showTextOverride)` | Background drawing (cs and ce, low opacity). | 1831 |
| `C:drawDebugPacenoteHelper(drawConfig, pacenoteToolsState)` | Common drawing: cs, orbit camera, ce and measurement geometry according to drawConfig (cs, ce, campoint, measurement, texts, colors, radii). | 1598 |
| `C:drawDebugPacenoteNext(pacenoteToolsState, pn_sel, globalOpacity)` | Drawing of the pacenote following the selection. | 1849 |
| `C:drawDebugPacenoteNoSelection(pacenoteToolsState, globalOpacity)` | Drawing used when no pacenote is selected (cs only). | 1802 |
| `C:drawDebugPacenoteNoSelectionRainbow(pacenoteToolsState, globalOpacity, csColor, showLabel, textColor)` | Colored variant of the no-selection drawing (cs color forced, optional label). | 1815 |
| `C:drawDebugPacenotePartitionAllSnaproad(pacenoteToolsState)` | Drawing used when creating a pacenote (cs and ce, reduced radius). | 1787 |
| `C:drawDebugPacenotePrev(pacenoteToolsState, pn_sel, globalOpacity)` | Drawing of the pacenote preceding the selection. | 1865 |
| `C:drawDebugPacenoteSelected(pacenoteToolsState, globalOpacity)` | Drawing of the selected pacenote (cs, ce, camera point if the pacenoteOrbit camera is active, measurements). | 1881 |
| `C:findItem(itemType)` | First structured item of a given type. | 2328 |
| `C:findItems(itemType)` | All structured items of a given type. | 2337 |
| `C:generateFreeformFromStructured()` | Generates a freeform text from the structured one (compositeTextEscaped), preserving the custom positions of the distance variables, and saves it. | 2259 |
| `C:getAudioMode()` | Effective audio mode: the notebook's mode if the setting is auto. | 973 |
| `C:getAudioModeSetting()` | The pacenote's own audio mode (may be auto). | 969 |
| `C:getAudioModeString()` | Readable name of the effective mode. | 988 |
| `C:getCachedLength()` | Stored length. | 2255 |
| `C:getCornerEndWaypoint()` | First waypoint of type cornerEnd, or nil. | 1093 |
| `C:getCornerStartWaypoint()` | First waypoint of type cornerStart (sorted list), or nil. | 1084 |
| `C:getCustomAudioFile()` | First custom audio file, or '' if there is none. | 619 |
| `C:getCustomAudioFiles()` | Custom mode: asks the notebook for the clip names assigned to this pacenote (automatic distribution plus manual anchors) and resolves them to full paths via the owner voicepack. | 608 |
| `C:getCustomDescription()` | Description (transcript) of the first custom clip, '' if absent. | 624 |
| `C:getDistanceMeasureWaypoint()` | 'cs' or 'ce' (default): waypoint from which the "after" distance is measured. | 1692 |
| `C:getNextUniqueIdentifier()` | Delegates to the notebook to obtain a unique identifier (used by the waypoints). | 106 |
| `C:getNextWaypointType()` | Type of the next waypoint to create: cornerStart if missing, otherwise cornerEnd if missing, otherwise nil. | 110 |
| `C:getNoteFieldAfter(lang)` | "After" distance text of a language ('' if absent). | 547 |
| `C:getNoteFieldAfterMeters(lang)` | "After" distance in meters (-1 if unknown). | 558 |
| `C:getNoteFieldBefore(lang)` | "Before" distance text of a language ('' if absent). | 503 |
| `C:getNoteFieldBeforeMeters(lang)` | "Before" distance in meters (-1 if unknown). | 514 |
| `C:getNoteFieldFreeform(lang)` | Raw free text of a language ('' if absent). | 525 |
| `C:getNoteFieldStructured(lang)` | Stored structured text of a language ({} if absent). | 536 |
| `C:getPosForOrbitCamera()` | Position of the orbit camera (cached): centroid of halfpoint, cs and ce; otherwise midpoint of cs and ce; otherwise cs; otherwise (0,0,0). | 2204 |
| `C:getSlowCornerReleaseType()` | Slow corner release type. | 2173 |
| `C:getTriggerType()` | Trigger type. | 2165 |
| `C:hasCorner()` | true if slot 4 contains a corner. | 2364 |
| `C:hasModifier(itemType)` | true if an item of the given type exists. | 2374 |
| `C:init(notebook, name, forceId)` | Constructor: initializes all fields to defaults (dynamic trigger, auto audio mode, empty texts per notebook language, empty structured, empty waypoint list). | 50 |
| `C:invalidateCamPosCache()` | Forgets the cached camera position. | 2251 |
| `C:isAudioModeCustom()` | true if the effective mode is custom. | 1005 |
| `C:isAudioModeFreeform()` | true if the effective mode is freeform. | 1001 |
| `C:isAudioModeStructuredOffline()` | true if the effective mode is structuredOffline. | 997 |
| `C:isAudioModeStructuredOnline()` | true if the effective mode is structuredOnline. | 993 |
| `C:isLastPacenote()` | true if this is the notebook's last sorted pacenote. | 2107 |
| `C:isSlowCornerReleaseCeMinus5()` | true if slowCorner and type ceMinus5. | 2193 |
| `C:isSlowCornerReleaseCeStatic()` | true if slowCorner and type ceStatic. | 2189 |
| `C:isSlowCornerReleaseCsHalf()` | true if slowCorner and type csHalf. | 2181 |
| `C:isSlowCornerReleaseCsStatic()` | true if slowCorner and type csStatic. | 2185 |
| `C:isSlowCornerReleaseCsStaticMinus40()` | true if slowCorner and type csStaticMinus40. | 2177 |
| `C:is_valid()` | true if validation_issues is empty (after validate). | 1029 |
| `C:items()` | Ordered structured items (structured:orderedItems). | 2324 |
| `C:markTodo()` | Marks the pacenote as to do. | 1216 |
| `C:matchesSearchPattern(searchPattern)` | true if the freeform text of one of the languages matches the search pattern (rallyUtil.matchSearchPattern). | 2069 |
| `C:measurementTypeForCorner(corner)` | Normalized measurement type of a corner (via geoPacenotes.normalizeMeasurementType). | 442 |
| `C:measurementVariantForType(measurementType)` | Measurement variant for a type, falling back to the default variant then measurements.corner1. | 446 |
| `C:moveWaypointTowards(snaproads, wp, fwd, step)` | Repeats the 2 m move of a waypoint along the road step times. | 2100 |
| `C:nameComponents()` | Splits the name into a base and a trailing number (pattern "(.-)%s*([%d%.]+)$"). | 2064 |
| `C:noteOutputCustom()` | Custom mode: descriptions of the assigned clips, joined by ' \| '; nil if there are none. | 1728 |
| `C:noteOutputFreeform(lang)` | Final free text of a language, with before/after distance variables interpolated. Empty string if compilation failed or the note is unusable. | 236 |
| `C:noteOutputPreview()` | Text preview according to the mode (structured, freeform, custom); '<empty>' if nothing; prefixed with '[S] ' for a slow corner. | 1749 |
| `C:noteOutputStructuredOffline()` | List of offline structured mode texts ({} if unavailable). | 479 |
| `C:noteOutputStructuredOnline(lang)` | List of online structured mode texts; if the compositor is absent, falls back to the texts stored in self.notes[lang].note.structured. | 380 |
| `C:noteTextForDrawDebug()` | Text displayed above the waypoint in the 3D view (= noteOutputPreview). | 1782 |
| `C:onDeserialized(data, oldIdMap)` | Reloads from the saved data: converts the old codriverWait into triggerType, ignores the legacy fwdAudioTrigger waypoints, copies data.notes if present and reloads structured. | 1143 |
| `C:onSerialize()` | Data to save: oldId, name, pk, playback_rules, isolate, triggerType, slowCornerReleaseType, audioMode, todo, metadata, waypoints, structured, slowCorner, ignoreDistanceCalls, includeLinkWord, distanceBeforeModifier, distanceMeasureWaypoint (if different from 'ce'), customAudioAnchors (if present). The note texts are not written. | 1102 |
| `C:pacenoteTextForSelect()` | Label for a selection list: second word of the name + ' - ' + preview. | 1033 |
| `C:playbackAllowed(currLap, maxLap)` | Evaluates playback_rules: empty/nil or 'true'/'t' allows, 'false'/'f' denies, otherwise the condition is compiled with loadstring and executed (see notes: bug on `context`). Returns the result and an optional error message. | 1987 |
| `C:refreshFreeform()` | Trims the freeform text and rewrites it, unless it is empty, blocked (autofill_blocker) or of unknown transcription. | 2111 |
| `C:refreshStructured()` | Recomposes the structured online text and stores it in the structured field of the selected language. | 2197 |
| `C:resolveAudioObjs(mode, audioObjs)` | Resolves (once per mode, result cached) the audioObjs: for each object with candidates, picks a variant at random (math.random). | 774 |
| `C:selectedCodriver()` | Selected co-driver (via the notebook). | 1025 |
| `C:selectedCodriverLanguage()` | Language of the selected co-driver (via the notebook). | 1021 |
| `C:selectedMeasurementVariant()` | Measurement variant matching the current corner. | 453 |
| `C:setAdjacentNotes(prevNote, nextNote)` | Stores the previous and next pacenotes (for drawing). | 1228 |
| `C:setAllRadii(newRadius, wpType)` | Sets the radius of all waypoints (or only those of one type). | 127 |
| `C:setAudioMode(mode)` | Sets the pacenote's own audio mode. | 1009 |
| `C:setCachedLength(len)` | Stores the pacenote's length. | 2247 |
| `C:setDistanceMeasureWaypoint(value)` | Sets the measurement waypoint (any value other than 'cs' falls back to 'ce' and is not stored). | 1696 |
| `C:setNavgraph(navgraphName, fallback)` | Stub: logs a 'not implemented' warning. | 1224 |
| `C:setNoteFieldAfter(val, meters)` | Sets the "after" text and distance for the selected co-driver's language. | 597 |
| `C:setNoteFieldBefore(val, meters)` | Sets the "before" text and distance for the selected co-driver's language. | 569 |
| `C:setNoteFieldFreeform(val, lang)` | Sets the free text of a language. | 577 |
| `C:setNoteFieldStructured(val, lang)` | Sets the stored structured text of a language. | 587 |
| `C:setSlowCornerReleaseType(val)` | Sets the slow corner release type. | 2169 |
| `C:setTriggerType(val)` | Sets the trigger type. | 2161 |
| `C:slowCornerAsText()` | '[S] slow corner' if slowCorner, otherwise ''. | 1051 |
| `C:structuredForProjection()` | Copy of the structured { schemaVersion, items } enriched, on the corner, with the live measurements: direction (-1 left, 1 right), intensity (diameter), arcDegrees, arcMeters, chordMeters. Does not modify the source structured. | 457 |
| `C:structuredPhraseEntriesOffline(opts)` | Same for offline mode (active voicepack and offline compositor). | 352 |
| `C:structuredPhraseEntriesOnline(lang, distBefore, distAfter, opts)` | Phrase entries of the "online" text compositor for the projected structured content; can resolve the mission voicepack's audio variants. | 326 |
| `C:toggleDistanceBeforeModifier()` | Toggles distanceBeforeModifier (places the distance before the post-corner modifiers). | 2136 |
| `C:toggleIgnoreDistanceCalls()` | Toggles ignoreDistanceCalls. | 2128 |
| `C:toggleIncludeLinkWord()` | Toggles includeLinkWord (true by default). | 2132 |
| `C:toggleIsolate()` | Toggles isolate; when enabled, sets the before/after distances to the internal level autodist_internal_level1, when disabled clears them so that autofill takes over again (except blocked fields). | 2140 |
| `C:toggleSlowCorner()` | Toggles slowCorner. | 2124 |
| `C:triggerTypeAsSmallIndicator()` | Abbreviation of the trigger type: I, csS, cs+50%, ce-5m, ceS; nil for the others. | 1068 |
| `C:triggerTypeAsText()` | Text "triggerType: [indicator] name" for the editor. | 1059 |
| `C:upgradeFromV2ToV3()` | Format migration: transforms each langData.note into { freeform = old, structured = {} }. | 1206 |
| `C:useStructured()` | true if structured content is used: structured online or offline mode, and not a system pacenote (metadata.system). | 1013 |
| `C:validate()` | Fills validation_issues: missing cs/ce waypoint, empty name, empty note, missing custom file, missing freeform note or unknown transcription. | 930 |
| `C:vehiclePlacementPosAndRot(distAway)` | Position and rotation to place a vehicle before the pacenote: distAway meters from cs along its normal, on the side opposite ce, facing cs. | 2035 |
| `C:waypointForAfterLink()` | Starting waypoint for the "after" distance according to distanceMeasureWaypoint. | 1701 |
| `C:waypointForBeforeLink()` | Reference waypoint for the "before" distance: cornerStart. | 1687 |

## Calls into the engine (C++)

- `FS:` `fileExists`, `removeFile`
- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/notebook/pacenote.lua`.*
