# `gameplay_rally_notebook_path`

*Fichier : `lua/ge/extensions/gameplay/rally/notebook/path.lua` · VM : Game Engine (GE) · 1692 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/notebook/path")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_notebook_path")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_detectFirstNotesLanguage()` | The codriver concept is fully phased out: voicepack persona/language come from voicepack<br> preferences, and there is no per-notebook codriver list. selectedCodriver() returns a<br> synthetic stub so legacy callers still get a sensible language string for note lookups.<br> Returns the first language key found in any pacenote's notes table, or nil. | 655 |
| `C:_getRallyManagerPick()` | Returns the toolbox-driven voicepack pick if a rally manager is currently running.<br> This is the bridge between the in-game picker and the editor (which falls back to settings). | 81 |
| `C:_missionPacenoteMetadataFile(audioModeDir)` |  | 1580 |
| `C:allToTerrain()` |  | 645 |
| `C:allWaypoints()` |  | 613 |
| `C:appendPacenotes(pacenotes)` |  | 213 |
| `C:autoManageTriggerTypes()` | first pacenote needs csImmediate so it fires without waiting for a previous<br> note's distance call; everything else stays on the dynamic default. | 702 |
| `C:autofillDistanceCalls()` |  | 806 |
| `C:basename()` |  | 279 |
| `C:basenameNoExt()` |  | 285 |
| `C:cacheCompiledPacenotes()` |  | 868 |
| `C:canSetCustomAudioAnchor(pacenote, basename)` |  | 1419 |
| `C:cleanupPacenoteNames()` |  | 403 |
| `C:clearAllTodo()` |  | 1126 |
| `C:clearCompilationFailures()` |  | 888 |
| `C:clearCustomAudioAnchor(basename)` |  | 1465 |
| `C:clearCustomSystemPacenoteCache()` |  | 1544 |
| `C:clearPacenoteAudioModeOverrides()` |  | 1666 |
| `C:clearResolvedAudioObjs()` |  | 882 |
| `C:customAudioAnchorInfoFor(basename)` |  | 1415 |
| `C:customAudioBasenamesFor(pacenote)` |  | 1403 |
| `C:customAudioEntry()` | The voicepack entry that owns this notebook's custom audio. Prefers the mission<br> voicepack that lists this notebook; falls back to the active voicepack only when no<br> mission voicepack claims it. This keeps the custom-audio widget scoped to the<br> mission-specific pack and out of any global/source pack's audio. | 1234 |
| `C:customPacenotesAudioDir()` | Audio (.ogg) files live in the voicepack's `audio/` subdir; metadata/transcriptions<br> stay at the voicepack root. | 1249 |
| `C:customPacenotesBaseDir()` | Path for mission-local system pacenote overrides (countdowns etc). Out-of-scope for the<br> mission-voicepack refactor; kept on the old `notebooks/custom/<basename>/` layout for now. | 1512 |
| `C:customPacenotesDir()` | Returns the directory holding `pacenote_*.ogg` (and metadata.json) for the custom<br> audio owner voicepack (the mission voicepack that owns this notebook). Returns nil<br> when no owner voicepack is resolvable. | 1241 |
| `C:deleteAllPacenotes()` |  | 220 |
| `C:deletePacenoteLanguage(lang)` |  | 1678 |
| `C:dir()` |  | 273 |
| `C:drawDebugNotebook(pacenoteToolsState, globalOpacity)` |  | 484 |
| `C:drawDebugNotebookForPartitionAllSnaproad(pacenoteToolsState, globalOpacity, window)` |  | 529 |
| `C:findNClosestPacenotes(pos, n)` |  | 894 |
| `C:findNextNonIsolated(i)` |  | 849 |
| `C:generateAllFreeform()` |  | 741 |
| `C:generatePacenotes(corners)` |  | 747 |
| `C:getActiveCompositorName()` |  | 134 |
| `C:getAdjacentPacenoteSet(selected_pn_id)` |  | 463 |
| `C:getAudioMode()` |  | 1146 |
| `C:getCustomAudioAnchorInfo()` | Returns anchor metadata keyed by basename plus the ordered anchor points. Anchors<br> are user-provided landmarks: this audio clip belongs on this pacenote. | 1295 |
| `C:getCustomAudioAssignment()` | Computes the assignment of clip basenames to pacenotes from manual anchors. Clips<br> between anchor points are interpolated between those landmark pacenotes. | 1349 |
| `C:getCustomSystemPacenotesForAudioMode()` | Builds system pacenotes (countdowns, warnings, start/finish, etc.) for custom mode<br> without a text compositor. The canonical names/order come from<br> notebook/systemPacenotes.lua; the audio for each is resolved by internal name<br> (pacenote_system_<name>_<variant>.ogg) from the active voicepack's audio dir,<br> falling back to its reuseAudioFrom sources (e.g. a global pack) for any clip the<br> mission pack doesn't ship. Variants are discovered by probing increasing indices. | 993 |
| `C:getLanguages()` |  | 634 |
| `C:getMissionDir()` |  | 244 |
| `C:getMissionId()` | a path looks like:<br> /gameplay/missions/gridmap_v2/rallyStage/rally-test-1/aipacenotes/notebooks/primary.notebook.json<br> we want to return this string: gridmap_v2/rallyStage/rally-test-1 | 235 |
| `C:getMissionType()` |  | 260 |
| `C:getNextUniqueIdentifier()` |  | 18 |
| `C:getOfflineTextCompositor()` |  | 173 |
| `C:getRandomSystemPacenote(desiredPrefix)` |  | 1077 |
| `C:getSnaproad()` |  | 67 |
| `C:getSystemPacenotesForAudioMode()` |  | 919 |
| `C:getTextCompositor()` |  | 148 |
| `C:getVisualCompositor2()` |  | 199 |
| `C:getWaypoint(wpId)` |  | 623 |
| `C:hasAnyPacenotes()` |  | 228 |
| `C:init(name)` |  | 23 |
| `C:invalidateActiveVoicepackCache()` |  | 115 |
| `C:invalidateCustomAudioMapping()` |  | 1408 |
| `C:isAudioModeCustom()` |  | 1173 |
| `C:isAudioModeFreeform()` |  | 1169 |
| `C:isAudioModeOfflineStructured()` |  | 1165 |
| `C:isAudioModeOnlineStructured()` |  | 1161 |
| `C:isV2()` |  | 1182 |
| `C:isV3()` |  | 1186 |
| `C:is_valid()` |  | 331 |
| `C:loadCustomPacenoteMetadata()` |  | 1595 |
| `C:loadCustomPacenoteTranscriptions()` |  | 1609 |
| `C:loadCustomSystemPacenoteMetadata()` |  | 1549 |
| `C:loadFreeformPacenoteMetadata()` |  | 1648 |
| `C:loadOfflineStructuredPacenoteMetadata()` |  | 1623 |
| `C:loadOnlineStructuredPacenoteMetadata()` |  | 1639 |
| `C:loadSystemPacenoteMetadata()` |  | 1657 |
| `C:markAllTodo()` |  | 1120 |
| `C:markRestTodo(pacenote)` |  | 1132 |
| `C:missionPacenoteAudioFile(audioModeDir, pacenoteTextOut)` |  | 1572 |
| `C:missionPacenotesDir(audioModeDir)` |  | 1190 |
| `C:missionVoicepackEntryForNotebook()` | Finds the mission-scoped voicepack entry that owns this notebook (its `notebooks`<br> list contains this notebook's basename). Custom corner clips belong to that specific<br> mission voicepack, not to whatever global pack the preference-driven active pick may<br> resolve to. Returns nil if no mission voicepack claims this notebook. | 1212 |
| `C:nextImportIdent()` |  | 378 |
| `C:onDeserialized(data)` |  | 557 |
| `C:onRallySettingsChanged()` |  | 859 |
| `C:onSerialize()` |  | 543 |
| `C:refreshAllFreeformNotes()` |  | 694 |
| `C:refreshAllPacenotes()` |  | 680 |
| `C:refreshAllStructuredNotes()` |  | 685 |
| `C:refreshPacenotes(opts)` |  | 723 |
| `C:reload()` |  | 316 |
| `C:remeasureAllPacenotes()` |  | 711 |
| `C:resolveActiveVoicepack()` |  | 122 |
| `C:resolveAllCustomSystemPacenotes(systemPacenotes)` |  | 1518 |
| `C:resolveCustomAudioBasename(basename)` | Resolves a clip basename to a full path via the custom audio owner voicepack,<br> honouring reuseAudioFrom fallback to a source pack. | 1280 |
| `C:save(fname)` |  | 297 |
| `C:scanCustomAudioBasenames()` | Returns the sorted list of custom-audio clip basenames present on disk in the<br> owner mission voicepack's audio dir. Order is the filename sort (clips are exported<br> in increasing numerical order); the number is used only for ordering, never to match<br> a clip to a specific pacenote. System pacenotes (pacenote_system_*) are excluded<br> by the numeric-prefix pattern. | 1260 |
| `C:selectedCodriver()` |  | 666 |
| `C:selectedCodriverLanguage()` |  | 675 |
| `C:setAdjacentNotes(pacenote_id)` |  | 1094 |
| `C:setAllAdjacentNotes()` |  | 1107 |
| `C:setAllRadii(newRadius, wpType)` |  | 639 |
| `C:setAudioMode(mode)` |  | 1157 |
| `C:setCustomAudioAnchor(pacenote, basename)` |  | 1444 |
| `C:setFname(newFname)` |  | 292 |
| `C:setSnaproad(sn)` | Snaproad is supplied lazily by whichever consumer owns the road geometry<br> (the editor's pacenotes window or the runtime RallyManager). distance<br> calculations that walk the road require it, so autofill is triggered as<br> soon as one is attached. | 60 |
| `C:sortPacenotesByName()` |  | 359 |
| `C:syncCustomAudioFromDisk()` | Reconcile after a Reaper re-export: refresh the disk scan and drop anchors whose<br> files no longer exist. | 1490 |
| `C:upgradeFromV2ToV3()` |  | 602 |
| `C:useCodriver(codriver)` |  | 1672 |
| `C:useStructured()` |  | 1177 |
| `C:validate()` |  | 327 |

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/notebook/path.lua`.*
