---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/recoveryClockAdvance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Table des pénalités de chronomètre appliquées à chaque récupération du véhicule (reset) en rallye. Une récupération coûte un nombre fixe de secondes, indépendant de la longueur de l'étape. Sur une spéciale : 5 s pour un recovery, 0 s pour un flip (retournement). Hors spéciale (liaison) : 60 s et 10 s. Utilisé par rallyManager:addRecoveryRaceTime.
--- Accès : extension `gameplay_rally_recoveryClockAdvance` : `extensions.load("gameplay_rally_recoveryClockAdvance")`, puis la globale `gameplay_rally_recoveryClockAdvance`
---@class gameplay_rally_recoveryClockAdvance
---@field nonSpecialStageSeconds table<string, number> Pénalités hors spéciale : recovery = 60, flip = 10.
---@field specialStageSeconds table<string, number> Pénalités sur une spéciale : recovery = 5, flip = 0 (le chemin de code est gardé mais n'ajoute rien).
gameplay_rally_recoveryClockAdvance = {}

--- Renvoie la pénalité en secondes selon que l'étape est une spéciale ou non ; 0 si le type est inconnu.
---Source : lua/ge/extensions/gameplay/rally/recoveryClockAdvance.lua:24
---@param recoveryType string "recovery" ou "flip"
---@param isSpecialStage boolean true pour une spéciale, false pour une liaison / autre étape
---@return number  Secondes ajoutées au chrono
function gameplay_rally_recoveryClockAdvance.getSeconds(recoveryType, isSpecialStage) end

--- Renvoie la pénalité en secondes pour un type de récupération sur une spéciale ; 0 si le type est inconnu.
---Source : lua/ge/extensions/gameplay/rally/recoveryClockAdvance.lua:20
---@param recoveryType string "recovery" ou "flip"
---@return number  Secondes ajoutées au chrono
function gameplay_rally_recoveryClockAdvance.getSpecialStageSeconds(recoveryType) end

