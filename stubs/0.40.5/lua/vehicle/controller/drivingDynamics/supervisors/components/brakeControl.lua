---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant de freinage du système drivingDynamics (type "auxiliary", defaultOrder 70). Il agit comme antipatinage (ordre 30), contrôle de lacet (ordre 50) et ABS (ordre 50) en freinant des roues individuelles. Le freinage antipatinage et de lacet est ajouté chaque pas à wheel.desiredBrakingTorque dans updateWheelsIntermediate ; l'ABS remplace les fonctions de calcul du couple de frein de chaque roue (wheels.setWheelBrakeUpdate). Chaque rôle est géré par des régulateurs PID parallèles configurables dans le jbeam ou via setParameters.
--- Accès : contrôleur `drivingDynamics/supervisors/components/brakeControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_drivingDynamics_supervisors_components_brakeControl
---@field componentOrderABSControl number 50.
---@field componentOrderTractionControl number 30.
---@field componentOrderYawControl number 50.
---@field defaultOrder number Ordre d'exécution par défaut (70).
---@field isActingAsABS boolean Vrai quand l'ABS limite le freinage.
---@field isActingAsTC boolean Vrai quand un frein d'antipatinage est actif.
---@field isActingAsYC boolean Vrai quand un frein de contrôle de lacet est actif.
---@field isActive boolean Vrai après initSecondStage.
---@field type string "auxiliary".
local controller_drivingDynamics_supervisors_components_brakeControl = {}

--- Appelé par le superviseur absControl pour chaque roue : met à jour périodiquement le coefficient ABS (absCoef) via un PID sur le glissement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:213
---@param wheelData table Données de roue {wheelName, slip}.
---@param brake number Entrée de frein 0..1.
---@param vehicleVelocity number Vitesse du véhicule (m/s).
---@param dt number Pas de temps (s).
---@return boolean  Vrai si l'ABS réduit le freinage (absCoef < 0.9).
function controller_drivingDynamics_supervisors_components_brakeControl.actAsABSControl(wheelData, brake, vehicleVelocity, dt) end

--- Appelé par tractionControl pour chaque groupe de roues : calcule le facteur de freinage de chaque roue d'après son glissement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:69
---@param wheelGroup table Groupe de roues {name, wheels, wheelCount, slipRange…}.
---@param dt number Pas de temps (s).
---@return boolean  Vrai si un frein antipatinage est demandé.
function controller_drivingDynamics_supervisors_components_brakeControl.actAsTractionControl(wheelGroup, dt) end

--- Appelé par yawControl : choisit la roue à freiner selon le PID dominant (écart de lacet, angle de dérive de caisse, dérive avant) et fixe son facteur de frein.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:106
---@param measuredYaw number Lacet mesuré (rad/s).
---@param expectedYaw number Lacet attendu, non utilisé.
---@param yawDifference number Écart de lacet (positif = survirage).
---@param bodySlipAngle number Angle de dérive de caisse ajusté (rad).
---@param frontSlipAngle number Angle de dérive de l'essieu avant (rad).
---@param rearSlipAngle number Angle de dérive de l'essieu arrière (rad).
---@param dt number Pas de temps (s).
---@return boolean  Vrai si une roue est freinée par le contrôle de lacet.
function controller_drivingDynamics_supervisors_components_brakeControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt) end

--- Renvoie une copie de la configuration.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:591
---@return table  Copie de la configuration.
function controller_drivingDynamics_supervisors_components_brakeControl.getConfig() end

--- Remet à false les indicateurs d'action.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:330
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_supervisors_components_brakeControl.init(jbeamData) end

--- Mémorise le nombre de roues.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:533
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_supervisors_components_brakeControl.initLastStage(jbeamData) end

--- Lit la configuration, crée les PID et s'enregistre auprès de tractionControl, yawControl et absControl selon leur présence ; installe les fonctions de frein ABS sur les roues.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:373
---@param jbeamData table Données jbeam (voir notes).
function controller_drivingDynamics_supervisors_components_brakeControl.initSecondStage(jbeamData) end

--- Mémorise la référence au CMU.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:299
---@param cmu table Contrôleur CMU.
function controller_drivingDynamics_supervisors_components_brakeControl.registerCMU(cmu) end

--- Remet à zéro indicateurs et PID et réinstalle les fonctions de frein ABS.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:309
function controller_drivingDynamics_supervisors_components_brakeControl.reset() end

--- Envoie la configuration au CMU.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:595
function controller_drivingDynamics_supervisors_components_brakeControl.sendConfigData() end

--- Remplace la configuration complète et reconfigure les PID.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:586
---@param configTable table Table {tractionControl, yawControl, absControl}.
function controller_drivingDynamics_supervisors_components_brakeControl.setConfig(configTable) end

--- Active/désactive les paquets de debug.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:293
---@param debugEnabled boolean Vrai pour activer.
function controller_drivingDynamics_supervisors_components_brakeControl.setDebugMode(debugEnabled) end

--- Applique des paramètres (voir notes) puis reconfigure les PID.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:546
---@param parameters table<string, any> Paramètres à appliquer.
function controller_drivingDynamics_supervisors_components_brakeControl.setParameters(parameters) end

--- Désactive le composant.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:537
function controller_drivingDynamics_supervisors_components_brakeControl.shutdown() end

--- Écrit electrics.values.isYCBrakeActive/isTCBrakeActive/isABSBrakeActive puis les remet à zéro (version debug : envoie aussi un paquet détaillé).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:245
---@param dt number Pas de temps graphique (s).
function controller_drivingDynamics_supervisors_components_brakeControl.updateGFX(dt) end

--- Chaque pas : ajoute à wheel.desiredBrakingTorque le frein TC/YC de chaque roue contrôlée et fait tourner les limites de couple ABS.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:51
---@param dt number Pas de temps (s).
function controller_drivingDynamics_supervisors_components_brakeControl.updateWheelsIntermediate(dt) end

return controller_drivingDynamics_supervisors_components_brakeControl
