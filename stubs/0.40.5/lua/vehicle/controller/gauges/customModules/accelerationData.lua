---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/gauges/customModules/accelerationData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de données pour genericGauges (type "auxiliary") : fournit les accélérations du capteur du véhicule. À référencer dans displayData.customModules avec le nom de module accelerationData.
--- Accès : contrôleur `gauges/customModules/accelerationData` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_gauges_customModules_accelerationData
---@field type string "auxiliary".
local controller_gauges_customModules_accelerationData = {}

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/accelerationData.lua:37
---@param jbeamData table Données jbeam du contrôleur.
function controller_gauges_customModules_accelerationData.init(jbeamData) end

--- Réinitialise l'état interne du module.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/accelerationData.lua:34
function controller_gauges_customModules_accelerationData.reset() end

--- Appelé par genericGauges avec les propriétés demandées dans displayData.customModules : acceleration (x, y, z = sensors.gx/gy/gz) et accelerationSmooth (xSmooth, ySmooth, zSmooth = sensors.gx2/gy2/gz2).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/accelerationData.lua:29
---@param properties table<string, boolean> Ensemble des propriétés demandées (clé = nom, valeur = true).
function controller_gauges_customModules_accelerationData.setupGaugeData(properties) end

--- Ne fait rien (la mise à jour se fait par updateGaugeData).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/accelerationData.lua:13
---@param dt number Pas de temps (s).
function controller_gauges_customModules_accelerationData.updateGFX(dt) end

--- Appelé par genericGauges avant chaque envoi : remplit moduleData avec les valeurs demandées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/accelerationData.lua:16
---@param moduleData table Table de données du module, envoyée ensuite à la page HTML.
---@param dt number Temps écoulé depuis le dernier envoi (s).
function controller_gauges_customModules_accelerationData.updateGaugeData(moduleData, dt) end

return controller_gauges_customModules_accelerationData
