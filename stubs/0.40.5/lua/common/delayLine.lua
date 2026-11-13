---@meta
-- tim19Atlas stub generated from lua/common/delayLine.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Ligne à retard générique : chaque paquet de données poussé dans la ligne ressort après le même délai. Créée à l'origine pour simuler le temps que met le carburant imbrûlé à parcourir l'échappement avant de brûler. Il faut interroger la ligne régulièrement (pop/popSum) avec le pas de temps pour récupérer ce qui est arrivé au bout.
--- Accès : `require("delayLine")`
---@class delayLine
local delayLine = {}

--- Crée une ligne à retard.
---Source : lua/common/delayLine.lua:92
---@param delay number Délai en secondes appliqué à chaque paquet.
---@return table  Objet avec les méthodes push, peek, pop, popSum, reset.
function delayLine.new(delay) end

--- Objet renvoyé par new(delay). Champs : delay, length, currentTime, data, times.
---@class delayLine_delayLine
local delayLine_delayLine = {}

--- Renvoie, sans les retirer ni avancer le temps, les paquets qui seraient arrivés dans dt secondes.
---Source : lua/common/delayLine.lua:dyn
---@param dt number Horizon en secondes.
---@return table|nil  Liste des paquets ; nil si la ligne est vide.
function delayLine_delayLine:peek(dt) end

--- Fait avancer le temps de dt, retire et renvoie tous les paquets arrivés à échéance.
---Source : lua/common/delayLine.lua:dyn
---@param dt number Temps écoulé en secondes.
---@return table|nil  Liste des paquets arrivés ; nil si la ligne est vide.
function delayLine_delayLine:pop(dt) end

--- Comme pop mais renvoie la somme (numérique) des paquets arrivés.
---Source : lua/common/delayLine.lua:dyn
---@param dt number Temps écoulé en secondes.
---@return number  Somme des paquets arrivés (0 si aucun).
function delayLine_delayLine:popSum(dt) end

--- Insère un paquet de données ; il sortira à currentTime + delay.
---Source : lua/common/delayLine.lua:dyn
---@param payload any Donnée à retarder.
function delayLine_delayLine:push(payload) end

--- Vide la ligne et remet le temps interne à 0.
---Source : lua/common/delayLine.lua:dyn
function delayLine_delayLine:reset() end

return delayLine
