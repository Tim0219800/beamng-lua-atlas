---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/gauges/customModules/dynamicRedlineData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de données pour genericGauges : calcule une zone rouge/jaune de compte-tours qui dépend de la température d'huile (moteur froid = régime max réduit) et un voyant de changement de rapport. Les valeurs sont converties en une échelle de sortie entière (ex. nombre de segments d'une barre de LED).
--- Accès : contrôleur `gauges/customModules/dynamicRedlineData` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_gauges_customModules_dynamicRedlineData
---@field type string "auxiliary".
local controller_gauges_customModules_dynamicRedlineData = {}

--- Lit les paramètres jbeam de l'échelle de sortie et de la température d'huile.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/dynamicRedlineData.lua:42
---@param jbeamData table Données jbeam du contrôleur.
function controller_gauges_customModules_dynamicRedlineData.init(jbeamData) end

--- Réinitialise l'état interne du module.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/dynamicRedlineData.lua:39
function controller_gauges_customModules_dynamicRedlineData.reset() end

--- Appelé par genericGauges avec les propriétés demandées dans displayData.customModules : aucune propriété n'est lue ; produit toujours yellow, red (entiers) et shiftLight (booléen).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/dynamicRedlineData.lua:36
---@param properties table<string, boolean> Ensemble des propriétés demandées (clé = nom, valeur = true).
function controller_gauges_customModules_dynamicRedlineData.setupGaugeData(properties) end

--- Ne fait rien (la mise à jour se fait par updateGaugeData).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/dynamicRedlineData.lua:21
---@param dt number Pas de temps (s).
function controller_gauges_customModules_dynamicRedlineData.updateGFX(dt) end

--- Appelé par genericGauges avant chaque envoi : remplit moduleData avec les valeurs demandées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/dynamicRedlineData.lua:24
---@param moduleData table Table de données du module, envoyée ensuite à la page HTML.
---@param dt number Temps écoulé depuis le dernier envoi (s).
function controller_gauges_customModules_dynamicRedlineData.updateGaugeData(moduleData, dt) end

return controller_gauges_customModules_dynamicRedlineData
