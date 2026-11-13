---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Journal d'évènements. Champs d'instance : items (liste ordonnée), itemsByEventGroup (table eventGroup -> liste), aggregatedItems (totalPenalty, totalStageTime, totalTime, penaltySummary).
---@class gameplay_rally_loop_rallyEventLog
local gameplay_rally_loop_rallyEventLog = {}

--- Construit le résumé des pénalités par groupe puis par penaltyType.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:115
function gameplay_rally_loop_rallyEventLog:_calcPenaltySummary() end

--- Somme data.amount des items de type 'penalty'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:95
function gameplay_rally_loop_rallyEventLog:_calcTotalPenalty() end

--- Somme data.stageTimeSecs de tous les items.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:105
function gameplay_rally_loop_rallyEventLog:_calcTotalStageTime() end

--- Ajoute une entrée au journal et au groupe de l'évènement, puis recalcule les agrégats. eventId et eventGroup valent 'unknown' s'ils sont absents.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:19
---@param event table Évènement source avec eventId et eventGroup.
---@param timestamp number Horodatage de l'entrée.
---@param type string Type d'entrée, par exemple 'penalty'.
---@param data table Données libres (amount, penaltyType, stageTimeSecs…).
function gameplay_rally_loop_rallyEventLog:addItem(event, timestamp, type, data) end

--- Vide le journal (items et groupes) et log un message de debug. Les agrégats ne sont pas recalculés.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:185
function gameplay_rally_loop_rallyEventLog:clear() end

--- Renvoie tous les items dans l'ordre d'ajout.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:55
---@return table  Liste d'items.
function gameplay_rally_loop_rallyEventLog:getAllItems() end

--- Renvoie les items d'un groupe d'évènements (table vide si aucun).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:51
---@param eventGroup string Nom du groupe.
---@return table  Liste d'items.
function gameplay_rally_loop_rallyEventLog:getItemsByEventGroup(eventGroup) end

--- Renvoie les items dont le type correspond.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:59
---@param type string Type recherché.
---@return table  Liste d'items.
function gameplay_rally_loop_rallyEventLog:getItemsByType(type) end

--- Résumé des pénalités : {totalPenalty, groups = {{eventGroup, totalPenalty, penalties = {{type, count, amount}}}}}. Les groupes suivent l'ordre de première apparition, les pénalités sont triées par type.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:91
---@return table  Résumé (par défaut {totalPenalty=0, groups={}}).
function gameplay_rally_loop_rallyEventLog:getPenaltySummary() end

--- Renvoie les items qui portent data.stageTimeSecs (un par spéciale terminée).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:69
---@return table  Liste d'items.
function gameplay_rally_loop_rallyEventLog:getStageTimes() end

--- Pénalité totale en secondes (0 si rien).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:79
---@return number  Secondes.
function gameplay_rally_loop_rallyEventLog:getTotalPenalty() end

--- Somme des temps de spéciales en secondes.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:83
---@return number  Secondes.
function gameplay_rally_loop_rallyEventLog:getTotalStageTime() end

--- Temps de spéciales plus pénalités, en secondes.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:87
---@return number  Secondes.
function gameplay_rally_loop_rallyEventLog:getTotalTime() end

--- Initialise les listes vides. Appelé par le constructeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:9
function gameplay_rally_loop_rallyEventLog:init() end

--- Recalcule totalPenalty, totalStageTime, totalTime et penaltySummary. Appelé par addItem.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:43
function gameplay_rally_loop_rallyEventLog:recalculateAggregatedItems() end

