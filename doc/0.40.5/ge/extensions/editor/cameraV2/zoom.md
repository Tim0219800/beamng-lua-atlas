# `editor_cameraV2_zoom`

*File: `lua/ge/extensions/editor/cameraV2/zoom.lua` · VM: Game Engine (GE) · 267 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_cameraV2_zoom`: `extensions.load("editor_cameraV2_zoom")`, then the global `editor_cameraV2_zoom`

Camera V2 zoom: replaces the standard wheel movement with a smoothed dolly along the view center. Each wheel notch changes the distance to the focal point proportionally (in logarithmic space), with exponential smoothing and collision against the terrain and static geometry so as not to pass through the scenery. Reads the preferences camera.cameraV2.zoomMinDistance, zoomMaxDistance, zoomFactorPerNotch and zoomResponse.

## Notes

- The focal point is the point hit by Engine.castRay from the camera forward (range 100000 m); with no hit, it is placed 50 m (clamped between min and max) in front of the camera.
- Max distance hard-coded to 2500 m (clamp on zoomMaxDistance). Response: amount = 1 - exp(-zoomResponse * dt), dt limited to 0.05 s.
- The zoom is cancelled if the right or middle mouse button is held, or if the camera was otherwise moved/rotated in an incompatible way (reconcileCameraTranslation).
- Inconsistency: zoomAnchor always returns terrainOnly = false and onMouseWheel sets terrainOnly = false with a fixed focus; the clampDistanceToTerrainOnly branch and lastZoomUsedTerrainOnly() can therefore never be true in this version.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_cameraV2_zoom.cancel()` | Abandons the zoom in progress. | 254 |
| `editor_cameraV2_zoom.isActive()` | Indicates whether a smoothed zoom is in progress. | 258 |
| `editor_cameraV2_zoom.lastZoomUsedTerrainOnly()` | Indicates whether the last zoom used only terrain collision (see notes: always false in the current code). | 262 |
| `editor_cameraV2_zoom.onMouseWheel(value, fixedFocus)` | Starts or extends a zoom: computes the focal point, the current distance and the target distance (distance * factor^-value, clamped), then stores the state that update() makes converge. Successive notches in the same direction accumulate. *(hook)* | 171 |
| `editor_cameraV2_zoom.update(deltaTime)` | Advances the smoothed zoom by one frame: moves the camera along the direction toward the focus. Ends the zoom (state cancelled) in case of a mouse gesture, an inconsistent pose or a collision. *(internal)* | 234 |

### Parameter details

#### `editor_cameraV2_zoom.isActive()`

Indicates whether a smoothed zoom is in progress.

- **returns**: boolean true if a zoom state exists

#### `editor_cameraV2_zoom.lastZoomUsedTerrainOnly()`

Indicates whether the last zoom used only terrain collision (see notes: always false in the current code).

- **returns**: boolean last terrainOnly

#### `editor_cameraV2_zoom.onMouseWheel(value, fixedFocus)`

Starts or extends a zoom: computes the focal point, the current distance and the target distance (distance * factor^-value, clamped), then stores the state that update() makes converge. Successive notches in the same direction accumulate.

- `value` (*number*) : Wheel notches; > 0 moves closer (zoom in), < 0 moves away. |value| <= 0.0001 is ignored
- `fixedFocus` (*vec3|nil*) : Imposed focal point (if reasonable) instead of the central raycast
- **returns**: boolean false if the value is negligible, true otherwise (event handled, even if validation fails)

#### `editor_cameraV2_zoom.update(deltaTime)`

Advances the smoothed zoom by one frame: moves the camera along the direction toward the focus. Ends the zoom (state cancelled) in case of a mouse gesture, an inconsistent pose or a collision.

- `deltaTime` (*number|nil*) : Seconds; clamped to [0; 0.05], defaults to ui_imgui.GetIO().DeltaTime

## Calls into the engine (C++)

- `Engine.` `castRay`
- `ui_imgui.` `GetIO`, `IsMouseDown`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/cameraV2/zoom.lua`.*
