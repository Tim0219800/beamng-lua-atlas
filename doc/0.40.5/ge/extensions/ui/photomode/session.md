# `ui_photomode_session`

*File: `lua/ge/extensions/ui/photomode/session.lua` · VM: Game Engine (GE) · 648 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_photomode_session`: `extensions.load("ui_photomode_session")`, then the global `ui_photomode_session`

Photo mode session orchestrator. It opens and closes the session: simulation pause (pause request "ui_pause_photomode"), solo split-screen view, capture then restoration of camera / scene / effects / advanced render / node grabber states, session free camera, global flag photoModeOpen. It also handles route profiles (pause, garage), the persistent session (setting photomodePersistentSession), the panel surface mode, exit confirmation and the payload (route payload) sent to the Vue UI.

## Example

```lua
ui_photomode_session.beginPhotomodeSession({profile = "garage"})
-- ... settings via ui_photomode_scene / _camera / _effects ...
ui_photomode_session.endPhotomodeSession()
```

## Notes

- Profiles: "pause" (default, no control hidden) and "garage" (hides timeOfDay and cloudCover of the scene, motionBlur of the effects, terrainLodScale/grassDensity/cloudQuality of advanced render, and disables the motionBlurCapture feature). An unknown profile falls back to "pause". This is only a UI visibility policy: direct Lua calls are not blocked.
- Order of beginPhotomodeSession: profile, pause, solo view, refresh of capture defaults, captureRestoreState (camera, scene, effects, advanced render), captureNodeGrabberRestoreState, default presets, free camera, suppressions (photoModeOpen = true), sessionActive = true, then restoration of the persistent state if enabled. endPhotomodeSession does the reverse and puts the profile back to "pause".
- The "Prioritize Resolution" quality application (applyPlatformPhotomodeQualityMode) is commented out in begin/end: it is not used in this version.
- The exit confirmation shows a dialog via guihooks.trigger("showConfirmationDialog", ...) with the Lua callbacks ui_photomode_session.cancelExitConfirmation() and confirmExit(); confirmExit then navigates to the requested route via extensions.ui_router.navigate with a one-time bypass of the confirmation.
- Game bug: isDebugEnabled and setDebugEnabled of this module read/write a global variable isDebugEnabled, not declared in this file, and not the state of ui_photomode_shared; isDebugEnabled() therefore returns nil until setDebugEnabled has been called, and logDebug of ui_photomode_shared is not affected.
- setHiddenCameraInputEnabled pushes/pops the "PhotoModeCamera" action map (player 0).

**Dependencies (loaded first):** `ui_photomode_shared`, `ui_photomode_camera`, `ui_photomode_scene`, `ui_photomode_flash`, `ui_photomode_effects`, `ui_photomode_advancedRender`, `ui_photomode_capture`, `ui_photomode_presets`, `core_settings_graphic`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_photomode_session.beginPhotomodeSession(options)` | Starts the photo mode session (pause, free camera, restore states, world suppressions). Ignored if a session is already active. | 540 |
| `ui_photomode_session.buildCapabilities()` | Computes the capabilities displayed by the UI: active profile, hidden controls, sections, features (upload, steam, openShareUrl, overlays, resolutionPresets, motionBlurCapture, advancedRenderTuning, developerTools...), build (shipping/developer) and advanced render state. The active profile's features take precedence. | 271 |
| `ui_photomode_session.cancelExitConfirmation()` | Cancels the pending exit (the dialog's "back" button) and re-enables the hidden camera input if it was. | 484 |
| `ui_photomode_session.confirmExit()` | Confirms the exit: enables the confirmation bypass then navigates to the stored route with extensions.ui_router.navigate. | 495 |
| `ui_photomode_session.consumeExitConfirmationBypass()` | Reads and consumes the exit confirmation bypass flag (used by the photo mode route guard). | 434 |
| `ui_photomode_session.endPhotomodeSession()` | Ends the session: ends the capture in progress, saves the persistent state if enabled, restores scene, effects, advanced render, camera, node grabber, solo view, suppressions and pause, then resets the temporary presets. Does nothing if everything is already inactive. | 578 |
| `ui_photomode_session.getPanelSurfaceMode()` | Returns the panel surface mode, "hidden" or "settings" ("hidden" if the stored value is invalid). | 415 |
| `ui_photomode_session.getRoutePayload()` | Builds the payload sent to the UI: contractVersion, sessionActive, capabilities, capture, persistentSession, panelSurfaceMode, mediaActions, resolutionPresets, suppressions. | 362 |
| `ui_photomode_session.handleExtensionLoaded()` | Called when the extension is loaded: clears the bookmarks (camera, relative camera, environment, advanced render) and resets the local session state. *(internal)* | 625 |
| `ui_photomode_session.handleExtensionUnloaded()` | Called when the extension is unloaded: ends the session, clears the bookmarks and resets the local state. *(internal)* | 633 |
| `ui_photomode_session.isCaptureInProgress()` | Indicates whether a capture is in progress (delegates to ui_photomode_capture). | 385 |
| `ui_photomode_session.isDebugEnabled()` | Returns the global variable isDebugEnabled (see the bug in the notes). | 510 |
| `ui_photomode_session.isPersistentSessionEnabled()` | Reads the photomodePersistentSession setting (if enabled, the session settings are stored on close and reapplied at the next opening). | 389 |
| `ui_photomode_session.isPhotomodeSessionActive()` | Indicates whether a photo mode session is active. | 381 |
| `ui_photomode_session.onPhotomodeRouteEnter(routeName)` | Hook called on entering a photo mode route (routeName as argument); only logs. *(internal)* *(hook)* | 532 |
| `ui_photomode_session.onPhotomodeRouteLeave(routeName)` | Hook called on leaving a photo mode route; only logs. *(internal)* *(hook)* | 536 |
| `ui_photomode_session.requestExitConfirmation(route, params, context)` | Stores the requested exit navigation and shows a confirmation dialog (different text if the persistent session is enabled). Does nothing more if a confirmation is already pending. | 442 |
| `ui_photomode_session.setDebugEnabled(value)` | Sets the global isDebugEnabled, propagates the setting to the screenshot API (setDebugTracingEnabled) and logs. | 514 |
| `ui_photomode_session.setHiddenCameraInputEnabled(enabled)` | Enables or disables the hidden photo camera inputs by pushing/popping the "PhotoModeCamera" action map. No effect if the state does not change. | 97 |
| `ui_photomode_session.setPanelSurfaceMode(mode)` | Changes the panel surface mode; refuses values other than "hidden" and "settings". | 420 |
| `ui_photomode_session.setPersistentSessionEnabled(value)` | Writes the persistent session setting; on disabling, clears the stored persistent state, then notifies the UI of the settings. | 396 |
| `ui_photomode_session.traceCaptureDebug(scope, payload)` | Logs a capture debug message: "scope" followed by the serialized payload (JSON). | 523 |

### Parameter details

#### `ui_photomode_session.beginPhotomodeSession(options)`

Starts the photo mode session (pause, free camera, restore states, world suppressions). Ignored if a session is already active.

- `options` (*table|nil*) : options.profile: "pause" (default) or "garage".
- **returns**: boolean true if the session started, false if it was already active.

#### `ui_photomode_session.buildCapabilities()`

Computes the capabilities displayed by the UI: active profile, hidden controls, sections, features (upload, steam, openShareUrl, overlays, resolutionPresets, motionBlurCapture, advancedRenderTuning, developerTools...), build (shipping/developer) and advanced render state. The active profile's features take precedence.

- **returns**: table Capabilities table.

#### `ui_photomode_session.confirmExit()`

Confirms the exit: enables the confirmation bypass then navigates to the stored route with extensions.ui_router.navigate.

- **returns**: boolean|any false if no navigation is pending, otherwise the result of ui_router.navigate.

#### `ui_photomode_session.consumeExitConfirmationBypass()`

Reads and consumes the exit confirmation bypass flag (used by the photo mode route guard).

- **returns**: boolean true if the bypass was armed (it is then disarmed).

#### `ui_photomode_session.endPhotomodeSession()`

Ends the session: ends the capture in progress, saves the persistent state if enabled, restores scene, effects, advanced render, camera, node grabber, solo view, suppressions and pause, then resets the temporary presets. Does nothing if everything is already inactive.

- **returns**: boolean true if a closing was done, false if the session was already inactive.

#### `ui_photomode_session.getPanelSurfaceMode()`

Returns the panel surface mode, "hidden" or "settings" ("hidden" if the stored value is invalid).

- **returns**: string "hidden" or "settings".

#### `ui_photomode_session.getRoutePayload()`

Builds the payload sent to the UI: contractVersion, sessionActive, capabilities, capture, persistentSession, panelSurfaceMode, mediaActions, resolutionPresets, suppressions.

- **returns**: table Photo mode route payload.

#### `ui_photomode_session.isCaptureInProgress()`

Indicates whether a capture is in progress (delegates to ui_photomode_capture).

- **returns**: boolean true if a capture is in progress.

#### `ui_photomode_session.isDebugEnabled()`

Returns the global variable isDebugEnabled (see the bug in the notes).

- **returns**: boolean|nil Value of the global isDebugEnabled.

#### `ui_photomode_session.isPersistentSessionEnabled()`

Reads the photomodePersistentSession setting (if enabled, the session settings are stored on close and reapplied at the next opening).

- **returns**: boolean true if the persistent session is enabled.

#### `ui_photomode_session.isPhotomodeSessionActive()`

Indicates whether a photo mode session is active.

- **returns**: boolean Value of S.sessionActive.

#### `ui_photomode_session.onPhotomodeRouteEnter(routeName)`

Hook called on entering a photo mode route (routeName as argument); only logs.

- `routeName` (*string*) : Name of the road.

#### `ui_photomode_session.onPhotomodeRouteLeave(routeName)`

Hook called on leaving a photo mode route; only logs.

- `routeName` (*string*) : Name of the road.

#### `ui_photomode_session.requestExitConfirmation(route, params, context)`

Stores the requested exit navigation and shows a confirmation dialog (different text if the persistent session is enabled). Does nothing more if a confirmation is already pending.

- `route` (*table|any*) : Target route (uses route.name if context.routeName is absent).
- `params` (*any*) : Route parameters to store.
- `context` (*table|nil*) : {routeName?, options?} .
- **returns**: boolean false if no valid route name, otherwise true.

#### `ui_photomode_session.setDebugEnabled(value)`

Sets the global isDebugEnabled, propagates the setting to the screenshot API (setDebugTracingEnabled) and logs.

- `value` (*any*) : Enabled only if value == true.

#### `ui_photomode_session.setHiddenCameraInputEnabled(enabled)`

Enables or disables the hidden photo camera inputs by pushing/popping the "PhotoModeCamera" action map. No effect if the state does not change.

- `enabled` (*boolean*) : Enabled only if enabled == true.
- **returns**: boolean Always true.

#### `ui_photomode_session.setPanelSurfaceMode(mode)`

Changes the panel surface mode; refuses values other than "hidden" and "settings".

- `mode` (*string*) : "hidden" or "settings".
- **returns**: table {ok=boolean, mode=string}.

#### `ui_photomode_session.setPersistentSessionEnabled(value)`

Writes the persistent session setting; on disabling, clears the stored persistent state, then notifies the UI of the settings.

- `value` (*boolean|any*) : New value (normalized to a boolean).
- **returns**: table {ok=boolean, enabled=boolean}.

#### `ui_photomode_session.traceCaptureDebug(scope, payload)`

Logs a capture debug message: "scope" followed by the serialized payload (JSON).

- `scope` (*string|nil*) : Label ("capture" by default).
- `payload` (*any*) : Data to append.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: ui_photomode_shared, _camera, _scene, _flash, _effects, _advancedRender, _capture, _presets, core_settings_graphic. |

**UI events (guihooks.trigger):** `showConfirmationDialog`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/photomode/session.lua`.*
