---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Actionneur de la Driving Dynamics Suite : répartition active du couple entre les deux sorties d'un différentiel (torque vectoring). Il compare les vitesses des roues gauche et droite corrigées du rayon de braquage (`CMU.vehicleData.turningCircleSpeedRatios`) et, sous accélérateur, calcule par PID un décalage de répartition (plus un terme dépendant du volant, de la g longitudinale et de l'accélérateur). Le résultat règle `diffTorqueSplitA` et `diffTorqueSplitB` du différentiel autour de 0,5/0,5. Ordre d'appel : `defaultOrder = 80`.
--- Accès : contrôleur `drivingDynamics/actuators/activeDiffBias` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_drivingDynamics_actuators_activeDiffBias
---@field defaultOrder number 80.
---@field isActing boolean true si le décalage de répartition est non nul.
---@field isActive boolean true si le différentiel et les roues ont été trouvés.
---@field overrideMax number Borne haute du décalage (1 par défaut).
---@field overrideMin number Borne basse du décalage imposée par un superviseur (-1 par défaut).
---@field type string "auxiliary".
---@field wheelSides table<string, integer> {left = -1|1, right = -1|1} : indique quelle sortie du différentiel alimente le côté gauche ou droit (rempli par initSecondStage).
local controller_drivingDynamics_actuators_activeDiffBias = {}

--- Renvoie une copie des paramètres.
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:280
---@return table  Copie profonde.
function controller_drivingDynamics_actuators_activeDiffBias.getConfig() end

--- Lit les paramètres jbeam et crée le PID de répartition.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:156
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_actuators_activeDiffBias.init(jbeamData) end

--- Retrouve le différentiel (`differentialName`), ses roues par sortie et le côté gauche/droit ; active le système.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:180
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_actuators_activeDiffBias.initSecondStage(jbeamData) end

--- Appelée par le CMU pour donner une référence vers lui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:253
---@param cmu table Module CMU.
function controller_drivingDynamics_actuators_activeDiffBias.registerCMU(cmu) end

--- Remet isActing et les bornes d'override à leur valeur initiale.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:150
function controller_drivingDynamics_actuators_activeDiffBias.reset() end

--- Remet les bornes d'override à -1 et 1.
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:51
function controller_drivingDynamics_actuators_activeDiffBias.resetOverride() end

--- Envoie les paramètres au CMU dans un paquet de debug config.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:284
function controller_drivingDynamics_actuators_activeDiffBias.sendConfigData() end

--- Remplace toute la table de paramètres.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:276
---@param configTable table Nouveaux paramètres.
function controller_drivingDynamics_actuators_activeDiffBias.setConfig(configTable) end

--- Active ou désactive l'envoi de paquets de debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:247
---@param debugEnabled boolean true pour envoyer.
function controller_drivingDynamics_actuators_activeDiffBias.setDebugMode(debugEnabled) end

--- Modifie à chaud avDiffThreshold, isEnabled, maxBiasOffset et brakingPIDkP/kI/kD (via CMU.applyParameter).
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:257
---@param parameters table Table des paramètres à changer.
function controller_drivingDynamics_actuators_activeDiffBias.setParameters(parameters) end

--- Arrête l'actionneur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:143
function controller_drivingDynamics_actuators_activeDiffBias.shutdown() end

--- Pas fixe (100 Hz) : calcule les vitesses corrigées, le décalage de répartition (PID + terme de volant) et règle la répartition de couple du différentiel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:56
---@param dt number Pas en secondes.
function controller_drivingDynamics_actuators_activeDiffBias.updateFixedStep(dt) end

--- Chaque frame : rien d'utile (retourne si désactivé). Variante debug : envoie les valeurs au CMU.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:112
---@param dt number Pas de temps en secondes.
function controller_drivingDynamics_actuators_activeDiffBias.updateGFX(dt) end

return controller_drivingDynamics_actuators_activeDiffBias
