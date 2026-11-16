# `util_trackBuilder_markers`

*File: `lua/ge/extensions/util/trackBuilder/markers.lua` · VM: Game Engine (GE) · 1026 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_trackBuilder_markers`: `extensions.load("util_trackBuilder_markers")`, then the global `util_trackBuilder_markers`

Manages the Track Builder edit markers (bank, height, width, checkpoint, left and right walls, ceiling) and the interpolation of the values they carry along the track. Markers are TSStatic objects created and moved in the scene (canSave = false). Each marker type declares in an internal 'types' table its interpolation mode ('points', 'segments', 'both' or 'single'), its field interpolation function and its marker placement function. The module also computes the start and end caps between neighboring segments.

## Notes

- The interpolation functions (step, linear, pow2, pow3, pow4, smoothSlope, smootherSlope) take t in [0, 1] and return two values: the interpolated value and its derivative. smoothSlope and smootherSlope have a horizontal derivative at both ends. The interpolation names stored in the markers (b.interpolation) are the names of these functions of M.
- Marker values are written into the segment's points (point.bank, point.width, point.height…) and into segment.markerInfo; segment.refreshMesh is set to true when the mesh must be regenerated.
- Only the types listed in names (bank, height, width, checkpoint, leftWall, rightWall, ceilingMesh) have a marker list; the names centerMesh, leftMesh and rightMesh are commented out in names, so hideMarkers/clearMarkers/unloadAll do not handle them (hideMarkers('centerMesh') would cause an error on a nil table).
- Bug: in linear/pow2/pow3/pow4, the derivative returned for t >= 1 is t, 2t, 3t, 4t instead of the derivative at 1 (1, 2, 3, 4 for t=1); the value is correct only if t is exactly 1.
- Bug: in compareSimpleCaps and compareWallCeilingCaps, the 'noPoints' branches test second.startCap / first.endCap (segment fields) instead of meshInfo[nameOfField].startCap / endCap.
- Bug: in interpolateOverSegments, the condition 'i ~= track' compares a number to a table (always true).
- A width marker consists of two TSStatic objects (named 'widthMarker<n>' and 'widthMarker<n>b').

## Functions

| Function | Description | Line |
|---|---|---|
| `util_trackBuilder_markers.addMarkerChange(name, index)` | Notes that the segment at index index has a modified marker for the field name; interpolate then recomputes only the affected zones. | 999 |
| `util_trackBuilder_markers.caps(segments, closed)` | Computes the start and end caps between consecutive segments for centerMesh, leftMesh, rightMesh (if the values differ), and for leftWall, rightWall, ceilingMesh (if the active state differs). Segment 1 is skipped; if closed is true, the last segment is compared to the second. | 921 |
| `util_trackBuilder_markers.clearMarkers(name)` | Removes the markers of the given type from the scene. | 990 |
| `util_trackBuilder_markers.hideMarkers(name)` | Hides the markers of the given type by setting their scale to 0. | 982 |
| `util_trackBuilder_markers.interpolate(nameOfField, track)` | Interpolates the field nameOfField over the whole track according to the type's mode ('points', 'segments', 'both' or 'single'), then clears the change list for that field. | 820 |
| `util_trackBuilder_markers.interpolateField(name, t, a, b, point, length)` | Delegates to the type-specific interpolation function (for example interpolateBank, interpolateWidth) to write the interpolated value into point. | 972 |
| `util_trackBuilder_markers.interpolateOverPoints(nameOfField, track)` | Interpolates between two successive marker values on the points of the relevant segments (only if they are in markerChanges or fresh), according to the distance traveled. | 721 |
| `util_trackBuilder_markers.interpolateOverSegments(nameOfField, track)` | Applies the previous marker value to each segment ('segments' mode), starting from the first segment that carries the field. | 781 |
| `util_trackBuilder_markers.interpolatePointsOfSegment(segment, startValue, endValue, startLength, endLength, nameOfField)` | Interpolates between startValue and endValue on a segment's points (fraction t = (p.length - startLength)/(endLength - startLength)) and on its markerInfo; without points, only computes markerInfo. Sets refreshMesh to true. | 931 |
| `util_trackBuilder_markers.interpolateSingle(nameOfField, track)` | For 'single' types (checkpoint), calls the segment function only for the indices registered by addMarkerChange. | 808 |
| `util_trackBuilder_markers.linear(t)` | Linear interpolation: value t, derivative 1 (0 outside [0, 1] on the left, 1 on the right). | 439 |
| `util_trackBuilder_markers.pow2(t)` | Interpolation in t². | 449 |
| `util_trackBuilder_markers.pow3(t)` | Interpolation in t³. | 459 |
| `util_trackBuilder_markers.pow4(t)` | Interpolation in t⁴. | 469 |
| `util_trackBuilder_markers.smoothSlope(t)` | Smooth interpolation (3t²-2t³): goes from 0 to 1 with a horizontal slope at 0 and at 1. | 480 |
| `util_trackBuilder_markers.smootherSlope(t)` | Even smoother interpolation (Perlin polynomial 6t⁵-15t⁴+10t³), zero slope and curvature at the ends. | 491 |
| `util_trackBuilder_markers.step(t)` | Step interpolation: always returns 0 and 0 (the start value is kept). | 435 |
| `util_trackBuilder_markers.transformMarkers(name, allNodes)` | Creates, deletes and repositions the marker objects of the given type for the track's nodes; has no effect if the type has no transformMarkers function. | 976 |
| `util_trackBuilder_markers.unloadAll()` | Forgets all marker lists (reset to {}) without deleting the objects from the scene; use after a scene cleanup. | 1007 |

### Parameter details

#### `util_trackBuilder_markers.addMarkerChange(name, index)`

Notes that the segment at index index has a modified marker for the field name; interpolate then recomputes only the affected zones.

- `name` (*string*) : Marker type.
- `index` (*integer*) : Index of the segment in the track.

#### `util_trackBuilder_markers.caps(segments, closed)`

Computes the start and end caps between consecutive segments for centerMesh, leftMesh, rightMesh (if the values differ), and for leftWall, rightWall, ceilingMesh (if the active state differs). Segment 1 is skipped; if closed is true, the last segment is compared to the second.

- `segments` (*table[]*) : Track segments.
- `closed` (*boolean|nil*) : Closed-loop track.

#### `util_trackBuilder_markers.clearMarkers(name)`

Removes the markers of the given type from the scene.

- `name` (*string*) : Marker type present in names.

#### `util_trackBuilder_markers.hideMarkers(name)`

Hides the markers of the given type by setting their scale to 0.

- `name` (*string*) : Marker type present in names.

#### `util_trackBuilder_markers.interpolate(nameOfField, track)`

Interpolates the field nameOfField over the whole track according to the type's mode ('points', 'segments', 'both' or 'single'), then clears the change list for that field.

- `nameOfField` (*string*) : Marker type (bank, height, width, leftWall…).
- `track` (*table[]*) : Ordered list of segments.

#### `util_trackBuilder_markers.interpolateField(name, t, a, b, point, length)`

Delegates to the type-specific interpolation function (for example interpolateBank, interpolateWidth) to write the interpolated value into point.

- `name` (*string*) : Marker type.
- `t` (*number*) : Fraction in [0, 1].
- `a` (*table*) : Start value.
- `b` (*table*) : End value.
- `point` (*table*) : Point or markerInfo to write to.
- `length` (*number*) : Length of the interval.

#### `util_trackBuilder_markers.interpolateOverPoints(nameOfField, track)`

Interpolates between two successive marker values on the points of the relevant segments (only if they are in markerChanges or fresh), according to the distance traveled.

- `nameOfField` (*string*) : Marker type.
- `track` (*table[]*) : Track segments.

#### `util_trackBuilder_markers.interpolateOverSegments(nameOfField, track)`

Applies the previous marker value to each segment ('segments' mode), starting from the first segment that carries the field.

- `nameOfField` (*string*) : Marker type.
- `track` (*table[]*) : Track segments.

#### `util_trackBuilder_markers.interpolatePointsOfSegment(segment, startValue, endValue, startLength, endLength, nameOfField)`

Interpolates between startValue and endValue on a segment's points (fraction t = (p.length - startLength)/(endLength - startLength)) and on its markerInfo; without points, only computes markerInfo. Sets refreshMesh to true.

- `segment` (*table*) : Segment to update.
- `startValue` (*table*) : Start value (with .value, .interpolation…).
- `endValue` (*table|nil*) : End value; nil to keep startValue.
- `startLength` (*number*) : Cumulative length at the start.
- `endLength` (*number|nil*) : Cumulative length at the end.
- `nameOfField` (*string*) : Marker type.

#### `util_trackBuilder_markers.interpolateSingle(nameOfField, track)`

For 'single' types (checkpoint), calls the segment function only for the indices registered by addMarkerChange.

- `nameOfField` (*string*) : Marker type.
- `track` (*table[]*) : Track segments.

#### `util_trackBuilder_markers.linear(t)`

Linear interpolation: value t, derivative 1 (0 outside [0, 1] on the left, 1 on the right).

- `t` (*number*) : Position.
- **returns**: number Value.
- **returns**: number Derivative.

#### `util_trackBuilder_markers.pow2(t)`

Interpolation in t².

- `t` (*number*) : Position.
- **returns**: number Value.
- **returns**: number Derivative.

#### `util_trackBuilder_markers.pow3(t)`

Interpolation in t³.

- `t` (*number*) : Position.
- **returns**: number Value.
- **returns**: number Derivative.

#### `util_trackBuilder_markers.pow4(t)`

Interpolation in t⁴.

- `t` (*number*) : Position.
- **returns**: number Value.
- **returns**: number Derivative.

#### `util_trackBuilder_markers.smoothSlope(t)`

Smooth interpolation (3t²-2t³): goes from 0 to 1 with a horizontal slope at 0 and at 1.

- `t` (*number*) : Position.
- **returns**: number Value.
- **returns**: number Derivative.

#### `util_trackBuilder_markers.smootherSlope(t)`

Even smoother interpolation (Perlin polynomial 6t⁵-15t⁴+10t³), zero slope and curvature at the ends.

- `t` (*number*) : Position.
- **returns**: number Value.
- **returns**: number Derivative.

#### `util_trackBuilder_markers.step(t)`

Step interpolation: always returns 0 and 0 (the start value is kept).

- `t` (*number*) : Position in [0, 1].
- **returns**: number Value.
- **returns**: number Derivative.

#### `util_trackBuilder_markers.transformMarkers(name, allNodes)`

Creates, deletes and repositions the marker objects of the given type for the track's nodes; has no effect if the type has no transformMarkers function.

- `name` (*string*) : Marker type.
- `allNodes` (*table[]*) : All the nodes/segments of the track.

## Fields

| Field | Type | Description |
|---|---|---|
| `names` | string[] | List of handled marker types: bank, height, width, checkpoint, leftWall, rightWall, ceilingMesh. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/trackBuilder/markers.lua`.*
