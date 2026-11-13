---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/penalties.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Calcul des pénalités de contrôle horaire (time control) d'une boucle de rallye : arrivée en avance, en retard, faux départ. Le temps est comparé à la minute près (arrivée dans la même minute que l'heure prévue = à l'heure). Chaque minute d'écart coûte 10 s.
--- Accès : extension `gameplay_rally_loop_penalties` : `extensions.load("gameplay_rally_loop_penalties")`, puis la globale `gameplay_rally_loop_penalties`
---@class gameplay_rally_loop_penalties
---@field falseStartPenaltySeconds number Pénalité de faux départ en secondes (10).
---@field timeControlPenaltySecondsPerMinute number Pénalité en secondes par minute d'avance ou de retard (10).
gameplay_rally_loop_penalties = {}

--- Pénalité d'une arrivée en avance : minutesEarly multiplié par timeControlPenaltySecondsPerMinute.
---Source : lua/ge/extensions/gameplay/rally/loop/penalties.lua:14
---@param minutesEarly number Nombre de minutes d'avance.
---@return number  Pénalité en secondes.
function gameplay_rally_loop_penalties.calculateEarlyPenalty(minutesEarly) end

--- Pénalité de faux départ ; constante, indépendante du nombre de faux départs.
---Source : lua/ge/extensions/gameplay/rally/loop/penalties.lua:26
---@param falseStartCount integer Nombre de faux départs (ignoré).
---@return number  falseStartPenaltySeconds.
function gameplay_rally_loop_penalties.calculateFalseStartPenalty(falseStartCount) end

--- Pénalité d'une arrivée en retard : minutesLate multiplié par timeControlPenaltySecondsPerMinute.
---Source : lua/ge/extensions/gameplay/rally/loop/penalties.lua:22
---@param minutesLate number Nombre de minutes de retard.
---@return number  Pénalité en secondes.
function gameplay_rally_loop_penalties.calculateLatePenalty(minutesLate) end

--- Détermine si l'arrivée à un point de contrôle est en avance, à l'heure ou en retard, et calcule la pénalité associée.
---Source : lua/ge/extensions/gameplay/rally/loop/penalties.lua:38
---@param actualTime number|nil Heure d'arrivée réelle, epoch en secondes.
---@param scheduledTime number|nil Heure prévue, epoch en secondes (peut être nil).
---@return table  {status = 'early'|'on-time'|'late', totalPenalty, hasPenalty, penalties}. Chaque élément de penalties : {type = 'time_control_early'|'time_control_late', amount, data = {minutesEarly|minutesLate, actualMinute, scheduledMinute}} pour l'i18n.
function gameplay_rally_loop_penalties.getTimingStatus(actualTime, scheduledTime) end

