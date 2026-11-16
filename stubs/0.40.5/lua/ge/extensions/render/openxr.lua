---@meta
-- tim19Atlas stub generated from lua/ge/extensions/render/openxr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lua interface for OpenXR virtual reality (VR headset). Drives the C++ engine (global object OpenXR): enabling/disabling with a welcome dialog, session state received from the engine (stateChanged), recentering, error handling, and a debug ImGui window (2D display settings, CEF UI in the headset, anchoring, debug mode, resolutions, FOV, IPD). The extension unloads itself on deactivation. Global: render_openxr.
--- Access: extension `render_openxr`: `extensions.load("render_openxr")`, then the global `render_openxr`
---@class render_openxr
---@field cefDialogOpen boolean|nil true while the welcome dialog is open.
---@field dependencies string[] {'core_camera'}
---@field state table OpenXR state received from the engine: systemName ('?' by default), enabled, sessionRunning, sessionState, renderedWidth/Height, recommendedWidth/Height, supportedWidth/Height, supportedLayers, fov0hz/fov0vt/fov1hz/fov1vt, ipd (m), currentRefreshRate/targetRefreshRate…
---@field stateString string 'disabled' (default), 'welcome' or 'enabled'.
render_openxr = {}

--- Recenters the VR view. Without argument, recenters once (OpenXR.centerNow); with a value, enables/disables continuous recentering when value > 0.2 (OpenXR.centerContinuous).
---Source: lua/ge/extensions/render/openxr.lua:328
---@param value number|nil Analog value of an input action (inferred from code).
function render_openxr.center(value) end

--- Closing of the welcome dialog (called by its buttons): enable=true enables OpenXR, otherwise disables it.
---Source: lua/ge/extensions/render/openxr.lua:162
---@param enable boolean User's choice.
function render_openxr.closeWelcome(enable) end

--- Called by the engine on an OpenXR error: logs the error and shows an error toast with the translation `ui.openXR.errors.<err>`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/openxr.lua:340
---@param err string Error identifier (translation key).
function render_openxr.errorDetected(err) end

--- Indicates whether an OpenXR session is running.
---Source: lua/ge/extensions/render/openxr.lua:336
---@return boolean  M.state.sessionRunning or false.
function render_openxr.isSessionRunning() end

--- Initialization hook: sets the extension to manual unload and loads the settings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/openxr.lua:157
function render_openxr.onInit() end

--- Pre-render hook: calls the current update function _anon(onUpdate when OpenXR is enabled, otherwise nothing).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/openxr.lua:36
---@param ... any dtReal, dtSim, dtRaw (inferred from code).
function render_openxr.onPreRender(...) end

--- Settings change hook: re-reads the OpenXR settings, restarts OpenXR if debug mode changes during a session, and regenerates the UI curvature (OpenXR.generateUiCurvature) if OpenXR is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/openxr.lua:143
function render_openxr.onSettingsChanged() end

--- Changes the state of the OpenXR interface: 'welcome' opens the dialog, 'enabled' activates OpenXR.setEnable(true) (falls back to 'disabled' on failure), 'disabled' turns it off and unloads the extension; any other value is an error (disables). Records a player action "set VR state …".
---Source: lua/ge/extensions/render/openxr.lua:289
---@param stateString string 'welcome', 'enabled' or 'disabled'.
function render_openxr.setStateUI(stateString) end

--- Called by the C++ engine on every OpenXR state change: updates M.state (the target refresh rate keeps the maximum seen; an infinite rate is brought back to 0), synchronizes stateString with enabled and notifies the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/openxr.lua:98
---@param state table New OpenXR state.
function render_openxr.stateChanged(state) end

--- Advances the state: disabled -> welcome; welcome -> enabled; enabled -> disabled.
---Source: lua/ge/extensions/render/openxr.lua:321
function render_openxr.toggle() end

--- Sends 'OpenXRStateChanged' to the UI if a tracked field changed, or if forced (then also logs the state).
---Source: lua/ge/extensions/render/openxr.lua:82
---@param forced boolean|nil Force the send.
function render_openxr.updateUI(forced) end

