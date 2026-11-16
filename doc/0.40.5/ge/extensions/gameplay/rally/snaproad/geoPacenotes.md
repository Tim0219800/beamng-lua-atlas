# `gameplay_rally_snaproad_geoPacenotes`

*File: `lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua` · VM: Game Engine (GE) · 850 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_snaproad_geoPacenotes`: `extensions.load("gameplay_rally_snaproad_geoPacenotes")`, then the global `gameplay_rally_snaproad_geoPacenotes`

Geometric measurement of the pacenotes' corners from the road (snaproad). From the points of a partition, it fits one or more circles (2D three-point method) to obtain radius, diameter, arc length, angle and fit quality, in three variants: 'single' (one circle), 'split2' (two parts), 'split3' (three parts). From this it derives the corner intensity (according to the notebook's text compositor), the direction, the hairpin candidates and the diameter change. It also draws the measurement in debug. Called by Snaproad:measurePartition in the rally editor.

## Notes

- measurePartition writes into pn.measurements: variants (single/split2/split3), diagnostics, corner1 (alias of variants.single), corner2 (nil), selectedType, selected, hairpinCandidate, diameterChange {change, changePercent, isOpening, isTightening}. The corner1/corner2 aliases are kept for compatibility with exports and debug tools.
- At least 3 focus points and a halfpoint (halfpointPos or halfpoint) on the pacenote are required, otherwise the measurement is abandoned without error.
- Circle fit quality: RMSE normalized by the radius; < 0.05 excellent, 0.05 to 0.15 good, > 0.15 poor or compound corner (code comment).
- The skipAuto parameter of measurePartition is not used.
- The module depends on editor/roadArchitect/utilities (circle2DFrom3Points): it is only usable in a context where the editor is available.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_snaproad_geoPacenotes.calculateCircleFromPoints2(p1, p2, p3)` | Computes the circle through three points with the 2D (XY) method: center (average Z of the three points), radius (2D distance from the center to p1) and arc length from p1 to p3 through p2 (direction determined by the cross product). | 220 |
| `gameplay_rally_snaproad_geoPacenotes.calculateMiddlePoint(pn, startPos, endPos, partition)` | Midpoint of a corner: the pacenote's halfpointPos or halfpoint if it exists, otherwise the partition's focus point closest to the geometric middle between start and end. | 515 |
| `gameplay_rally_snaproad_geoPacenotes.drawPacenoteMeasurement(center, radius, arcDistance, p1, p2, p3, clr, alpha, prefix, fitQuality, arcDegrees)` | Draws a measurement with debugDrawer: circle arc as prisms, radii, and arc text (length, diameter, fit quality, angle). Draws nothing if the center is nil or the radius <= 0. | 773 |
| `gameplay_rally_snaproad_geoPacenotes.measurePartition(pn, focusPoints, skipAuto)` | Measures a pacenote's corner from the partition's focus points: builds the path, fits the circles of the three variants, annotates intensity, direction and hairpin, and fills in pn.measurements (see notes). | 800 |
| `gameplay_rally_snaproad_geoPacenotes.measurementTypeOptions()` | Ordered list of the measurement type definitions (for a dropdown). | 32 |
| `gameplay_rally_snaproad_geoPacenotes.normalizeMeasurementType(measurementType)` | Returns the type if it exists, otherwise the default type ('single'). | 27 |

### Parameter details

#### `gameplay_rally_snaproad_geoPacenotes.calculateCircleFromPoints2(p1, p2, p3)`

Computes the circle through three points with the 2D (XY) method: center (average Z of the three points), radius (2D distance from the center to p1) and arc length from p1 to p3 through p2 (direction determined by the cross product).

- `p1` (*vec3*) : First point
- `p2` (*vec3*) : Intermediate point
- `p3` (*vec3*) : Last point
- **returns**: vec3|nil Center; nil if the points are collinear
- **returns**: number Radius in meters (0 on failure)
- **returns**: number Arc length in meters (0 on failure)

#### `gameplay_rally_snaproad_geoPacenotes.calculateMiddlePoint(pn, startPos, endPos, partition)`

Midpoint of a corner: the pacenote's halfpointPos or halfpoint if it exists, otherwise the partition's focus point closest to the geometric middle between start and end.

- `pn` (*table*) : Pacenote
- `startPos` (*vec3*) : Start of the corner
- `endPos` (*vec3*) : End of the corner
- `partition` (*table*) : Partition with focus_points
- **returns**: vec3 Position of the middle

#### `gameplay_rally_snaproad_geoPacenotes.drawPacenoteMeasurement(center, radius, arcDistance, p1, p2, p3, clr, alpha, prefix, fitQuality, arcDegrees)`

Draws a measurement with debugDrawer: circle arc as prisms, radii, and arc text (length, diameter, fit quality, angle). Draws nothing if the center is nil or the radius <= 0.

- `center` (*vec3|nil*) : Circle center
- `radius` (*number*) : Radius (m)
- `arcDistance` (*number*) : Arc length (m)
- `p1` (*vec3*) : Start of the arc
- `p2` (*vec3*) : Intermediate point
- `p3` (*vec3*) : End of the arc
- `clr` (*table|nil*) : Color (purple by default)
- `alpha` (*number|nil*) : Opacity (0.7 by default)
- `prefix` (*string|nil*) : Text prefix
- `fitQuality` (*number|nil*) : Fit quality (normalized RMSE)
- `arcDegrees` (*number|nil*) : Arc angle in degrees

#### `gameplay_rally_snaproad_geoPacenotes.measurePartition(pn, focusPoints, skipAuto)`

Measures a pacenote's corner from the partition's focus points: builds the path, fits the circles of the three variants, annotates intensity, direction and hairpin, and fills in pn.measurements (see notes).

- `pn` (*table*) : Pacenote with start and end waypoints
- `focusPoints` (*table[]*) : Partition's focus points (at least 3)
- `skipAuto` (*boolean|nil*) : Unused

#### `gameplay_rally_snaproad_geoPacenotes.measurementTypeOptions()`

Ordered list of the measurement type definitions (for a dropdown).

- **returns**: table[] Items {id, label, segmentCount}

#### `gameplay_rally_snaproad_geoPacenotes.normalizeMeasurementType(measurementType)`

Returns the type if it exists, otherwise the default type ('single').

- `measurementType` (*string|nil*) : Measurement type
- **returns**: string Valid type

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultMeasurementType` | string | Default measurement type: 'single'. |
| `measurementTypeOrder` | string[] | Order of the types: 'single', 'split2', 'split3'. |
| `measurementTypes` | table<string, table> | Description of each type: {id, label ('Single fit', 'Two-part fit', 'Three-part fit'), segmentCount (1, 2, 3)}. |

## Calls into the engine (C++)

- `debugDrawer:` `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua`.*
