---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Actionneur de la Driving Dynamics Suite : amortisseurs à amortissement variable. Il regroupe des poutres d'amortisseur (par nom) et applique, selon un mode nommé (Comfort, Sport...), des coefficients multiplicatifs à leurs valeurs jbeam d'amortissement via `obj:setBoundedBeamDamp`. Le mode se choisit par `setParameters({damperMode = "nom"})`, typiquement depuis un mode `driveModes` de type "controller". Ordre d'appel : `defaultOrder = 80`.
--- Accès : contrôleur `drivingDynamics/actuators/adaptiveDampers` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_drivingDynamics_actuators_adaptiveDampers
---@field defaultOrder number 80.
---@field isActing boolean false : jamais modifié dans ce fichier.
---@field isActive boolean true après init.
---@field type string "auxiliary".
local controller_drivingDynamics_actuators_adaptiveDampers = {}

--- Renvoie une copie des paramètres.
---Source : lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua:110
---@return table  Copie profonde ({isEnabled = true} par défaut).
function controller_drivingDynamics_actuators_adaptiveDampers.getConfig() end

--- Retrouve les poutres d'amortisseur par nom et lit les modes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua:47
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_actuators_adaptiveDampers.init(jbeamData) end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua:83
function controller_drivingDynamics_actuators_adaptiveDampers.initLastStage() end

--- Appelée par le CMU pour donner une référence vers lui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua:90
---@param cmu table Module CMU.
function controller_drivingDynamics_actuators_adaptiveDampers.registerCMU(cmu) end

--- Vide (l'amortissement n'est pas remis à l'état initial).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua:44
function controller_drivingDynamics_actuators_adaptiveDampers.reset() end

--- Envoie les paramètres au CMU dans un paquet de debug config.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua:114
function controller_drivingDynamics_actuators_adaptiveDampers.sendConfigData() end

--- Remplace la table de paramètres (sans effet sur les modes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua:106
---@param configTable table Nouveaux paramètres.
function controller_drivingDynamics_actuators_adaptiveDampers.setConfig(configTable) end

--- Mémorise le mode debug (sans autre effet).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua:86
---@param debugEnabled boolean État du mode debug.
function controller_drivingDynamics_actuators_adaptiveDampers.setDebugMode(debugEnabled) end

--- Applique un mode d'amortissement si `parameters.damperMode` est fourni.
---Source : lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua:100
---@param parameters table Champ : damperMode (nom d'un mode défini dans `modes`).
function controller_drivingDynamics_actuators_adaptiveDampers.setParameters(parameters) end

--- Arrête l'actionneur (isActive = false).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua:94
function controller_drivingDynamics_actuators_adaptiveDampers.shutdown() end

return controller_drivingDynamics_actuators_adaptiveDampers
