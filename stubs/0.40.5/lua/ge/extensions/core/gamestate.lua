---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/gamestate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_gamestate`: two roles. (1) Store the GAME state (freeroam, campaign… with app layout and menu items) and broadcast it to the extensions and the UI. (2) Drive the loading screen: modules request to show it (requestEnterLoadingScreen) and to close it (requestExitLoadingScreen); the screen only closes when ALL requesters have finished. A modder uses it to show the loading screen during a long task.
--- Access: extension `core_gamestate`: `extensions.load("core_gamestate")`, then the global `core_gamestate`
---@class core_gamestate
---@field state table Current game state {state, appLayout, menuItems, options}; {} at start and after a return to the main menu.
core_gamestate = {}

--- Returns the game state name if it is non-empty (also displays the state via dump(), debug).
---Source: lua/ge/extensions/core/gamestate.lua:43
---@return string|nil  State name or nil.
function core_gamestate.gameStateDecorator() end

--- Deep copy of the game state.
---Source: lua/ge/extensions/core/gamestate.lua:39
---@return table  Copy of M.state.
function core_gamestate.getGameState() end

--- State of a module's request.
---Source: lua/ge/extensions/core/gamestate.lua:97
---@param tagName string Requester identifier.
---@return boolean|nil  true = requested, false = finished, nil = never requested.
function core_gamestate.getLoadingStatus(tagName) end

--- Indicates whether at least one module requests the loading screen. Not to be used during the loading process itself (the code advises against it); prefer getLoadingStatus.
---Source: lua/ge/extensions/core/gamestate.lua:93
---@return boolean  true if a loading is requested.
function core_gamestate.loading() end

--- Called by the UI when the loading screen is actually displayed: sets loadingActive and executes the pending callbacks.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/gamestate.lua:169
function core_gamestate.loadingScreenActive() end

--- Called by the UI when the loading screen is closed: resets the audio parameters to 0, signals LoadingManager and emits the onLoadingScreenInactive hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/gamestate.lua:175
---@param state number|string State sent by the UI (converted to a number if possible).
function core_gamestate.loadingScreenInactive(state) end

--- UI route change hook: updates the main menu music if the global functions exist.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/gamestate.lua:224
---@param context table Context with toRoute.name.
function core_gamestate.onAfterRouteChange(context) end

--- Restore hook: does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/gamestate.lua:184
---@param data any Not used.
function core_gamestate.onDeserialized(data) end

--- Called when the extension loads: asks the UI to report its initialization (guihooks requestUIInitialised).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/gamestate.lua:202
function core_gamestate.onExtensionLoaded() end

--- Hook (alias of uiReady) called when the UI is ready: if a loading was waiting for the UI, re-emits LoadingScreen {active = true}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/gamestate.lua:187
function core_gamestate.onUIInitialised() end

--- Per-frame hook: if callbacks have been waiting for the loading screen for more than 1 s (accumulated time capped at 1/30 s per frame), forces loadingScreenActive.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/gamestate.lua:210
---@param dtReal number Real-time delta in seconds.
---@param dtSim number Simulation delta.
---@param dtRaw number Raw delta.
function core_gamestate.onUpdate(dtReal, dtSim, dtRaw) end

--- Requests the display of the loading screen on behalf of a module. On the first request, sends LoadingScreen {active = true} and sets the audio parameters g_GameLoading=1 and g_FadeTimeMS=1000. func is called when the screen is ready.
---Source: lua/ge/extensions/core/gamestate.lua:101
---@param tagName string Requester identifier (same name to reuse for the exit). nil: ignored.
---@param func function|nil Callback to execute when the screen is displayed.
function core_gamestate.requestEnterLoadingScreen(tagName, func) end

--- Indicates that the requester has finished. When all have finished, the loading screen is hidden (LoadingScreen {active = false, gotoMainMenu, gameState}) and the callback queue is cleared.
---Source: lua/ge/extensions/core/gamestate.lua:141
---@param tagName string Same identifier as for the entry. An unknown tag produces a warning.
---@param ignoreMenuswitch boolean|nil Not used in the code.
function core_gamestate.requestExitLoadingScreen(tagName, ignoreMenuswitch) end

--- Broadcasts the current game state: onGameStateUpdate hook and UI event GameStateUpdate (alias of sendGameState).
---Source: lua/ge/extensions/core/gamestate.lua:23
function core_gamestate.requestGameState() end

--- Tells the UI whether to show the main menu background (guihooks ShowEntertainingBackground): true when getMissionFilename() is empty. Does not change the UI route.
---Source: lua/ge/extensions/core/gamestate.lua:59
---@return boolean  true if no level is loaded.
function core_gamestate.requestMainMenuState() end

--- Updates the game state (freeroam, campaign…) then broadcasts it. nil parameters keep the old value.
---Source: lua/ge/extensions/core/gamestate.lua:29
---@param state string|nil Name of the game state.
---@param appLayout any UI apps layout (inferred from code).
---@param menuItems any Menu items (inferred from code).
---@param options any Additional options.
function core_gamestate.setGameState(state, appLayout, menuItems, options) end

