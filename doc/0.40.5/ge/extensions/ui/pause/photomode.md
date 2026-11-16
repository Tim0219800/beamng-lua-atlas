# `ui_pause_photomode`

*File: `lua/ge/extensions/ui/pause/photomode.lua` · VM: Game Engine (GE) · 109 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_pause_photomode`: `extensions.load("ui_pause_photomode")`, then the global `ui_pause_photomode`

Facade of the photo mode integrated into the pause menu. It contains no logic: it loads the eight ui_photomode_* modules (session, camera, scene, effects, advancedRender, capture, preview, presets) and redirects about sixty functions to them via a FORWARDED_FUNCTIONS table. It also relays the engine hooks (capture metadata, pre-render, update, end of capture) to the right submodules.

## Example

```lua
ui_pause_photomode.requestScreenshot(...)  -- calls ui_photomode_capture.requestScreenshot
```

## Notes

- The redirected functions are generated dynamically at load time (M[name] = function(...) return _G[target][name](...) end); they therefore do not appear in the .md's static list. Examples: getCameraState, setCameraFov, setEffectsState, requestScreenshot, listPresets, applyPreset, beginPhotomodeSession, endPhotomodeSession, getRoutePayload. Their signature is that of the target function.
- The target submodule of each function: session (session/panel/debug states, routes), camera (camera, camera bookmarks, FOV, speed, roll, exposure), scene (scene, environment bookmarks), effects, advancedRender, capture (captures, resolution), preview (preview, sharing), presets (presets).

**Dependencies (loaded first):** `ui_photomode_session`, `ui_photomode_camera`, `ui_photomode_scene`, `ui_photomode_effects`, `ui_photomode_advancedRender`, `ui_photomode_capture`, `ui_photomode_preview`, `ui_photomode_presets`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_pause_photomode.onCollectScreenshotMetadata(...)` | Hook called when collecting a capture's metadata; delegates to ui_photomode_preview.collectScreenshotMetadata. *(internal)* *(hook)* | 84 |
| `ui_pause_photomode.onExtensionLoaded(...)` | Load hook; delegates to ui_photomode_session.handleExtensionLoaded. *(internal)* *(hook)* | 100 |
| `ui_pause_photomode.onExtensionUnloaded(...)` | Unload hook; delegates to ui_photomode_session.handleExtensionUnloaded. *(internal)* *(hook)* | 104 |
| `ui_pause_photomode.onPreRender(...)` | Hook called before rendering; delegates to ui_photomode_capture.handlePreRender. *(internal)* *(hook)* | 88 |
| `ui_pause_photomode.onScreenshotAllDone(...)` | Hook called when all requested captures are finished; delegates to ui_photomode_capture.onScreenshotAllDone. *(internal)* *(hook)* | 96 |
| `ui_pause_photomode.onUpdate(...)` | Hook called every frame; delegates to ui_photomode_preview.handleUpdate. *(internal)* *(hook)* | 92 |

### Parameter details

#### `ui_pause_photomode.onCollectScreenshotMetadata(...)`

Hook called when collecting a capture's metadata; delegates to ui_photomode_preview.collectScreenshotMetadata.

- `...` (*any*) : Arguments passed as is.
- **returns**: any Value returned by the submodule.

#### `ui_pause_photomode.onExtensionLoaded(...)`

Load hook; delegates to ui_photomode_session.handleExtensionLoaded.

- `...` (*any*) : Arguments passed on.

#### `ui_pause_photomode.onExtensionUnloaded(...)`

Unload hook; delegates to ui_photomode_session.handleExtensionUnloaded.

- `...` (*any*) : Arguments passed on.

#### `ui_pause_photomode.onPreRender(...)`

Hook called before rendering; delegates to ui_photomode_capture.handlePreRender.

- `...` (*any*) : Arguments passed on.

#### `ui_pause_photomode.onScreenshotAllDone(...)`

Hook called when all requested captures are finished; delegates to ui_photomode_capture.onScreenshotAllDone.

- `...` (*any*) : Arguments passed on.

#### `ui_pause_photomode.onUpdate(...)`

Hook called every frame; delegates to ui_photomode_preview.handleUpdate.

- `...` (*any*) : Arguments passed on.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | List of the ui_photomode_* extensions loaded before this module. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/pause/photomode.lua`.*
