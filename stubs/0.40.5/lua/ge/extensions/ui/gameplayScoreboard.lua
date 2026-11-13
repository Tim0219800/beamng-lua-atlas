---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplayScoreboard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Couche de données de tableau des scores, indépendante de la source (écran partagé local ou réseau multijoueur). Garde l'état des joueurs (nom, couleur, scores, statut, rang) et le pousse à l'UI par le stream « scoreboard » (guihooks.queueStream). Le tri se fait selon le style (orderBy.key, direction asc/desc), les joueurs « disqualified » passant après les autres ; les ex-aequo partagent le rang.
--- Accès : extension `ui_gameplayScoreboard` : `extensions.load("ui_gameplayScoreboard")`, puis la globale `ui_gameplayScoreboard`
---@class ui_gameplayScoreboard
ui_gameplayScoreboard = {}

--- Vide les joueurs, remet le style par défaut, désactive le tableau et pousse l'état vide à l'UI.
---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:86
function ui_gameplayScoreboard.clear() end

--- Crée le joueur s'il n'existe pas (nom par défaut = playerId, scores vides) ; sinon met à jour couleur, index et nom fournis (non nil). Ne pousse pas à l'UI.
---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:100
---@param playerId string Identifiant du joueur (stocké aussi dans mpClientId).
---@param name string|nil Nom affiché.
---@param color any Couleur du joueur (format transmis tel quel à l'UI).
---@param playerIndex integer|nil Index du joueur, sert de départage au tri.
function ui_gameplayScoreboard.ensurePlayer(playerId, name, color, playerIndex) end

--- Renvoie la table des joueurs (playerId -> {mpClientId, name, scores, status, color, playerIndex, rank}).
---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:147
---@return table<string, table>  Table interne des joueurs (non copiée).
function ui_gameplayScoreboard.getPlayers() end

--- Indique si un tableau est actif (startNewScoreboard appelé et pas de clear depuis).
---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:96
---@return boolean  true si actif.
function ui_gameplayScoreboard.isActive() end

--- Déclenche une pulsation de couleur sur la ligne du joueur via guihooks.trigger('scoreboardPlayerPulseColor', {mpClientId, color}). Sans effet si inactif.
---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:137
---@param playerId string Identifiant du joueur.
---@param color any Couleur de la pulsation.
function ui_gameplayScoreboard.pulsePlayerColor(playerId, color) end

--- Indique à l'UI quel joueur est le client local (mpClientId) et pousse l'état.
---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:142
---@param id string|nil Identifiant du joueur local.
function ui_gameplayScoreboard.setLocalMPClientId(id) end

--- Change la couleur d'un joueur (le crée au besoin) et pousse à l'UI.
---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:115
---@param playerId string Identifiant du joueur.
---@param color any Nouvelle couleur.
function ui_gameplayScoreboard.setPlayerColor(playerId, color) end

--- Change le nom d'un joueur (le crée au besoin). N'envoie pas de mise à jour à l'UI.
---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:110
---@param playerId string Identifiant du joueur.
---@param name string Nouveau nom.
function ui_gameplayScoreboard.setPlayerName(playerId, name) end

--- Réinitialise (clear), active le tableau avec le style donné et pousse l'état à l'UI.
---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:152
---@param _scoreboardStyle table|nil Définition du style : entries (liste {key, name, order, type}) et orderBy ({key, direction}). Défaut : style à une colonne score.
function ui_gameplayScoreboard.startNewScoreboard(_scoreboardStyle) end

--- Fusionne les valeurs données dans les scores du joueur (clé par clé) et pousse à l'UI. Sans effet si le tableau n'est pas actif.
---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:121
---@param playerId string Identifiant du joueur.
---@param scores table<string, number> Valeurs par clé de colonne (ex. {score = 10}).
function ui_gameplayScoreboard.updatePlayerScores(playerId, scores) end

--- Définit le statut d'un joueur (ex. "disqualified" le classe en dernier) et pousse à l'UI. Sans effet si inactif.
---Source : lua/ge/extensions/ui/gameplayScoreboard.lua:130
---@param playerId string Identifiant du joueur.
---@param status string|nil Statut ; seule la valeur "disqualified" est interprétée par le tri.
function ui_gameplayScoreboard.updatePlayerStatus(playerId, status) end

