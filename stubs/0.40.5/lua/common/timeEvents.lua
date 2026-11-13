---@meta
-- tim19Atlas stub generated from lua/common/timeEvents.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit planificateur : permet de programmer l'exécution d'une fonction dans X secondes, à la manière de `schedule()`. On crée une liste d'événements avec require('timeEvents').create(), on y ajoute des événements, et on appelle process(dt) à chaque mise à jour.
--- Accès : `require("timeEvents")`
---@class timeEvents
local timeEvents = {}

--- Crée et renvoie une nouvelle liste d'événements temporels vide.
---Source : lua/common/timeEvents.lua:46
---@return table  objet avec méthodes addEvent, clear, process
function timeEvents.create() end

--- Objet renvoyé par create(). Les événements sont stockés comme éléments du tableau.
---@class timeEvents_mt
local timeEvents_mt = {}

--- Programme fn dans `time` secondes.
---Source : lua/common/timeEvents.lua:27
---@param time number délai en secondes
---@param fn function fonction sans argument à exécuter
function timeEvents_mt:addEvent(time, fn) end

--- Supprime tous les événements en attente.
---Source : lua/common/timeEvents.lua:31
function timeEvents_mt:clear() end

--- À appeler à chaque mise à jour : fait avancer les délais de dt et exécute les événements arrivés à échéance.
---Source : lua/common/timeEvents.lua:35
---@param dt number temps écoulé en secondes
function timeEvents_mt:process(dt) end

return timeEvents
