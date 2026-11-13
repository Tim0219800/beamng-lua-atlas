---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/gauges/customModules/combustionEngineData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de données pour genericGauges : calcule consommation de carburant (l/100 km), affichage de consommation, puissance et couple des moteurs à combustion et autonomie restante. Les calculs ne sont faits que pour les propriétés demandées.
--- Accès : contrôleur `gauges/customModules/combustionEngineData` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_gauges_customModules_combustionEngineData
---@field type string "auxiliary".
local controller_gauges_customModules_combustionEngineData = {}

--- Initialise la consommation moyenne lissée à 10 l/100 km.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/combustionEngineData.lua:133
---@param jbeamData table Données jbeam du contrôleur.
function controller_gauges_customModules_combustionEngineData.init(jbeamData) end

--- Réinitialise l'état interne du module.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/combustionEngineData.lua:123
function controller_gauges_customModules_combustionEngineData.reset() end

--- Appelé par genericGauges avec les propriétés demandées dans displayData.customModules : fuelConsumption (averageFuelConsumption, currentFuelConsumption), fuelDisplay (fuelDisplay, -1..3), currentPower (currentPower et averagePower en ch, currentTorque en N·m), remainingRange (remainingRange ; active aussi fuelConsumption).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/combustionEngineData.lua:107
---@param properties table<string, boolean> Ensemble des propriétés demandées (clé = nom, valeur = true).
function controller_gauges_customModules_combustionEngineData.setupGaugeData(properties) end

--- Ne fait rien (la mise à jour se fait par updateGaugeData).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/combustionEngineData.lua:40
---@param dt number Pas de temps (s).
function controller_gauges_customModules_combustionEngineData.updateGFX(dt) end

--- Appelé par genericGauges avant chaque envoi : remplit moduleData avec les valeurs demandées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/combustionEngineData.lua:43
---@param moduleData table Table de données du module, envoyée ensuite à la page HTML.
---@param dt number Temps écoulé depuis le dernier envoi (s).
function controller_gauges_customModules_combustionEngineData.updateGaugeData(moduleData, dt) end

return controller_gauges_customModules_combustionEngineData
