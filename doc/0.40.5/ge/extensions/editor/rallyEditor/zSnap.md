# `editor_rallyEditor_zSnap`

*File: `lua/ge/extensions/editor/rallyEditor/zSnap.lua` · VM: Game Engine (GE) · 89 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_rallyEditor_zSnap`: `extensions.load("editor_rallyEditor_zSnap")`, then the global `editor_rallyEditor_zSnap`

Rally editor helper to "snap" a point's height (z) to the terrain. Three methods: none, terrain height (core_terrain.getTerrainHeight) or vertical raycast (editorUtil.vertRaycast). The current method comes from the rally editor preference (editor_rallyEditor.getPrefWaypointSnapMethod). Also used to fit a spline's geometry to the terrain.

## Example

```lua
local zSnap = extensions.editor_rallyEditor_zSnap
local p = zSnap.zSnap(vec3(100, 200, 0), zSnap.methods.vertRaycast, 10)
```

## Notes

- The "InPlace" functions modify the vec3 passed as argument (pos.z) and return it; zSnap() works on a copy.
- An unknown method in snapInPlace falls back to defaultMethod (getTerrainHeight).
- snapTerrainHeightInPlace changes nothing if core_terrain.getTerrainHeight is absent or returns nil.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_rallyEditor_zSnap.conformSplineGeometry(spline, useRaycast, minNumDivisions, minSpacing, rayRaise)` | Generates the geometry of a Catmull-Rom spline snapped to the terrain, by raycast (geom.catmullRomRaycast) or by terrain height (geom.catmullRomConformToTerrain). | 81 |
| `editor_rallyEditor_zSnap.getCurrentMethod()` | Returns the method chosen in the rally editor preferences, or defaultMethod if absent/invalid. | 60 |
| `editor_rallyEditor_zSnap.isValidMethod(method)` | Returns whether the label is a known method. | 47 |
| `editor_rallyEditor_zSnap.methodForUseRaycast(useRaycast)` | Converts a boolean to a method: vertRaycast if true, otherwise getTerrainHeight. | 73 |
| `editor_rallyEditor_zSnap.noSnappingInPlace(pos)` | Does nothing, returns pos as is. | 24 |
| `editor_rallyEditor_zSnap.snapDrivelineInPlace(pos, useRaycast, rayRaise)` | Snaps a driveline point to the terrain with the method inferred from useRaycast. | 77 |
| `editor_rallyEditor_zSnap.snapInPlace(pos, method, rayRaise)` | Applies the chosen method (or the default method if unknown) to pos, in place. | 51 |
| `editor_rallyEditor_zSnap.snapInPlaceWithCurrentMethod(pos, rayRaise)` | snapInPlace with the current method. | 69 |
| `editor_rallyEditor_zSnap.snapRaycastInPlace(pos, rayRaise)` | Adjusts pos.z by a vertical raycast (editorUtil.vertRaycast). | 36 |
| `editor_rallyEditor_zSnap.snapTerrainHeightInPlace(pos)` | Sets pos.z to the terrain height at (x, y) if available. | 28 |
| `editor_rallyEditor_zSnap.zSnap(pos, method, rayRaise)` | Like snapInPlace but on a copy of pos. | 56 |
| `editor_rallyEditor_zSnap.zSnapWithCurrentMethod(pos)` | zSnap with the current method, on a copy. | 65 |

### Parameter details

#### `editor_rallyEditor_zSnap.conformSplineGeometry(spline, useRaycast, minNumDivisions, minSpacing, rayRaise)`

Generates the geometry of a Catmull-Rom spline snapped to the terrain, by raycast (geom.catmullRomRaycast) or by terrain height (geom.catmullRomConformToTerrain).

- `spline` (*table*) : Source spline.
- `useRaycast` (*boolean*) : Method choice.
- `minNumDivisions` (*integer*) : Minimum number of subdivisions (passed to geom).
- `minSpacing` (*number*) : Minimum spacing (passed to geom).
- `rayRaise` (*number|nil*) : Ray raise.
- **returns**: table Result of the geom function called.

#### `editor_rallyEditor_zSnap.getCurrentMethod()`

Returns the method chosen in the rally editor preferences, or defaultMethod if absent/invalid.

- **returns**: string Method label.

#### `editor_rallyEditor_zSnap.isValidMethod(method)`

Returns whether the label is a known method.

- `method` (*string*) : Method label.
- **returns**: boolean true if valid.

#### `editor_rallyEditor_zSnap.methodForUseRaycast(useRaycast)`

Converts a boolean to a method: vertRaycast if true, otherwise getTerrainHeight.

- `useRaycast` (*boolean*) : Use the raycast.
- **returns**: string Method label.

#### `editor_rallyEditor_zSnap.noSnappingInPlace(pos)`

Does nothing, returns pos as is.

- `pos` (*vec3*) : Position.
- **returns**: vec3 pos unchanged.

#### `editor_rallyEditor_zSnap.snapDrivelineInPlace(pos, useRaycast, rayRaise)`

Snaps a driveline point to the terrain with the method inferred from useRaycast.

- `pos` (*vec3*) : Position modified in place.
- `useRaycast` (*boolean*) : true = raycast, false = terrain height.
- `rayRaise` (*number|nil*) : Ray raise.
- **returns**: vec3 pos.

#### `editor_rallyEditor_zSnap.snapInPlace(pos, method, rayRaise)`

Applies the chosen method (or the default method if unknown) to pos, in place.

- `pos` (*vec3*) : Position modified in place.
- `method` (*string*) : Method label.
- `rayRaise` (*number|nil*) : Ray raise (raycast method).
- **returns**: vec3 pos.

#### `editor_rallyEditor_zSnap.snapInPlaceWithCurrentMethod(pos, rayRaise)`

snapInPlace with the current method.

- `pos` (*vec3*) : Position modified in place.
- `rayRaise` (*number|nil*) : Ray raise.
- **returns**: vec3 pos.

#### `editor_rallyEditor_zSnap.snapRaycastInPlace(pos, rayRaise)`

Adjusts pos.z by a vertical raycast (editorUtil.vertRaycast).

- `pos` (*vec3*) : Position modified in place.
- `rayRaise` (*number|nil*) : Height the ray is raised by before firing (passed to vertRaycast).
- **returns**: vec3 pos.

#### `editor_rallyEditor_zSnap.snapTerrainHeightInPlace(pos)`

Sets pos.z to the terrain height at (x, y) if available.

- `pos` (*vec3*) : Position modified in place.
- **returns**: vec3 pos.

#### `editor_rallyEditor_zSnap.zSnap(pos, method, rayRaise)`

Like snapInPlace but on a copy of pos.

- `pos` (*vec3*) : Source position (not modified).
- `method` (*string*) : Method label.
- `rayRaise` (*number|nil*) : Ray raise.
- **returns**: vec3 New position.

#### `editor_rallyEditor_zSnap.zSnapWithCurrentMethod(pos)`

zSnap with the current method, on a copy.

- `pos` (*vec3*) : Source position.
- **returns**: vec3 New position.

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultMethod` | string | Default method: methods.getTerrainHeight. |
| `methodValues` | string[] | Ordered list of method labels (for a dropdown). |
| `methods` | table<string, string> | Method names: noSnapping, getTerrainHeight, vertRaycast (values = displayable labels). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/zSnap.lua`.*
