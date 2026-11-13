# `gameplay_rally_util`

*Fichier : `lua/ge/extensions/gameplay/rally/util.lua` · VM : Game Engine (GE) · 733 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_util` : `extensions.load("gameplay_rally_util")`, puis la globale `gameplay_rally_util`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_util.arePointsEqualWithinThreshold(point1, point2, threshold)` |  | 494 |
| `gameplay_rally_util.calculateForwardNormal(snap_pos, next_pos)` | args are both vec3's representing a position. | 315 |
| `gameplay_rally_util.compareCustomPacenoteAudioBasenames(a, b)` |  | 432 |
| `gameplay_rally_util.createNotebook(fname)` |  | 204 |
| `gameplay_rally_util.customPacenoteAudioBasenameParts(basename)` |  | 420 |
| `gameplay_rally_util.customRound(dist, round_to)` |  | 400 |
| `gameplay_rally_util.cutsFile(missionDir)` |  | 306 |
| `gameplay_rally_util.detectMissionEditorMissionId()` |  | 107 |
| `gameplay_rally_util.detectMissionIdHelper()` |  | 140 |
| `gameplay_rally_util.detectMissionManagerMissionId()` |  | 99 |
| `gameplay_rally_util.determineCornerCall(angles, steering)` |  | 347 |
| `gameplay_rally_util.drawVehBB(vehId)` |  | 537 |
| `gameplay_rally_util.drawVehLeadingPoint(vehId, inside)` |  | 529 |
| `gameplay_rally_util.drivelineFile(missionDir)` |  | 294 |
| `gameplay_rally_util.drivelineSplineFile(missionDir)` |  | 302 |
| `gameplay_rally_util.finalDrivelineFile(missionDir)` |  | 298 |
| `gameplay_rally_util.formatTime12Hour(timeSecs, includeSeconds, includeTenths)` |  | 600 |
| `gameplay_rally_util.formatTime24Hour(timeSecs, includeSeconds, includeTenths)` |  | 576 |
| `gameplay_rally_util.formatTimeFromSeconds(timeSecs, includeSeconds, includeTenths)` |  | 628 |
| `gameplay_rally_util.getAppropriateTextColor(clr)` |  | 490 |
| `gameplay_rally_util.getMissionName(missionId)` |  | 450 |
| `gameplay_rally_util.getNotebookFullPath(missionDir, basename)` |  | 186 |
| `gameplay_rally_util.getTime()` | returns seconds since epoch | 64 |
| `gameplay_rally_util.getVehFrontBottom(vehId)` |  | 516 |
| `gameplay_rally_util.getVehFrontCenter(vehId)` |  | 500 |
| `gameplay_rally_util.hasPunctuation(last_char)` |  | 89 |
| `gameplay_rally_util.listNotebooks(missionDir)` |  | 191 |
| `gameplay_rally_util.loadCornerAnglesFile()` |  | 335 |
| `gameplay_rally_util.loadNotebook(notebookFname)` |  | 220 |
| `gameplay_rally_util.loadNotebookForMissionDir(missionDir, basename)` |  | 259 |
| `gameplay_rally_util.loadRacePath(missionDir)` |  | 264 |
| `gameplay_rally_util.makePacenoteAudioFilename(pacenoteHash)` |  | 404 |
| `gameplay_rally_util.makePacenoteVariantAudioFilename(pacenoteHash, variant)` |  | 408 |
| `gameplay_rally_util.makeSystemPacenoteAudioFilename(systemKey, variantIndex)` |  | 445 |
| `gameplay_rally_util.matchSearchPattern(searchPattern, stringToMatch)` |  | 384 |
| `gameplay_rally_util.missionDirHelper(missionId)` |  | 131 |
| `gameplay_rally_util.missionReccePath(missionDir, basename)` |  | 288 |
| `gameplay_rally_util.missionRecceRecordDir(missionDir)` |  | 283 |
| `gameplay_rally_util.normalizeName(name)` |  | 77 |
| `gameplay_rally_util.pacenoteAudioBasenameVariantIndex(basename)` |  | 414 |
| `gameplay_rally_util.pacenoteHashSha1(s)` |  | 58 |
| `gameplay_rally_util.randomId()` |  | 484 |
| `gameplay_rally_util.stripBasename(thepath)` |  | 370 |
| `gameplay_rally_util.transcriptsFile(missionDir)` |  | 310 |
| `gameplay_rally_util.translatedMissionName(missionName)` |  | 461 |
| `gameplay_rally_util.translatedMissionNameFromId(missionId)` |  | 472 |
| `gameplay_rally_util.trimString(txt)` |  | 364 |
| `gameplay_rally_util.useNote(text)` |  | 393 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `activeState_countdown` | string |  |
| `activeState_inactive` | string |  |
| `activeState_stageActive` | string |  |
| `activeState_vehicleProximity` | string |  |
| `autodist_internal_level1` | string |  |
| `autofill_blocker` | string |  |
| `defaultCodriverName` | string |  |
| `defaultNotebookFname` | string |  |
| `default_codriver_language` | string |  |
| `default_codriver_voice` | string |  |
| `default_waypoint_intersect_radius` | number |  |
| `extRally` | string |  |
| `extRallyLoop` | string |  |
| `freeformDir` | string |  |
| `generatedPacenotesDir` | string |  |
| `missionRallyDir` | string |  |
| `notebooksDir` | string |  |
| `notebooksPath` | any |  |
| `pacenotesMetadataBasename` | string |  |
| `pacenotesTranscriptionsBasename` | string |  |
| `rallyLoop_flowgraph_color` | any |  |
| `rallySettingsRoot` | string | vars |
| `rally_flowgraph_color` | any |  |
| `recceDir` | string |  |
| `recceRecordSubdir` | string |  |
| `structuredDir` | string |  |
| `systemDir` | string |  |
| `transcriptsExt` | string |  |
| `unknown_transcript_str` | string |  |
| `validPunctuation` | table |  |
| `var_da` | string |  |
| `var_db` | string |  |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `debugDrawer:` `drawLineInstance`, `drawSphere`
- `scenetree.` `findObjectById`
- `ui_imgui.` `ImVec4`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/util.lua`.*
