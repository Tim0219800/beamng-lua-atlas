# `gameplay_rally_notebook_path`

*File: `lua/ge/extensions/gameplay/rally/notebook/path.lua` · VM: Game Engine (GE) · 1692 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/notebook/path")` (file under extensions/ but not a regular extension)

The rally notebook: container of a sorted list of pacenotes (pacenote.lua) saved in a *.notebook.json file under <mission>/rally/notebooks/. It handles loading/saving (format version "4"), the name/authors/description, the notebook's audio mode, resolution of the active voicepack (via the rally manager or the editor), the text and visual compositors, the automatic computation of distance calls between notes (autofillDistanceCalls) from the snaproad, generation of pacenotes from detected corners, system pacenotes (countdown, warnings), the paths of generated audio files and the "custom" audio mode (recorded clips distributed over the pacenotes by interpolation between manually placed anchors). The module returns a constructor: require('/lua/ge/extensions/gameplay/rally/notebook/path')(name).

## Example

```lua
local nb = require('/lua/ge/extensions/gameplay/rally/notebook/path')()
nb:setFname('/gameplay/missions/<type>/rallyStage/<id>/rally/notebooks/primary.notebook.json')
nb:onDeserialized(jsonReadFile(nb.fname))
for _, pn in ipairs(nb.pacenotes.sorted) do print(pn.name, pn:noteOutputPreview()) end
```

## Notes

- Expected file path: .../<mission>/rally/notebooks/<name>.notebook.json; getMissionDir goes up two folders from the file, getMissionId returns the part after /missions/.
- onDeserialized does not rebuild the texts (refreshAllStructuredNotes) or the distances: this is deferred to the consumers (editor, RallyManager) and to setSnaproad(), which calls autofillDistanceCalls().
- The co-driver concept is removed: selectedCodriver() returns a dummy object { id='_auto', name='<auto>', language, voice }; the language is the first one found in the pacenotes' notes.
- Probable bug: in _getRallyManagerPick, `rm.getVoicepackPickWritesSettings and rm:getVoicepackPickWritesSettings() or true` is always true when the method returns false (and/or idiom).
- Probable bug: findNClosestPacenotes calls getCornerStartWaypoint().pos without a nil check; a pacenote without a cornerStart waypoint causes an error.
- validate() only empties validation_issues: is_valid() is therefore always true for the notebook.
- In getAudioMode, the local variable `voicepack` shadows the file's voicepack module (harmless as long as self.audioMode is set, which is the case after init).
- nextImportIdent increments the ASCII letter without a bound: after 'Z' it returns non-alphabetic characters.
- Custom audio files are in the audio/ subfolder of the mission voicepack that owns the notebook; the pacenote_system_* clips are excluded from the scan. The mission overrides of the system pacenotes stay in notebooks/custom/<notebook>/.

## Class `C`

Notebook instance. Fields: _uid, id, name ("Primary" by default), description, authors, metadata, version, created_at, updated_at, pacenotes (sortedList), fname, validation_issues, audioMode (structuredOffline by default), snaproad, caches (compositors, voicepack, metadata, custom audio mapping).

The module returns a constructor: `local obj = require("gameplay_rally_notebook_path")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_detectFirstNotesLanguage()` | First language key found in the pacenotes' notes, or nil. | 655 |
| `C:_getRallyManagerPick()` | Current voicepack choice: the editor's if this notebook is the current one, otherwise that of the active RallyManager. Also returns a "writes settings" boolean (see notes). | 81 |
| `C:_missionPacenoteMetadataFile(audioModeDir)` | Path of the metadata file of a mode folder. | 1580 |
| `C:allToTerrain()` | Snaps all waypoints back to the terrain. | 645 |
| `C:allWaypoints()` | Table of all waypoints keyed by identifier. | 613 |
| `C:appendPacenotes(pacenotes)` | Creates one pacenote per entry and deserializes it. | 213 |
| `C:autoManageTriggerTypes()` | Forces csImmediate for the first pacenote and dynamic for the others. | 702 |
| `C:autofillDistanceCalls()` | Recomputes the distance calls: clears the before/after fields (except blocked or isolated fields), then for each pair of consecutive non-isolated pacenotes sets a link word (the next one's "before") or a distance (the current one's "after") according to the compositor. Stops if the snaproad or the compositor is missing. | 806 |
| `C:basename()` | Notebook file name (with extensions). | 279 |
| `C:basenameNoExt()` | Name without the two extensions (.notebook.json). | 285 |
| `C:cacheCompiledPacenotes()` | Recompiles all pacenotes (visual order numbers, clears caches) and logs the ones that fail. | 868 |
| `C:canSetCustomAudioAnchor(pacenote, basename)` | Checks that an anchor is possible: clip present on disk and monotonic order with the other anchors. | 1419 |
| `C:cleanupPacenoteNames()` | Renames each pacenote "<base> <index>" according to its position and rebuilds the name index. | 403 |
| `C:clearAllTodo()` | Removes the to-do mark from all pacenotes. | 1126 |
| `C:clearCompilationFailures()` | Resets the compile failures of all pacenotes. | 888 |
| `C:clearCustomAudioAnchor(basename)` | Removes a clip's anchor. | 1465 |
| `C:clearCustomSystemPacenoteCache()` | Clears the cache of the system overrides and their metadata. | 1544 |
| `C:clearPacenoteAudioModeOverrides()` | Puts all pacenotes back in auto audio mode (follow the notebook's). | 1666 |
| `C:clearResolvedAudioObjs()` | Clears the resolved audioObjs of all pacenotes. | 882 |
| `C:customAudioAnchorInfoFor(basename)` | Anchor info of a clip. | 1415 |
| `C:customAudioBasenamesFor(pacenote)` | Clips assigned to a pacenote. | 1403 |
| `C:customAudioEntry()` | Voicepack that owns the custom audio: the mission's, otherwise the active voicepack. | 1234 |
| `C:customPacenotesAudioDir()` | audio/ subfolder of the owning voicepack. | 1249 |
| `C:customPacenotesBaseDir()` | Folder of the mission overrides of the system pacenotes: <mission>/<notebooksPath>/custom/<notebook>. | 1512 |
| `C:customPacenotesDir()` | Root folder of the owning voicepack (clips, metadata, transcriptions). | 1241 |
| `C:deleteAllPacenotes()` | Replaces the list with an empty sortedList. | 220 |
| `C:deletePacenoteLanguage(lang)` | Removes a language from all pacenotes. | 1678 |
| `C:dir()` | Folder of the notebook file. | 273 |
| `C:drawDebugNotebook(pacenoteToolsState, globalOpacity)` | 3D drawing of the notebook in the editor: the selection (and neighbors according to preferences), or all pacenotes in rainbow colors if nothing is selected. | 484 |
| `C:drawDebugNotebookForPartitionAllSnaproad(pacenoteToolsState, globalOpacity, window)` | Draws the pacenotes that overlap the given distance window (pacenote creation). | 529 |
| `C:findNClosestPacenotes(pos, n)` | The n pacenotes whose cornerStart waypoint is closest to pos (see notes about a possible nil). | 894 |
| `C:findNextNonIsolated(i)` | Next non-isolated pacenote after index i. | 849 |
| `C:generateAllFreeform()` | Generates the freeform text from the structured one for all pacenotes. | 741 |
| `C:generatePacenotes(corners)` | Clears the pacenotes and creates one per detected corner (cs/ce waypoints placed on the snaproad if available, normals aligned, sortOrder = 5*i), then sorts, renames and fills in the distances. | 747 |
| `C:getActiveCompositorName()` | Name of the compositor style declared by the active voicepack (compositorStyle); nil if absent or, in custom mode, if the style module does not exist. | 134 |
| `C:getAdjacentPacenoteSet(selected_pn_id)` | Previous, selected and next pacenotes of an identifier. | 463 |
| `C:getAudioMode()` | The notebook's audio mode (saved property, not overridden by the voicepack). | 1146 |
| `C:getCustomAudioAnchorInfo()` | Info about the placed anchors (clip -> pacenote): points sorted by clip and a table by name, with the flags duplicate, nonMonotonic, invalid. | 1295 |
| `C:getCustomAudioAssignment()` | Distributes the clips over the pacenotes: anchored clips go to their pacenote, the others are linearly interpolated between neighboring anchors (implicit bounds 0 and end). | 1349 |
| `C:getCustomSystemPacenotesForAudioMode()` | Custom mode version without compositor: looks for pacenote_system_<name>_<n>.ogg in the active voicepack for each name of systemPacenotes.required (variants probed by increasing indices). | 993 |
| `C:getLanguages()` | List of a single language { language, codrivers = {} } (detected or default language). | 634 |
| `C:getMissionDir()` | Mission folder (two levels above the notebook file); nil without fname. | 244 |
| `C:getMissionId()` | Mission identifier (part of the folder after /missions/), e.g. gridmap_v2/rallyStage/rally-test-1; nil without a file. | 235 |
| `C:getMissionType()` | missionType field of the mission's info.json, or nil. | 260 |
| `C:getNextUniqueIdentifier()` | Increments and returns the notebook's identifier counter. | 18 |
| `C:getOfflineTextCompositor()` | Same for the offline compositor (separate instance). | 173 |
| `C:getRandomSystemPacenote(desiredPrefix)` | Draws a weighted variant of a system pacenote. | 1077 |
| `C:getSnaproad()` | Attached snaproad. | 67 |
| `C:getSystemPacenotesForAudioMode()` | System pacenotes (countdown, warnings…) according to the audio mode, with mission custom overrides; returns the name -> variants table and the audio metadata. | 919 |
| `C:getTextCompositor()` | Text compositor (created and loaded on demand, cached); nil and 'E' log if no voicepack matches (except in custom mode). | 148 |
| `C:getVisualCompositor2()` | Visual compositor built on the text compositor; nil if there is no text compositor. | 199 |
| `C:getWaypoint(wpId)` | Waypoint with the given identifier, or nil. | 623 |
| `C:hasAnyPacenotes()` | true if there is at least one pacenote. | 228 |
| `C:init(name)` | Constructor: default fields, empty pacenote list. | 23 |
| `C:invalidateActiveVoicepackCache()` | Clears the cache of the active voicepack and of the offline metadata. | 115 |
| `C:invalidateCustomAudioMapping()` | Clears the custom caches (mapping, disk scan, metadata, transcriptions). | 1408 |
| `C:isAudioModeCustom()` | true if custom mode. | 1173 |
| `C:isAudioModeFreeform()` | true if freeform mode. | 1169 |
| `C:isAudioModeOfflineStructured()` | true if structuredOffline mode. | 1165 |
| `C:isAudioModeOnlineStructured()` | true if structuredOnline mode. | 1161 |
| `C:isV2()` | true if the notebook version is 2 or absent. | 1182 |
| `C:isV3()` | true if the version is 3. | 1186 |
| `C:is_valid()` | true if validation_issues is empty. | 331 |
| `C:loadCustomPacenoteMetadata()` | Metadata (durations…) of the custom clips, cached ({} if absent). | 1595 |
| `C:loadCustomPacenoteTranscriptions()` | Transcriptions of the custom clips (clip -> { description }), cached. | 1609 |
| `C:loadCustomSystemPacenoteMetadata()` | Metadata of the system overrides: merge of the shared file and the mission file. | 1549 |
| `C:loadFreeformPacenoteMetadata()` | Metadata of the mission's freeform folder; nil if absent. | 1648 |
| `C:loadOfflineStructuredPacenoteMetadata()` | Metadata of the active voicepack (structured offline mode), cached per voicepack. | 1623 |
| `C:loadOnlineStructuredPacenoteMetadata()` | Metadata of the mission's structured online folder; nil if the file does not exist. | 1639 |
| `C:loadSystemPacenoteMetadata()` | Metadata of the mission's system folder; nil if absent. | 1657 |
| `C:markAllTodo()` | Marks all pacenotes as to do. | 1120 |
| `C:markRestTodo(pacenote)` | Marks the given pacenote and all following ones as to do. | 1132 |
| `C:missionPacenoteAudioFile(audioModeDir, pacenoteTextOut)` | Path of a text's audio file: <mode folder>/<name derived from the text hash>. nil without compositor. | 1572 |
| `C:missionPacenotesDir(audioModeDir)` | Folder of the generated audio: <mission>/<notebooksPath>/<generatedPacenotesDir>/<notebook>/<audioModeDir>. | 1190 |
| `C:missionVoicepackEntryForNotebook()` | Mission voicepack entry whose notebooks list contains this notebook. | 1212 |
| `C:nextImportIdent()` | Next import letter ("Import_X"); 'A' by default. | 378 |
| `C:onDeserialized(data)` | Reloads the notebook from JSON data (version, metadata, audio mode, pacenotes); migrates v2 to v3. | 557 |
| `C:onRallySettingsChanged()` | Called when settings change: invalidates the voicepack and compositors, then recompiles the pacenotes. | 859 |
| `C:onSerialize()` | Data to save: name, description, authors, metadata, dates, pacenotes, audioMode, version. | 543 |
| `C:refreshAllFreeformNotes()` | Trims the freeform text of each pacenote. | 694 |
| `C:refreshAllPacenotes()` | Refreshes the structured then freeform texts of all pacenotes. | 680 |
| `C:refreshAllStructuredNotes()` | Forgets the cached text compositor and recomposes the structured text of each pacenote (no effect in custom mode). | 685 |
| `C:refreshPacenotes(opts)` | Full chain: names (cleanupNames), trigger types, remeasure (remeasure), distances, texts. Logs the duration. | 723 |
| `C:reload()` | Rereads the notebook file and deserializes it. | 316 |
| `C:remeasureAllPacenotes()` | For each pacenote, partitions the snaproad over it and measures the corner (no effect without snaproad). | 711 |
| `C:resolveActiveVoicepack()` | Resolves (cache per mission + choice) the effective voicepack via voicepack.resolveEffectiveEntry. | 122 |
| `C:resolveAllCustomSystemPacenotes(systemPacenotes)` | Looks for the audio overrides of the system pacenotes (<name>_<i>.ogg, or <name>.ogg if a single variant) in the game's shared folder then in the mission (the mission wins); result is cached. | 1518 |
| `C:resolveCustomAudioBasename(basename)` | Full path of a clip via the owning voicepack (with reuseAudioFrom fallback). | 1280 |
| `C:save(fname)` | Writes the notebook as JSON (updates updated_at). | 297 |
| `C:scanCustomAudioBasenames()` | Sorted list (cache) of the numbered pacenote_*.ogg clips present in the custom audio folder; system clips are excluded. | 1260 |
| `C:selectedCodriver()` | Dummy co-driver (see notes). | 666 |
| `C:selectedCodriverLanguage()` | Language of the dummy co-driver. | 675 |
| `C:setAdjacentNotes(pacenote_id)` | Sets the neighbors (previous/next) of the pacenote with the given identifier and clears those of the others. | 1094 |
| `C:setAllAdjacentNotes()` | Sets the neighbors of all pacenotes. | 1107 |
| `C:setAllRadii(newRadius, wpType)` | Sets the radius of the waypoints of all pacenotes. | 639 |
| `C:setAudioMode(mode)` | Sets the notebook's audio mode. | 1157 |
| `C:setCustomAudioAnchor(pacenote, basename)` | Places a clip's anchor on a pacenote (removes the clip's old anchor), invalidates the caches. | 1444 |
| `C:setFname(newFname)` | Sets the notebook file and invalidates the voicepack cache. | 292 |
| `C:setSnaproad(sn)` | Attaches the snaproad (provided by the editor or the RallyManager) and, if non-nil, reruns autofillDistanceCalls(). | 60 |
| `C:sortPacenotesByName()` | Sorts the pacenotes by trailing number of the name (then by name), updates sortOrder and invalidates the custom audio mapping. | 359 |
| `C:syncCustomAudioFromDisk()` | After a new audio export: rescans the disk and removes the anchors whose file has disappeared. | 1490 |
| `C:upgradeFromV2ToV3()` | Migration v2 to v3: migrates each pacenote, sets the version to "3" and reruns autofill. | 602 |
| `C:useCodriver(codriver)` | Only resets the compile failures (the co-driver is no longer saved). | 1672 |
| `C:useStructured()` | true if the mode is structured (online or offline). | 1177 |
| `C:validate()` | Empties validation_issues (no real rule). | 327 |

## Calls into the engine (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/notebook/path.lua`.*
