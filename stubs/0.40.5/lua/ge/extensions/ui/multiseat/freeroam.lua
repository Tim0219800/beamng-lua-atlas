---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/multiseat/freeroam.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the multi-seat session (split screen) in freeroam: choice of suggested vehicles, spawn plan (level positions, otherwise a group of nearby parking spots, otherwise road), opening the multiseat settings, enabling/disabling split screen and traffic, exit to solo mode, and restoration after a UI or Lua reload. A level can provide mainLevel.getMultiseatSuggestedVehicles(playerCount) and mainLevel.getMultiseatSpawnPositions(playerCount), or multiseat.suggestedVehicles in info.json.
--- Access: extension `ui_multiseat_freeroam`: `extensions.load("ui_multiseat_freeroam")`, then the global `ui_multiseat_freeroam`
---@class ui_multiseat_freeroam
---@field dependencies table<integer, string> Extensions loaded before: gameplay_city, gameplay_parking, gameplay_traffic, ui_multiseat_multiseatSettings, ui_multiseat_multiseatVehicles.
ui_multiseat_freeroam = {}

--- Loads gameplay_multiseat_gamemodeManager and marks the multiseat freeroam session as active.
---Source: lua/ge/extensions/ui/multiseat/freeroam.lua:109
function ui_multiseat_freeroam.activate() end

--- Marks the session as inactive and cancels any pending restoration.
---Source: lua/ge/extensions/ui/multiseat/freeroam.lua:114
function ui_multiseat_freeroam.deactivate() end

--- Returns to solo freeroam: stops the multiseat gamemode, optionally applies an assignment cache (options.assignmentCache), stops drag races and a non-mission crawl, deletes all vehicles except player 0's, clears the session, turns off multiseat and gives the vehicle back to player 0 with the game camera.
---Source: lua/ge/extensions/ui/multiseat/freeroam.lua:191
---@param options table|nil Options; assignmentCache = player assignments to cache before exiting.
---@return boolean  false if the session was not active or the cache could not be saved, otherwise true.
function ui_multiseat_freeroam.exitMultiseat(options) end

--- Returns whether the multiseat freeroam session is active.
---Source: lua/ge/extensions/ui/multiseat/freeroam.lua:119
---@return boolean  true if active.
function ui_multiseat_freeroam.isActive() end

--- Hook called at the end of the level; deactivates the session and cancels any restoration.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/freeroam.lua:343
function ui_multiseat_freeroam.onClientEndMission() end

--- Hook called after a Lua reload; if the restoreAsFreeroam marker is present, calls restoreAfterReload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/freeroam.lua:295
---@param data table Data returned by onSerialize.
function ui_multiseat_freeroam.onDeserialized(data) end

--- Hook called when the multiseat settings have been applied. Activates the session; with more than one player, loads render_splitScreen, gives it the players and adds the players to the traffic sources; with a single player, unloads split screen and traffic. Then closes the menu. No effect if result.success == false or result.exitAfterApply == true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/freeroam.lua:164
---@param changeSet table Applied changes (unused here).
---@param result table Application result (success, exitAfterApply).
function ui_multiseat_freeroam.onMultiseatSettingsApplied(changeSet, result) end

--- Hook called when the multiseat settings are closed; does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/freeroam.lua:250
function ui_multiseat_freeroam.onMultiseatSettingsClosed() end

--- Pause menu home rail hook: adds the buttons "home.changeMultiseatSettings" (opens pause.multiseatSettings) and "home.exitMultiseat" (confirmation, then exitMultiseat and return to "play"). Nothing is added if neither the session nor a multiseat gamemode is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/freeroam.lua:253
---@param actions table List of actions to complete.
---@param _context table Context (unused).
---@param registerButton function Function that registers a button and its callback.
function ui_multiseat_freeroam.onPauseHomeRailBuildMultiseatActions(actions, _context, registerButton) end

--- Hook called before a Lua reload; returns {restoreAsFreeroam = true} if a session is active, otherwise nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/freeroam.lua:280
---@param reason string Serialization reason (log).
---@return table|nil  Restoration marker.
function ui_multiseat_freeroam.onSerialize(reason) end

--- Hook called when the UI is ready; if a restoration is pending, restores multiseat, the split screen, the traffic and reloads the "multiseat" UI route (set as the game route).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/freeroam.lua:304
function ui_multiseat_freeroam.onUiReady() end

--- Starts a multiseat configuration (source "settings") and navigates to the route "pause.multiseatSettings". If navigation fails, the configuration is abandoned.
---Source: lua/ge/extensions/ui/multiseat/freeroam.lua:155
---@return boolean  false if navigation failed, otherwise true.
function ui_multiseat_freeroam.openSettings() end

--- Marks the session active and queues a restoration, executed at the next onUiReady.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/freeroam.lua:123
function ui_multiseat_freeroam.restoreAfterReload() end

--- Starts freeroam in split screen: assigns each registered player a vehicle suggested for the level, builds a spawn plan (level, then parking, otherwise road), spawns the vehicles and activates the session on success. If spawning fails, the vehicles are removed.
---Source: lua/ge/extensions/ui/multiseat/freeroam.lua:129
---@param levelName string Level name, used to find the suggested vehicles.
---@return boolean  true if everything succeeded.
---@return string|nil  Failure reason (see notes).
function ui_multiseat_freeroam.startSplitscreenFreeroam(levelName) end

