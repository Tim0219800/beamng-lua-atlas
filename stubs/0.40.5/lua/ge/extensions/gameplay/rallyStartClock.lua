---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rallyStartClock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the special stage start clocks (physical signs present in the levels) for rally. It loads the clock types from `lua/ge/extensions/gameplay/rally/startClocks/*.lua` (each must expose `textures`, `findClocks` and `draw`), creates a display TSStatic object for each clock found, draws the wall time, the "SS<n>" label and the countdown (with light code R, A or G) into dynamic textures, then, if the `rallyStartCountdownDisplay` setting is '3d', shows the clock nearest to the start line in an inset render view at the top of the screen with a frame colored according to the light. It feeds its state from the `onRallyDataUpdated` hook.
--- Access: extension `gameplay_rallyStartClock`: `extensions.load("gameplay_rallyStartClock")`, then the global `gameplay_rallyStartClock`
---@class gameplay_rallyStartClock
gameplay_rallyStartClock = {}

--- Loaded clock types.
---Source: lua/ge/extensions/gameplay/rallyStartClock.lua:525
---@return table[]  List of {name, module} (name = file name without extension).
function gameplay_rallyStartClock.getClockTypes() end

--- Indicates whether the countdown's 3D render view is active; rallyLoop uses it to hide the 2D countdown.
---Source: lua/ge/extensions/gameplay/rallyStartClock.lua:524
---@return boolean  true if the 3D view is available.
function gameplay_rallyStartClock.isRenderViewAvailable() end

--- Load hook: loads (or reloads) the clock types from the startClocks folder.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rallyStartClock.lua:69
function gameplay_rallyStartClock.onExtensionLoaded() end

--- Unload hook: destroys the render view, the displays and resets the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rallyStartClock.lua:426
function gameplay_rallyStartClock.onExtensionUnloaded() end

--- Called before rendering, after all onUpdate: advances the local clock if no fresh data has arrived, redraws the textures if the display changed and draws the colored frame of the 3D view.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rallyStartClock.lua:499
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
function gameplay_rallyStartClock.onPreRender(dtReal, dtSim) end

--- Hook called when the rally data changes. Reads activeState (start and end of the countdown, 1.5 s delay of the 3D view), rallyClock.wallClockSecs and startClockCountdownData (or countdownData) to compute the start time (timeUntilLaunch in seconds, state 'launched').
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rallyStartClock.lua:440
---@param data table Rally data (activeState, rallyClock, startClockCountdownData, countdownData).
function gameplay_rallyStartClock.onRallyDataUpdated(data) end

--- Hook emitted at the end of a rally session: same cleanup as unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rallyStartClock.lua:426
function gameplay_rallyStartClock.onRallySessionEnd() end

--- Update hook: (re)detects the level's clocks every second if needed, rebinds the textures, runs the view delay and updates the 3D render view.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rallyStartClock.lua:476
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
function gameplay_rallyStartClock.onUpdate(dtReal, dtSim) end

