# `editor_rallyEditor_pacenotes`

*Fichier : `lua/ge/extensions/editor/rallyEditor/pacenotes.lua` · VM : Game Engine (GE) · 2677 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/pacenotes")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_pacenotes")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_moveSelectedWaypointHelper(fwd, steps)` |  | 2487 |
| `C:_newPacenotesDrivelineHost()` |  | 412 |
| `C:applyLiveDrivelineReproject(force)` |  | 547 |
| `C:attemptToFixMapEdgeIssue()` |  | 789 |
| `C:autofillDistanceCalls()` |  | 2385 |
| `C:beginCustomAudioAnchorPick(basename)` |  | 333 |
| `C:beginDrag()` |  | 823 |
| `C:cameraPathIsPlaying()` |  | 2553 |
| `C:cameraPathPlay()` |  | 2516 |
| `C:cancelCustomAudioAnchorPick()` |  | 347 |
| `C:captureDrivelineEditSnapshot()` |  | 459 |
| `C:cleanupPacenoteNames(recordHistory)` |  | 2361 |
| `C:clearState()` |  | 135 |
| `C:createMouseDragPacenote()` |  | 1450 |
| `C:debugDrawNewPacenote(pos_cs, pos_ce)` |  | 1406 |
| `C:debugDrawNewPacenote2(pos_cs, pos_ce)` |  | 1428 |
| `C:deleteAllPacenotes()` |  | 2021 |
| `C:deleteSelected()` |  | 1767 |
| `C:deleteSelectedPacenote(shouldSelect)` |  | 1773 |
| `C:deselect()` |  | 777 |
| `C:detectCustomAudioAnchorPickHover()` |  | 1553 |
| `C:detectMouseHoverWaypoint()` | figures out which pacenote to select with the mouse in the 3D scene. | 1613 |
| `C:dragging()` |  | 837 |
| `C:draw(mouseInfo, dtReal, dtSim, dtRaw)` |  | 1392 |
| `C:drawCustomAudioAnchorPickOverlay(globalOpacity)` |  | 937 |
| `C:drawDebugCameraPlaying()` |  | 1117 |
| `C:drawDebugEntrypoint(globalOpacity, dt)` |  | 985 |
| `C:drawDrivelineEditToggle()` |  | 2031 |
| `C:drawPacenotesDrivelineEditSurface()` |  | 1082 |
| `C:drawPacenotesList()` |  | 2105 |
| `C:endDragging()` |  | 874 |
| `C:ensureDrivelineEditSnapshot()` |  | 505 |
| `C:ensurePacenotesDrivelineHost()` |  | 429 |
| `C:ensurePreviewAudioManager()` |  | 256 |
| `C:ensureValidationFresh()` |  | 1979 |
| `C:generateElevationProfile()` |  | 2627 |
| `C:getCustomAudioAnchorPickBasename()` |  | 358 |
| `C:getRacePath()` |  | 212 |
| `C:getSnaproad()` |  | 366 |
| `C:handleCustomAudioAnchorPickMouseInput()` |  | 1576 |
| `C:handleMouseDown(hoveredWp)` |  | 1123 |
| `C:handleMouseHold()` |  | 1218 |
| `C:handleMouseInput()` |  | 1328 |
| `C:handleMouseUp()` |  | 1247 |
| `C:handleUnmodifiedMouseInteraction(hoveredWp)` |  | 1316 |
| `C:init(rallyEditor)` |  | 107 |
| `C:insertMode()` |  | 1970 |
| `C:insertNewPacenoteAfter(note)` |  | 2413 |
| `C:invalidateNoSelectionPreview()` |  | 180 |
| `C:isCustomAudioAnchorPickActive()` |  | 354 |
| `C:isPacenotesDrivelineEditActive()` |  | 408 |
| `C:isPickingCustomAudioAnchorFor(basename)` |  | 362 |
| `C:isValid()` |  | 175 |
| `C:loadSnaproad(snapshot)` |  | 370 |
| `C:markLiveDrivelineReprojectDirty()` |  | 542 |
| `C:markPacenoteGeometryDirty()` |  | 186 |
| `C:markValidationDirty()` |  | 1975 |
| `C:measureSelectedPacenote(applyMeasurements)` |  | 1796 |
| `C:mergeSelectedWithNextPacenote()` |  | 2608 |
| `C:mergeSelectedWithPrevPacenote()` |  | 2589 |
| `C:moveSelectedWaypointBackward(steps)` |  | 2510 |
| `C:moveSelectedWaypointForward(steps)` |  | 2504 |
| `C:onEditModeActivate()` |  | 203 |
| `C:onEditModeDeactivate()` |  | 207 |
| `C:onPacenoteDrag(pn_sel)` |  | 1191 |
| `C:onPacenotesDrivelineEditCommitted(host)` |  | 569 |
| `C:pacenoteSearchMatches(pacenote)` |  | 2322 |
| `C:placeVehicleAtPacenote()` |  | 2402 |
| `C:refreshAfterDrivelineReproject()` |  | 530 |
| `C:refreshPacenotes(opts)` |  | 2392 |
| `C:refreshPacenotesTab(snapshot, opts)` |  | 1959 |
| `C:remeasureAllPacenotes()` |  | 1812 |
| `C:replaceSnaproadFromDrivelineV3(drivelineV3, snapshot)` |  | 512 |
| `C:resetGizmoTransformToOrigin()` |  | 793 |
| `C:searchPacenoteMatchFn(pacenote)` |  | 2318 |
| `C:selectNextPacenote()` |  | 1909 |
| `C:selectNextWaypoint()` |  | 2450 |
| `C:selectPacenote(id)` |  | 685 |
| `C:selectPrevPacenote()` |  | 1859 |
| `C:selectRecentPacenote()` |  | 1842 |
| `C:selectWaypoint(id)` |  | 736 |
| `C:selected()` | called by RallyEditor when this tab is selected. | 640 |
| `C:selectedPacenote()` |  | 234 |
| `C:selectedWaypoint()` |  | 243 |
| `C:setHover(wp)` |  | 1290 |
| `C:setModeEditAll()` |  | 2570 |
| `C:setModeEditCorners()` |  | 2575 |
| `C:setOrbitCameraToSelectedPacenote()` |  | 671 |
| `C:setPacenotesDrivelineEditActive(active)` |  | 583 |
| `C:setPath(path)` |  | 190 |
| `C:setupEditMode()` |  | 2580 |
| `C:startPreviewAudio(pacenote)` |  | 270 |
| `C:stopPreviewAudio()` |  | 304 |
| `C:toggleCornerCalls()` |  | 2557 |
| `C:unselect()` | called by RallyEditor when this tab is unselected. | 659 |
| `C:updateGizmoTransform(index)` |  | 803 |
| `C:updatePreviewAudio(dtReal, dtSim, dtRaw)` |  | 311 |
| `C:validate()` |  | 1985 |
| `C:wpPosForSimpleDrag(wp, mousePos, mouseOffset)` | returns new position for the drag, and another position for orienting the normal perpendicularly. | 1696 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorEditModeChanged` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `worldEditorCppApi.` `getAxisGizmoScale`, `setAxisGizmoSelectedElement`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/pacenotes.lua`.*
