# `editor_ezObjectSelect_selectionGeometry`

*File: `lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua` · VM: Game Engine (GE) · 473 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_selectionGeometry`: `extensions.load("editor_ezObjectSelect_selectionGeometry")`, then the global `editor_ezObjectSelect_selectionGeometry`

Selection geometry of the Easy Select tool: box validation, computation of an object's 8 world corners (oriented box via getObjBox + transform + scale, world-aligned box for vehicles or as a fallback), camera context, bounds signatures to detect that an object has moved, and creation of screen-projected "proxies" (convex hull polygon, area, centroid, distances, volume). These proxies are used to choose the object under the mouse.

## Notes

- Bounds types: "vehicleWorldAabb" (BeamNGVehicle), "oriented", "worldAabb". Proxy creation failure reasons: invalidBounds, degenerateBounds, outsideNearPlane, degenerateProjection.
- createCameraContext computes rangeOrigin: impact point of a 5000 m ray in front of the camera; otherwise the terrain height under the camera; otherwise the impact of a downward ray. A proxy's distances (cameraDistance) are measured from this point.
- The screen coordinates of the polygons are relative to the viewport (0..width, 0..height), whereas modalOperatorCommon.projectToScreen adds viewportX/Y.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_selectionGeometry.boundsSignaturesEqual(first, second)` | Compares two signatures element by element. | 91 |
| `editor_ezObjectSelect_selectionGeometry.createCameraContext()` | Captures the editor camera (core_camera position, quat, FOV) and the main imgui viewport. | 99 |
| `editor_ezObjectSelect_selectionGeometry.createProjectedProxy(obj, camera, boundsSignature)` | Builds an object's proxy for the camera: screen polygon of the convex hull of the corners (clipped at the near plane), area, centroid, camera/view distances, volume, oriented box. | 414 |
| `editor_ezObjectSelect_selectionGeometry.createProxy(obj, camera, mousePosition, rayOrigin, rayDirection)` | Shortcut: createProjectedProxy then updateCursorMetrics then updateRayEntry. | 464 |
| `editor_ezObjectSelect_selectionGeometry.getBoundsSignature(obj, result)` | Returns a list of numbers describing the current bounds of an object (type, transform, scale, box). Used to compare two states with boundsSignaturesEqual. The result table is reused if provided. | 55 |
| `editor_ezObjectSelect_selectionGeometry.getObjectVolume(obj)` | Box volume (extents x absolute scale for oriented objects). | 185 |
| `editor_ezObjectSelect_selectionGeometry.getWorldCorners(obj)` | The 8 world corners of an object's box. | 181 |
| `editor_ezObjectSelect_selectionGeometry.updateCursorMetrics(proxy, mousePosition)` | Adds to the proxy cursorDistance (distance in pixels from the cursor to the polygon, 0 if inside) and centerBias (distance to the centroid divided by the square root of the area). | 449 |
| `editor_ezObjectSelect_selectionGeometry.updateRayEntry(proxy, rayOrigin, rayDirection)` | Adds proxy.rayEntry: entry distance of the ray into the oriented box (math.huge if it misses it or without a ray). | 458 |
| `editor_ezObjectSelect_selectionGeometry.validBox(box)` | Tests that a box has finite minExtents/maxExtents (\|v\| < 1e10, no NaN) and min <= max on each axis. | 23 |

### Parameter details

#### `editor_ezObjectSelect_selectionGeometry.boundsSignaturesEqual(first, second)`

Compares two signatures element by element.

- `first` (*table|nil*) : 
- `second` (*table|nil*) : 
- **returns**: boolean false if one is nil or of different length

#### `editor_ezObjectSelect_selectionGeometry.createCameraContext()`

Captures the editor camera (core_camera position, quat, FOV) and the main imgui viewport.

- **returns**: table|nil {pos, rangeOrigin, right, forward, up, halfTan, aspect, width, height, viewportX, viewportY, nearDistance} or nil if data is missing or the viewport is empty

#### `editor_ezObjectSelect_selectionGeometry.createProjectedProxy(obj, camera, boundsSignature)`

Builds an object's proxy for the camera: screen polygon of the convex hull of the corners (clipped at the near plane), area, centroid, camera/view distances, volume, oriented box.

- `obj` (*userdata*) : Scene object
- `camera` (*table*) : Context from createCameraContext
- `boundsSignature` (*table|nil*) : Signature already computed (otherwise computed)
- **returns**: table|nil {source, sourceId, boundsType, worldCorners, polygon, area, centroid, cameraDistance, viewDistance, volume, cameraInside, orientedBox, boundsSignature}
- **returns**: string|nil failure reason if nil

#### `editor_ezObjectSelect_selectionGeometry.createProxy(obj, camera, mousePosition, rayOrigin, rayDirection)`

Shortcut: createProjectedProxy then updateCursorMetrics then updateRayEntry.

- `obj` (*userdata*) : 
- `camera` (*table*) : 
- `mousePosition` (*table*) : {x, y}
- `rayOrigin` (*vec3|nil*) : 
- `rayDirection` (*vec3|nil*) : 
- **returns**: table|nil proxy
- **returns**: string|nil failure reason

#### `editor_ezObjectSelect_selectionGeometry.getBoundsSignature(obj, result)`

Returns a list of numbers describing the current bounds of an object (type, transform, scale, box). Used to compare two states with boundsSignaturesEqual. The result table is reused if provided.

- `obj` (*userdata*) : Scene object
- `result` (*table|nil*) : Table to fill (reused)
- **returns**: table|nil signature, or nil if no valid box

#### `editor_ezObjectSelect_selectionGeometry.getObjectVolume(obj)`

Box volume (extents x absolute scale for oriented objects).

- `obj` (*userdata|nil*) : Scene object
- **returns**: number|nil volume in m3 (world units), nil if invalid or not finite

#### `editor_ezObjectSelect_selectionGeometry.getWorldCorners(obj)`

The 8 world corners of an object's box.

- `obj` (*userdata*) : Scene object
- **returns**: table|nil list of 8 vec3 (or nil)
- **returns**: string bounds type, or "invalidBounds"

#### `editor_ezObjectSelect_selectionGeometry.updateCursorMetrics(proxy, mousePosition)`

Adds to the proxy cursorDistance (distance in pixels from the cursor to the polygon, 0 if inside) and centerBias (distance to the centroid divided by the square root of the area).

- `proxy` (*table*) : Proxy
- `mousePosition` (*table*) : {x, y} relative to the viewport
- **returns**: table the same proxy

#### `editor_ezObjectSelect_selectionGeometry.updateRayEntry(proxy, rayOrigin, rayDirection)`

Adds proxy.rayEntry: entry distance of the ray into the oriented box (math.huge if it misses it or without a ray).

- `proxy` (*table*) : Proxy
- `rayOrigin` (*vec3|nil*) : 
- `rayDirection` (*vec3|nil*) : 
- **returns**: table the same proxy

#### `editor_ezObjectSelect_selectionGeometry.validBox(box)`

Tests that a box has finite minExtents/maxExtents (|v| < 1e10, no NaN) and min <= max on each axis.

- `box` (*table|nil*) : Box with minExtents and maxExtents
- **returns**: boolean 

## Calls into the engine (C++)

- `Engine.` `castRay`, `sceneGetCameraFrustum`
- `obj:` `getID`, `getObjBox`, `getScale`, `getTransform`, `getWorldBox`, `isSubClassOf`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua`.*
