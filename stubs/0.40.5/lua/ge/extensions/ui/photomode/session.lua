---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/session.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Photo mode session orchestrator. It opens and closes the session: simulation pause (pause request "ui_pause_photomode"), solo split-screen view, capture then restoration of camera / scene / effects / advanced render / node grabber states, session free camera, global flag photoModeOpen. It also handles route profiles (pause, garage), the persistent session (setting photomodePersistentSession), the panel surface mode, exit confirmation and the payload (route payload) sent to the Vue UI.
--- Access: extension `ui_photomode_session`: `extensions.load("ui_photomode_session")`, then the global `ui_photomode_session`
---@class ui_photomode_session
---@field dependencies table<integer, string> Extensions loaded before: ui_photomode_shared, _camera, _scene, _flash, _effects, _advancedRender, _capture, _presets, core_settings_graphic.
ui_photomode_session = {}

--- Starts the photo mode session (pause, free camera, restore states, world suppressions). Ignored if a session is already active.
---Source: lua/ge/extensions/ui/photomode/session.lua:540
---@param options table|nil options.profile: "pause" (default) or "garage".
---@return boolean  true if the session started, false if it was already active.
function ui_photomode_session.beginPhotomodeSession(options) end

--- Computes the capabilities displayed by the UI: active profile, hidden controls, sections, features (upload, steam, openShareUrl, overlays, resolutionPresets, motionBlurCapture, advancedRenderTuning, developerTools...), build (shipping/developer) and advanced render state. The active profile's features take precedence.
---Source: lua/ge/extensions/ui/photomode/session.lua:271
---@return table  Capabilities table.
function ui_photomode_session.buildCapabilities() end

--- Cancels the pending exit (the dialog's "back" button) and re-enables the hidden camera input if it was.
---Source: lua/ge/extensions/ui/photomode/session.lua:484
function ui_photomode_session.cancelExitConfirmation() end

--- Confirms the exit: enables the confirmation bypass then navigates to the stored route with extensions.ui_router.navigate.
---Source: lua/ge/extensions/ui/photomode/session.lua:495
---@return boolean|any  false if no navigation is pending, otherwise the result of ui_router.navigate.
function ui_photomode_session.confirmExit() end

--- Reads and consumes the exit confirmation bypass flag (used by the photo mode route guard).
---Source: lua/ge/extensions/ui/photomode/session.lua:434
---@return boolean  true if the bypass was armed (it is then disarmed).
function ui_photomode_session.consumeExitConfirmationBypass() end

--- Ends the session: ends the capture in progress, saves the persistent state if enabled, restores scene, effects, advanced render, camera, node grabber, solo view, suppressions and pause, then resets the temporary presets. Does nothing if everything is already inactive.
---Source: lua/ge/extensions/ui/photomode/session.lua:578
---@return boolean  true if a closing was done, false if the session was already inactive.
function ui_photomode_session.endPhotomodeSession() end

--- Returns the panel surface mode, "hidden" or "settings" ("hidden" if the stored value is invalid).
---Source: lua/ge/extensions/ui/photomode/session.lua:415
---@return string  "hidden" or "settings".
function ui_photomode_session.getPanelSurfaceMode() end

--- Builds the payload sent to the UI: contractVersion, sessionActive, capabilities, capture, persistentSession, panelSurfaceMode, mediaActions, resolutionPresets, suppressions.
---Source: lua/ge/extensions/ui/photomode/session.lua:362
---@return table  Photo mode route payload.
function ui_photomode_session.getRoutePayload() end

--- Called when the extension is loaded: clears the bookmarks (camera, relative camera, environment, advanced render) and resets the local session state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/session.lua:625
function ui_photomode_session.handleExtensionLoaded() end

--- Called when the extension is unloaded: ends the session, clears the bookmarks and resets the local state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/session.lua:633
function ui_photomode_session.handleExtensionUnloaded() end

--- Indicates whether a capture is in progress (delegates to ui_photomode_capture).
---Source: lua/ge/extensions/ui/photomode/session.lua:385
---@return boolean  true if a capture is in progress.
function ui_photomode_session.isCaptureInProgress() end

--- Returns the global variable isDebugEnabled (see the bug in the notes).
---Source: lua/ge/extensions/ui/photomode/session.lua:510
---@return boolean|nil  Value of the global isDebugEnabled.
function ui_photomode_session.isDebugEnabled() end

--- Reads the photomodePersistentSession setting (if enabled, the session settings are stored on close and reapplied at the next opening).
---Source: lua/ge/extensions/ui/photomode/session.lua:389
---@return boolean  true if the persistent session is enabled.
function ui_photomode_session.isPersistentSessionEnabled() end

--- Indicates whether a photo mode session is active.
---Source: lua/ge/extensions/ui/photomode/session.lua:381
---@return boolean  Value of S.sessionActive.
function ui_photomode_session.isPhotomodeSessionActive() end

--- Hook called on entering a photo mode route (routeName as argument); only logs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/session.lua:532
---@param routeName string Name of the road.
function ui_photomode_session.onPhotomodeRouteEnter(routeName) end

--- Hook called on leaving a photo mode route; only logs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/session.lua:536
---@param routeName string Name of the road.
function ui_photomode_session.onPhotomodeRouteLeave(routeName) end

--- Stores the requested exit navigation and shows a confirmation dialog (different text if the persistent session is enabled). Does nothing more if a confirmation is already pending.
---Source: lua/ge/extensions/ui/photomode/session.lua:442
---@param route table|any Target route (uses route.name if context.routeName is absent).
---@param params any Route parameters to store.
---@param context table|nil {routeName?, options?} .
---@return boolean  false if no valid route name, otherwise true.
function ui_photomode_session.requestExitConfirmation(route, params, context) end

--- Sets the global isDebugEnabled, propagates the setting to the screenshot API (setDebugTracingEnabled) and logs.
---Source: lua/ge/extensions/ui/photomode/session.lua:514
---@param value any Enabled only if value == true.
function ui_photomode_session.setDebugEnabled(value) end

--- Enables or disables the hidden photo camera inputs by pushing/popping the "PhotoModeCamera" action map. No effect if the state does not change.
---Source: lua/ge/extensions/ui/photomode/session.lua:97
---@param enabled boolean Enabled only if enabled == true.
---@return boolean  Always true.
function ui_photomode_session.setHiddenCameraInputEnabled(enabled) end

--- Changes the panel surface mode; refuses values other than "hidden" and "settings".
---Source: lua/ge/extensions/ui/photomode/session.lua:420
---@param mode string "hidden" or "settings".
---@return table  {ok=boolean, mode=string}.
function ui_photomode_session.setPanelSurfaceMode(mode) end

--- Writes the persistent session setting; on disabling, clears the stored persistent state, then notifies the UI of the settings.
---Source: lua/ge/extensions/ui/photomode/session.lua:396
---@param value boolean|any New value (normalized to a boolean).
---@return table  {ok=boolean, enabled=boolean}.
function ui_photomode_session.setPersistentSessionEnabled(value) end

--- Logs a capture debug message: "scope" followed by the serialized payload (JSON).
---Source: lua/ge/extensions/ui/photomode/session.lua:523
---@param scope string|nil Label ("capture" by default).
---@param payload any Data to append.
function ui_photomode_session.traceCaptureDebug(scope, payload) end

