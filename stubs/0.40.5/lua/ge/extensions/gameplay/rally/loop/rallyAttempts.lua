---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/rallyAttempts.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Crée et enregistre une tentative (attempt) de mission pour une boucle de rallye (rally loop) à travers le système de progression des missions (gameplay_missions_progress). Une tentative de fin normale reçoit le temps total, la pénalité, les temps de chaque spéciale (timeSS1, timeSS2…), les données du véhicule et les étoiles gagnées ; une tentative DNF (abandon ou redémarrage) ne reçoit que le type de DNF et le véhicule. Appelé par le gestionnaire de boucle (rallyLoopManager) via l'objet mgr.
--- Accès : extension `gameplay_rally_loop_rallyAttempts` : `extensions.load("gameplay_rally_loop_rallyAttempts")`, puis la globale `gameplay_rally_loop_rallyAttempts`
---@class gameplay_rally_loop_rallyAttempts
gameplay_rally_loop_rallyAttempts = {}

--- Crée une tentative abandonnée (DNF) : marque attempt.dnf = true, enregistre le dnfType et l'id de la mission courante, ajoute le véhicule, agrège et sauvegarde. Aucune étoile ni temps n'est enregistré.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyAttempts.lua:85
---@param mgr table Gestionnaire de boucle (rallyLoopManager) : doit fournir getRallyLoopMissionId et getCurrentMissionId.
---@param dnfType string Type de DNF : "restart" ou "abandon".
---@return table|nil  L'objet attempt créé (nil si l'id de mission est introuvable).
---@return table|nil  Résultat d'agrégation (totalChange).
function gameplay_rally_loop_rallyAttempts.createRallyLoopAttemptForDnf(mgr, dnfType) end

--- Crée une tentative de fin normale : temps et pénalités de mgr, temps de chaque spéciale, véhicule du joueur, notation en étoiles (RallyLoopStars.gradeAttempt), agrégation dans la progression de la mission, puis sauvegarde.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyAttempts.lua:66
---@param mgr table Gestionnaire de boucle (rallyLoopManager) : doit fournir getRallyLoopMissionId, getTotalPenalty, getTotalTime, getEventLog et éventuellement getRallyLoopMission.
---@return table|nil  L'objet attempt créé (nil si l'id de mission est introuvable).
---@return table|nil  Résultat d'agrégation (totalChange) renvoyé par gameplay_missions_progress.aggregateAttempt.
function gameplay_rally_loop_rallyAttempts.createRallyLoopAttemptForFinish(mgr) end

