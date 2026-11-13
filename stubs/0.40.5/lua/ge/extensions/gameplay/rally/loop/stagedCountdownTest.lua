---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/stagedCountdownTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de test. Champs : epoch (secondes écoulées depuis le début), environmentStartTimeSecs (heure murale de départ en secondes), scheduledEventTime (époque de l'évènement planifié).
---@class gameplay_rally_loop_stagedCountdownTest
local gameplay_rally_loop_stagedCountdownTest = {}

--- Planifie scheduledEventTime à la prochaine minute pleine de l'horloge murale ; s'il reste moins de 15 s avant, utilise la minute suivante. Le résultat est exprimé en époque (relative au démarrage).
---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownTest.lua:39
function gameplay_rally_loop_stagedCountdownTest:calculateScheduledEventTime() end

--- Heure murale simulée = (environmentStartTimeSecs + epoch) modulo 86400.
---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownTest.lua:106
---@return number|nil  Secondes depuis minuit.
function gameplay_rally_loop_stagedCountdownTest:getWallClockTime() end

--- Lit l'heure de l'environnement, initialise epoch = 0 et planifie l'évènement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownTest.lua:17
function gameplay_rally_loop_stagedCountdownTest:init() end

--- Replanifie l'évènement : minute pleine suivant l'ancienne heure plus slotSizeMinutes minutes. Marque comme déjà déclenchés les avertissements dont le délai restant est déjà passé.
---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownTest.lua:71
---@param slotSizeMinutes number Taille du créneau ajouté, en minutes.
---@param rescheduleCount integer Nombre de replanifications déjà faites (sert seulement au log).
---@param maxReschedules integer Nombre maximal de replanifications (log).
---@param defaultWarningTimes number[] Délais d'avertissement en secondes avant l'évènement.
---@param warningsTriggered table<number, boolean> Table modifiée sur place : warningsTriggered[délai] = true si le délai est dépassé.
---@return boolean  Toujours true.
---@return number  Nouvelle époque de l'évènement planifié.
function gameplay_rally_loop_stagedCountdownTest:reschedule(slotSizeMinutes, rescheduleCount, maxReschedules, defaultWarningTimes, warningsTriggered) end

