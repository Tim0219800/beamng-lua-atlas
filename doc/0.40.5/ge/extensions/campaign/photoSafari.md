# `campaign_photoSafari`

*File: `lua/ge/extensions/campaign/photoSafari.lua` · VM: Game Engine (GE) · 188 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `campaign_photoSafari`: `extensions.load("campaign_photoSafari")`, then the global `campaign_photoSafari`

Logic of the campaign's "photo safari" mission: the player must photograph places. On acceptance, a JSON file lists the places (keys = trigger names) with their hints, the target object (objectName) and the closeToPhoto trigger. BeamNG triggers (onBeamNGTrigger) unlock hints and open photo mode; takepiccheck, called by photomode.js, checks that the target is entirely within the camera's field of view and close enough.

## Notes

- The hint triggers are hardcoded: prototype_2_trigger_CD, prototype_2_shady_trigger, prototype_2_ranger_trigger, prototype_2_stuntman_trigger, prototype_2_police_trigger. The special place "on_site" uses the trigger "on_site_obj" and the object "camtrig".
- Values read in the field M: accept, photomodeOpen, location, targetObj, closeToPhoto, cameraDistanceToObject, msg, showhint, count, description, foundLocation, photoSafarimissions, photoSafariData.
- Bug: in onBeamNGTrigger, logTag is not defined in this file (nil) and the error message reads M.photoSafariData.objectName instead of the place's objectName; the message will therefore be wrong or cause a concatenation error.
- For a photo outside the "on_site" place, the photo is valid if the object's bounding box is entirely within the frustum and if camdis <= M.cameraDistanceToObject.
- For "on_site", on_siteLocation requires the camera to be within 5 m of the object "camtrig", and the vehicle to be in the zone (trigger on_site_obj).
- takepiccheck displays the message via guihooks.trigger('ScenarioFlashMessage', {{msg, 2}}), returns to the menu (ui_router.navigate('menu')) and resumes the simulation (simTimeAuthority.pause(false)).

## Functions

| Function | Description | Line |
|---|---|---|
| `campaign_photoSafari.missionaccepted(file)` | Loads the mission's JSON file (jsonReadFile), sets accept to true, resets hints, found and seen places, and stores each place's hints. Does nothing if the file does not exist. | 22 |
| `campaign_photoSafari.onBeamNGTrigger(data)` | Hook called when a trigger is crossed. Ignores everything except the player's vehicle. On entering a hint trigger: unlocks the next hint of each place not yet found; in a place trigger: stores location/targetObj and opens photo mode; in closeToPhoto: computes the camera-object distance. On exit, closes photo mode or closeToPhoto. *(internal)* *(hook)* | 40 |
| `campaign_photoSafari.takepiccheck()` | Checks the photo: refuses if the player is not close enough, otherwise tests the camera's distance to the object and that the object's bounding box is entirely within the frustum (Engine.sceneGetCameraFrustum). On success, marks the place as found. Displays the result message. | 144 |

### Parameter details

#### `campaign_photoSafari.missionaccepted(file)`

Loads the mission's JSON file (jsonReadFile), sets accept to true, resets hints, found and seen places, and stores each place's hints. Does nothing if the file does not exist.

- `file` (*string*) : Path of the photo safari mission's JSON.

#### `campaign_photoSafari.onBeamNGTrigger(data)`

Hook called when a trigger is crossed. Ignores everything except the player's vehicle. On entering a hint trigger: unlocks the next hint of each place not yet found; in a place trigger: stores location/targetObj and opens photo mode; in closeToPhoto: computes the camera-object distance. On exit, closes photo mode or closeToPhoto.

- `data` (*table*) : Trigger data: subjectID, event ('enter'/'exit'), triggerName.

#### `campaign_photoSafari.takepiccheck()`

Checks the photo: refuses if the player is not close enough, otherwise tests the camera's distance to the object and that the object's bounding box is entirely within the frustum (Engine.sceneGetCameraFrustum). On success, marks the place as found. Displays the result message.

- **returns**: boolean|nil true if the photo is valid, false otherwise, nil if the place is already found or if the player is too far.

## Fields

| Field | Type | Description |
|---|---|---|
| `accept` | boolean | True when the mission has been accepted and its JSON loaded. |
| `photomodeOpen` | boolean | True when the player is in a place's trigger and can take the photo. |
| `targetObj` | string|nil | Name of the scene object to photograph. |

**UI events (guihooks.trigger):** `ScenarioFlashMessage`

## Calls into the engine (C++)

- `Engine.` `sceneGetCameraFrustum`
- `FS:` `fileExists`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/campaign/photoSafari.lua`.*
