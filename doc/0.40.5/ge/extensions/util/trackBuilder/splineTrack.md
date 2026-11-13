# `util_trackBuilder_splineTrack`

*Fichier : `lua/ge/extensions/util/trackBuilder/splineTrack.lua` · VM : Game Engine (GE) · 2295 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_trackBuilder_splineTrack` : `extensions.load("util_trackBuilder_splineTrack")`, puis la globale `util_trackBuilder_splineTrack`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_trackBuilder_splineTrack.addCheckPointPositions(reverse)` | this function creates evenly spaced checkpoints, and adds them to the scenario etc. | 262 |
| `util_trackBuilder_splineTrack.addClosingPiece()` |  | 1092 |
| `util_trackBuilder_splineTrack.addCurve(len, hardness, dir, index, replace)` |  | 1604 |
| `util_trackBuilder_splineTrack.addEmptyOffset(xOff, yOff, zOff, dirOff, absolute, index, replace)` |  | 1608 |
| `util_trackBuilder_splineTrack.addForward(len, index, replace)` | these functions add pieces to the low-level track info stored in pieces.<br>adding new types pieces need to be put in:<br> here<br> function to calculate their points<br> function toSegments => call own function with params<br> trackbuilder.js: piece information, parameters<br> trackbuilder.js: getSelectedTrackElementData | 1603 |
| `util_trackBuilder_splineTrack.addLoop(rad, off, index, replace)` |  | 1607 |
| `util_trackBuilder_splineTrack.addOffsetCurve(len, off, hardness, index, replace)` |  | 1605 |
| `util_trackBuilder_splineTrack.addPiece(params, index, replace)` | adds a piece to the piece field, at a given position, can replace others, and handles marking affected pieces as invalid. | 1611 |
| `util_trackBuilder_splineTrack.addSpiral(size, inside, dir, index, replace)` |  | 1606 |
| `util_trackBuilder_splineTrack.calculateCustomPoints(piece)` | scales and rotated custom points of a piece. | 1263 |
| `util_trackBuilder_splineTrack.convertToSpline()` | goes through all segments and calculates the points and other infos for them. | 1111 |
| `util_trackBuilder_splineTrack.createMarkers()` | creates and places all the neccesary markers. | 703 |
| `util_trackBuilder_splineTrack.createNewSubTrack(position, hdg)` |  | 90 |
| `util_trackBuilder_splineTrack.exportTrackToTable()` | exports the current track to a simple lua table. | 1736 |
| `util_trackBuilder_splineTrack.focusCameraOn(index, distance, force)` | marker functions | 616 |
| `util_trackBuilder_splineTrack.focusMarkerOn(index, dontRefresMaterial, force)` | this places the track marker on a track element by index. | 645 |
| `util_trackBuilder_splineTrack.getAllCheckpoints()` |  | 347 |
| `util_trackBuilder_splineTrack.getArcPoints(segment)` |  | 1175 |
| `util_trackBuilder_splineTrack.getBezierPoints(segment)` | calculates points on a bezier curve | 1209 |
| `util_trackBuilder_splineTrack.getCustomTracks()` | reloads the list of all available tracks, sends those to the app | 2137 |
| `util_trackBuilder_splineTrack.getEndOfTrack()` | returns the last track piece | 1534 |
| `util_trackBuilder_splineTrack.getIntersection(name)` |  | 222 |
| `util_trackBuilder_splineTrack.getLastPieceWithMarker(markerName, lastIndex)` |  | 493 |
| `util_trackBuilder_splineTrack.getPieceInfo(index, sub)` | gets the track table of one singular element thereof. | 502 |
| `util_trackBuilder_splineTrack.getPreviewNames()` |  | 2158 |
| `util_trackBuilder_splineTrack.getSegmentInfo(index, sub)` |  | 521 |
| `util_trackBuilder_splineTrack.getSelectedTrackInfo()` | -- stack code might be removed at some point.<br>--stacks all the pieces up until the selected piece.<br>local function stackToCursor()<br>  M.stack(#pieces - currentSelected)<br>end<br><br>--stacks any number of pieces.<br>local function stack(count)<br>  if #pieces <= 2 then return end<br>  if not count then count = 1 end<br>  if count <= 0 then return end<br><br>  while count > 0 do<br>    stackedPieces[#stackedPieces + 1] = pieces[#pieces]<br>    M.revert()<br>    count = count - 1<br>    if #pieces <= 0 then<br>      count = 0<br>    end<br>  end<br>end<br><br>--applies any number of pieces from the stack, with the option to keep the stack.<br>local function applyStack(count, keep)<br>  if #stackedPieces == 0 then return end<br>  if not count then count = 1 end<br>  if count <= 0 then return end<br><br>  local to = #stackedPieces - count<br>  to = to + 1<br>  if to < 1 then to = 1 end<br>  for i = #stackedPieces, to, -1 do<br>    M.addPiece(M.deepcopy(stackedPieces[i]))<br>    M.invalidatePiece(#pieces)<br>    pieces[#pieces].fresh = false<br>    if not keep then<br>      stackedPieces[#stackedPieces] = nil<br>    end<br>  end<br>end<br><br>--helper copy function for stacking.<br>local function deepcopy(orig)<br>  local orig_type = type(orig)<br>  local copy<br>  if orig_type == 'table' then<br>    copy = {}<br>    for orig_key, orig_value in pairs(orig) do<br>      copy[orig_key] = orig_value<br>    end<br>  else --number, string, boolean, etc<br>    copy = orig<br>  end<br>  return copy<br>end<br><br>--gets number of stacked tiles.<br>local function getStackCount()<br>  return #stackedPieces<br>end<br><br>--clears the stack.<br>local function clearStack()<br>  stackedPieces = {}<br>end<br> gets the track info the currently selected piece. | 608 |
| `util_trackBuilder_splineTrack.getTrackPosition()` | gets the values of the trackPosition field. | 477 |
| `util_trackBuilder_splineTrack.importTrackFromTable(import)` | imports the track from a table. destroys current track. | 1902 |
| `util_trackBuilder_splineTrack.initTrack(noUnload)` | initializes the track. | 1429 |
| `util_trackBuilder_splineTrack.invalidatePiece(index, types, force)` | marks a piece to be invalidated later, either in general or for a specific type. | 1317 |
| `util_trackBuilder_splineTrack.load(originalFilename, instantHighQuality, increasePointMult, clearShapes, silent, ignoreCol)` | restores the track from the given file by name | 1984 |
| `util_trackBuilder_splineTrack.loadJSON(originalFilename)` | only loads the json of a track (for getting infos such as length and author) | 2045 |
| `util_trackBuilder_splineTrack.makeTrack(instantHighQuality, ignoreCollision)` | makes an actual mesh from the track info. | 848 |
| `util_trackBuilder_splineTrack.markerChange(type, index, value)` | change a marker of a piece, marks the piece as invalid | 737 |
| `util_trackBuilder_splineTrack.measureTrack()` | measures the length of the track | 1291 |
| `util_trackBuilder_splineTrack.mergeMultiTrack(segments, centerMat, borderMat, borderMesh)` |  | 173 |
| `util_trackBuilder_splineTrack.onClientEndMission()` | Hook for deleting the track when the level is unloaded. *(hook)* | 2172 |
| `util_trackBuilder_splineTrack.onCollectScreenshotMetadata(metadata)` | *(hook)* | 2179 |
| `util_trackBuilder_splineTrack.onPreRender(dt)` | *(hook)* | 2281 |
| `util_trackBuilder_splineTrack.onUpdate()` | called every frame. when high quality is enabled, manages the timer on low quality track segments so they can be upgraded one after another. *(hook)* | 787 |
| `util_trackBuilder_splineTrack.positionTrackAboveVehicle()` | positions the track 15m above the player vehicle. returns false if there is no player vehicle | 422 |
| `util_trackBuilder_splineTrack.positionTrackBeforeCamera()` | positions the track 15m in front of the camera. returs false if user is not in free camera mode | 395 |
| `util_trackBuilder_splineTrack.positionVehicle(reverse, index)` | places the players car at the beginning of the track. | 362 |
| `util_trackBuilder_splineTrack.refreshAllMaterials()` | track to mesh functions | 836 |
| `util_trackBuilder_splineTrack.removeAt(index)` | removes a piece at a position. | 1544 |
| `util_trackBuilder_splineTrack.removeIntersection(name)` |  | 197 |
| `util_trackBuilder_splineTrack.removeSubTrack(index)` |  | 104 |
| `util_trackBuilder_splineTrack.removeTrack()` | removes the whole track, incl. meshes and markers. | 1503 |
| `util_trackBuilder_splineTrack.rename(oldName, newName)` | renames a file | 2124 |
| `util_trackBuilder_splineTrack.revert()` | destroys the last track element (minimum of two elements remain, because only one element makes no track) | 1539 |
| `util_trackBuilder_splineTrack.rotateTrackToCamera()` | rotates the track so that it points into the direction the camera is looking. returs false if user is not in free camera mode | 410 |
| `util_trackBuilder_splineTrack.rotateTrackToTrackVehicle()` | positions the track so it looks into the direction of the player vehicle. returns false if there is no player vehicle | 434 |
| `util_trackBuilder_splineTrack.rotateVectorByQuat(v, q)` | helper function to rotate a vector by a quat. | 1727 |
| `util_trackBuilder_splineTrack.save(filename, saveOptions)` | saves the track to the given file by name | 2062 |
| `util_trackBuilder_splineTrack.setAllPiecesHighQuality()` |  | 772 |
| `util_trackBuilder_splineTrack.setDefaultLaps(laps)` |  | 468 |
| `util_trackBuilder_splineTrack.setHighQuality(hq)` | sets the track to high quality or not. | 527 |
| `util_trackBuilder_splineTrack.setIntersectionMaterial(name, center, border)` |  | 205 |
| `util_trackBuilder_splineTrack.setIntersectionMesh(name, mesh)` |  | 213 |
| `util_trackBuilder_splineTrack.setMaterial(index, sub, field, material, fill)` |  | 988 |
| `util_trackBuilder_splineTrack.setMesh(index, field, mesh, fill)` |  | 1026 |
| `util_trackBuilder_splineTrack.setReversible(rev)` |  | 472 |
| `util_trackBuilder_splineTrack.setSegmentMaterial(segment)` | sets the material of a segment and marks it for updating if the material actually changed | 1070 |
| `util_trackBuilder_splineTrack.setTrackPosition(x, y, z, hdg, sub)` | sets the values of the trackPosition field | 446 |
| `util_trackBuilder_splineTrack.showMarkers(show)` | toggles visibility of markers on or off. | 684 |
| `util_trackBuilder_splineTrack.snapToGrid(point)` | snaps a given point to the triangular grid, using the unit vectors in the trackPosition field. | 1078 |
| `util_trackBuilder_splineTrack.switchSubTrack(index)` | M.undo = M.undo | 96 |
| `util_trackBuilder_splineTrack.toSegments()` | takes the low-level info stored in the pieces-field, and creates the bezier segments or custom point arrays out of it. | 1329 |
| `util_trackBuilder_splineTrack.unloadAll()` | clears all the fields. | 1487 |
| `util_trackBuilder_splineTrack.unselectAll()` |  | 634 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `applyStack` | any |  ⚠ référence `applyStack` non définie dans le fichier (vaut probablement nil) |
| `camDistance` | number | cam settings |
| `clearStack` | any |  ⚠ référence `clearStack` non définie dans le fichier (vaut probablement nil) |
| `curve` | any |  ⚠ référence `curve` non définie dans le fichier (vaut probablement nil) |
| `deepcopy` | any |  |
| `emptyOffset` | any |  ⚠ référence `emptyOffset` non définie dans le fichier (vaut probablement nil) |
| `forward` | any |  ⚠ référence `forward` non définie dans le fichier (vaut probablement nil) |
| `fresnelSC` | any |  ⚠ référence `fresnelSC` non définie dans le fichier (vaut probablement nil) |
| `getHdgVector` | any |  ⚠ référence `getHdgVector` non définie dans le fichier (vaut probablement nil) |
| `getStackCount` | any |  ⚠ référence `getStackCount` non définie dans le fichier (vaut probablement nil) |
| `initialTrackPiece` | any |  ⚠ référence `initialTrackPiece` non définie dans le fichier (vaut probablement nil) |
| `interpolateField` | any |  ⚠ référence `interpolateField` non définie dans le fichier (vaut probablement nil) |
| `interpolateSegment` | any |  ⚠ référence `interpolateSegment` non définie dans le fichier (vaut probablement nil) |
| `loop` | any |  ⚠ référence `loop` non définie dans le fichier (vaut probablement nil) |
| `materialUtil` | any |  |
| `offsetCurve` | any |  ⚠ référence `offsetCurve` non définie dans le fichier (vaut probablement nil) |
| `saveHistory` | any |  ⚠ référence `saveHistory` non définie dans le fichier (vaut probablement nil) |
| `setAllPiecesToAsphalt` | any |  ⚠ référence `setAllPiecesToAsphalt` non définie dans le fichier (vaut probablement nil) |
| `spiral` | any |  ⚠ référence `spiral` non définie dans le fichier (vaut probablement nil) |
| `stack` | any |  ⚠ référence `stack` non définie dans le fichier (vaut probablement nil) |
| `stackToCursor` | any |  ⚠ référence `stackToCursor` non définie dans le fichier (vaut probablement nil) |

**Évènements UI (guihooks.trigger) :** `Message`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`, `removeFile`, `renameFile`
- `be:` `reloadCollision`
- `core_environment.` `getFogDensity`, `getTimeOfDay`, `setFogDensity`, `setTimeOfDay`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/trackBuilder/splineTrack.lua`.*
