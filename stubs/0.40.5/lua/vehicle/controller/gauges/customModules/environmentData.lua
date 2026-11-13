---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/gauges/customModules/environmentData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de données pour genericGauges : fournit la température extérieure et l'heure système.
--- Accès : contrôleur `gauges/customModules/environmentData` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_gauges_customModules_environmentData
---@field type string "auxiliary".
local controller_gauges_customModules_environmentData = {}

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/environmentData.lua:24
---@param jbeamData table Données jbeam du contrôleur.
function controller_gauges_customModules_environmentData.init(jbeamData) end

--- Réinitialise l'état interne du module.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/environmentData.lua:21
function controller_gauges_customModules_environmentData.reset() end

--- Appelé par genericGauges avec les propriétés demandées dans displayData.customModules : aucune propriété n'est lue ; produit toujours temperatureEnv et time.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/environmentData.lua:18
---@param properties table<string, boolean> Ensemble des propriétés demandées (clé = nom, valeur = true).
function controller_gauges_customModules_environmentData.setupGaugeData(properties) end

--- Ne fait rien (la mise à jour se fait par updateGaugeData).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/environmentData.lua:10
---@param dt number Pas de temps (s).
function controller_gauges_customModules_environmentData.updateGFX(dt) end

--- Appelé par genericGauges avant chaque envoi : remplit moduleData avec les valeurs demandées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/environmentData.lua:13
---@param moduleData table Table de données du module, envoyée ensuite à la page HTML.
---@param dt number Temps écoulé depuis le dernier envoi (s).
function controller_gauges_customModules_environmentData.updateGaugeData(moduleData, dt) end

return controller_gauges_customModules_environmentData
