# `core_cameraModes_observer`

*File: `lua/ge/extensions/core/cameraModes/observer.lua` · VM: Game Engine (GE) · 125 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/observer")` (file under extensions/ but not a regular extension)

Global "observer" camera for scenarios: sits on a level camera object (named by cameraName, optional fields Speed, blendSpeed, PositionMove, targetFOV, showApps) and looks at the position of the tracked vehicle (or of a targetOverride object). The FOV is targetFOV, otherwise 90 - 3 * distance (min 10). If the object has a numeric Speed field, sets simTimeAuthority to 1/Speed (slow motion) and hides the UI apps. Returns a constructor.

## Notes

- setCamera has the signature (cam, targetOverride); the extracted page only listed targetOverride (inferred from code). In setCamera/setCustomData, cam is a C++ object whose 'name' field is read via getField.

## Class `C`

Observer camera.

The module returns a constructor: `local obj = require("core_cameraModes_observer")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init()` | isGlobal = true, hidden = true, no associated camera object. | 8 |
| `C:onCameraChanged(focused)` | Hook: when this mode takes focus, sends onCameraNameChanged to the UI and the hook onCameraModeChanged('observer'); on losing it, reloads the 'scenario' apps layout and forgets the camera. | 98 |
| `C:onScenarioChange(scenario)` | Hook: forgets the camera if the scenario disappears. | 111 |
| `C:onScenarioRestarted()` | Hook: forgets the associated camera. | 108 |
| `C:setCamera(cam, targetOverride)` | Chooses the camera object (by its name), restarts the blend and restores the normal simulation speed. | 84 |
| `C:setCustomData(customData)` | Called by setGlobalCameraByName when switching to this mode: calls setCamera(customData.cam, customData.targetOverride). | 80 |
| `C:update(data)` | Computes position, rotation and FOV from the camera object; position blend toward PositionMove at speed blendSpeed (50). | 17 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onCameraModeChanged` — listened to by 3 module(s)

**UI events (guihooks.trigger):** `ShowApps`, `appContainer:loadLayoutByType`, `onCameraNameChanged`

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/observer.lua`.*
