---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/lowPerformance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Low frame rate detector in freeroam and split screen (only freeroam and multiseatGamemode modes; missions, scenarios, career and tutorials are never monitored). When the smoothed FPS average stays below 25 for 5 s, it switches to a "low performance" state, displays a warning toast and can ask for confirmation before a new vehicle spawns (confirmSpawn). A modder who spawns vehicles can go through confirmSpawn to respect this warning.
--- Access: extension `gameplay_lowPerformance`: `extensions.load("gameplay_lowPerformance")`, then the global `gameplay_lowPerformance`
---@class gameplay_lowPerformance
gameplay_lowPerformance = {}

--- Abandons the pending spawn function _anon(Cancel button).
---Source: lua/ge/extensions/gameplay/lowPerformance.lua:125
function gameplay_lowPerformance.cancelPendingSpawn() end

--- Executes the pending spawn function, if any (Continue button).
---Source: lua/ge/extensions/gameplay/lowPerformance.lua:119
function gameplay_lowPerformance.confirmPendingSpawn() end

--- Executes spawnFn directly, unless the low performance state is active, the warning has not yet been shown for this episode and notifications are enabled: in that case displays a confirmation dialog (Cancel / Don't show again / Continue) and defers spawnFn.
---Source: lua/ge/extensions/gameplay/lowPerformance.lua:93
---@param spawnFn function Function that performs the spawn.
---@return any  Result of spawnFn if executed immediately (nil if it returns nothing), or false while the player has to decide.
function gameplay_lowPerformance.confirmSpawn(spawnFn) end

--- Returns the translated texts to display in the pause menu when low performance is active and notifications are allowed.
---Source: lua/ge/extensions/gameplay/lowPerformance.lua:141
---@return table|nil  {notice, hint, infoTitle, infoMessage} or nil.
function gameplay_lowPerformance.getPauseNotice() end

--- Returns whether the game is currently considered in low performance, and whether detection is still applicable (gate active).
---Source: lua/ge/extensions/gameplay/lowPerformance.lua:88
---@return boolean  true if low performance.
function gameplay_lowPerformance.isLowPerformance() end

--- Disables notifications (notifyLowPerformance setting = false), displays an info toast then executes the pending spawn.
---Source: lua/ge/extensions/gameplay/lowPerformance.lua:129
function gameplay_lowPerformance.muteAndConfirmPendingSpawn() end

--- Screen fade state hook: sampling is suspended as long as the state is not 3 (fade finished).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/lowPerformance.lua:196
---@param state integer Fade state; 3 = finished.
function gameplay_lowPerformance.onScreenFadeState(state) end

--- Per-frame update hook: periodically (1 s) checks the gate, manages the grace period, smooths the FPS and toggles the low performance state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/lowPerformance.lua:151
---@param dtReal number Real-time delta (unused).
---@param dtSim number Simulation delta time (unused).
---@param dtRaw number Raw delta time in seconds, used for timing and FPS.
function gameplay_lowPerformance.onUpdate(dtReal, dtSim, dtRaw) end

--- Vehicle spawn hook: restarts the grace period (spawning temporarily drops the FPS).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/lowPerformance.lua:192
function gameplay_lowPerformance.onVehicleSpawned() end

