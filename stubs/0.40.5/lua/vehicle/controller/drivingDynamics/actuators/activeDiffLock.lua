---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Actionneur de la Driving Dynamics Suite : verrouillage actif d'un différentiel d'essieu. À 100 Hz (updateFixedStep) il compare les vitesses des deux sorties corrigées du rayon de braquage (`CMU.vehicleData.turningCircleSpeedRatios`) ; sous accélérateur, un PID règle un coefficient de verrouillage 0..1 qui monte quand l'écart de vitesse dépasse `avDiffThreshold`. Le coefficient est écrit dans `relevantDifferential.activeLockCoef`. Les superviseurs peuvent le borner par `overrideMin`/`overrideMax`. Ordre d'appel : `defaultOrder = 80`.
--- Accès : contrôleur `drivingDynamics/actuators/activeDiffLock` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_drivingDynamics_actuators_activeDiffLock
---@field defaultOrder number 80.
---@field isActing boolean true si le coefficient de verrouillage est > 0.
---@field isActive boolean true si le différentiel et ses roues ont été trouvés.
---@field overrideMax number Borne haute du verrouillage (1 par défaut).
---@field overrideMin number Borne basse du verrouillage (0 par défaut).
---@field type string "auxiliary".
local controller_drivingDynamics_actuators_activeDiffLock = {}

--- Renvoie une copie des paramètres.
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:217
---@return table  Copie profonde.
function controller_drivingDynamics_actuators_activeDiffLock.getConfig() end

--- Lit les paramètres jbeam et crée le PID.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:132
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_actuators_activeDiffLock.init(jbeamData) end

--- Retrouve le différentiel (`differentialName`) et les roues de chaque sortie ; active le système.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:154
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_actuators_activeDiffLock.initSecondStage(jbeamData) end

--- Appelée par le CMU pour donner une référence vers lui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:192
---@param cmu table Module CMU.
function controller_drivingDynamics_actuators_activeDiffLock.registerCMU(cmu) end

--- Remet isActing à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:128
function controller_drivingDynamics_actuators_activeDiffLock.reset() end

--- Remet les bornes d'override à 0 et 1.
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:46
function controller_drivingDynamics_actuators_activeDiffLock.resetOverride() end

--- Envoie les paramètres au CMU dans un paquet de debug config.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:221
function controller_drivingDynamics_actuators_activeDiffLock.sendConfigData() end

--- Remplace toute la table de paramètres.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:213
---@param configTable table Nouveaux paramètres.
function controller_drivingDynamics_actuators_activeDiffLock.setConfig(configTable) end

--- Active ou désactive l'envoi de paquets de debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:186
---@param debugEnabled boolean true pour envoyer.
function controller_drivingDynamics_actuators_activeDiffLock.setDebugMode(debugEnabled) end

--- Modifie à chaud avDiffThreshold, isEnabled et lockingPIDkP/kI/kD (via CMU.applyParameter).
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:196
---@param parameters table Table des paramètres à changer.
function controller_drivingDynamics_actuators_activeDiffLock.setParameters(parameters) end

--- Arrête l'actionneur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:121
function controller_drivingDynamics_actuators_activeDiffLock.shutdown() end

--- Pas fixe (100 Hz) : calcule l'écart de vitesse corrigé, le coefficient de verrouillage (PID lissé, borné par l'override) et l'écrit dans `activeLockCoef` du différentiel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:51
---@param dt number Pas en secondes.
function controller_drivingDynamics_actuators_activeDiffLock.updateFixedStep(dt) end

--- Chaque frame : rien d'utile. Variante debug : envoie les valeurs au CMU.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:93
---@param dt number Pas de temps en secondes.
function controller_drivingDynamics_actuators_activeDiffLock.updateGFX(dt) end

return controller_drivingDynamics_actuators_activeDiffLock
