---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/pacenotes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/editor/rallyEditor/pacenotes.lua (instanciée par la fonction renvoyée par le module)
---@class editor_rallyEditor_pacenotes
local editor_rallyEditor_pacenotes = {}

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2487
---@param fwd any
---@param steps any
function editor_rallyEditor_pacenotes:_moveSelectedWaypointHelper(fwd, steps) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:412
function editor_rallyEditor_pacenotes:_newPacenotesDrivelineHost() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:547
---@param force any
function editor_rallyEditor_pacenotes:applyLiveDrivelineReproject(force) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:789
function editor_rallyEditor_pacenotes:attemptToFixMapEdgeIssue() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2385
function editor_rallyEditor_pacenotes:autofillDistanceCalls() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:333
---@param basename any
function editor_rallyEditor_pacenotes:beginCustomAudioAnchorPick(basename) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:823
function editor_rallyEditor_pacenotes:beginDrag() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2553
function editor_rallyEditor_pacenotes:cameraPathIsPlaying() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2516
function editor_rallyEditor_pacenotes:cameraPathPlay() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:347
function editor_rallyEditor_pacenotes:cancelCustomAudioAnchorPick() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:459
function editor_rallyEditor_pacenotes:captureDrivelineEditSnapshot() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2361
---@param recordHistory any
function editor_rallyEditor_pacenotes:cleanupPacenoteNames(recordHistory) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:135
function editor_rallyEditor_pacenotes:clearState() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1450
function editor_rallyEditor_pacenotes:createMouseDragPacenote() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1406
---@param pos_cs any
---@param pos_ce any
function editor_rallyEditor_pacenotes:debugDrawNewPacenote(pos_cs, pos_ce) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1428
---@param pos_cs any
---@param pos_ce any
function editor_rallyEditor_pacenotes:debugDrawNewPacenote2(pos_cs, pos_ce) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2021
function editor_rallyEditor_pacenotes:deleteAllPacenotes() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1767
function editor_rallyEditor_pacenotes:deleteSelected() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1773
---@param shouldSelect any
function editor_rallyEditor_pacenotes:deleteSelectedPacenote(shouldSelect) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:777
function editor_rallyEditor_pacenotes:deselect() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1553
function editor_rallyEditor_pacenotes:detectCustomAudioAnchorPickHover() end

--- figures out which pacenote to select with the mouse in the 3D scene.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1613
function editor_rallyEditor_pacenotes:detectMouseHoverWaypoint() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:837
function editor_rallyEditor_pacenotes:dragging() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1392
---@param mouseInfo any
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function editor_rallyEditor_pacenotes:draw(mouseInfo, dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:937
---@param globalOpacity any
function editor_rallyEditor_pacenotes:drawCustomAudioAnchorPickOverlay(globalOpacity) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1117
function editor_rallyEditor_pacenotes:drawDebugCameraPlaying() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:985
---@param globalOpacity any
---@param dt any
function editor_rallyEditor_pacenotes:drawDebugEntrypoint(globalOpacity, dt) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2031
function editor_rallyEditor_pacenotes:drawDrivelineEditToggle() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1082
function editor_rallyEditor_pacenotes:drawPacenotesDrivelineEditSurface() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2105
function editor_rallyEditor_pacenotes:drawPacenotesList() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:874
function editor_rallyEditor_pacenotes:endDragging() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:505
function editor_rallyEditor_pacenotes:ensureDrivelineEditSnapshot() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:429
function editor_rallyEditor_pacenotes:ensurePacenotesDrivelineHost() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:256
function editor_rallyEditor_pacenotes:ensurePreviewAudioManager() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1979
function editor_rallyEditor_pacenotes:ensureValidationFresh() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2627
function editor_rallyEditor_pacenotes:generateElevationProfile() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:358
function editor_rallyEditor_pacenotes:getCustomAudioAnchorPickBasename() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:212
function editor_rallyEditor_pacenotes:getRacePath() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:366
function editor_rallyEditor_pacenotes:getSnaproad() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1576
function editor_rallyEditor_pacenotes:handleCustomAudioAnchorPickMouseInput() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1123
---@param hoveredWp any
function editor_rallyEditor_pacenotes:handleMouseDown(hoveredWp) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1218
function editor_rallyEditor_pacenotes:handleMouseHold() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1328
function editor_rallyEditor_pacenotes:handleMouseInput() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1247
function editor_rallyEditor_pacenotes:handleMouseUp() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1316
---@param hoveredWp any
function editor_rallyEditor_pacenotes:handleUnmodifiedMouseInteraction(hoveredWp) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:107
---@param rallyEditor any
function editor_rallyEditor_pacenotes:init(rallyEditor) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1970
function editor_rallyEditor_pacenotes:insertMode() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2413
---@param note any
function editor_rallyEditor_pacenotes:insertNewPacenoteAfter(note) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:180
function editor_rallyEditor_pacenotes:invalidateNoSelectionPreview() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:354
function editor_rallyEditor_pacenotes:isCustomAudioAnchorPickActive() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:408
function editor_rallyEditor_pacenotes:isPacenotesDrivelineEditActive() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:362
---@param basename any
function editor_rallyEditor_pacenotes:isPickingCustomAudioAnchorFor(basename) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:175
function editor_rallyEditor_pacenotes:isValid() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:370
---@param snapshot any
function editor_rallyEditor_pacenotes:loadSnaproad(snapshot) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:542
function editor_rallyEditor_pacenotes:markLiveDrivelineReprojectDirty() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:186
function editor_rallyEditor_pacenotes:markPacenoteGeometryDirty() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1975
function editor_rallyEditor_pacenotes:markValidationDirty() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1796
---@param applyMeasurements any
function editor_rallyEditor_pacenotes:measureSelectedPacenote(applyMeasurements) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2608
function editor_rallyEditor_pacenotes:mergeSelectedWithNextPacenote() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2589
function editor_rallyEditor_pacenotes:mergeSelectedWithPrevPacenote() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2510
---@param steps any
function editor_rallyEditor_pacenotes:moveSelectedWaypointBackward(steps) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2504
---@param steps any
function editor_rallyEditor_pacenotes:moveSelectedWaypointForward(steps) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:203
function editor_rallyEditor_pacenotes:onEditModeActivate() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:207
function editor_rallyEditor_pacenotes:onEditModeDeactivate() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1191
---@param pn_sel any
function editor_rallyEditor_pacenotes:onPacenoteDrag(pn_sel) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:569
---@param host any
function editor_rallyEditor_pacenotes:onPacenotesDrivelineEditCommitted(host) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2322
---@param pacenote any
function editor_rallyEditor_pacenotes:pacenoteSearchMatches(pacenote) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2402
function editor_rallyEditor_pacenotes:placeVehicleAtPacenote() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:530
function editor_rallyEditor_pacenotes:refreshAfterDrivelineReproject() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2392
---@param opts any
function editor_rallyEditor_pacenotes:refreshPacenotes(opts) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1959
---@param snapshot any
---@param opts any
function editor_rallyEditor_pacenotes:refreshPacenotesTab(snapshot, opts) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1812
function editor_rallyEditor_pacenotes:remeasureAllPacenotes() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:512
---@param drivelineV3 any
---@param snapshot any
function editor_rallyEditor_pacenotes:replaceSnaproadFromDrivelineV3(drivelineV3, snapshot) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:793
function editor_rallyEditor_pacenotes:resetGizmoTransformToOrigin() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2318
---@param pacenote any
function editor_rallyEditor_pacenotes:searchPacenoteMatchFn(pacenote) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1909
function editor_rallyEditor_pacenotes:selectNextPacenote() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2450
function editor_rallyEditor_pacenotes:selectNextWaypoint() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:685
---@param id any
function editor_rallyEditor_pacenotes:selectPacenote(id) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1859
function editor_rallyEditor_pacenotes:selectPrevPacenote() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1842
function editor_rallyEditor_pacenotes:selectRecentPacenote() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:736
---@param id any
function editor_rallyEditor_pacenotes:selectWaypoint(id) end

--- called by RallyEditor when this tab is selected.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:640
function editor_rallyEditor_pacenotes:selected() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:234
function editor_rallyEditor_pacenotes:selectedPacenote() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:243
function editor_rallyEditor_pacenotes:selectedWaypoint() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1290
---@param wp any
function editor_rallyEditor_pacenotes:setHover(wp) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2570
function editor_rallyEditor_pacenotes:setModeEditAll() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2575
function editor_rallyEditor_pacenotes:setModeEditCorners() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:671
function editor_rallyEditor_pacenotes:setOrbitCameraToSelectedPacenote() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:583
---@param active any
function editor_rallyEditor_pacenotes:setPacenotesDrivelineEditActive(active) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:190
---@param path any
function editor_rallyEditor_pacenotes:setPath(path) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2580
function editor_rallyEditor_pacenotes:setupEditMode() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:270
---@param pacenote any
function editor_rallyEditor_pacenotes:startPreviewAudio(pacenote) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:304
function editor_rallyEditor_pacenotes:stopPreviewAudio() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2557
function editor_rallyEditor_pacenotes:toggleCornerCalls() end

--- called by RallyEditor when this tab is unselected.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:659
function editor_rallyEditor_pacenotes:unselect() end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:803
---@param index any
function editor_rallyEditor_pacenotes:updateGizmoTransform(index) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:311
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function editor_rallyEditor_pacenotes:updatePreviewAudio(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1985
function editor_rallyEditor_pacenotes:validate() end

--- returns new position for the drag, and another position for orienting the normal perpendicularly.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1696
---@param wp any
---@param mousePos any
---@param mouseOffset any
function editor_rallyEditor_pacenotes:wpPosForSimpleDrag(wp, mousePos, mouseOffset) end

