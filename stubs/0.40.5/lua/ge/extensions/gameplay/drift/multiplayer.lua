---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/multiplayer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pont entre le gameplay de drift et le tableau de scores multijoueur (multiplayer_multiplayerScoreboard). Quand un spot de drift démarre, crée un scoreboard avec les colonnes potentialScore, driftLevel et score ; ensuite pousse le score du joueur, son niveau de drift, son statut (finishLine / disqualified) et pulse en rouge lors d'un crash. Ne fait rien si multiplayer_multiplayerScoreboard n'existe pas.
--- Accès : extension `gameplay_drift_multiplayer` : `extensions.load("gameplay_drift_multiplayer")`, puis la globale `gameplay_drift_multiplayer`
---@class gameplay_drift_multiplayer
---@field dependencies string[] gameplay_drift_general, chargé avant.
gameplay_drift_multiplayer = {}

--- Renvoie la table {default=false, canBeChanged=false} décrivant le réglage de debug de ce module (utilisée par la fenêtre de debug drift).
---Source : lua/ge/extensions/gameplay/drift/multiplayer.lua:59
---@return table  {default = false, canBeChanged = false}
function gameplay_drift_multiplayer.getDriftDebugInfo() end

--- Hook : crash pendant un défi, fait pulser la couleur du joueur en rouge dans le scoreboard.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/multiplayer.lua:53
function gameplay_drift_multiplayer.onDriftCrash() end

--- Hook : pousse au scoreboard le score potentiel, le score et le niveau de drift courants, en contexte inFreeroamChallenge.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/multiplayer.lua:18
---@param data table Données du changement de score (inutilisées ici : le score est relu via gameplay_drift_scoring.getScore()).
function gameplay_drift_multiplayer.onDriftScoreChanged(data) end

--- Hook : spot échoué, pousse le statut "disqualified" au scoreboard.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/multiplayer.lua:46
function gameplay_drift_multiplayer.onDriftSpotFailed() end

--- Hook : ligne d'arrivée franchie, pousse le statut "finishLine" au scoreboard.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/multiplayer.lua:39
function gameplay_drift_multiplayer.onDriftSpotFinishLineCrossed() end

--- Hook : à l'entrée dans un spot de drift, crée un nouveau scoreboard multijoueur trié par score décroissant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/multiplayer.lua:25
---@param data table Contient lineId, passé à startNewScoreboard.
function gameplay_drift_multiplayer.onDriftSpotStarted(data) end

--- Appelé à chaque frame : envoie le niveau de drift au scoreboard s'il a changé depuis la dernière frame.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/multiplayer.lua:72
function gameplay_drift_multiplayer.onUpdate() end

