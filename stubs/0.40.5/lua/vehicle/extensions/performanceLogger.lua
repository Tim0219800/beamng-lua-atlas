---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/performanceLogger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit outil de profilage : mesure des durées en millisecondes avec HighPerfTimer, soit une mesure unique (startMeasurement / stopMeasurement), soit une moyenne sur N mesures écrite dans le log (measureAverage).
--- Accès : extension `performanceLogger` : `extensions.load (VM véhicule)("performanceLogger")`, puis la globale `performanceLogger`
---@class performanceLogger
performanceLogger = {}

--- Arrête le chronomètre, ajoute la mesure à la moyenne et, après stopCount mesures, écrit la moyenne dans le log.
---Source : lua/vehicle/extensions/performanceLogger.lua:28
---@param name string Nom de la mesure.
---@param stopCount integer Nombre de mesures avant affichage.
---@param showMin boolean|nil Afficher le minimum des moyennes.
function performanceLogger.measureAverage(name, stopCount, showMin) end

--- Hook d'initialisation : efface chronomètres et mesures.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/performanceLogger.lua:48
function performanceLogger.onInit() end

--- Même fonction que onInit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/performanceLogger.lua:48
function performanceLogger.onReset() end

--- Crée (ou remet à zéro) le chronomètre nommé.
---Source : lua/vehicle/extensions/performanceLogger.lua:12
---@param name string Nom de la mesure.
function performanceLogger.startMeasurement(name) end

--- Termine la moyenne nommée et renvoie la moyenne accumulée (supprime le chronomètre).
---Source : lua/vehicle/extensions/performanceLogger.lua:22
---@param name string Nom de la mesure.
---@return number  Moyenne en millisecondes.
function performanceLogger.stopAvergage(name) end

--- Arrête le chronomètre et renvoie la durée mesurée.
---Source : lua/vehicle/extensions/performanceLogger.lua:41
---@param name string Nom de la mesure.
---@return number  Durée en millisecondes.
function performanceLogger.stopMeasurement(name) end

