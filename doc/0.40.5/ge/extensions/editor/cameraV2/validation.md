# `editor_cameraV2_validation`

*File: `lua/ge/extensions/editor/cameraV2/validation.lua` · VM: Game Engine (GE) · 103 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_cameraV2_validation`: `extensions.load("editor_cameraV2_validation")`, then the global `editor_cameraV2_validation`

Shared Camera V2 checks to reject NaNs, infinities and extreme coordinates coming from faulty raycasts or camera computations, before applying a position or rotation. Useful to a modder who wants to validate points, quaternions or terrain heights before passing them to the camera.

## Notes

- 'Reasonable' coordinate limit: 10,000,000 (worldCoordinateLimit). Terrain height limit: 1,000,000.
- A quaternion is considered valid if the square of its norm is between 0.25 and 2.25 (it is not required to be unit length).
- isValidXY/isValidPoint/isReasonableXY/isReasonablePoint return nil (not false) when point is nil.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_cameraV2_validation.isFinite(value)` | True if value is a number that is neither NaN nor infinite. | 14 |
| `editor_cameraV2_validation.isPointOnRaySegment(point, origin, direction, maximumDistance)` | True if point is near the ray segment origin -> origin + direction*maximumDistance: projection on the normalized ray between -0.01 and maximumDistance+0.01, and perpendicular distance <= 1. | 76 |
| `editor_cameraV2_validation.isReasonableCoordinate(value)` | True if the value is finite and its absolute value does not exceed 10,000,000. | 35 |
| `editor_cameraV2_validation.isReasonablePoint(point)` | True if x, y and z are reasonable coordinates. | 45 |
| `editor_cameraV2_validation.isReasonableXY(point)` | True if x and y are reasonable coordinates. | 39 |
| `editor_cameraV2_validation.isValidCoordinate(value)` | Alias of isFinite for a coordinate. | 21 |
| `editor_cameraV2_validation.isValidPoint(point)` | True if x, y and z are finite numbers. | 31 |
| `editor_cameraV2_validation.isValidQuaternion(rotation)` | True if x, y, z, w are finite and if x²+y²+z²+w² is in [0.25; 2.25]. | 49 |
| `editor_cameraV2_validation.isValidTerrainHeight(value)` | True if the height is finite and \|height\| <= 1,000,000. | 66 |
| `editor_cameraV2_validation.isValidXY(point)` | True if point.x and point.y are finite numbers. | 25 |
| `editor_cameraV2_validation.terrainHeightAt(point)` | Queries core_terrain.getTerrainHeight(vec3(x, y, 0)) for a reasonable point and returns the height if it is valid. | 70 |
| `editor_cameraV2_validation.worldCoordinateLimit()` | Returns the coordinate limit used by the 'reasonable' tests. | 98 |

### Parameter details

#### `editor_cameraV2_validation.isFinite(value)`

True if value is a number that is neither NaN nor infinite.

- `value` (*any*) : Value to test
- **returns**: boolean true if finite number

#### `editor_cameraV2_validation.isPointOnRaySegment(point, origin, direction, maximumDistance)`

True if point is near the ray segment origin -> origin + direction*maximumDistance: projection on the normalized ray between -0.01 and maximumDistance+0.01, and perpendicular distance <= 1.

- `point` (*vec3*) : Point to test
- `origin` (*vec3*) : Ray origin
- `direction` (*vec3*) : Direction (normalized internally; length <= 0.0001 rejected)
- `maximumDistance` (*number*) : Maximum segment length (>= 0)
- **returns**: boolean true if on the segment

#### `editor_cameraV2_validation.isReasonableCoordinate(value)`

True if the value is finite and its absolute value does not exceed 10,000,000.

- `value` (*any*) : Coordinate
- **returns**: boolean true if reasonable

#### `editor_cameraV2_validation.isReasonablePoint(point)`

True if x, y and z are reasonable coordinates.

- `point` (*table|nil*) : Point with x, y, z
- **returns**: boolean|nil true/false, or nil if point is nil

#### `editor_cameraV2_validation.isReasonableXY(point)`

True if x and y are reasonable coordinates.

- `point` (*table|nil*) : Point with x, y
- **returns**: boolean|nil true/false, or nil if point is nil

#### `editor_cameraV2_validation.isValidCoordinate(value)`

Alias of isFinite for a coordinate.

- `value` (*any*) : Coordinate
- **returns**: boolean true if finite

#### `editor_cameraV2_validation.isValidPoint(point)`

True if x, y and z are finite numbers.

- `point` (*table|nil*) : Point with x, y, z
- **returns**: boolean|nil true/false, or nil if point is nil

#### `editor_cameraV2_validation.isValidQuaternion(rotation)`

True if x, y, z, w are finite and if x²+y²+z²+w² is in [0.25; 2.25].

- `rotation` (*table|nil*) : Quaternion with x, y, z, w
- **returns**: boolean true if valid

#### `editor_cameraV2_validation.isValidTerrainHeight(value)`

True if the height is finite and |height| <= 1,000,000.

- `value` (*any*) : Height
- **returns**: boolean true if valid

#### `editor_cameraV2_validation.isValidXY(point)`

True if point.x and point.y are finite numbers.

- `point` (*table|nil*) : Table with x and y fields (vec3 possible)
- **returns**: boolean|nil true/false, or nil if point is nil

#### `editor_cameraV2_validation.terrainHeightAt(point)`

Queries core_terrain.getTerrainHeight(vec3(x, y, 0)) for a reasonable point and returns the height if it is valid.

- `point` (*table*) : Point with x, y
- **returns**: number|nil Terrain height, or nil if the point or the height is invalid

#### `editor_cameraV2_validation.worldCoordinateLimit()`

Returns the coordinate limit used by the 'reasonable' tests.

- **returns**: number 10000000

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/cameraV2/validation.lua`.*
