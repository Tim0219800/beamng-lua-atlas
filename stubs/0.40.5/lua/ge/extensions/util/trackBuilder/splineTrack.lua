---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/splineTrack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_trackBuilder_splineTrack` : `extensions.load("util_trackBuilder_splineTrack")`, puis la globale `util_trackBuilder_splineTrack`
---@class util_trackBuilder_splineTrack
---@field applyStack any
---@field camDistance number
---@field clearStack any
---@field curve any
---@field deepcopy any
---@field emptyOffset any
---@field forward any
---@field fresnelSC any
---@field getHdgVector any
---@field getStackCount any
---@field initialTrackPiece any
---@field interpolateField any
---@field interpolateSegment any
---@field loop any
---@field materialUtil any
---@field offsetCurve any
---@field saveHistory any
---@field setAllPiecesToAsphalt any
---@field spiral any
---@field stack any
---@field stackToCursor any
util_trackBuilder_splineTrack = {}

--- this function creates evenly spaced checkpoints, and adds them to the scenario etc.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:262
---@param reverse any
function util_trackBuilder_splineTrack.addCheckPointPositions(reverse) end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1092
function util_trackBuilder_splineTrack.addClosingPiece() end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1604
---@param len any
---@param hardness any
---@param dir any
---@param index any
---@param replace any
function util_trackBuilder_splineTrack.addCurve(len, hardness, dir, index, replace) end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1608
---@param xOff any
---@param yOff any
---@param zOff any
---@param dirOff any
---@param absolute any
---@param index any
---@param replace any
function util_trackBuilder_splineTrack.addEmptyOffset(xOff, yOff, zOff, dirOff, absolute, index, replace) end

--- these functions add pieces to the low-level track info stored in pieces.
--- adding new types pieces need to be put in:
---  here
---  function to calculate their points
---  function toSegments => call own function with params
---  trackbuilder.js: piece information, parameters
---  trackbuilder.js: getSelectedTrackElementData
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1603
---@param len any
---@param index any
---@param replace any
function util_trackBuilder_splineTrack.addForward(len, index, replace) end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1607
---@param rad any
---@param off any
---@param index any
---@param replace any
function util_trackBuilder_splineTrack.addLoop(rad, off, index, replace) end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1605
---@param len any
---@param off any
---@param hardness any
---@param index any
---@param replace any
function util_trackBuilder_splineTrack.addOffsetCurve(len, off, hardness, index, replace) end

--- adds a piece to the piece field, at a given position, can replace others, and handles marking affected pieces as invalid.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1611
---@param params any
---@param index any
---@param replace any
function util_trackBuilder_splineTrack.addPiece(params, index, replace) end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1606
---@param size any
---@param inside any
---@param dir any
---@param index any
---@param replace any
function util_trackBuilder_splineTrack.addSpiral(size, inside, dir, index, replace) end

--- scales and rotated custom points of a piece.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1263
---@param piece any
function util_trackBuilder_splineTrack.calculateCustomPoints(piece) end

--- goes through all segments and calculates the points and other infos for them.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1111
function util_trackBuilder_splineTrack.convertToSpline() end

--- creates and places all the neccesary markers.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:703
function util_trackBuilder_splineTrack.createMarkers() end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:90
---@param position any
---@param hdg any
function util_trackBuilder_splineTrack.createNewSubTrack(position, hdg) end

--- exports the current track to a simple lua table.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1736
function util_trackBuilder_splineTrack.exportTrackToTable() end

--- marker functions
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:616
---@param index any
---@param distance any
---@param force any
function util_trackBuilder_splineTrack.focusCameraOn(index, distance, force) end

--- this places the track marker on a track element by index.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:645
---@param index any
---@param dontRefresMaterial any
---@param force any
function util_trackBuilder_splineTrack.focusMarkerOn(index, dontRefresMaterial, force) end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:347
function util_trackBuilder_splineTrack.getAllCheckpoints() end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1175
---@param segment any
function util_trackBuilder_splineTrack.getArcPoints(segment) end

--- calculates points on a bezier curve
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1209
---@param segment any
function util_trackBuilder_splineTrack.getBezierPoints(segment) end

--- reloads the list of all available tracks, sends those to the app
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:2137
function util_trackBuilder_splineTrack.getCustomTracks() end

--- returns the last track piece
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1534
function util_trackBuilder_splineTrack.getEndOfTrack() end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:222
---@param name any
function util_trackBuilder_splineTrack.getIntersection(name) end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:493
---@param markerName any
---@param lastIndex any
function util_trackBuilder_splineTrack.getLastPieceWithMarker(markerName, lastIndex) end

--- gets the track table of one singular element thereof.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:502
---@param index any
---@param sub any
function util_trackBuilder_splineTrack.getPieceInfo(index, sub) end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:2158
function util_trackBuilder_splineTrack.getPreviewNames() end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:521
---@param index any
---@param sub any
function util_trackBuilder_splineTrack.getSegmentInfo(index, sub) end

--- -- stack code might be removed at some point.
--- --stacks all the pieces up until the selected piece.
--- local function stackToCursor()
---   M.stack(#pieces - currentSelected)
--- end
---
--- --stacks any number of pieces.
--- local function stack(count)
---   if #pieces <= 2 then return end
---   if not count then count = 1 end
---   if count <= 0 then return end
---
---   while count > 0 do
---     stackedPieces[#stackedPieces + 1] = pieces[#pieces]
---     M.revert()
---     count = count - 1
---     if #pieces <= 0 then
---       count = 0
---     end
---   end
--- end
---
--- --applies any number of pieces from the stack, with the option to keep the stack.
--- local function applyStack(count, keep)
---   if #stackedPieces == 0 then return end
---   if not count then count = 1 end
---   if count <= 0 then return end
---
---   local to = #stackedPieces - count
---   to = to + 1
---   if to < 1 then to = 1 end
---   for i = #stackedPieces, to, -1 do
---     M.addPiece(M.deepcopy(stackedPieces[i]))
---     M.invalidatePiece(#pieces)
---     pieces[#pieces].fresh = false
---     if not keep then
---       stackedPieces[#stackedPieces] = nil
---     end
---   end
--- end
---
--- --helper copy function for stacking.
--- local function deepcopy(orig)
---   local orig_type = type(orig)
---   local copy
---   if orig_type == 'table' then
---     copy = {}
---     for orig_key, orig_value in pairs(orig) do
---       copy[orig_key] = orig_value
---     end
---   else --number, string, boolean, etc
---     copy = orig
---   end
---   return copy
--- end
---
--- --gets number of stacked tiles.
--- local function getStackCount()
---   return #stackedPieces
--- end
---
--- --clears the stack.
--- local function clearStack()
---   stackedPieces = {}
--- end
---  gets the track info the currently selected piece.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:608
function util_trackBuilder_splineTrack.getSelectedTrackInfo() end

--- gets the values of the trackPosition field.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:477
function util_trackBuilder_splineTrack.getTrackPosition() end

--- imports the track from a table. destroys current track.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1902
---@param import any
function util_trackBuilder_splineTrack.importTrackFromTable(import) end

--- initializes the track.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1429
---@param noUnload any
function util_trackBuilder_splineTrack.initTrack(noUnload) end

--- marks a piece to be invalidated later, either in general or for a specific type.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1317
---@param index any
---@param types any
---@param force any
function util_trackBuilder_splineTrack.invalidatePiece(index, types, force) end

--- restores the track from the given file by name
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1984
---@param originalFilename any
---@param instantHighQuality any
---@param increasePointMult any
---@param clearShapes any
---@param silent any
---@param ignoreCol any
function util_trackBuilder_splineTrack.load(originalFilename, instantHighQuality, increasePointMult, clearShapes, silent, ignoreCol) end

--- only loads the json of a track (for getting infos such as length and author)
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:2045
---@param originalFilename any
function util_trackBuilder_splineTrack.loadJSON(originalFilename) end

--- makes an actual mesh from the track info.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:848
---@param instantHighQuality any
---@param ignoreCollision any
function util_trackBuilder_splineTrack.makeTrack(instantHighQuality, ignoreCollision) end

--- change a marker of a piece, marks the piece as invalid
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:737
---@param type any
---@param index any
---@param value any
function util_trackBuilder_splineTrack.markerChange(type, index, value) end

--- measures the length of the track
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1291
function util_trackBuilder_splineTrack.measureTrack() end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:173
---@param segments any
---@param centerMat any
---@param borderMat any
---@param borderMesh any
function util_trackBuilder_splineTrack.mergeMultiTrack(segments, centerMat, borderMat, borderMesh) end

--- Hook for deleting the track when the level is unloaded.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:2172
function util_trackBuilder_splineTrack.onClientEndMission() end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:2179
---@param metadata any
function util_trackBuilder_splineTrack.onCollectScreenshotMetadata(metadata) end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:2281
---@param dt any
function util_trackBuilder_splineTrack.onPreRender(dt) end

--- called every frame. when high quality is enabled, manages the timer on low quality track segments so they can be upgraded one after another.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:787
function util_trackBuilder_splineTrack.onUpdate() end

--- positions the track 15m above the player vehicle. returns false if there is no player vehicle
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:422
function util_trackBuilder_splineTrack.positionTrackAboveVehicle() end

--- positions the track 15m in front of the camera. returs false if user is not in free camera mode
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:395
function util_trackBuilder_splineTrack.positionTrackBeforeCamera() end

--- places the players car at the beginning of the track.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:362
---@param reverse any
---@param index any
function util_trackBuilder_splineTrack.positionVehicle(reverse, index) end

--- track to mesh functions
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:836
function util_trackBuilder_splineTrack.refreshAllMaterials() end

--- removes a piece at a position.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1544
---@param index any
function util_trackBuilder_splineTrack.removeAt(index) end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:197
---@param name any
function util_trackBuilder_splineTrack.removeIntersection(name) end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:104
---@param index any
function util_trackBuilder_splineTrack.removeSubTrack(index) end

--- removes the whole track, incl. meshes and markers.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1503
function util_trackBuilder_splineTrack.removeTrack() end

--- renames a file
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:2124
---@param oldName any
---@param newName any
function util_trackBuilder_splineTrack.rename(oldName, newName) end

--- destroys the last track element (minimum of two elements remain, because only one element makes no track)
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1539
function util_trackBuilder_splineTrack.revert() end

--- rotates the track so that it points into the direction the camera is looking. returs false if user is not in free camera mode
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:410
function util_trackBuilder_splineTrack.rotateTrackToCamera() end

--- positions the track so it looks into the direction of the player vehicle. returns false if there is no player vehicle
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:434
function util_trackBuilder_splineTrack.rotateTrackToTrackVehicle() end

--- helper function to rotate a vector by a quat.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1727
---@param v any
---@param q any
function util_trackBuilder_splineTrack.rotateVectorByQuat(v, q) end

--- saves the track to the given file by name
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:2062
---@param filename any
---@param saveOptions any
function util_trackBuilder_splineTrack.save(filename, saveOptions) end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:772
function util_trackBuilder_splineTrack.setAllPiecesHighQuality() end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:468
---@param laps any
function util_trackBuilder_splineTrack.setDefaultLaps(laps) end

--- sets the track to high quality or not.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:527
---@param hq any
function util_trackBuilder_splineTrack.setHighQuality(hq) end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:205
---@param name any
---@param center any
---@param border any
function util_trackBuilder_splineTrack.setIntersectionMaterial(name, center, border) end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:213
---@param name any
---@param mesh any
function util_trackBuilder_splineTrack.setIntersectionMesh(name, mesh) end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:988
---@param index any
---@param sub any
---@param field any
---@param material any
---@param fill any
function util_trackBuilder_splineTrack.setMaterial(index, sub, field, material, fill) end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1026
---@param index any
---@param field any
---@param mesh any
---@param fill any
function util_trackBuilder_splineTrack.setMesh(index, field, mesh, fill) end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:472
---@param rev any
function util_trackBuilder_splineTrack.setReversible(rev) end

--- sets the material of a segment and marks it for updating if the material actually changed
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1070
---@param segment any
function util_trackBuilder_splineTrack.setSegmentMaterial(segment) end

--- sets the values of the trackPosition field
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:446
---@param x any
---@param y any
---@param z any
---@param hdg any
---@param sub any
function util_trackBuilder_splineTrack.setTrackPosition(x, y, z, hdg, sub) end

--- toggles visibility of markers on or off.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:684
---@param show any
function util_trackBuilder_splineTrack.showMarkers(show) end

--- snaps a given point to the triangular grid, using the unit vectors in the trackPosition field.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1078
---@param point any
function util_trackBuilder_splineTrack.snapToGrid(point) end

--- M.undo = M.undo
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:96
---@param index any
function util_trackBuilder_splineTrack.switchSubTrack(index) end

--- takes the low-level info stored in the pieces-field, and creates the bezier segments or custom point arrays out of it.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1329
function util_trackBuilder_splineTrack.toSegments() end

--- clears all the fields.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1487
function util_trackBuilder_splineTrack.unloadAll() end

---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:634
function util_trackBuilder_splineTrack.unselectAll() end

