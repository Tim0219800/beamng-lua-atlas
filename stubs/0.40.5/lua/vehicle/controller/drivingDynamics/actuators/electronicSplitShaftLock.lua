---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Actionneur de la Driving Dynamics Suite : verrouillage électronique d'un arbre de répartition (split shaft, embrayage de transfert type Haldex). À chaque étape physique intermédiaire, il compare la vitesse d'entrée à celle de la sortie secondaire (`secondaryOutputAVName`) ; un PID règle le rapport d'embrayage `clutchRatio` (0..1) de l'arbre pour réduire l'écart. Le verrouillage est coupé au freinage ou sans accélérateur (sauf freinage du pied gauche), figé pendant un changement de rapport, avec un minimum possible, et nul au frein de stationnement. Ordre d'appel : `defaultOrder = 80`.
--- Accès : contrôleur `drivingDynamics/actuators/electronicSplitShaftLock` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_drivingDynamics_actuators_electronicSplitShaftLock
---@field defaultOrder number 80.
---@field isActing boolean true si le rapport d'embrayage dépasse 0.01.
---@field isActive boolean true si l'arbre de répartition a été trouvé.
---@field overrideMax number Borne haute du rapport d'embrayage (1 par défaut).
---@field overrideMin number Borne basse du rapport d'embrayage (0 par défaut).
---@field type string "auxiliary".
local controller_drivingDynamics_actuators_electronicSplitShaftLock = {}

--- Renvoie une copie des paramètres.
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:229
---@return table  Copie profonde.
function controller_drivingDynamics_actuators_electronicSplitShaftLock.getConfig() end

--- Lit les paramètres jbeam et crée le PID d'embrayage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:146
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_actuators_electronicSplitShaftLock.init(jbeamData) end

--- Retrouve l'arbre de répartition (`splitShaftName`) et active le système.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:175
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_actuators_electronicSplitShaftLock.initSecondStage(jbeamData) end

--- Appelée par le CMU pour donner une référence vers lui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:203
---@param cmu table Module CMU.
function controller_drivingDynamics_actuators_electronicSplitShaftLock.registerCMU(cmu) end

--- Remet isActing et les bornes d'override à leur valeur initiale.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:140
function controller_drivingDynamics_actuators_electronicSplitShaftLock.reset() end

--- Remet les bornes d'override à 0 et 1.
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:46
function controller_drivingDynamics_actuators_electronicSplitShaftLock.resetOverride() end

--- Envoie les paramètres au CMU dans un paquet de debug config.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:233
function controller_drivingDynamics_actuators_electronicSplitShaftLock.sendConfigData() end

--- Remplace toute la table de paramètres.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:225
---@param configTable table Nouveaux paramètres.
function controller_drivingDynamics_actuators_electronicSplitShaftLock.setConfig(configTable) end

--- Active ou désactive l'envoi de paquets de debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:197
---@param debugEnabled boolean true pour envoyer.
function controller_drivingDynamics_actuators_electronicSplitShaftLock.setDebugMode(debugEnabled) end

--- Modifie à chaud avDiffThreshold, avThreshold, minimumLock, isEnabled et clutchPIDkP/kI/kD (via CMU.applyParameter).
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:207
---@param parameters table Table des paramètres à changer.
function controller_drivingDynamics_actuators_electronicSplitShaftLock.setParameters(parameters) end

--- Arrête l'actionneur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:133
function controller_drivingDynamics_actuators_electronicSplitShaftLock.shutdown() end

--- Chaque frame : rien d'utile. Variante debug : envoie les valeurs au CMU.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:106
---@param dt number Pas de temps en secondes.
function controller_drivingDynamics_actuators_electronicSplitShaftLock.updateGFX(dt) end

--- Étape physique intermédiaire : calcule le rapport d'embrayage (PID, conditions de conduite, override) et l'écrit dans `clutchRatio` de l'arbre de répartition.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:51
---@param dt number Pas en secondes.
function controller_drivingDynamics_actuators_electronicSplitShaftLock.updateWheelsIntermediate(dt) end

return controller_drivingDynamics_actuators_electronicSplitShaftLock
