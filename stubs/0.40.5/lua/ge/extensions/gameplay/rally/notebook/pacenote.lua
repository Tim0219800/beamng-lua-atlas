---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/pacenote.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pacenote instance. Fields: notebook, id, pk (stable random identifier), name, todo, playback_rules (text condition), isolate, triggerType, slowCornerReleaseType, slowCorner, ignoreDistanceCalls, includeLinkWord, distanceBeforeModifier, distanceMeasureWaypoint, audioMode, notes (by language), structured, pacenoteWaypoints (sortedList), metadata (metadata.system hides the structured mode), measurements {corner1, corner2, splitPoint, variants, selectedType, selected}, sortOrder, validation_issues, halfpoint, prevNote/nextNote, customAudioAnchors.
---@class gameplay_rally_notebook_pacenote
local gameplay_rally_notebook_pacenote = {}

--- Moves a waypoint forward by 2 m along the road, reruns the notebook's autofillDistanceCalls and realigns the normal.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2081
---@param snaproad table Snaproad.
---@param wp table Waypoint.
---@param fwd boolean Direction of movement.
function gameplay_rally_notebook_pacenote:_moveWaypointTowardsStepper(snaproad, wp, fwd) end

--- Snaps each waypoint to the terrain with zSnap.zSnapWithCurrentMethod.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:135
function gameplay_rally_notebook_pacenote:allToTerrain() end

--- Since measurements are projection data, only refreshes the structured text (refreshStructured) without changing the canonical items.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2378
function gameplay_rally_notebook_pacenote:applyMeasurements() end

--- Compiles the pacenote (cached): audioObjs and durations for the four modes, preview text, before/after distances and the visual event (visualPacenoteEvent) produced by the visual compositor. Returns nil if _compileFailed.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:851
---@return table|nil  { id, name, noteText, audioObjs*, audioLen*, visualPacenoteEvent, distanceBefore, distanceAfter }.
function gameplay_rally_notebook_pacenote:asCompiled() end

--- Path of the freeform text's audio file in the mission's freeform folder.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1896
---@return string  Path.
function gameplay_rally_notebook_pacenote:audioFnameFreeform() end

--- File names of the structured offline mode.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1970
---@param opts table|nil includeMissingVariant.
---@return string[]  Paths.
function gameplay_rally_notebook_pacenote:audioFnamesStructuredOffline(opts) end

--- File names (first candidate if several) of the structured online mode.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1925
---@param opts table|nil includeMissingVariant.
---@return string[]  Paths.
function gameplay_rally_notebook_pacenote:audioFnamesStructuredOnline(opts) end

--- Audio items of the structured offline mode, according to the active voicepack; empty list without voicepack or compositor.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1942
---@param opts table|nil includeMissingVariant.
---@return table[]  Audio items.
function gameplay_rally_notebook_pacenote:audioItemsStructuredOffline(opts) end

--- Audio items of the structured online mode: { candidates, category } or { fname, category } per phrase.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1909
---@param opts table|nil includeMissingVariant.
---@return table[]  Audio items.
function gameplay_rally_notebook_pacenote:audioItemsStructuredOnline(opts) end

--- Total audio duration (s) of the active mode's audioObjs.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:794
---@return number  Seconds.
function gameplay_rally_notebook_pacenote:audioLenTotal() end

--- audioObjs of the current audio mode from asCompiled (resolved, cached); nil if compilation failed or the mode is unknown.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:811
---@return table[]|nil  List of audioObjs (pacenoteFname, audioLen, category, structuredTimingAfter…).
function gameplay_rally_notebook_pacenote:audioObjs() end

--- Recomputes the audioObjs of the current mode without going through the compile cache.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:827
---@return table[]|nil  Resolved audioObjs.
function gameplay_rally_notebook_pacenote:audioObjsFresh() end

--- true in structuredOnline or freeform mode (generated files).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2292
---@return boolean  Result.
function gameplay_rally_notebook_pacenote:canDeleteAudioFiles() end

--- Item in slot 1 if it is of type caution.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2353
---@return table|nil  Element.
function gameplay_rally_notebook_pacenote:caution() end

--- Caution level (1 to 3) or nil.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2359
---@return integer|nil  Level.
function gameplay_rally_notebook_pacenote:cautionLevel() end

--- true if all file names are non-empty and exist (FS:fileExists).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:798
---@param audioMode string Mode (only used for a commented-out log).
---@param fnames string[] Files to test.
---@return boolean  Result.
function gameplay_rally_notebook_pacenote:checkFilesExist(audioMode, fnames) end

--- Forgets the adjacent pacenotes.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1233
function gameplay_rally_notebook_pacenote:clearAdjacentNotes() end

--- Clears the compilation cache and the resolved audioObjs; call after modifying the content.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:638
function gameplay_rally_notebook_pacenote:clearCachedFgData() end

--- Resets the compilation failure flag to false.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:643
function gameplay_rally_notebook_pacenote:clearCompilationFailures() end

--- Clears the cache of resolved audioObjs (variant draw).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:634
function gameplay_rally_notebook_pacenote:clearResolvedAudioObjs() end

--- Removes the to-do mark.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1220
function gameplay_rally_notebook_pacenote:clearTodo() end

--- Item in slot 4 if it is of type corner.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2368
---@return table|nil  Corner element.
function gameplay_rally_notebook_pacenote:corner() end

--- Like currentStructuredOutput but without the before/after distances.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:495
---@return string[]  Texts.
function gameplay_rally_notebook_pacenote:currentStructuredContentOutput() end

--- Current structured texts (online), or the stored structured field as a fallback.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:487
---@return string[]  Texts.
function gameplay_rally_notebook_pacenote:currentStructuredOutput() end

--- The notebook's custom audio folder.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2316
---@return string  Path.
function gameplay_rally_notebook_pacenote:customAudioFileDir() end

--- Deletes (FS:removeFile) the pacenote's generated audio files according to the mode; no effect if not deletable.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2297
function gameplay_rally_notebook_pacenote:deleteAudioFiles() end

--- Deletes the texts of a language.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2312
---@param lang string Language.
function gameplay_rally_notebook_pacenote:deleteLanguage(lang) end

--- true if the compilation was marked as failed.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:647
---@return boolean  Result.
function gameplay_rally_notebook_pacenote:didCompileFail() end

--- Distance along the road between this pacenote's "after" link waypoint and the next one's cornerStart, via snaproad:distanceBetweenPositions. Returns 0.0 if a waypoint is missing and nil if no snaproad is available.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1708
---@param toPacenote table Next pacenote.
---@return number|nil  Distance in meters.
function gameplay_rally_notebook_pacenote:distanceCornerEndToCornerStart(toPacenote) end

--- Draws the measured arcs (fitted circle, points p1 p2 p3, fit quality) of the selected variant; ignores arcs with a diameter >= 750 m; marks the break points of multiple segments.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1631
function gameplay_rally_notebook_pacenote:drawDebugMeasurement() end

--- Background drawing (cs and ce, low opacity).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1831
---@param pacenoteToolsState table State.
---@param globalOpacity number Opacity.
---@param showTextOverride boolean|nil Forces the text to be displayed.
function gameplay_rally_notebook_pacenote:drawDebugPacenoteBackground(pacenoteToolsState, globalOpacity, showTextOverride) end

--- Common drawing: cs, orbit camera, ce and measurement geometry according to drawConfig (cs, ce, campoint, measurement, texts, colors, radii).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1598
---@param drawConfig table Drawing configuration.
---@param pacenoteToolsState table Editor tools state.
function gameplay_rally_notebook_pacenote:drawDebugPacenoteHelper(drawConfig, pacenoteToolsState) end

--- Drawing of the pacenote following the selection.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1849
---@param pacenoteToolsState table State.
---@param pn_sel table Selected pacenote (unused).
---@param globalOpacity number Opacity.
function gameplay_rally_notebook_pacenote:drawDebugPacenoteNext(pacenoteToolsState, pn_sel, globalOpacity) end

--- Drawing used when no pacenote is selected (cs only).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1802
---@param pacenoteToolsState table State.
---@param globalOpacity number Global opacity.
function gameplay_rally_notebook_pacenote:drawDebugPacenoteNoSelection(pacenoteToolsState, globalOpacity) end

--- Colored variant of the no-selection drawing (cs color forced, optional label).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1815
---@param pacenoteToolsState table State.
---@param globalOpacity number Opacity.
---@param csColor table Color {r,g,b}.
---@param showLabel boolean Show the label.
---@param textColor table Text color.
function gameplay_rally_notebook_pacenote:drawDebugPacenoteNoSelectionRainbow(pacenoteToolsState, globalOpacity, csColor, showLabel, textColor) end

--- Drawing used when creating a pacenote (cs and ce, reduced radius).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1787
---@param pacenoteToolsState table Tools state.
function gameplay_rally_notebook_pacenote:drawDebugPacenotePartitionAllSnaproad(pacenoteToolsState) end

--- Drawing of the pacenote preceding the selection.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1865
---@param pacenoteToolsState table State.
---@param pn_sel table Selected pacenote (unused).
---@param globalOpacity number Opacity.
function gameplay_rally_notebook_pacenote:drawDebugPacenotePrev(pacenoteToolsState, pn_sel, globalOpacity) end

--- Drawing of the selected pacenote (cs, ce, camera point if the pacenoteOrbit camera is active, measurements).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1881
---@param pacenoteToolsState table State.
---@param globalOpacity number Opacity.
function gameplay_rally_notebook_pacenote:drawDebugPacenoteSelected(pacenoteToolsState, globalOpacity) end

--- First structured item of a given type.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2328
---@param itemType string Type (caution, corner, modifier name).
---@return table|nil  Element.
function gameplay_rally_notebook_pacenote:findItem(itemType) end

--- All structured items of a given type.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2337
---@param itemType string Type.
---@return table[]  Items.
function gameplay_rally_notebook_pacenote:findItems(itemType) end

--- Generates a freeform text from the structured one (compositeTextEscaped), preserving the custom positions of the distance variables, and saves it.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2259
function gameplay_rally_notebook_pacenote:generateFreeformFromStructured() end

--- Effective audio mode: the notebook's mode if the setting is auto.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:973
---@return integer  Value of RallyEnums.pacenoteAudioMode.
function gameplay_rally_notebook_pacenote:getAudioMode() end

--- The pacenote's own audio mode (may be auto).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:969
---@return integer  Value of RallyEnums.pacenoteAudioMode.
function gameplay_rally_notebook_pacenote:getAudioModeSetting() end

--- Readable name of the effective mode.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:988
---@return string  Name.
function gameplay_rally_notebook_pacenote:getAudioModeString() end

--- Stored length.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2255
---@return number|nil  Length.
function gameplay_rally_notebook_pacenote:getCachedLength() end

--- First waypoint of type cornerEnd, or nil.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1093
---@return table|nil  Waypoint.
function gameplay_rally_notebook_pacenote:getCornerEndWaypoint() end

--- First waypoint of type cornerStart (sorted list), or nil.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1084
---@return table|nil  Waypoint.
function gameplay_rally_notebook_pacenote:getCornerStartWaypoint() end

--- First custom audio file, or '' if there is none.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:619
---@return string  Path.
function gameplay_rally_notebook_pacenote:getCustomAudioFile() end

--- Custom mode: asks the notebook for the clip names assigned to this pacenote (automatic distribution plus manual anchors) and resolves them to full paths via the owner voicepack.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:608
---@return string[]  Audio file paths.
function gameplay_rally_notebook_pacenote:getCustomAudioFiles() end

--- Description (transcript) of the first custom clip, '' if absent.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:624
---@return string  Description.
function gameplay_rally_notebook_pacenote:getCustomDescription() end

--- 'cs' or 'ce' (default): waypoint from which the "after" distance is measured.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1692
---@return string  'cs' or 'ce'.
function gameplay_rally_notebook_pacenote:getDistanceMeasureWaypoint() end

--- Delegates to the notebook to obtain a unique identifier (used by the waypoints).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:106
---@return integer  Identifier.
function gameplay_rally_notebook_pacenote:getNextUniqueIdentifier() end

--- Type of the next waypoint to create: cornerStart if missing, otherwise cornerEnd if missing, otherwise nil.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:110
---@return string|nil  Waypoint type.
function gameplay_rally_notebook_pacenote:getNextWaypointType() end

--- "After" distance text of a language ('' if absent).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:547
---@param lang string|nil Language.
---@return string  Text.
function gameplay_rally_notebook_pacenote:getNoteFieldAfter(lang) end

--- "After" distance in meters (-1 if unknown).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:558
---@param lang string|nil Language.
---@return number  Meters.
function gameplay_rally_notebook_pacenote:getNoteFieldAfterMeters(lang) end

--- "Before" distance text of a language ('' if absent).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:503
---@param lang string|nil Language (default: selected co-driver).
---@return string  Text.
function gameplay_rally_notebook_pacenote:getNoteFieldBefore(lang) end

--- "Before" distance in meters (-1 if unknown).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:514
---@param lang string|nil Language.
---@return number  Meters.
function gameplay_rally_notebook_pacenote:getNoteFieldBeforeMeters(lang) end

--- Raw free text of a language ('' if absent).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:525
---@param lang string|nil Language.
---@return string  Text.
function gameplay_rally_notebook_pacenote:getNoteFieldFreeform(lang) end

--- Stored structured text of a language ({} if absent).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:536
---@param lang string|nil Language.
---@return table  List of texts.
function gameplay_rally_notebook_pacenote:getNoteFieldStructured(lang) end

--- Position of the orbit camera (cached): centroid of halfpoint, cs and ce; otherwise midpoint of cs and ce; otherwise cs; otherwise (0,0,0).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2204
---@return vec3  Position.
function gameplay_rally_notebook_pacenote:getPosForOrbitCamera() end

--- Slow corner release type.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2173
---@return integer  RallyEnums.slowCornerReleaseType.
function gameplay_rally_notebook_pacenote:getSlowCornerReleaseType() end

--- Trigger type.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2165
---@return integer  RallyEnums.triggerType.
function gameplay_rally_notebook_pacenote:getTriggerType() end

--- true if slot 4 contains a corner.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2364
---@return boolean  Result.
function gameplay_rally_notebook_pacenote:hasCorner() end

--- true if an item of the given type exists.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2374
---@param itemType string Modifier type.
---@return boolean  Result.
function gameplay_rally_notebook_pacenote:hasModifier(itemType) end

--- Constructor: initializes all fields to defaults (dynamic trigger, auto audio mode, empty texts per notebook language, empty structured, empty waypoint list).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:50
---@param notebook table Owner notebook.
---@param name string|nil Name (default "Pacenote <id>").
---@param forceId integer|nil Imposed identifier.
function gameplay_rally_notebook_pacenote:init(notebook, name, forceId) end

--- Forgets the cached camera position.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2251
function gameplay_rally_notebook_pacenote:invalidateCamPosCache() end

--- true if the effective mode is custom.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1005
---@return boolean  Result.
function gameplay_rally_notebook_pacenote:isAudioModeCustom() end

--- true if the effective mode is freeform.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1001
---@return boolean  Result.
function gameplay_rally_notebook_pacenote:isAudioModeFreeform() end

--- true if the effective mode is structuredOffline.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:997
---@return boolean  Result.
function gameplay_rally_notebook_pacenote:isAudioModeStructuredOffline() end

--- true if the effective mode is structuredOnline.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:993
---@return boolean  Result.
function gameplay_rally_notebook_pacenote:isAudioModeStructuredOnline() end

--- true if this is the notebook's last sorted pacenote.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2107
---@return boolean  Result.
function gameplay_rally_notebook_pacenote:isLastPacenote() end

--- true if slowCorner and type ceMinus5.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2193
---@return boolean  Result.
function gameplay_rally_notebook_pacenote:isSlowCornerReleaseCeMinus5() end

--- true if slowCorner and type ceStatic.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2189
---@return boolean  Result.
function gameplay_rally_notebook_pacenote:isSlowCornerReleaseCeStatic() end

--- true if slowCorner and type csHalf.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2181
---@return boolean  Result.
function gameplay_rally_notebook_pacenote:isSlowCornerReleaseCsHalf() end

--- true if slowCorner and type csStatic.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2185
---@return boolean  Result.
function gameplay_rally_notebook_pacenote:isSlowCornerReleaseCsStatic() end

--- true if slowCorner and type csStaticMinus40.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2177
---@return boolean  Result.
function gameplay_rally_notebook_pacenote:isSlowCornerReleaseCsStaticMinus40() end

--- true if validation_issues is empty (after validate).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1029
---@return boolean  Result.
function gameplay_rally_notebook_pacenote:is_valid() end

--- Ordered structured items (structured:orderedItems).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2324
---@return table[]  Items.
function gameplay_rally_notebook_pacenote:items() end

--- Marks the pacenote as to do.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1216
function gameplay_rally_notebook_pacenote:markTodo() end

--- true if the freeform text of one of the languages matches the search pattern (rallyUtil.matchSearchPattern).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2069
---@param searchPattern string Pattern.
---@return boolean  Result.
function gameplay_rally_notebook_pacenote:matchesSearchPattern(searchPattern) end

--- Normalized measurement type of a corner (via geoPacenotes.normalizeMeasurementType).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:442
---@param corner table|nil Corner element.
---@return string  Measurement type (single, split2, split3).
function gameplay_rally_notebook_pacenote:measurementTypeForCorner(corner) end

--- Measurement variant for a type, falling back to the default variant then measurements.corner1.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:446
---@param measurementType string|nil Measurement type.
---@return table|nil  Measurement (diameter, direction, arcDegrees, arcMeters, chordMeters...).
function gameplay_rally_notebook_pacenote:measurementVariantForType(measurementType) end

--- Repeats the 2 m move of a waypoint along the road step times.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2100
---@param snaproads table Snaproad (misleading plural name).
---@param wp table Waypoint.
---@param fwd boolean Direction.
---@param step integer|nil Number of steps (1 by default).
function gameplay_rally_notebook_pacenote:moveWaypointTowards(snaproads, wp, fwd, step) end

--- Splits the name into a base and a trailing number (pattern "(.-)%s*([%d%.]+)$").
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2064
---@return string|nil  Base.
---@return string|nil  Number.
function gameplay_rally_notebook_pacenote:nameComponents() end

--- Custom mode: descriptions of the assigned clips, joined by ' | '; nil if there are none.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1728
---@return string|nil  Text.
function gameplay_rally_notebook_pacenote:noteOutputCustom() end

--- Final free text of a language, with before/after distance variables interpolated. Empty string if compilation failed or the note is unusable.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:236
---@param lang string|nil Language (default: that of the selected co-driver).
---@return string  Text.
function gameplay_rally_notebook_pacenote:noteOutputFreeform(lang) end

--- Text preview according to the mode (structured, freeform, custom); '<empty>' if nothing; prefixed with '[S] ' for a slow corner.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1749
---@return string  Preview.
function gameplay_rally_notebook_pacenote:noteOutputPreview() end

--- List of offline structured mode texts ({} if unavailable).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:479
---@return string[]  Texts.
function gameplay_rally_notebook_pacenote:noteOutputStructuredOffline() end

--- List of online structured mode texts; if the compositor is absent, falls back to the texts stored in self.notes[lang].note.structured.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:380
---@param lang string|nil Language.
---@return string[]  Texts.
function gameplay_rally_notebook_pacenote:noteOutputStructuredOnline(lang) end

--- Text displayed above the waypoint in the 3D view (= noteOutputPreview).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1782
---@return string  Text.
function gameplay_rally_notebook_pacenote:noteTextForDrawDebug() end

--- Reloads from the saved data: converts the old codriverWait into triggerType, ignores the legacy fwdAudioTrigger waypoints, copies data.notes if present and reloads structured.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1143
---@param data table Data produced by onSerialize.
---@param oldIdMap table Old/new identifier mapping table.
function gameplay_rally_notebook_pacenote:onDeserialized(data, oldIdMap) end

--- Data to save: oldId, name, pk, playback_rules, isolate, triggerType, slowCornerReleaseType, audioMode, todo, metadata, waypoints, structured, slowCorner, ignoreDistanceCalls, includeLinkWord, distanceBeforeModifier, distanceMeasureWaypoint (if different from 'ce'), customAudioAnchors (if present). The note texts are not written.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1102
---@return table  JSON-serializable table.
function gameplay_rally_notebook_pacenote:onSerialize() end

--- Label for a selection list: second word of the name + ' - ' + preview.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1033
---@return string  Label.
function gameplay_rally_notebook_pacenote:pacenoteTextForSelect() end

--- Evaluates playback_rules: empty/nil or 'true'/'t' allows, 'false'/'f' denies, otherwise the condition is compiled with loadstring and executed (see notes: bug on `context`). Returns the result and an optional error message.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1987
---@param currLap integer|nil Current lap (-1 by default).
---@param maxLap integer|nil Number of laps (-1 by default).
---@return boolean|any  Allowed or not.
---@return string|nil  Syntax or runtime error.
function gameplay_rally_notebook_pacenote:playbackAllowed(currLap, maxLap) end

--- Trims the freeform text and rewrites it, unless it is empty, blocked (autofill_blocker) or of unknown transcription.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2111
function gameplay_rally_notebook_pacenote:refreshFreeform() end

--- Recomposes the structured online text and stores it in the structured field of the selected language.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2197
function gameplay_rally_notebook_pacenote:refreshStructured() end

--- Resolves (once per mode, result cached) the audioObjs: for each object with candidates, picks a variant at random (math.random).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:774
---@param mode string 'freeform', 'structuredOnline', 'structuredOffline' or 'custom'.
---@param audioObjs table[]|nil Unresolved audioObjs.
---@return table[]|nil  Concrete audioObjs.
function gameplay_rally_notebook_pacenote:resolveAudioObjs(mode, audioObjs) end

--- Selected co-driver (via the notebook).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1025
---@return table  Co-driver.
function gameplay_rally_notebook_pacenote:selectedCodriver() end

--- Language of the selected co-driver (via the notebook).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1021
---@return string  Language.
function gameplay_rally_notebook_pacenote:selectedCodriverLanguage() end

--- Measurement variant matching the current corner.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:453
---@return table|nil  Measurement.
function gameplay_rally_notebook_pacenote:selectedMeasurementVariant() end

--- Stores the previous and next pacenotes (for drawing).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1228
---@param prevNote table|nil Previous.
---@param nextNote table|nil Next.
function gameplay_rally_notebook_pacenote:setAdjacentNotes(prevNote, nextNote) end

--- Sets the radius of all waypoints (or only those of one type).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:127
---@param newRadius number Radius in meters.
---@param wpType string|nil Type to filter, nil for all.
function gameplay_rally_notebook_pacenote:setAllRadii(newRadius, wpType) end

--- Sets the pacenote's own audio mode.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1009
---@param mode integer Value of RallyEnums.pacenoteAudioMode.
function gameplay_rally_notebook_pacenote:setAudioMode(mode) end

--- Stores the pacenote's length.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2247
---@param len number Length in meters.
function gameplay_rally_notebook_pacenote:setCachedLength(len) end

--- Sets the measurement waypoint (any value other than 'cs' falls back to 'ce' and is not stored).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1696
---@param value string|nil 'cs' or 'ce'.
function gameplay_rally_notebook_pacenote:setDistanceMeasureWaypoint(value) end

--- Stub: logs a 'not implemented' warning.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1224
---@param navgraphName string Not used.
---@param fallback any Not used.
function gameplay_rally_notebook_pacenote:setNavgraph(navgraphName, fallback) end

--- Sets the "after" text and distance for the selected co-driver's language.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:597
---@param val string Text.
---@param meters number Distance in meters (-1 unknown).
function gameplay_rally_notebook_pacenote:setNoteFieldAfter(val, meters) end

--- Sets the "before" text and distance for the selected co-driver's language.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:569
---@param val string Text.
---@param meters number Distance in meters (-1 unknown).
function gameplay_rally_notebook_pacenote:setNoteFieldBefore(val, meters) end

--- Sets the free text of a language.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:577
---@param val string Text.
---@param lang string|nil Language.
function gameplay_rally_notebook_pacenote:setNoteFieldFreeform(val, lang) end

--- Sets the stored structured text of a language.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:587
---@param val table List of texts.
---@param lang string|nil Language.
function gameplay_rally_notebook_pacenote:setNoteFieldStructured(val, lang) end

--- Sets the slow corner release type.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2169
---@param val integer RallyEnums.slowCornerReleaseType.
function gameplay_rally_notebook_pacenote:setSlowCornerReleaseType(val) end

--- Sets the trigger type.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2161
---@param val integer Value of RallyEnums.triggerType.
function gameplay_rally_notebook_pacenote:setTriggerType(val) end

--- '[S] slow corner' if slowCorner, otherwise ''.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1051
---@return string  Text.
function gameplay_rally_notebook_pacenote:slowCornerAsText() end

--- Copy of the structured { schemaVersion, items } enriched, on the corner, with the live measurements: direction (-1 left, 1 right), intensity (diameter), arcDegrees, arcMeters, chordMeters. Does not modify the source structured.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:457
---@return table  Projected structured.
function gameplay_rally_notebook_pacenote:structuredForProjection() end

--- Same for offline mode (active voicepack and offline compositor).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:352
---@param opts table|nil resolveVariants, includeMissingVariant.
---@return table[]|nil  Entries; nil without voicepack or compositor.
function gameplay_rally_notebook_pacenote:structuredPhraseEntriesOffline(opts) end

--- Phrase entries of the "online" text compositor for the projected structured content; can resolve the mission voicepack's audio variants.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:326
---@param lang string|nil Language for the before/after fields.
---@param distBefore string|nil Override of the before distance text.
---@param distAfter string|nil Override of the after distance text.
---@param opts table|nil resolveVariants, includeMissingVariant.
---@return table[]|nil  Entries { text, category, ... }; nil if no compositor.
function gameplay_rally_notebook_pacenote:structuredPhraseEntriesOnline(lang, distBefore, distAfter, opts) end

--- Toggles distanceBeforeModifier (places the distance before the post-corner modifiers).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2136
function gameplay_rally_notebook_pacenote:toggleDistanceBeforeModifier() end

--- Toggles ignoreDistanceCalls.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2128
function gameplay_rally_notebook_pacenote:toggleIgnoreDistanceCalls() end

--- Toggles includeLinkWord (true by default).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2132
function gameplay_rally_notebook_pacenote:toggleIncludeLinkWord() end

--- Toggles isolate; when enabled, sets the before/after distances to the internal level autodist_internal_level1, when disabled clears them so that autofill takes over again (except blocked fields).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2140
function gameplay_rally_notebook_pacenote:toggleIsolate() end

--- Toggles slowCorner.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2124
function gameplay_rally_notebook_pacenote:toggleSlowCorner() end

--- Abbreviation of the trigger type: I, csS, cs+50%, ce-5m, ceS; nil for the others.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1068
---@return string|nil  Indicator.
function gameplay_rally_notebook_pacenote:triggerTypeAsSmallIndicator() end

--- Text "triggerType: [indicator] name" for the editor.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1059
---@return string  Text.
function gameplay_rally_notebook_pacenote:triggerTypeAsText() end

--- Format migration: transforms each langData.note into { freeform = old, structured = {} }.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1206
function gameplay_rally_notebook_pacenote:upgradeFromV2ToV3() end

--- true if structured content is used: structured online or offline mode, and not a system pacenote (metadata.system).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1013
---@return boolean  Result.
function gameplay_rally_notebook_pacenote:useStructured() end

--- Fills validation_issues: missing cs/ce waypoint, empty name, empty note, missing custom file, missing freeform note or unknown transcription.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:930
function gameplay_rally_notebook_pacenote:validate() end

--- Position and rotation to place a vehicle before the pacenote: distAway meters from cs along its normal, on the side opposite ce, facing cs.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2035
---@param distAway number|nil Distance in meters (15 by default).
---@return vec3|nil  Position.
---@return quat|nil  Rotation; nil, nil if cs or ce is missing.
function gameplay_rally_notebook_pacenote:vehiclePlacementPosAndRot(distAway) end

--- Starting waypoint for the "after" distance according to distanceMeasureWaypoint.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1701
---@return table|nil  Waypoint.
function gameplay_rally_notebook_pacenote:waypointForAfterLink() end

--- Reference waypoint for the "before" distance: cornerStart.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1687
---@return table|nil  Waypoint.
function gameplay_rally_notebook_pacenote:waypointForBeforeLink() end

