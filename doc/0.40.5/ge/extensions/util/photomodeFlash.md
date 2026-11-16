# `util_photomodeFlash`

*File: `lua/ge/extensions/util/photomodeFlash.lua` · VM: Game Engine (GE) · 407 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_photomodeFlash`: `extensions.load("util_photomodeFlash")`, then the global `util_photomodeFlash`

Photo mode flash: creates a spotlight (SpotLight, with shadows, not saved in the level) attached to the camera during photo mode, aimed at the target point (raycast from the camera, otherwise the DOF focus distance). Two modes: "always" (continuously on) and "pulse" (on only during the capture). In pulse mode, runCapture waits 2 warm-up frames, triggers the capture via the screenshot module, then turns the flash off on receiving onScreenshotAllDone (or after 60 fallback frames). The photo mode UI calls applyFromUi.

## Example

```lua
extensions.util_photomodeFlash.applyFromUi(true, true, 25000, 55, 0, 0)
extensions.util_photomodeFlash.runCapture('takeScreenShot')
```

## Notes

- The spotlight is offset from the camera: 0.12 m to the right, 0.06 m up and 0.05 m forward; range 40 m; shadow map 1024.
- The flash only applies if photo mode is open (global variable photoModeOpen or ui_photomode_shared.S.photoModeOpen) and if the active camera is not "path".
- Capture types accepted by runCapture (kind): takeScreenShot, takeBigScreenShot, takeHugeScreenShot, takeCustomScreenShot, takeMotionBlurScreenShot, publish, steam. They delegate to the screenshot module; "steam" does not go through the capture-end hook.
- runCapture without an active flash simply starts the capture. In pulse mode, a second request during a pulse is refused (false, "capture_busy").
- The hue, saturation and outerAngle values are rounded to integers; the intensity is only clamped.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_photomodeFlash.applyFromUi(enabled, fireOnCapture, intensity, outerAngle, hue, saturation)` | Applies the settings coming from the photo mode UI: clamps the values then enables the flash (or disables it if enabled is not true). | 330 |
| `util_photomodeFlash.enable(en)` | Enables or disables the flash: on activation creates the SpotLight in MissionGroup and aims it; on deactivation removes it. Cancels any pending pulse. | 268 |
| `util_photomodeFlash.onExtensionUnloaded()` | Hook called on unload: disables the flash and removes the spotlight. *(internal)* *(hook)* | 402 |
| `util_photomodeFlash.onPreRender(dtReal, dtSim, dtRaw)` | Hook called every frame before rendering: repositions the spotlight on the camera and advances the pulse state machine (warm-up, capture, cleanup, fallback delay). *(internal)* *(hook)* | 346 |
| `util_photomodeFlash.onScreenshotAllDone()` | Hook called when all in-progress screenshots are done: starts the cleanup (turning the flash off) of a pending pulse. Ignored if photo mode is not open. *(internal)* *(hook)* | 394 |
| `util_photomodeFlash.runCapture(kind, ...)` | Triggers a screenshot taking the flash into account: direct if the flash is inactive or in always mode, with a light pulse in pulse mode. | 291 |

### Parameter details

#### `util_photomodeFlash.applyFromUi(enabled, fireOnCapture, intensity, outerAngle, hue, saturation)`

Applies the settings coming from the photo mode UI: clamps the values then enables the flash (or disables it if enabled is not true).

- `enabled` (*boolean*) : Enables the flash (disables otherwise)
- `fireOnCapture` (*boolean*) : true for pulse mode, otherwise always
- `intensity` (*number*) : Intensity (0 to 1,000,000)
- `outerAngle` (*number*) : Outer angle in degrees (1 to 179)
- `hue` (*number*) : Hue in degrees (0 to 360)
- `saturation` (*number*) : Saturation in percent (0 to 100)

#### `util_photomodeFlash.enable(en)`

Enables or disables the flash: on activation creates the SpotLight in MissionGroup and aims it; on deactivation removes it. Cancels any pending pulse.

- `en` (*boolean*) : true to enable (any other value disables)

#### `util_photomodeFlash.onPreRender(dtReal, dtSim, dtRaw)`

Hook called every frame before rendering: repositions the spotlight on the camera and advances the pulse state machine (warm-up, capture, cleanup, fallback delay).

- `dtReal` (*number*) : Real-time delta (unused)
- `dtSim` (*number*) : Simulation time delta (unused)
- `dtRaw` (*number*) : Raw time delta (unused)

#### `util_photomodeFlash.runCapture(kind, ...)`

Triggers a screenshot taking the flash into account: direct if the flash is inactive or in always mode, with a light pulse in pulse mode.

- `kind` (*string*) : Capture type (see notes)
- `...` (*any*) : Arguments passed to the corresponding screenshot module function (up to 6 depending on the type)
- **returns**: boolean true if the capture is started or scheduled
- **returns**: string|nil Error code: "capture_busy" or "screenshot_request_failed"

## Fields

| Field | Type | Description |
|---|---|---|
| `capturePulseActive` | boolean | true during a flash pulse tied to a capture |
| `enabled` | boolean | true if the flash is active (the spotlight exists) |
| `hue` | integer | Color hue in degrees, 0 to 360 (default 0) |
| `intensity` | number | Spotlight intensity (default 25000, from 0 to 1,000,000) |
| `mode` | string | "always" (continuous) or "pulse" (only during a capture) |
| `outerAngle` | integer | Outer cone angle in degrees (default 55, from 1 to 179) |
| `saturation` | integer | Saturation in percent, 0 to 100 (default 0: white light) |

## Calls into the engine (C++)

- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/photomodeFlash.lua`.*
