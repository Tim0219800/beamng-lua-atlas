---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/loggerTemplate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Modèle de contrôleur d'enregistrement de données (type "auxiliary", defaultOrder 100000) : à chaque image il ajoute à un CSV en mémoire (bibliothèque csvlib) temps, accélérateur, frein, énergie stockée des batteries électriques et puissance des moteurs électriques. saveLogToCSV écrit le fichier « testLog ». À copier comme point de départ pour un enregistreur personnalisé.
--- Accès : contrôleur `loggerTemplate` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_loggerTemplate
---@field defaultOrder number 100000.
---@field type string "auxiliary".
local controller_loggerTemplate = {}

--- Crée le CSV (colonnes time, throttle, brake, batteryCapacity, motorPower) et remet le chrono à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/loggerTemplate.lua:83
function controller_loggerTemplate.init() end

--- Recrée un CSV vide et remet le chrono à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/loggerTemplate.lua:77
function controller_loggerTemplate.reset() end

--- Écrit le CSV sur disque sous le nom testLog.
---Source : lua/vehicle/controller/loggerTemplate.lua:19
function controller_loggerTemplate.saveLogToCSV() end

--- Incrémente le chrono interne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/loggerTemplate.lua:70
---@param dt number Pas de temps (s).
function controller_loggerTemplate.update(dt) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/loggerTemplate.lua:60
---@param dt number Pas de temps (s).
function controller_loggerTemplate.updateFixedStep(dt) end

--- Ajoute une ligne de données au CSV.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/loggerTemplate.lua:55
---@param dt number Pas de temps (s).
function controller_loggerTemplate.updateGFX(dt) end

return controller_loggerTemplate
