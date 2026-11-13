---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/timerModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module flowgraph (moduleOrder 0) qui gère des minuteurs. Il tient trois horloges globales cumulées (real, sim, raw) mises à jour par onUpdate avec dtReal, dtSim et dtRaw ; chaque minuteur référence l'une d'elles (mode 'dtSim', 'dtReal' ou 'dtRaw'), a un temps de départ, une durée (défaut 5 s) et peut être mis en pause. Les valeurs sont stockées dans un variableStorage et finalisées à la fin du tick.
--- Accès : `require("extensions/flowgraph/modules/timerModule")` (fichier sous extensions/ mais pas une extension classique)
---@class flowgraph_modules_timerModule
flowgraph_modules_timerModule = {}

--- Crée un minuteur et renvoie son id. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@param data table mode (défaut 'dtSim'), time (temps déjà écoulé, défaut 0), duration (défaut 5)
---@return integer  id du minuteur
function flowgraph_modules_timerModule.addTimer(data) end

--- Appelé après le tick du graphe : applique les pauses ou reprises en attente puis finalise les variables. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
function flowgraph_modules_timerModule.afterTrigger() end

--- Vide variables et minuteurs, remet les horloges globales à 0. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
function flowgraph_modules_timerModule.clear() end

--- Appelé à l'arrêt du projet : appelle clear(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
function flowgraph_modules_timerModule.executionStopped() end

--- Renvoie le temps écoulé : valeur figée si en pause, sinon horloge du mode moins le départ. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@param id integer id du minuteur
---@return number  temps écoulé (s)
function flowgraph_modules_timerModule.getElapsedTime(id) end

--- Incrémente et renvoie un id de minuteur. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@return integer  id
function flowgraph_modules_timerModule.getFreeId() end

--- Renvoie l'horloge globale du mode demandé. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@param mode string 'dtSim', 'dtReal' ou 'dtRaw'
---@return number  temps cumulé (s), 0 si mode inconnu
function flowgraph_modules_timerModule.getGlobalTime(mode) end

--- Renvoie l'objet minuteur complet (start, mode, duration, isPaused…). (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@param id integer id du minuteur
---@return table|nil  minuteur
function flowgraph_modules_timerModule.getTimer(id) end

--- Crée le variableStorage et appelle clear(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
function flowgraph_modules_timerModule.init() end

--- Vrai si le temps écoulé a atteint la durée. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@param id integer id du minuteur
---@return boolean  terminé
function flowgraph_modules_timerModule.isComplete(id) end

--- Appelé à chaque mise à jour du manager : ajoute dtReal, dtSim et dtRaw aux horloges globales. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@param dtReal number delta temps réel (s)
---@param dtSim number delta temps de simulation (s)
---@param dtRaw number delta temps brut (s)
function flowgraph_modules_timerModule.onUpdate(dtReal, dtSim, dtRaw) end

--- Change un champ du minuteur (start, mode, duration) via le variableStorage. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@param id integer id du minuteur
---@param field string start, mode ou duration
---@param val any nouvelle valeur
function flowgraph_modules_timerModule.set(id, field, val) end

--- Fixe le temps écoulé d'un minuteur (en pause : mémorise la valeur ; sinon recalcule le départ). (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@param id integer id du minuteur
---@param time number temps écoulé (s)
function flowgraph_modules_timerModule.setElapsedTime(id, time) end

--- Change le mode d'horloge du minuteur en conservant le temps écoulé (si non en pause). (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@param id integer id du minuteur
---@param mode string 'dtSim', 'dtReal' ou 'dtRaw'
function flowgraph_modules_timerModule.setMode(id, mode) end

--- Met en pause ou reprend un minuteur ; l'effet est appliqué dans afterTrigger. Ne fait rien si l'état demandé est déjà l'état actuel ; avertit si un drapeau est déjà posé. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@param id integer id du minuteur
---@param val boolean true = pause, false = reprise
function flowgraph_modules_timerModule.setPause(id, val) end

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/timerModule.lua
---@class flowgraph_modules_timerModule_C
local flowgraph_modules_timerModule_C = {}

--- adds a new timer.
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:38
---@param data any
function flowgraph_modules_timerModule_C:addTimer(data) end

--- called at the end, finalizing all the merge strats.
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:112
function flowgraph_modules_timerModule_C:afterTrigger() end

---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:18
function flowgraph_modules_timerModule_C:clear() end

---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:134
function flowgraph_modules_timerModule_C:executionStopped() end

--- gets the elapsed time on a timer.
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:92
---@param id any
function flowgraph_modules_timerModule_C:getElapsedTime(id) end

---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:8
function flowgraph_modules_timerModule_C:getFreeId() end

--- gets the global time depending on the mode.
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:30
---@param mode any
function flowgraph_modules_timerModule_C:getGlobalTime(mode) end

--- gets the full timer object.
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:58
---@param id any
function flowgraph_modules_timerModule_C:getTimer(id) end

---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:13
function flowgraph_modules_timerModule_C:init() end

--- checks if the timer is complete.
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:101
---@param id any
function flowgraph_modules_timerModule_C:isComplete(id) end

---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:105
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function flowgraph_modules_timerModule_C:onUpdate(dtReal, dtSim, dtRaw) end

--- sets some field for the timer, using the variables.
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:61
---@param id any
---@param field any
---@param val any
function flowgraph_modules_timerModule_C:set(id, field, val) end

--- sets the elapsed time on a timer.
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:74
---@param id any
---@param time any
function flowgraph_modules_timerModule_C:setElapsedTime(id, time) end

--- sets the desired mode of the timer
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:83
---@param id any
---@param mode any
function flowgraph_modules_timerModule_C:setMode(id, mode) end

--- pauses or unpauses a timer.
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:64
---@param id any
---@param val any
function flowgraph_modules_timerModule_C:setPause(id, val) end

