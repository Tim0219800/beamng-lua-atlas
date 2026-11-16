---@meta
-- tim19Atlas stub generated from lua/ge/simTimeAuthority.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Authority over the simulation time speed: pause, slow motion (bullet time) and resume, with smoothing. A modder uses it to pause the game, set a slow motion (0.001 to 1) or stack pause requests (pushPauseRequest/popPauseRequest). It synchronizes the C++ engine (be:setSimulationTimeScale, be:setEnabled) and the replay (core_replay), and notifies the UI (bullettime messages).
--- Access: global `simTimeAuthority`
---@class simTimeAuthority
---@field selectionSlot integer Index (1 to 12) of the selected slow-motion notch in the internal notch table (12 = real time).
---@field simulationSpeed number Requested (target) simulation speed, 1 = real time, 0 = pause, 0.001 minimum outside pause. Initialized from be:getSimulationTimeScale().
---@field simulationSpeedReal number Speed currently applied to the engine after smoothing (updated by the update function).
simTimeAuthority = {}

--- Empties all pause requests and resumes the simulation (pause(false)).
---Source: lua/ge/simTimeAuthority.lua:269
function simTimeAuthority.clearPauseStack() end

--- Returns the requested simulation speed (target, not necessarily reached).
---Source: lua/ge/simTimeAuthority.lua:152
---@return number  1 = real time, 0.5 = slow motion, 0 = pause.
function simTimeAuthority.get() end

--- Returns the speed saved before the last pause: this is the one that will be restored on resume.
---Source: lua/ge/simTimeAuthority.lua:292
---@return number  Speed to restore.
function simTimeAuthority.getInitialTimeScale() end

--- Indicates whether time is paused: replay pause state during playback, otherwise not be:getEnabled().
---Source: lua/ge/simTimeAuthority.lua:34
---@return boolean  true if paused.
function simTimeAuthority.getPause() end

--- Returns the speed actually applied to the engine (accounts for smoothing).
---Source: lua/ge/simTimeAuthority.lua:148
---@return number  Actual speed.
function simTimeAuthority.getReal() end

--- Hook called after a GE Lua reload: restores simulationSpeed and the initial speed, then empties the pause stack.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/simTimeAuthority.lua:284
---@param data table Table returned by onSerialize: {simulationSpeed, initialTimeScale}.
function simTimeAuthority.onDeserialized(data) end

--- Hook called before a GE Lua reload: returns the requested speed and the initial speed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/simTimeAuthority.lua:279
---@return table  {simulationSpeed = number, initialTimeScale = number}.
function simTimeAuthority.onSerialize() end

--- Hook called when the UI is initialized: empties the pause stack (clearPauseStack).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/simTimeAuthority.lua:275
function simTimeAuthority.onUIInitialised() end

--- Pauses or resumes instantly. Broadcasts the onSimTimePauseCalled(paused) hook. When pausing: saves the current speed, speed 0, be:setEnabled(false). On resume: restores the saved speed with smoothing. No effect if the requested state is already the current one or if no level is loaded.
---Source: lua/ge/simTimeAuthority.lua:170
---@param paused boolean true to pause, false to resume.
---@param playPauseSound boolean|nil true to play the pause sound (event:>UI>Main>Pause) when entering pause.
function simTimeAuthority.pause(paused, playPauseSound) end

--- Pauses or resumes with a smoothed speed transition (gradual slowdown to 0, or speed-up). Emits the hook simTimePauseCalled(paused). The rates are given by the caller and apply only to this transition.
---Source: lua/ge/simTimeAuthority.lua:199
---@param paused boolean true to pause, false to resume.
---@param rateLimit number|nil Maximum rate of speed change (20 by default if nil).
---@param startAccel number|nil Acceleration at the start of the transition (10 by default).
---@param stopAccel number|nil Deceleration at the end of the transition (3 by default).
---@param playPauseSound boolean|nil true to play the pause sound.
function simTimeAuthority.pauseSmooth(paused, rateLimit, startAccel, stopAccel, playPauseSound) end

--- Removes an identified pause request. When the counter drops back to 0 and the game was not paused before the first request, the simulation resumes.
---Source: lua/ge/simTimeAuthority.lua:256
---@param id string Request identifier (the same as for pushPauseRequest).
function simTimeAuthority.popPauseRequest(id) end

--- Adds an identified pause request and pauses. Remembers whether the game was already paused at the first request. A given id is counted only once.
---Source: lua/ge/simTimeAuthority.lua:242
---@param id string Unique identifier of the caller.
function simTimeAuthority.pushPauseRequest(id) end

--- Displays a speed message on screen (guihooks 'Message', category bullettime): fast-forward, real time, slow motion (simplified) or slow motion by a factor computed with the current option.
---Source: lua/ge/simTimeAuthority.lua:64
---@param speed number Speed to announce.
---@param simplified boolean true: generic slow-motion message with no factor or notch index.
function simTimeAuthority.reportSpeed(speed, simplified) end

--- Sends the current requested speed to the UI (guihooks 'BullettimeValueChanged').
---Source: lua/ge/simTimeAuthority.lua:166
function simTimeAuthority.requestValue() end

--- Selects a slow-motion notch with direction keys. During a replay, drives the replay speed instead.
---Source: lua/ge/simTimeAuthority.lua:122
---@param val string '^': toggles between real time and the last slow-motion notch; 'v': instant slow-motion notch (1/8); '<': slower notch; '>': faster notch.
function simTimeAuthority.selectPreset(val) end

--- Changes the requested simulation speed (progressive smoothing to the new value) and displays the simplified speed message. The value is clamped to [0.001, 1]. A non-numeric value is rejected with a logged error.
---Source: lua/ge/simTimeAuthority.lua:156
---@param val number New speed (1 = real time, 0.5 = half).
function simTimeAuthority.set(val) end

--- Like set, but also forces the smoothed value: the speed is applied without transition. Shows no message.
---Source: lua/ge/simTimeAuthority.lua:161
---@param val number New speed (clamped to [0.001, 1]).
function simTimeAuthority.setInstant(val) end

--- Toggles pause/resume. Emits the hook onTogglePause; during a replay calls core_replay.togglePlay().
---Source: lua/ge/simTimeAuthority.lua:229
---@param playPauseSound boolean|nil true to play the pause sound.
function simTimeAuthority.togglePause(playPauseSound) end

--- Update function registered with the extension system: on each call applies the ongoing speed smoothing (sends the speed to the engine via be:setSimulationTimeScale and physicsEngineEvent) and deactivates itself at the end of the transition. It serves as a wrapper because a registered function pointer cannot be replaced by nop.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/simTimeAuthority.lua:297
---@param ... any Update arguments; the first is dt (s).
function simTimeAuthority.update(...) end

