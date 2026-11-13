---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplayScoreboard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_gameplayScoreboard` : `extensions.load("ui_gameplayScoreboard")`, puis la globale `ui_gameplayScoreboard`
---@class ui_gameplayScoreboard
ui_gameplayScoreboard = {}

---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:86
function ui_gameplayScoreboard.clear() end

---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:100
---@param playerId any
---@param name any
---@param color any
---@param playerIndex any
function ui_gameplayScoreboard.ensurePlayer(playerId, name, color, playerIndex) end

---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:147
function ui_gameplayScoreboard.getPlayers() end

---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:96
function ui_gameplayScoreboard.isActive() end

---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:137
---@param playerId any
---@param color any
function ui_gameplayScoreboard.pulsePlayerColor(playerId, color) end

---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:142
---@param id any
function ui_gameplayScoreboard.setLocalMPClientId(id) end

---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:115
---@param playerId any
---@param color any
function ui_gameplayScoreboard.setPlayerColor(playerId, color) end

---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:110
---@param playerId any
---@param name any
function ui_gameplayScoreboard.setPlayerName(playerId, name) end

--- @param _scoreboardStyle table  the style definition for the scoreboard UI
---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:152
---@param _scoreboardStyle any
function ui_gameplayScoreboard.startNewScoreboard(_scoreboardStyle) end

---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:121
---@param playerId any
---@param scores any
function ui_gameplayScoreboard.updatePlayerScores(playerId, scores) end

---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:130
---@param playerId any
---@param status any
function ui_gameplayScoreboard.updatePlayerStatus(playerId, status) end

