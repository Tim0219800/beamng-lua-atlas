# `editor_rallyEditor`

*Fichier : `lua/ge/extensions/editor/rallyEditor.lua` · VM : Game Engine (GE) · 1523 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rallyEditor` : `extensions.load("editor_rallyEditor")`, puis la globale `editor_rallyEditor`

**Dépendances (chargées avant) :** `gameplay_missions_missions`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rallyEditor.allowGizmo()` |  | 1439 |
| `editor_rallyEditor.buildVoicepackPickerEntries(missionDir)` |  | 1450 |
| `editor_rallyEditor.cameraPathPlay()` | M.moveSelectedWaypointForwardFast = moveSelectedWaypointForwardFast<br> M.moveSelectedWaypointBackwardFast = moveSelectedWaypointBackwardFast | 302 |
| `editor_rallyEditor.changeDebugDrawOpacity(val)` |  | 1377 |
| `editor_rallyEditor.clearGhostNotebook()` |  | 1295 |
| `editor_rallyEditor.deselect()` |  | 247 |
| `editor_rallyEditor.detectNotebookToLoad(missionDir)` |  | 1323 |
| `editor_rallyEditor.drawStageLoaderModal()` |  | 612 |
| `editor_rallyEditor.drawToolbarMissionContext(pathObj)` |  | 616 |
| `editor_rallyEditor.getCurrentFilename()` | M.getCurrentFilename = function() return previousFilepath..previousFilename end | 1369 |
| `editor_rallyEditor.getCurrentMissionDir()` |  | 1443 |
| `editor_rallyEditor.getCurrentMissionId()` |  | 1445 |
| `editor_rallyEditor.getCurrentMissionName()` |  | 1444 |
| `editor_rallyEditor.getCurrentPath()` |  | 1442 |
| `editor_rallyEditor.getCurrentVoicepackPick()` |  | 1446 |
| `editor_rallyEditor.getGhostNotebookError()` |  | 1313 |
| `editor_rallyEditor.getGhostNotebookLabelForPacenote(pacenote)` |  | 1317 |
| `editor_rallyEditor.getGhostNotebookPath()` |  | 1301 |
| `editor_rallyEditor.getGhostNotebookSelectedFname()` |  | 1305 |
| `editor_rallyEditor.getGhostNotebookSelectedLabel()` |  | 1309 |
| `editor_rallyEditor.getMissionDir()` |  | 1517 |
| `editor_rallyEditor.getMissionId()` |  | 1518 |
| `editor_rallyEditor.getPacenotesWindow()` | M.setPreferredSnaproadType = setPreferredSnaproadType | 1516 |
| `editor_rallyEditor.getPrefDefaultRadius()` |  | 1246 |
| `editor_rallyEditor.getPrefDrivelineSplinePrismWidth()` |  | 1242 |
| `editor_rallyEditor.getPrefLockWaypoints()` |  | 1254 |
| `editor_rallyEditor.getPrefPacenoteLabelDistance()` |  | 1226 |
| `editor_rallyEditor.getPrefPacenoteLabelMode()` |  | 1222 |
| `editor_rallyEditor.getPrefPacenoteLabelNearCameraCount()` |  | 1230 |
| `editor_rallyEditor.getPrefShowAdjacentPacenoteText()` |  | 1234 |
| `editor_rallyEditor.getPrefShowAllPacenoteLabels()` |  | 1218 |
| `editor_rallyEditor.getPrefShowNextPacenote()` |  | 1214 |
| `editor_rallyEditor.getPrefShowPreviousPacenote()` |  | 1210 |
| `editor_rallyEditor.getPrefShowSelectedPacenoteUtility()` |  | 1238 |
| `editor_rallyEditor.getPrefUiPacenoteNoteFieldWidth()` |  | 1250 |
| `editor_rallyEditor.getPrefWaypointSnapMethod()` |  | 1258 |
| `editor_rallyEditor.getViewSnaproadPathOnTop()` |  | 1459 |
| `editor_rallyEditor.getVolatilePreferences()` |  | 1514 |
| `editor_rallyEditor.insertMode()` | M.cycleDragMode = cycleDragMode | 233 |
| `editor_rallyEditor.isCalibrationWindowOpen()` |  | 1510 |
| `editor_rallyEditor.isPacenotesToolsSectionExpanded()` |  | 1520 |
| `editor_rallyEditor.isToolboxOpen()` |  | 1425 |
| `editor_rallyEditor.isVisible()` |  | 1452 |
| `editor_rallyEditor.listGhostNotebookChoices()` |  | 1285 |
| `editor_rallyEditor.listNotebooks(folder)` |  | 1267 |
| `editor_rallyEditor.loadForMissionEditor(missionDir)` |  | 1345 |
| `editor_rallyEditor.loadNotebook(fullFilename)` |  | 416 |
| `editor_rallyEditor.loadOrCreateForMissionEditor(missionDir)` |  | 1357 |
| `editor_rallyEditor.loadOrCreateNotebook(fullFilename)` |  | 400 |
| `editor_rallyEditor.mouseWheelZoom(val)` |  | 1389 |
| `editor_rallyEditor.moveSelectedWaypointBackward(v)` | called directly by the input action | 292 |
| `editor_rallyEditor.moveSelectedWaypointForward(v)` | called directly by the input action | 282 |
| `editor_rallyEditor.onDeserialized(data)` | *(hook)* | 1133 |
| `editor_rallyEditor.onEditorGui(dtReal, dtSim, dtRaw)` | *(hook)* | 979 |
| `editor_rallyEditor.onEditorInitialized()` | this is called after you Ctrl+L to reload lua. *(hook)* | 1037 |
| `editor_rallyEditor.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 1167 |
| `editor_rallyEditor.onEditorToolWindowHide(windowName)` | *(hook)* | 1110 |
| `editor_rallyEditor.onSerialize()` | *(hook)* | 1122 |
| `editor_rallyEditor.onVehicleResetted()` | *(hook)* | 1429 |
| `editor_rallyEditor.onWindowGotFocus(windowName)` | *(hook)* | 1116 |
| `editor_rallyEditor.openStageLoaderModal()` |  | 608 |
| `editor_rallyEditor.saveNotebook()` |  | 212 |
| `editor_rallyEditor.selectGhostNotebook(fname)` |  | 1290 |
| `editor_rallyEditor.selectNextPacenote()` |  | 228 |
| `editor_rallyEditor.selectNextWaypoint()` |  | 252 |
| `editor_rallyEditor.selectPrevPacenote()` |  | 223 |
| `editor_rallyEditor.setFreeCam()` |  | 238 |
| `editor_rallyEditor.setPrefLockWaypoints(val)` |  | 1263 |
| `editor_rallyEditor.setVoicepackPick(pick)` | Sets the active voicepack pick and auto-loads the first candidate notebook for it.<br> Clears the loaded notebook if the pick has no resolvable candidates. | 445 |
| `editor_rallyEditor.show()` |  | 1000 |
| `editor_rallyEditor.showPacenotesTab()` |  | 983 |
| `editor_rallyEditor.showRallyTool()` |  | 988 |
| `editor_rallyEditor.toggleCalibrationWindow()` |  | 1511 |
| `editor_rallyEditor.toggleCornerCalls()` |  | 307 |
| `editor_rallyEditor.zoomIn(val)` | called directly by the input action | 1400 |
| `editor_rallyEditor.zoomOut(val)` | called directly by the input action | 1413 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `devToolsWindowOpen` | any |  |
| `notebookBasenamesForPick` | any |  |
| `picksMatch` | any | Thin facades over voicepack.lua kept for backwards compatibility with external callers. |
| `rallyToolboxWindowOpen` | any |  |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `scenetree.` `findObject`

**Charge les extensions :** `gameplay_rallyLoop`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor.lua`.*
