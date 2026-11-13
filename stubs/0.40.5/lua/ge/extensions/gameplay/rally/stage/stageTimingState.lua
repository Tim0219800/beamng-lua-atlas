---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet d'état de chronométrage.
---@class gameplay_rally_stage_stageTimingState
local gameplay_rally_stage_stageTimingState = {}

--- Ajoute des secondes au temps écoulé (pénalité, par exemple de récupération).
---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:50
---@param seconds number Secondes à ajouter, > 0
---@return boolean  true si le temps a été ajouté
function gameplay_rally_stage_stageTimingState:addTime(seconds) end

--- Fait avancer le chrono de dt s'il est actif et non terminé, en mémorisant le début et la durée de la frame ; sinon frameDt vaut 0.
---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:39
---@param dt number|nil Pas de temps en secondes (0 si nil)
function gameplay_rally_stage_stageTimingState:advance(dt) end

--- Termine le chrono : statut 'complete', fige finishTime et elapsedTime.
---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:60
---@param time number|nil Temps de fin ; temps écoulé actuel si nil
function gameplay_rally_stage_stageTimingState:completeAt(time) end

--- Durée de la dernière frame traitée par advance (0 si inactif).
---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:143
---@return number  secondes
function gameplay_rally_stage_stageTimingState:getFrameDt() end

--- Temps au début de la dernière frame traitée par advance.
---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:139
---@return number  secondes
function gameplay_rally_stage_stageTimingState:getFrameStartTime() end

--- Liste des pathnodeId dans l'ordre d'enregistrement.
---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:123
---@return table  splitOrder
function gameplay_rally_stage_stageTimingState:getSplitOrder() end

--- Table des splits indexée par pathnodeId.
---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:119
---@return table  splitTimes
function gameplay_rally_stage_stageTimingState:getSplitTimes() end

--- Instantané de l'état : status, active, complete, elapsedTime, finishTime, frameStartTime, frameDt, splitTimes, splitOrder (les tables de splits sont partagées, pas copiées).
---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:147
---@return table  État
function gameplay_rally_stage_stageTimingState:getState() end

--- Temps de fin s'il existe, sinon temps écoulé (secondes).
---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:135
---@return number  secondes
function gameplay_rally_stage_stageTimingState:getTime() end

--- Appelle reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:7
function gameplay_rally_stage_stageTimingState:init() end

--- Vrai si le chrono tourne (actif et non terminé).
---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:127
---@return boolean
function gameplay_rally_stage_stageTimingState:isActive() end

--- Vrai si le chrono est terminé.
---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:131
---@return boolean
function gameplay_rally_stage_stageTimingState:isComplete() end

--- Marque un split comme manquant (sans temps) avec une raison ; l'entrée remplace une éventuelle entrée existante.
---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:95
---@param splitData table Même structure que recordSplit
---@param reason string|nil Raison (par défaut splitData.missingReason ou 'missing')
---@return table|nil  Entrée enregistrée
function gameplay_rally_stage_stageTimingState:markSplitMissing(splitData, reason) end

--- Enregistre un temps intermédiaire pour un point de chemin, si splitData.isSplitTiming. Complète splitData.time et splitData.source si absents.
---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:68
---@param splitData table {isSplitTiming, pathnodeId, pathnodeName, pathnodeType, splitLabel}
---@param time number|nil Temps du split (temps courant si nil)
---@param source string|nil Origine du temps ('tracker' par défaut)
---@return table|nil  Entrée enregistrée, nil si splitData invalide
function gameplay_rally_stage_stageTimingState:recordSplit(splitData, time, source) end

--- Remet tout à zéro : statut idle, inactif, non terminé, temps 0, aucun split.
---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:11
function gameplay_rally_stage_stageTimingState:reset() end

--- Active ou met en pause le chrono (statut 'active' / 'idle'). Sans effet si le chrono est terminé (il reste inactif).
---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:23
---@param active boolean true pour démarrer/reprendre (seule la valeur true stricte compte)
function gameplay_rally_stage_stageTimingState:setActive(active) end

