---@meta
-- tim19Atlas stub generated from lua/ge/extensions/render/splitScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Split screen (multiseat): creates a render view per player (RenderViewManagerInstance, views named 'splitscreen0', 'splitscreen1'...), computes the on-screen layout with render_splitScreenLayouts according to the number of players and the multiseatLayout<N> setting, manages per-player camera contexts, player labels and the 'multiseat' Vue HUD. The extension activates as soon as it is loaded (onExtensionLoaded calls enable) and deactivates on unload. A modder or a mission can force the player list with setCustomPlayers.
--- Access: extension `render_splitScreen`: `extensions.load("render_splitScreen")`, then the global `render_splitScreen`
---@class render_splitScreen
---@field dependencies string[] Extensions loaded first: core_playerPersonas, render_playerTags, render_playerCompassMarkers.
render_splitScreen = {}

--- Temporarily shows a single player in full screen without changing the participant list or the HUD state. With options.mainView = true, uses the main view; otherwise enlarges the player's view with an 'orbit' camera. Player labels are removed during the solo view.
---Source: lua/ge/extensions/render/splitScreen.lua:482
---@param player integer Player index (converted by tonumber).
---@param options table|nil {mainView = boolean}.
---@return boolean  false if player is not numeric or is not in the configured player list (or has no view); true otherwise.
function render_splitScreen.beginSoloView(player, options) end

--- Shortcut for setCustomPlayers(nil).
---Source: lua/ge/extensions/render/splitScreen.lua:377
function render_splitScreen.clearCustomPlayers() end

--- Ends the solo view and restores the context camera and the layout.
---Source: lua/ge/extensions/render/splitScreen.lua:458
---@return boolean  true if a solo view was active.
function render_splitScreen.endSoloView() end

--- Returns the current display configuration.
---Source: lua/ge/extensions/render/splitScreen.lua:562
---@return boolean  false if split screen is inactive.
---@return integer|nil  Number of players.
---@return string|nil  Layout identifier.
---@return string|nil  Mode: 'shared' or 'split'.
function render_splitScreen.getCurrentConfiguration() end

--- Returns the ordered list of player indices that have a view: the custom list from setCustomPlayers if it exists, otherwise core_multiseat.getPlayers. Limited to 64; contains {0} if empty.
---Source: lua/ge/extensions/render/splitScreen.lua:82
---@param result integer[]|nil Table to fill and return (reusable to avoid an allocation); created if nil.
---@return integer[]  Player indices.
function render_splitScreen.getPlayers(result) end

--- True if split screen is active, rendered in shared view and without a solo view.
---Source: lua/ge/extensions/render/splitScreen.lua:567
---@return boolean  State.
function render_splitScreen.isSharedView() end

--- UI route change hook: sends the HUD state back on each entry into the 'multiseat' route, since the Vue view is remounted with its route.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/splitScreen.lua:433
---@param context table Navigation context (context.toRoute.name).
function render_splitScreen.onAfterRouteChange(context) end

--- End-of-mission hook: ends the solo view (endSoloView).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/splitScreen.lua:458
function render_splitScreen.onClientEndMission() end

--- Hook called after a GE Lua reload: restores the saved player list and re-enables split screen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/splitScreen.lua:583
---@param data table onSerialize data (customPlayers).
function render_splitScreen.onDeserialized(data) end

--- Extension load hook: restores customPlayers if data is provided and enables split screen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/splitScreen.lua:593
---@param data table|nil Possible serialized data.
function render_splitScreen.onExtensionLoaded(data) end

--- Unload hook: alias of disable(preserveRoute). Destroys the views, renders the world on the main view, resets exposure to zero and restores the 'play' game route unless preserveRoute.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/splitScreen.lua:396
---@param preserveRoute boolean|nil If true, does not change the game route.
function render_splitScreen.onExtensionUnloaded(preserveRoute) end

--- Hook called before a GE Lua reload: returns {customPlayers} and disables split screen while keeping the route, to destroy the C++ views.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/splitScreen.lua:571
---@param reason string Reason for serialization (used in the log).
---@return table  {customPlayers = ...}.
function render_splitScreen.onSerialize(reason) end

--- Hook called when settings change: rebuilds the view quality overrides, which are a snapshot of the global settings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/splitScreen.lua:448
function render_splitScreen.onSettingsChanged() end

--- Hook called every frame: recomputes the configuration (players, window size, layout) and updates the players' compass markers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/splitScreen.lua:440
---@param dtReal number Real frame duration (s).
---@param dtSim number Simulated duration (s), unused.
function render_splitScreen.onUpdate(dtReal, dtSim) end

--- Forces the layout to be recomputed on the next pass (resets the remembered size) and does it right away if active.
---Source: lua/ge/extensions/render/splitScreen.lua:556
function render_splitScreen.refreshLayout() end

--- Forces the list of players that must have a view (e.g. for a mission), or removes it with nil. An empty list is equivalent to nil. If split screen is active, recomputes right away.
---Source: lua/ge/extensions/render/splitScreen.lua:360
---@param players integer[]|nil Ordered player indices, or nil to clear the override.
function render_splitScreen.setCustomPlayers(players) end

--- Switches this player's own view to the next camera group (core_camera.cycleCameraGroup).
---Source: lua/ge/extensions/render/splitScreen.lua:549
---@param player integer Player index.
---@return boolean  false if the player has no split screen view (the caller can then use the main camera toggle).
function render_splitScreen.toggleFreeCam(player) end

