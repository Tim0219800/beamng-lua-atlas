---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/roadSectionPenaltyKeeper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Détecteur de pénalités de liaison. Champs : manager, recalcCount, violationCount, lastCheckTime.
---@class gameplay_rally_loop_roadSectionPenaltyKeeper
local gameplay_rally_loop_roadSectionPenaltyKeeper = {}

--- Incrémente violationCount et renvoie la donnée de pénalité {type = 'liaison_deviation', amount, data = {violationNumber, recalcCount}} avec amount = 30, 60, 120 puis 180 s.
---Source : lua/ge/extensions/gameplay/rally/loop/roadSectionPenaltyKeeper.lua:37
---@return table  Données de pénalité.
function gameplay_rally_loop_roadSectionPenaltyKeeper:createPenaltyData() end

--- Mémorise le gestionnaire et remet les compteurs à zéro. Appelé par le constructeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/roadSectionPenaltyKeeper.lua:20
---@param manager table rallyLoopManager (utilise manager.clock et manager:recordRouteRecalcPenalty).
function gameplay_rally_loop_roadSectionPenaltyKeeper:init(manager) end

--- Appelé à chaque frame par le gestionnaire. Toutes les 10 s (temps manager.clock), si recalcCount > 5 et violationCount < MAX_VIOLATIONS, appelle manager:recordRouteRecalcPenalty(createPenaltyData()) et remet recalcCount à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/roadSectionPenaltyKeeper.lua:58
---@return boolean|nil  false si la fenêtre de 10 s n'est pas écoulée, sinon nil.
function gameplay_rally_loop_roadSectionPenaltyKeeper:onUpdate() end

--- Incrémente le compteur de recalculs d'itinéraire ; à appeler à chaque recalcul de route détecté.
---Source : lua/ge/extensions/gameplay/rally/loop/roadSectionPenaltyKeeper.lua:33
function gameplay_rally_loop_roadSectionPenaltyKeeper:registerRecalc() end

--- Remet recalcCount et violationCount à 0.
---Source : lua/ge/extensions/gameplay/rally/loop/roadSectionPenaltyKeeper.lua:28
function gameplay_rally_loop_roadSectionPenaltyKeeper:reset() end

