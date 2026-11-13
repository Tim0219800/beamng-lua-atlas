---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Actionneur de la Driving Dynamics Suite : différentiel à verrouillage électronique par freinage (EDL, « brake-based » : on freine la roue qui patine pour transférer le couple). À chaque étape physique intermédiaire, il compare les vitesses des deux sorties corrigées du rayon de braquage (`CMU.vehicleData.turningCircleSpeedRatios`) ; si l'écart dépasse `avDiffThreshold` sous accélérateur (> 0.05), un PID calcule un coefficient de freinage appliqué en `desiredBrakingTorque` aux roues du côté le plus rapide. Ordre d'appel : `defaultOrder = 80`.
--- Accès : contrôleur `drivingDynamics/actuators/electronicDiffLock` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_drivingDynamics_actuators_electronicDiffLock
---@field defaultOrder number 80.
---@field isActing boolean true si l'écart de vitesse justifie un freinage.
---@field isActive boolean true si le différentiel et ses roues ont été trouvés.
---@field overrideMax number Plafond du coefficient de freinage imposé par un superviseur (1 par défaut).
---@field type string "auxiliary".
local controller_drivingDynamics_actuators_electronicDiffLock = {}

--- Renvoie une copie des paramètres.
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:241
---@return table  Copie profonde.
function controller_drivingDynamics_actuators_electronicDiffLock.getConfig() end

--- Lit les paramètres jbeam et crée le PID de freinage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:152
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_actuators_electronicDiffLock.init(jbeamData) end

--- Retrouve le différentiel (`differentialName`) et les roues de chaque sortie ; active le système.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:175
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_actuators_electronicDiffLock.initSecondStage(jbeamData) end

--- Appelée par le CMU pour donner une référence vers lui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:215
---@param cmu table Module CMU.
function controller_drivingDynamics_actuators_electronicDiffLock.registerCMU(cmu) end

--- Remet isActing à false et overrideMax à 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:147
function controller_drivingDynamics_actuators_electronicDiffLock.reset() end

--- Remet les bornes d'override : overrideMin = 0, overrideMax = 1.
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:48
function controller_drivingDynamics_actuators_electronicDiffLock.resetOverride() end

--- Envoie les paramètres au CMU dans un paquet de debug config.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:245
function controller_drivingDynamics_actuators_electronicDiffLock.sendConfigData() end

--- Remplace toute la table de paramètres.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:237
---@param configTable table Nouveaux paramètres.
function controller_drivingDynamics_actuators_electronicDiffLock.setConfig(configTable) end

--- Active ou désactive l'envoi de paquets de debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:209
---@param debugEnabled boolean true pour envoyer.
function controller_drivingDynamics_actuators_electronicDiffLock.setDebugMode(debugEnabled) end

--- Modifie à chaud avDiffThreshold, avThreshold, isEnabled et brakingPIDkP/kI/kD (via CMU.applyParameter).
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:219
---@param parameters table Table des paramètres à changer.
function controller_drivingDynamics_actuators_electronicDiffLock.setParameters(parameters) end

--- Arrête l'actionneur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:140
function controller_drivingDynamics_actuators_electronicDiffLock.shutdown() end

--- Chaque frame : rien d'utile. Variante debug : envoie les valeurs au CMU.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:110
---@param dt number Pas de temps en secondes.
function controller_drivingDynamics_actuators_electronicDiffLock.updateGFX(dt) end

--- Étape physique intermédiaire : calcule les vitesses de sortie corrigées, le coefficient de freinage (PID) et ajoute le couple de freinage aux roues du côté qui patine.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:53
---@param dt number Pas en secondes.
function controller_drivingDynamics_actuators_electronicDiffLock.updateWheelsIntermediate(dt) end

return controller_drivingDynamics_actuators_electronicDiffLock
