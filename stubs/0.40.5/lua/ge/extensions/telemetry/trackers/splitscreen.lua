---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/splitscreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Split-screen telemetry tracker: split-screen sessions, usage duration of each configuration and multi-seat game modes played. splitScreenStarted and splitScreenStopped bracket a session in a level; the "splitScreenActive" activity restarts when the player count, layout or mode changes; "splitScreenGamemode" covers a multi-seat game mode.
--- Access: extension `telemetry_trackers_splitscreen`: `extensions.load("telemetry_trackers_splitscreen")`, then the global `telemetry_trackers_splitscreen`
---@class telemetry_trackers_splitscreen
---@field dependencies string[] telemetry_core.
telemetry_trackers_splitscreen = {}

--- Hook called at the end of the level: closes game mode, activity and session (reason levelEnded).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/splitscreen.lua:160
function telemetry_trackers_splitscreen.onClientEndMission() end

--- Hook called when a level starts: resynchronizes the split-screen state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/splitscreen.lua:156
function telemetry_trackers_splitscreen.onClientStartMission() end

--- Hook called when the game exits: closes everything (reason gameExit).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/splitscreen.lua:166
function telemetry_trackers_splitscreen.onExit() end

--- Hook called on load: manual unload and synchronization with the current render_splitScreen configuration.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/splitscreen.lua:151
function telemetry_trackers_splitscreen.onExtensionLoaded() end

--- Hook called on unload: closes everything (same function as onExit).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/splitscreen.lua:166
function telemetry_trackers_splitscreen.onExtensionUnloaded() end

--- Hook called at a round's end screen: emits splitScreenGamemodeFinished (tied, hasWinner).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/splitscreen.lua:132
---@param gamemodeId string Game mode ID.
---@param result table|nil Result ({tied, winnerPlayer}).
function telemetry_trackers_splitscreen.onMultiseatGamemodeFinished(gamemodeId, result) end

--- Hook called for each round started, including a restart from the end screen or the pause menu: ends the previous mode (restarted or switched) and starts the splitScreenGamemode activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/splitscreen.lua:121
---@param gamemodeId string Game mode ID.
function telemetry_trackers_splitscreen.onMultiseatGamemodeLaunched(gamemodeId) end

--- Hook called when the game mode stops: ends the activity with the reason "stopped".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/splitscreen.lua:142
function telemetry_trackers_splitscreen.onMultiseatGamemodeStopped() end

--- Hook called when the split-screen configuration changes: starts/updates the session and activity, or ends them if disabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/splitscreen.lua:96
---@param enabled boolean Split screen active.
---@param playerCount integer Number of players.
---@param layout any Layout.
---@param mode any Mode.
function telemetry_trackers_splitscreen.onSplitScreenChanged(enabled, playerCount, layout, mode) end

--- Hook called when the player requests split-screen start: remembers the origin.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/splitscreen.lua:54
---@param entry string discover or multiseatSettings.
---@param activity string Game mode ID or "freeroam".
function telemetry_trackers_splitscreen.onSplitScreenStartRequested(entry, activity) end

