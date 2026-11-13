---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/gauges/customModules/electricMotorData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de données pour genericGauges : calcule la puissance affichée, la puissance et le couple, l'autonomie restante et un graphe de consommation pour les moteurs électriques.
--- Accès : contrôleur `gauges/customModules/electricMotorData` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_gauges_customModules_electricMotorData
---@field type string "auxiliary".
local controller_gauges_customModules_electricMotorData = {}

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/electricMotorData.lua:109
---@param jbeamData table Données jbeam du contrôleur.
function controller_gauges_customModules_electricMotorData.init(jbeamData) end

--- Réinitialise l'état interne du module.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/electricMotorData.lua:105
function controller_gauges_customModules_electricMotorData.reset() end

--- Appelé par genericGauges avec les propriétés demandées dans displayData.customModules : powerDisplay (electricPowerDisplay : accélérateur moyen moins régénération), currentPower (currentPower et averagePower en ch, currentTorque en N·m), remainingRange, consumptionGraph (averageConsumption, envoyé toutes les 5 s, sinon nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/electricMotorData.lua:92
---@param properties table<string, boolean> Ensemble des propriétés demandées (clé = nom, valeur = true).
function controller_gauges_customModules_electricMotorData.setupGaugeData(properties) end

--- Ne fait rien (la mise à jour se fait par updateGaugeData).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/electricMotorData.lua:33
---@param dt number Pas de temps (s).
function controller_gauges_customModules_electricMotorData.updateGFX(dt) end

--- Appelé par genericGauges avant chaque envoi : remplit moduleData avec les valeurs demandées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/electricMotorData.lua:36
---@param moduleData table Table de données du module, envoyée ensuite à la page HTML.
---@param dt number Temps écoulé depuis le dernier envoi (s).
function controller_gauges_customModules_electricMotorData.updateGaugeData(moduleData, dt) end

return controller_gauges_customModules_electricMotorData
