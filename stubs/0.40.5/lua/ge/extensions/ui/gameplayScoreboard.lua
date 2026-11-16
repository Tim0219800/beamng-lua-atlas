---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplayScoreboard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Scoreboard data layer, independent of the source (local split screen or multiplayer network). Keeps the players' state (name, color, scores, status, rank) and pushes it to the UI through the "scoreboard" stream (guihooks.queueStream). Sorting is done according to the style (orderBy.key, asc/desc direction), with "disqualified" players placed after the others; ties share the rank.
--- Access: extension `ui_gameplayScoreboard`: `extensions.load("ui_gameplayScoreboard")`, then the global `ui_gameplayScoreboard`
---@class ui_gameplayScoreboard
ui_gameplayScoreboard = {}

--- Empties the players, resets the default style, deactivates the scoreboard and pushes the empty state to the UI.
---Source: lua/ge/extensions/ui/gameplayScoreboard.lua:86
function ui_gameplayScoreboard.clear() end

--- Creates the player if it does not exist (default name = playerId, empty scores); otherwise updates the color, index and name provided (non-nil). Does not push to the UI.
---Source: lua/ge/extensions/ui/gameplayScoreboard.lua:100
---@param playerId string Player identifier (also stored in mpClientId).
---@param name string|nil Displayed name.
---@param color any Player color (format passed as is to the UI).
---@param playerIndex integer|nil Player index, used as the sort tiebreaker.
function ui_gameplayScoreboard.ensurePlayer(playerId, name, color, playerIndex) end

--- Returns the players table (playerId -> {mpClientId, name, scores, status, color, playerIndex, rank}).
---Source: lua/ge/extensions/ui/gameplayScoreboard.lua:147
---@return table<string, table>  Internal players table (not copied).
function ui_gameplayScoreboard.getPlayers() end

--- Indicates whether a scoreboard is active (startNewScoreboard called and no clear since).
---Source: lua/ge/extensions/ui/gameplayScoreboard.lua:96
---@return boolean  true if active.
function ui_gameplayScoreboard.isActive() end

--- Triggers a color pulse on the player's row via guihooks.trigger('scoreboardPlayerPulseColor', {mpClientId, color}). No effect if inactive.
---Source: lua/ge/extensions/ui/gameplayScoreboard.lua:137
---@param playerId string Player identifier.
---@param color any Pulse color.
function ui_gameplayScoreboard.pulsePlayerColor(playerId, color) end

--- Tells the UI which player is the local client (mpClientId) and pushes the state.
---Source: lua/ge/extensions/ui/gameplayScoreboard.lua:142
---@param id string|nil Local player identifier.
function ui_gameplayScoreboard.setLocalMPClientId(id) end

--- Changes a player's color (creates it if needed) and pushes to the UI.
---Source: lua/ge/extensions/ui/gameplayScoreboard.lua:115
---@param playerId string Player identifier.
---@param color any New color.
function ui_gameplayScoreboard.setPlayerColor(playerId, color) end

--- Changes a player's name (creates it if needed). Does not send an update to the UI.
---Source: lua/ge/extensions/ui/gameplayScoreboard.lua:110
---@param playerId string Player identifier.
---@param name string New name.
function ui_gameplayScoreboard.setPlayerName(playerId, name) end

--- Resets (clear), activates the scoreboard with the given style and pushes the state to the UI.
---Source: lua/ge/extensions/ui/gameplayScoreboard.lua:152
---@param _scoreboardStyle table|nil Style definition: entries (list of {key, name, order, type}) and orderBy ({key, direction}). Default: one-column score style.
function ui_gameplayScoreboard.startNewScoreboard(_scoreboardStyle) end

--- Merges the given values into the player's scores (key by key) and pushes to the UI. No effect if the scoreboard is not active.
---Source: lua/ge/extensions/ui/gameplayScoreboard.lua:121
---@param playerId string Player identifier.
---@param scores table<string, number> Values by column key (e.g. {score = 10}).
function ui_gameplayScoreboard.updatePlayerScores(playerId, scores) end

--- Sets a player's status (e.g. "disqualified" ranks them last) and pushes to the UI. No effect if inactive.
---Source: lua/ge/extensions/ui/gameplayScoreboard.lua:130
---@param playerId string Player identifier.
---@param status string|nil Status; only the value "disqualified" is interpreted by the sort.
function ui_gameplayScoreboard.updatePlayerStatus(playerId, status) end

