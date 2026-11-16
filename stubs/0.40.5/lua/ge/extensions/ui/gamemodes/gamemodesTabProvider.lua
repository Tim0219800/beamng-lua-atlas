---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Facade used by the UI's "game modes" tab. Depending on whether a multiplayer session exists (multiplayer_sessionManager.getCurrentSession() non-nil), calls are redirected to multiplayer_uiBackend_multiplayerUIManager, otherwise to gameplay_multiseat_gamemodeManager (split screen). Each function checks that the target module is loaded and does nothing otherwise.
--- Access: extension `ui_gamemodes_gamemodesTabProvider`: `extensions.load("ui_gamemodes_gamemodesTabProvider")`, then the global `ui_gamemodes_gamemodesTabProvider`
---@class ui_gamemodes_gamemodesTabProvider
ui_gamemodes_gamemodesTabProvider = {}

--- Network only: the host deselects the mode (deselectGamemodeForOwner).
---Source: lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua:61
function ui_gamemodes_gamemodesTabProvider.deselectGamemode() end

--- Requests that the game mode data be sent to the UI (requestMultiplayerTabData on network, requestGamemodeData in split screen).
---Source: lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua:8
function ui_gamemodes_gamemodesTabProvider.requestGamemodeData() end

--- Network only: requests to change one's own role in the game mode.
---Source: lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua:93
---@param role any Requested role (inferred from code: passed as is).
function ui_gamemodes_gamemodesTabProvider.requestSetOwnGamemodeRole(role) end

--- Restarts a game mode in split screen (gamemodeManager.restart). No effect in a network session.
---Source: lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua:44
---@param name string Game mode name.
---@param settings table|nil Mode settings.
function ui_gamemodes_gamemodesTabProvider.restartGamemode(name, settings) end

--- Network only: the host selects a mode (selectGamemodeForOwner).
---Source: lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua:53
---@param name string Game mode name.
function ui_gamemodes_gamemodesTabProvider.selectGamemode(name) end

--- Network only: sets the host's role before the "ready" phase.
---Source: lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua:85
---@param role any Role (inferred from code: passed as is).
function ui_gamemodes_gamemodesTabProvider.setOwnerPreReadyRole(role) end

--- Starts a game mode (multiplayerUIManager.startGamemode or gamemodeManager.start).
---Source: lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua:20
---@param name string Game mode name.
---@param settings table|nil Mode settings (inferred from code: passed as is).
function ui_gamemodes_gamemodesTabProvider.startGamemode(name, settings) end

--- Network only: starts the players' "ready" phase for a mode.
---Source: lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua:69
---@param gamemodeInfo table Mode information (inferred from code: passed as is).
function ui_gamemodes_gamemodesTabProvider.startReadyUp(gamemodeInfo) end

--- Stops the current game mode (stopGamemode on network, stop in split screen).
---Source: lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua:32
function ui_gamemodes_gamemodesTabProvider.stopGamemode() end

--- Network only: stops the "ready" phase.
---Source: lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua:77
function ui_gamemodes_gamemodesTabProvider.stopReadyUp() end

