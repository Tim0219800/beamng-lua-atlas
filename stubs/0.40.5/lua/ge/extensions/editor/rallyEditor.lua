---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_rallyEditor` : `extensions.load("editor_rallyEditor")`, puis la globale `editor_rallyEditor`
---@class editor_rallyEditor
---@field dependencies table
---@field devToolsWindowOpen any
---@field notebookBasenamesForPick any
---@field picksMatch any
---@field rallyToolboxWindowOpen any
editor_rallyEditor = {}

---Source : lua/ge/extensions/editor/rallyEditor.lua:1439
function editor_rallyEditor.allowGizmo() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1450
---@param missionDir any
function editor_rallyEditor.buildVoicepackPickerEntries(missionDir) end

--- M.moveSelectedWaypointForwardFast = moveSelectedWaypointForwardFast
---  M.moveSelectedWaypointBackwardFast = moveSelectedWaypointBackwardFast
---Source : lua/ge/extensions/editor/rallyEditor.lua:302
function editor_rallyEditor.cameraPathPlay() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1377
---@param val any
function editor_rallyEditor.changeDebugDrawOpacity(val) end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1295
function editor_rallyEditor.clearGhostNotebook() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:247
function editor_rallyEditor.deselect() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1323
---@param missionDir any
function editor_rallyEditor.detectNotebookToLoad(missionDir) end

---Source : lua/ge/extensions/editor/rallyEditor.lua:612
function editor_rallyEditor.drawStageLoaderModal() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:616
---@param pathObj any
function editor_rallyEditor.drawToolbarMissionContext(pathObj) end

--- M.getCurrentFilename = function() return previousFilepath..previousFilename end
---Source : lua/ge/extensions/editor/rallyEditor.lua:1369
function editor_rallyEditor.getCurrentFilename() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1443
function editor_rallyEditor.getCurrentMissionDir() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1445
function editor_rallyEditor.getCurrentMissionId() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1444
function editor_rallyEditor.getCurrentMissionName() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1442
function editor_rallyEditor.getCurrentPath() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1446
function editor_rallyEditor.getCurrentVoicepackPick() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1313
function editor_rallyEditor.getGhostNotebookError() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1317
---@param pacenote any
function editor_rallyEditor.getGhostNotebookLabelForPacenote(pacenote) end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1301
function editor_rallyEditor.getGhostNotebookPath() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1305
function editor_rallyEditor.getGhostNotebookSelectedFname() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1309
function editor_rallyEditor.getGhostNotebookSelectedLabel() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1517
function editor_rallyEditor.getMissionDir() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1518
function editor_rallyEditor.getMissionId() end

--- M.setPreferredSnaproadType = setPreferredSnaproadType
---Source : lua/ge/extensions/editor/rallyEditor.lua:1516
function editor_rallyEditor.getPacenotesWindow() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1246
function editor_rallyEditor.getPrefDefaultRadius() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1242
function editor_rallyEditor.getPrefDrivelineSplinePrismWidth() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1254
function editor_rallyEditor.getPrefLockWaypoints() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1226
function editor_rallyEditor.getPrefPacenoteLabelDistance() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1222
function editor_rallyEditor.getPrefPacenoteLabelMode() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1230
function editor_rallyEditor.getPrefPacenoteLabelNearCameraCount() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1234
function editor_rallyEditor.getPrefShowAdjacentPacenoteText() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1218
function editor_rallyEditor.getPrefShowAllPacenoteLabels() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1214
function editor_rallyEditor.getPrefShowNextPacenote() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1210
function editor_rallyEditor.getPrefShowPreviousPacenote() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1238
function editor_rallyEditor.getPrefShowSelectedPacenoteUtility() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1250
function editor_rallyEditor.getPrefUiPacenoteNoteFieldWidth() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1258
function editor_rallyEditor.getPrefWaypointSnapMethod() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1459
function editor_rallyEditor.getViewSnaproadPathOnTop() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1514
function editor_rallyEditor.getVolatilePreferences() end

--- M.cycleDragMode = cycleDragMode
---Source : lua/ge/extensions/editor/rallyEditor.lua:233
function editor_rallyEditor.insertMode() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1510
function editor_rallyEditor.isCalibrationWindowOpen() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1520
function editor_rallyEditor.isPacenotesToolsSectionExpanded() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1425
function editor_rallyEditor.isToolboxOpen() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1452
function editor_rallyEditor.isVisible() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1285
function editor_rallyEditor.listGhostNotebookChoices() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1267
---@param folder any
function editor_rallyEditor.listNotebooks(folder) end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1345
---@param missionDir any
function editor_rallyEditor.loadForMissionEditor(missionDir) end

---Source : lua/ge/extensions/editor/rallyEditor.lua:416
---@param fullFilename any
function editor_rallyEditor.loadNotebook(fullFilename) end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1357
---@param missionDir any
function editor_rallyEditor.loadOrCreateForMissionEditor(missionDir) end

---Source : lua/ge/extensions/editor/rallyEditor.lua:400
---@param fullFilename any
function editor_rallyEditor.loadOrCreateNotebook(fullFilename) end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1389
---@param val any
function editor_rallyEditor.mouseWheelZoom(val) end

--- called directly by the input action
---Source : lua/ge/extensions/editor/rallyEditor.lua:292
---@param v any
function editor_rallyEditor.moveSelectedWaypointBackward(v) end

--- called directly by the input action
---Source : lua/ge/extensions/editor/rallyEditor.lua:282
---@param v any
function editor_rallyEditor.moveSelectedWaypointForward(v) end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1133
---@param data any
function editor_rallyEditor.onDeserialized(data) end

---Source : lua/ge/extensions/editor/rallyEditor.lua:979
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function editor_rallyEditor.onEditorGui(dtReal, dtSim, dtRaw) end

--- this is called after you Ctrl+L to reload lua.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1037
function editor_rallyEditor.onEditorInitialized() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1167
---@param prefsRegistry any
function editor_rallyEditor.onEditorRegisterPreferences(prefsRegistry) end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1110
---@param windowName any
function editor_rallyEditor.onEditorToolWindowHide(windowName) end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1122
function editor_rallyEditor.onSerialize() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1429
function editor_rallyEditor.onVehicleResetted() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1116
---@param windowName any
function editor_rallyEditor.onWindowGotFocus(windowName) end

---Source : lua/ge/extensions/editor/rallyEditor.lua:608
function editor_rallyEditor.openStageLoaderModal() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:212
function editor_rallyEditor.saveNotebook() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1290
---@param fname any
function editor_rallyEditor.selectGhostNotebook(fname) end

---Source : lua/ge/extensions/editor/rallyEditor.lua:228
function editor_rallyEditor.selectNextPacenote() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:252
function editor_rallyEditor.selectNextWaypoint() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:223
function editor_rallyEditor.selectPrevPacenote() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:238
function editor_rallyEditor.setFreeCam() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1263
---@param val any
function editor_rallyEditor.setPrefLockWaypoints(val) end

--- Sets the active voicepack pick and auto-loads the first candidate notebook for it.
---  Clears the loaded notebook if the pick has no resolvable candidates.
---Source : lua/ge/extensions/editor/rallyEditor.lua:445
---@param pick any
function editor_rallyEditor.setVoicepackPick(pick) end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1000
function editor_rallyEditor.show() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:983
function editor_rallyEditor.showPacenotesTab() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:988
function editor_rallyEditor.showRallyTool() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:1511
function editor_rallyEditor.toggleCalibrationWindow() end

---Source : lua/ge/extensions/editor/rallyEditor.lua:307
function editor_rallyEditor.toggleCornerCalls() end

--- called directly by the input action
---Source : lua/ge/extensions/editor/rallyEditor.lua:1400
---@param val any
function editor_rallyEditor.zoomIn(val) end

--- called directly by the input action
---Source : lua/ge/extensions/editor/rallyEditor.lua:1413
---@param val any
function editor_rallyEditor.zoomOut(val) end

