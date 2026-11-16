# `ui_photomode_flash`

*File: `lua/ge/extensions/ui/photomode/flash.lua` · VM: Game Engine (GE) · 164 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_photomode_flash`: `extensions.load("ui_photomode_flash")`, then the global `ui_photomode_flash`

Photo mode flash settings. Keeps the flash state in memory (enabled, fire on capture, intensity, angle, hue, saturation) and passes it to the util/photomodeFlash extension, which it loads on demand. Acts as a facade for the photo mode UI panel and for the capture module (ui_photomode_capture) which triggers captures with flash.

## Example

```lua
ui_photomode_flash.applyStatePatch({enabled = true, intensity = 30000})
ui_photomode_flash.applyRuntimeSettings()
```

## Notes

- Default values: enabled=false, fireOnCapture=false, intensity=25000, outerAngle=55, hue=0, saturation=0.
- applyStatePatch only changes the Lua state; applyRuntimeSettings (or applyPresetState) must be called for util/photomodeFlash to actually be updated. Numeric values are not validated.
- Functions that fail return false plus a reason: extensions_unavailable, flash_unavailable, flash_apply_failed, screenshot_request_failed.
- getCaptureUiHoldFrames is 5 only if the flash is enabled and fires on capture, otherwise 0.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_photomode_flash.applyPresetState(flashState)` | Applies a preset state (merge then applyRuntimeSettings). Does nothing if the argument is not a table. | 95 |
| `ui_photomode_flash.applyRuntimeSettings()` | If the flash is disabled, turns off util/photomodeFlash (enable(false)). Otherwise loads this extension and calls applyFromUi with the current settings. | 103 |
| `ui_photomode_flash.applyStatePatch(partialState)` | Merges into the state the fields present in partialState (enabled and fireOnCapture converted to booleans). Does not act on the render engine. | 82 |
| `ui_photomode_flash.buildState()` | Returns a copy of the flash state: enabled, fireOnCapture, intensity, outerAngle, hue, saturation. | 63 |
| `ui_photomode_flash.captureDefaultPresetState()` | Returns a flash state with default values, without modifying the current state. | 78 |
| `ui_photomode_flash.capturePresetState()` | Flash state to save in a preset (same as buildState). | 74 |
| `ui_photomode_flash.getCaptureUiHoldFrames()` | Number of frames during which to keep the UI hidden/frozen during a capture with flash: 5 if flash enabled and fireOnCapture, otherwise 0. | 147 |
| `ui_photomode_flash.resetSettings()` | Turns off the flash on the engine side then resets the Lua settings to default values. | 154 |
| `ui_photomode_flash.restoreRuntimeState()` | Turns off the flash on the engine side (util/photomodeFlash.enable(false)) if it is loaded, without touching the Lua settings. | 159 |
| `ui_photomode_flash.runCapture(kind, ...)` | Delegates a capture to util/photomodeFlash.runCapture(kind, ...) with the call protected by pcall. | 130 |

### Parameter details

#### `ui_photomode_flash.applyPresetState(flashState)`

Applies a preset state (merge then applyRuntimeSettings). Does nothing if the argument is not a table.

- `flashState` (*table*) : Flash state from a preset
- **returns**: boolean success
- **returns**: string|nil failure reason

#### `ui_photomode_flash.applyRuntimeSettings()`

If the flash is disabled, turns off util/photomodeFlash (enable(false)). Otherwise loads this extension and calls applyFromUi with the current settings.

- **returns**: boolean success
- **returns**: string|nil failure reason (flash_unavailable, flash_apply_failed...)

#### `ui_photomode_flash.applyStatePatch(partialState)`

Merges into the state the fields present in partialState (enabled and fireOnCapture converted to booleans). Does not act on the render engine.

- `partialState` (*table*) : Fields to change; any other type is ignored
- **returns**: boolean always true

#### `ui_photomode_flash.buildState()`

Returns a copy of the flash state: enabled, fireOnCapture, intensity, outerAngle, hue, saturation.

- **returns**: table Serializable flash state

#### `ui_photomode_flash.captureDefaultPresetState()`

Returns a flash state with default values, without modifying the current state.

- **returns**: table Default values

#### `ui_photomode_flash.capturePresetState()`

Flash state to save in a preset (same as buildState).

- **returns**: table Current state

#### `ui_photomode_flash.getCaptureUiHoldFrames()`

Number of frames during which to keep the UI hidden/frozen during a capture with flash: 5 if flash enabled and fireOnCapture, otherwise 0.

- **returns**: integer 0 or 5

#### `ui_photomode_flash.runCapture(kind, ...)`

Delegates a capture to util/photomodeFlash.runCapture(kind, ...) with the call protected by pcall.

- `kind` (*any*) : Capture type passed as is to util/photomodeFlash (inferred from code)
- `...` (*any*) : Additional arguments passed as is
- **returns**: boolean true if the capture was requested
- **returns**: string|nil failure reason (screenshot_request_failed by default)

**Loads extensions:** `util/photomodeFlash`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/photomode/flash.lua`.*
