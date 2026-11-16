# `render_openxr`

*File: `lua/ge/extensions/render/openxr.lua` · VM: Game Engine (GE) · 371 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `render_openxr`: `extensions.load("render_openxr")`, then the global `render_openxr`

Lua interface for OpenXR virtual reality (VR headset). Drives the C++ engine (global object OpenXR): enabling/disabling with a welcome dialog, session state received from the engine (stateChanged), recentering, error handling, and a debug ImGui window (2D display settings, CEF UI in the headset, anchoring, debug mode, resolutions, FOV, IPD). The extension unloads itself on deactivation. Global: render_openxr.

## Example

```lua
extensions.render_openxr.toggle()   -- disabled -> welcome -> enabled -> disabled
extensions.render_openxr.center()   -- recenters the view (ctrl+numpad5)
if extensions.render_openxr.isSessionRunning() then ... end
```

## Notes

- stateString: 'disabled', 'welcome' (confirmation dialog shown) or 'enabled'. setStateUI('welcome') only opens the dialog with the OK button if the adapter is Vulkan or Direct3D12; otherwise only a cancel button is offered ("no Vulkan" text).
- The Lua callbacks of the dialog buttons are strings executed by the UI: `extensions.render_openxr.closeWelcome(true|false)`.
- M.state is the table received from the C++ engine via stateChanged(state); the UI is notified by guihooks 'OpenXRStateChanged' when one of the tracked fields changes (enabled, sessionRunning, headsetActive, systemName, targetRefreshRate, renderedWidth/Height, recommendedWidth/Height, sourceCount, activeSourceCount, poseValidSourceCount, inputSourcesKey). The sourceCount… fields and the getInputSourceStates/getSourcePoseStates accessors are commented out (TODO, API not finalized).
- onPreRender (and not onUpdate) is used deliberately: core_camera runs at preRender, so OpenXR must come after it to avoid a one-frame pose lag (hence the dependency on core_camera).
- Persisted settings (via settings): openXRuiEnabled, openXRuiMode, openXRwindowViewMode, openXRdebugEnabled, openXRquadCompositionEnabled (default false), plus openXRimguiEnabled (read only); changing debug mode during a session restarts OpenXR.
- The debug ImGui window is only drawn if the openXRimguiEnabled setting is true and the session is running; closing the window disables OpenXR.
- Shortcuts announced in the debug UI: ctrl+numpad0 (enable/disable), ctrl+numpad5 (center).
- If enable fails on the C++ side, a simple debug log is emitted and the state goes back to 'disabled'.

**Dependencies (loaded first):** `core_camera`

## Functions

| Function | Description | Line |
|---|---|---|
| `render_openxr.center(value)` | Recenters the VR view. Without argument, recenters once (OpenXR.centerNow); with a value, enables/disables continuous recentering when value > 0.2 (OpenXR.centerContinuous). | 328 |
| `render_openxr.closeWelcome(enable)` | Closing of the welcome dialog (called by its buttons): enable=true enables OpenXR, otherwise disables it. | 162 |
| `render_openxr.errorDetected(err)` | Called by the engine on an OpenXR error: logs the error and shows an error toast with the translation `ui.openXR.errors.<err>`. *(internal)* | 340 |
| `render_openxr.isSessionRunning()` | Indicates whether an OpenXR session is running. | 336 |
| `render_openxr.onInit()` | Initialization hook: sets the extension to manual unload and loads the settings. *(internal)* *(hook)* | 157 |
| `render_openxr.onPreRender(...)` | Pre-render hook: calls the current update function (onUpdate when OpenXR is enabled, otherwise nothing). *(internal)* *(hook)* | 36 |
| `render_openxr.onSettingsChanged()` | Settings change hook: re-reads the OpenXR settings, restarts OpenXR if debug mode changes during a session, and regenerates the UI curvature (OpenXR.generateUiCurvature) if OpenXR is active. *(internal)* *(hook)* | 143 |
| `render_openxr.setStateUI(stateString)` | Changes the state of the OpenXR interface: 'welcome' opens the dialog, 'enabled' activates OpenXR.setEnable(true) (falls back to 'disabled' on failure), 'disabled' turns it off and unloads the extension; any other value is an error (disables). Records a player action "set VR state …". | 289 |
| `render_openxr.stateChanged(state)` | Called by the C++ engine on every OpenXR state change: updates M.state (the target refresh rate keeps the maximum seen; an infinite rate is brought back to 0), synchronizes stateString with enabled and notifies the UI. *(internal)* | 98 |
| `render_openxr.toggle()` | Advances the state: disabled -> welcome; welcome -> enabled; enabled -> disabled. | 321 |
| `render_openxr.updateUI(forced)` | Sends 'OpenXRStateChanged' to the UI if a tracked field changed, or if forced (then also logs the state). | 82 |

### Parameter details

#### `render_openxr.center(value)`

Recenters the VR view. Without argument, recenters once (OpenXR.centerNow); with a value, enables/disables continuous recentering when value > 0.2 (OpenXR.centerContinuous).

- `value` (*number|nil*) : Analog value of an input action (inferred from code).

#### `render_openxr.closeWelcome(enable)`

Closing of the welcome dialog (called by its buttons): enable=true enables OpenXR, otherwise disables it.

- `enable` (*boolean*) : User's choice.

#### `render_openxr.errorDetected(err)`

Called by the engine on an OpenXR error: logs the error and shows an error toast with the translation `ui.openXR.errors.<err>`.

- `err` (*string*) : Error identifier (translation key).

#### `render_openxr.isSessionRunning()`

Indicates whether an OpenXR session is running.

- **returns**: boolean M.state.sessionRunning or false.

#### `render_openxr.onPreRender(...)`

Pre-render hook: calls the current update function (onUpdate when OpenXR is enabled, otherwise nothing).

- `...` (*any*) : dtReal, dtSim, dtRaw (inferred from code).

#### `render_openxr.setStateUI(stateString)`

Changes the state of the OpenXR interface: 'welcome' opens the dialog, 'enabled' activates OpenXR.setEnable(true) (falls back to 'disabled' on failure), 'disabled' turns it off and unloads the extension; any other value is an error (disables). Records a player action "set VR state …".

- `stateString` (*string*) : 'welcome', 'enabled' or 'disabled'.

#### `render_openxr.stateChanged(state)`

Called by the C++ engine on every OpenXR state change: updates M.state (the target refresh rate keeps the maximum seen; an infinite rate is brought back to 0), synchronizes stateString with enabled and notifies the UI.

- `state` (*table*) : New OpenXR state.

#### `render_openxr.updateUI(forced)`

Sends 'OpenXRStateChanged' to the UI if a tracked field changed, or if forced (then also logs the state).

- `forced` (*boolean|nil*) : Force the send.

## Fields

| Field | Type | Description |
|---|---|---|
| `cefDialogOpen` | boolean|nil | true while the welcome dialog is open. |
| `dependencies` | string[] | {'core_camera'} |
| `state` | table | OpenXR state received from the engine: systemName ('?' by default), enabled, sessionRunning, sessionState, renderedWidth/Height, recommendedWidth/Height, supportedWidth/Height, supportedLayers, fov0hz/fov0vt/fov1hz/fov1vt, ipd (m), currentRefreshRate/targetRefreshRate… |
| `stateString` | string | 'disabled' (default), 'welcome' or 'enabled'. |

**UI events (guihooks.trigger):** `ConfirmationDialogClose`, `ConfirmationDialogOpen`, `OpenXRStateChanged`, `toastrMsg`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/render/openxr.lua`.*
