---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/gauges/customModules/navigationData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de données pour genericGauges : alimente une carte de navigation dans la page HTML. À la configuration il demande à ui_uiNavi (moteur de jeu) d'initialiser la carte du tableau de bord ; à chaque mise à jour il envoie la position (x, y) et l'orientation du véhicule (degrés) par streamJS("updateMap").
--- Accès : contrôleur `gauges/customModules/navigationData` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_gauges_customModules_navigationData
---@field type string "auxiliary".
local controller_gauges_customModules_navigationData = {}

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/navigationData.lua:37
---@param jbeamData table Données jbeam du contrôleur.
function controller_gauges_customModules_navigationData.init(jbeamData) end

--- Réinitialise l'état interne du module.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/navigationData.lua:34
function controller_gauges_customModules_navigationData.reset() end

--- Appelé par genericGauges avec les propriétés demandées dans displayData.customModules : aucune propriété n'est lue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/navigationData.lua:29
---@param properties table Propriétés demandées (non utilisées).
---@param htmlTexture table Texture HTML du tableau de bord (htmlTexture.new).
function controller_gauges_customModules_navigationData.setupGaugeData(properties, htmlTexture) end

--- Ne fait rien (la mise à jour se fait par updateGaugeData).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/navigationData.lua:19
---@param dt number Pas de temps (s).
function controller_gauges_customModules_navigationData.updateGFX(dt) end

--- Appelé par genericGauges avant chaque envoi : remplit moduleData avec les valeurs demandées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/customModules/navigationData.lua:22
---@param moduleData table Table de données du module, envoyée ensuite à la page HTML.
---@param dt number Temps écoulé depuis le dernier envoi (s).
function controller_gauges_customModules_navigationData.updateGaugeData(moduleData, dt) end

return controller_gauges_customModules_navigationData
