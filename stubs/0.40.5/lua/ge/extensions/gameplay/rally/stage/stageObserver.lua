---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/stage/stageObserver.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet observateur renvoyé par le constructeur ; options facultatives : authorityMode, checkWindowBehindMeters, checkWindowAheadMeters, missWindowBehindMeters.
---@class gameplay_rally_stage_stageObserver
local gameplay_rally_stage_stageObserver = {}

--- Renvoie le mode d'autorité courant.
---Source : lua/ge/extensions/gameplay/rally/stage/stageObserver.lua:151
---@return string  'tracker' ou 'shadow'
function gameplay_rally_stage_stageObserver:getAuthorityMode() end

--- Temps de fin d'étape s'il est connu, sinon dernier temps d'étape échantillonné.
---Source : lua/ge/extensions/gameplay/rally/stage/stageObserver.lua:325
---@return number|nil  secondes
function gameplay_rally_stage_stageObserver:getStageTime() end

--- Instantané : authorityMode, stageComplete, stageFinishTime, currentStageTime, currentStageTimeRounded (au dixième), trackerState, raceActive, raceComplete.
---Source : lua/ge/extensions/gameplay/rally/stage/stageObserver.lua:330
---@return table  État
function gameplay_rally_stage_stageObserver:getState() end

--- Initialise le mode d'autorité, les tailles de fenêtres et le stockage des coins, puis appelle reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/stage/stageObserver.lua:137
---@param options table|nil Voir description de la classe
function gameplay_rally_stage_stageObserver:init(options) end

--- Renseigne splitData.time et splitData.source ('race') s'ils sont absents.
---Source : lua/ge/extensions/gameplay/rally/stage/stageObserver.lua:220
---@param splitData table|nil Données du split
---@param time number Temps du split en secondes
function gameplay_rally_stage_stageObserver:recordRaceSplit(splitData, time) end

--- Remet à zéro la distance précédente, l'index de départ d'observation, l'emprise précédente, l'état de fin d'étape, les dernières valeurs et le compteur updateSerial.
---Source : lua/ge/extensions/gameplay/rally/stage/stageObserver.lua:155
function gameplay_rally_stage_stageObserver:reset() end

--- Oublie la distance et l'emprise précédentes pour éviter un faux franchissement après une téléportation.
---Source : lua/ge/extensions/gameplay/rally/stage/stageObserver.lua:173
function gameplay_rally_stage_stageObserver:resetAfterTeleport() end

--- Oublie l'emprise précédente : la prochaine update ne fait que la mémoriser, sans détecter de franchissement.
---Source : lua/ge/extensions/gameplay/rally/stage/stageObserver.lua:169
function gameplay_rally_stage_stageObserver:resetFootprint() end

--- Définit le mode d'autorité : 'tracker' ou, pour toute autre valeur, 'shadow'.
---Source : lua/ge/extensions/gameplay/rally/stage/stageObserver.lua:147
---@param mode string 'tracker' ou 'shadow'
function gameplay_rally_stage_stageObserver:setAuthorityMode(mode) end

--- Met à jour l'observation pour la frame : lit le temps d'étape, récupère les coins du véhicule, avance la fenêtre d'observation, teste le franchissement des pathnodes proches et met à jour trackerObserved/trackerMissed, trackerTime, time et source, ainsi que stageTimingState.
---Source : lua/ge/extensions/gameplay/rally/stage/stageObserver.lua:226
---@param context table {tracker (distFromStart, state), pathnodeObservationList (ou splitList), vehId, raceData, stageTime, stageFrameStartTime, stageFrameDt, stageTimingState}
function gameplay_rally_stage_stageObserver:update(context) end

