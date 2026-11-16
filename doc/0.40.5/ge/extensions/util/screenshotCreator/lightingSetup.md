# `util_screenshotCreator_lightingSetup`

*File: `lua/ge/extensions/util/screenshotCreator/lightingSetup.lua` · VM: Game Engine (GE) · 939 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator_lightingSetup`: `extensions.load("util_screenshotCreator_lightingSetup")`, then the global `util_screenshotCreator_lightingSetup`

Sets up the studio lighting for vehicle thumbnails and restores it afterwards. It finds in the scene (scenetree) the objects marked by the dynamic field thumbnailRole: SpotLights (roles key, fill, rim, top, groundFill, horizonFill) and "lightplane" TSStatics serving as reflection cards (horizonCard, shoulderCard, topCard, cameraCard). adjust() places them around the vehicle based on the camera and the bounding box, sets their intensity in lux, applies an exposure correction, adjusts the SSAO, shows or hides the parking markup (field thumbnailLayer = parkingMarkup) and hides the vehicle's occupants. restore() undoes everything (transforms, light fields, visibility).

## Notes

- adjust() starts with restore(); it returns false (and restores) on the slightest error. Calling restore() after the capture is therefore mandatory (job.lua does it).
- The settings come from util_screenshotCreator_settings.getLightingRig(): enabled, roles, exposureCorrection, ssaoMode, parkingMarkup.
- If the rig is disabled, only the existing spotlights near the vehicle are adjusted (spot planes), plus the cards, the SSAO, the markup and the occupants.
- An exposure correction targets 850 lx in total on the visible faces of the vehicle, with a gain clamped between 0.5 and 2; only key, fill, rim and top are modified.
- Each role can be taken by only one object: duplicates or objects of the wrong class are ignored with a warning in the log (tag screenshotCreatorLighting).
- selfCheck() runs once at the first adjust; a failed assertion would raise a Lua error.

**Dependencies (loaded first):** `util_screenshotCreator_settings`, `util_screenshotCreator_vehicleSetup`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator_lightingSetup.adjust(vehicle, camera)` | Sets up the capture lighting for this vehicle and this camera: rig spotlights, reflection cards, SSAO, parking markup, occupant hiding, and enabling the cards' render mask on the main view. | 876 |
| `util_screenshotCreator_lightingSetup.clearMarkupTags()` | Clears the thumbnailLayer field of all parking markup objects. | 719 |
| `util_screenshotCreator_lightingSetup.getMarkupCount()` | Counts the scene objects marked thumbnailLayer = parkingMarkup. | 714 |
| `util_screenshotCreator_lightingSetup.hideReflectionCardsForTechCapture()` | Temporarily hides the active reflection cards (setHidden and setRenderEnabled(false)) for a "Tech" capture. To be followed by restoreReflectionCardsAfterTechCapture. | 295 |
| `util_screenshotCreator_lightingSetup.restore()` | Undoes all the changes made by adjust: view mask, SSAO, markup, occupants, reflection cards and lights (transform and fields intensity, innerAngle, outerAngle, range, castShadows). Unrestored states are kept for a new attempt. | 334 |
| `util_screenshotCreator_lightingSetup.restoreReflectionCardsAfterTechCapture()` | Restores the original visibility of the cards hidden by hideReflectionCardsForTechCapture. | 260 |
| `util_screenshotCreator_lightingSetup.selfCheck()` | Internal assertion-based test on the card geometry (direction, transform, rear side, rotation around the vertical axis). *(internal)* | 548 |

### Parameter details

#### `util_screenshotCreator_lightingSetup.adjust(vehicle, camera)`

Sets up the capture lighting for this vehicle and this camera: rig spotlights, reflection cards, SSAO, parking markup, occupant hiding, and enabling the cards' render mask on the main view.

- `vehicle` (*table*) : Vehicle object to photograph.
- `camera` (*table*) : Resolved camera: {pos = vec3, rot = quat, ...} (framing result).
- **returns**: boolean true if everything was applied, false on failure (the state is then restored).

#### `util_screenshotCreator_lightingSetup.clearMarkupTags()`

Clears the thumbnailLayer field of all parking markup objects.

- **returns**: integer Number of objects whose tag was cleared.

#### `util_screenshotCreator_lightingSetup.getMarkupCount()`

Counts the scene objects marked thumbnailLayer = parkingMarkup.

- **returns**: integer Number of markup objects.

#### `util_screenshotCreator_lightingSetup.hideReflectionCardsForTechCapture()`

Temporarily hides the active reflection cards (setHidden and setRenderEnabled(false)) for a "Tech" capture. To be followed by restoreReflectionCardsAfterTechCapture.

- **returns**: boolean false if a hide is already in progress (nested call) or on error (visibility restored).

#### `util_screenshotCreator_lightingSetup.restore()`

Undoes all the changes made by adjust: view mask, SSAO, markup, occupants, reflection cards and lights (transform and fields intensity, innerAngle, outerAngle, range, castShadows). Unrestored states are kept for a new attempt.

- **returns**: boolean true if everything was restored exactly.

#### `util_screenshotCreator_lightingSetup.restoreReflectionCardsAfterTechCapture()`

Restores the original visibility of the cards hidden by hideReflectionCardsForTechCapture.

- **returns**: boolean true if all cards have recovered their state.

#### `util_screenshotCreator_lightingSetup.selfCheck()`

Internal assertion-based test on the card geometry (direction, transform, rear side, rotation around the vertical axis).

- **returns**: boolean Always true (otherwise an assertion fails).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before: util_screenshotCreator_settings and util_screenshotCreator_vehicleSetup. |
| `onClientEndMission` | function | Alias of M.restore: restores the lighting at the end of the level. |
| `onExit` | function | Alias of M.restore: restores the lighting when the game closes. |
| `onExtensionUnloaded` | function | Alias of M.restore: restores the lighting when the extension is unloaded. |

## Calls into the engine (C++)

- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`, `getAllObjects`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator/lightingSetup.lua`.*
