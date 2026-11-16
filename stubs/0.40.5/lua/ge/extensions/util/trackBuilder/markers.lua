---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/markers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the Track Builder edit markers (bank, height, width, checkpoint, left and right walls, ceiling) and the interpolation of the values they carry along the track. Markers are TSStatic objects created and moved in the scene (canSave = false). Each marker type declares in an internal 'types' table its interpolation mode ('points', 'segments', 'both' or 'single'), its field interpolation function and its marker placement function. The module also computes the start and end caps between neighboring segments.
--- Access: extension `util_trackBuilder_markers`: `extensions.load("util_trackBuilder_markers")`, then the global `util_trackBuilder_markers`
---@class util_trackBuilder_markers
---@field names string[] List of handled marker types: bank, height, width, checkpoint, leftWall, rightWall, ceilingMesh.
util_trackBuilder_markers = {}

--- Notes that the segment at index index has a modified marker for the field name; interpolate then recomputes only the affected zones.
---Source: lua/ge/extensions/util/trackBuilder/markers.lua:999
---@param name string Marker type.
---@param index integer Index of the segment in the track.
function util_trackBuilder_markers.addMarkerChange(name, index) end

--- Computes the start and end caps between consecutive segments for centerMesh, leftMesh, rightMesh (if the values differ), and for leftWall, rightWall, ceilingMesh (if the active state differs). Segment 1 is skipped; if closed is true, the last segment is compared to the second.
---Source: lua/ge/extensions/util/trackBuilder/markers.lua:921
---@param segments table[] Track segments.
---@param closed boolean|nil Closed-loop track.
function util_trackBuilder_markers.caps(segments, closed) end

--- Removes the markers of the given type from the scene.
---Source: lua/ge/extensions/util/trackBuilder/markers.lua:990
---@param name string Marker type present in names.
function util_trackBuilder_markers.clearMarkers(name) end

--- Hides the markers of the given type by setting their scale to 0.
---Source: lua/ge/extensions/util/trackBuilder/markers.lua:982
---@param name string Marker type present in names.
function util_trackBuilder_markers.hideMarkers(name) end

--- Interpolates the field nameOfField over the whole track according to the type's mode ('points', 'segments', 'both' or 'single'), then clears the change list for that field.
---Source: lua/ge/extensions/util/trackBuilder/markers.lua:820
---@param nameOfField string Marker type (bank, height, width, leftWall…).
---@param track table[] Ordered list of segments.
function util_trackBuilder_markers.interpolate(nameOfField, track) end

--- Delegates to the type-specific interpolation function _anon(for example interpolateBank, interpolateWidth) to write the interpolated value into point.
---Source: lua/ge/extensions/util/trackBuilder/markers.lua:972
---@param name string Marker type.
---@param t number Fraction in [0, 1].
---@param a table Start value.
---@param b table End value.
---@param point table Point or markerInfo to write to.
---@param length number Length of the interval.
function util_trackBuilder_markers.interpolateField(name, t, a, b, point, length) end

--- Interpolates between two successive marker values on the points of the relevant segments (only if they are in markerChanges or fresh), according to the distance traveled.
---Source: lua/ge/extensions/util/trackBuilder/markers.lua:721
---@param nameOfField string Marker type.
---@param track table[] Track segments.
function util_trackBuilder_markers.interpolateOverPoints(nameOfField, track) end

--- Applies the previous marker value to each segment ('segments' mode), starting from the first segment that carries the field.
---Source: lua/ge/extensions/util/trackBuilder/markers.lua:781
---@param nameOfField string Marker type.
---@param track table[] Track segments.
function util_trackBuilder_markers.interpolateOverSegments(nameOfField, track) end

--- Interpolates between startValue and endValue on a segment's points (fraction t = (p.length - startLength)/(endLength - startLength)) and on its markerInfo; without points, only computes markerInfo. Sets refreshMesh to true.
---Source: lua/ge/extensions/util/trackBuilder/markers.lua:931
---@param segment table Segment to update.
---@param startValue table Start value (with .value, .interpolation…).
---@param endValue table|nil End value; nil to keep startValue.
---@param startLength number Cumulative length at the start.
---@param endLength number|nil Cumulative length at the end.
---@param nameOfField string Marker type.
function util_trackBuilder_markers.interpolatePointsOfSegment(segment, startValue, endValue, startLength, endLength, nameOfField) end

--- For 'single' types (checkpoint), calls the segment function only for the indices registered by addMarkerChange.
---Source: lua/ge/extensions/util/trackBuilder/markers.lua:808
---@param nameOfField string Marker type.
---@param track table[] Track segments.
function util_trackBuilder_markers.interpolateSingle(nameOfField, track) end

--- Linear interpolation: value t, derivative 1 (0 outside [0, 1] on the left, 1 on the right).
---Source: lua/ge/extensions/util/trackBuilder/markers.lua:439
---@param t number Position.
---@return number  Value.
---@return number  Derivative.
function util_trackBuilder_markers.linear(t) end

--- Interpolation in t².
---Source: lua/ge/extensions/util/trackBuilder/markers.lua:449
---@param t number Position.
---@return number  Value.
---@return number  Derivative.
function util_trackBuilder_markers.pow2(t) end

--- Interpolation in t³.
---Source: lua/ge/extensions/util/trackBuilder/markers.lua:459
---@param t number Position.
---@return number  Value.
---@return number  Derivative.
function util_trackBuilder_markers.pow3(t) end

--- Interpolation in t⁴.
---Source: lua/ge/extensions/util/trackBuilder/markers.lua:469
---@param t number Position.
---@return number  Value.
---@return number  Derivative.
function util_trackBuilder_markers.pow4(t) end

--- Smooth interpolation (3t²-2t³): goes from 0 to 1 with a horizontal slope at 0 and at 1.
---Source: lua/ge/extensions/util/trackBuilder/markers.lua:480
---@param t number Position.
---@return number  Value.
---@return number  Derivative.
function util_trackBuilder_markers.smoothSlope(t) end

--- Even smoother interpolation (Perlin polynomial 6t⁵-15t⁴+10t³), zero slope and curvature at the ends.
---Source: lua/ge/extensions/util/trackBuilder/markers.lua:491
---@param t number Position.
---@return number  Value.
---@return number  Derivative.
function util_trackBuilder_markers.smootherSlope(t) end

--- Step interpolation: always returns 0 and 0 (the start value is kept).
---Source: lua/ge/extensions/util/trackBuilder/markers.lua:435
---@param t number Position in [0, 1].
---@return number  Value.
---@return number  Derivative.
function util_trackBuilder_markers.step(t) end

--- Creates, deletes and repositions the marker objects of the given type for the track's nodes; has no effect if the type has no transformMarkers function.
---Source: lua/ge/extensions/util/trackBuilder/markers.lua:976
---@param name string Marker type.
---@param allNodes table[] All the nodes/segments of the track.
function util_trackBuilder_markers.transformMarkers(name, allNodes) end

--- Forgets all marker lists (reset to {}) without deleting the objects from the scene; use after a scene cleanup.
---Source: lua/ge/extensions/util/trackBuilder/markers.lua:1007
function util_trackBuilder_markers.unloadAll() end

