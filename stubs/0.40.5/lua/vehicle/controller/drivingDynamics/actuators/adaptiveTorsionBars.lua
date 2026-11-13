---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Actionneur de la Driving Dynamics Suite : barres de torsion (anti-roulis) à raideur variable. Il regroupe des barres de torsion par nom et applique, selon un mode nommé, des coefficients multiplicatifs à leur raideur et amortissement jbeam via `obj:setTorsionbarSpringDamp`. Le mode se choisit par `setParameters({torsionBarMode = "nom"})`, typiquement depuis un mode `driveModes` de type "controller". Ordre d'appel : `defaultOrder = 80`.
--- Accès : contrôleur `drivingDynamics/actuators/adaptiveTorsionBars` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_drivingDynamics_actuators_adaptiveTorsionBars
---@field defaultOrder number 80.
---@field isActing boolean false : jamais modifié dans ce fichier.
---@field isActive boolean true après init.
---@field type string "auxiliary".
local controller_drivingDynamics_actuators_adaptiveTorsionBars = {}

--- Renvoie une copie des paramètres.
---Source : lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua:103
---@return table  Copie profonde ({isEnabled = true} par défaut).
function controller_drivingDynamics_actuators_adaptiveTorsionBars.getConfig() end

--- Retrouve les barres de torsion par nom et lit les modes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua:43
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_actuators_adaptiveTorsionBars.init(jbeamData) end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua:76
function controller_drivingDynamics_actuators_adaptiveTorsionBars.initLastStage() end

--- Appelée par le CMU pour donner une référence vers lui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua:83
---@param cmu table Module CMU.
function controller_drivingDynamics_actuators_adaptiveTorsionBars.registerCMU(cmu) end

--- Vide (les barres ne sont pas remises à l'état initial).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua:40
function controller_drivingDynamics_actuators_adaptiveTorsionBars.reset() end

--- Envoie les paramètres au CMU dans un paquet de debug config.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua:107
function controller_drivingDynamics_actuators_adaptiveTorsionBars.sendConfigData() end

--- Remplace la table de paramètres (sans effet sur les modes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua:99
---@param configTable table Nouveaux paramètres.
function controller_drivingDynamics_actuators_adaptiveTorsionBars.setConfig(configTable) end

--- Mémorise le mode debug (sans autre effet).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua:79
---@param debugEnabled boolean État du mode debug.
function controller_drivingDynamics_actuators_adaptiveTorsionBars.setDebugMode(debugEnabled) end

--- Applique un mode de raideur si `parameters.torsionBarMode` est fourni.
---Source : lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua:93
---@param parameters table Champ : torsionBarMode (nom d'un mode défini dans `modes`).
function controller_drivingDynamics_actuators_adaptiveTorsionBars.setParameters(parameters) end

--- Arrête l'actionneur (isActive = false).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua:87
function controller_drivingDynamics_actuators_adaptiveTorsionBars.shutdown() end

return controller_drivingDynamics_actuators_adaptiveTorsionBars
