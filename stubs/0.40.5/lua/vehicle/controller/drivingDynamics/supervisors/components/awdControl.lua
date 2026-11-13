---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant de contrôle de lacet pour les transmissions intégrales à verrouillage électronique (type "auxiliary", defaultOrder 70). Il s'enregistre auprès de tractionControl (ordre 10, mais n'y fait rien) et de yawControl (ordre 20). Sous accélération, s'il détecte du survirage via l'angle de dérive de caisse, il règle overrideMin/overrideMax de l'actionneur de verrouillage (par défaut "electronicSplitShaftLock") pour répartir le couple entre essieux avant/arrière selon le mode (rearMain, frontMain, centerDiff).
--- Accès : contrôleur `drivingDynamics/supervisors/components/awdControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_drivingDynamics_supervisors_components_awdControl
---@field actAsABSControl function nop.
---@field componentOrderABSControl number 1000 : inutilisé.
---@field componentOrderTractionControl number 10.
---@field componentOrderYawControl number 20.
---@field defaultOrder number Ordre d'exécution par défaut (70).
---@field isActingAsABS boolean Toujours false.
---@field isActingAsTC boolean Toujours false.
---@field isActingAsYC boolean Vrai quand un override de verrouillage est appliqué.
---@field isActive boolean Vrai après initSecondStage.
---@field type string "auxiliary".
local controller_drivingDynamics_supervisors_components_awdControl = {}

--- Appelé par tractionControl ; ne fait rien et renvoie false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:35
---@param wheelGroup table Groupe de roues.
---@param dt number Pas de temps (s).
---@return boolean  false.
function controller_drivingDynamics_supervisors_components_awdControl.actAsTractionControl(wheelGroup, dt) end

--- Appelé par yawControl : réinitialise puis calcule les bornes overrideMin/overrideMax de l'actionneur de verrouillage à partir de l'angle de dérive de caisse (survirage sous accélération seulement).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:54
---@param measuredYaw number Lacet mesuré (rad/s).
---@param expectedYaw number Lacet attendu, non utilisé.
---@param yawDifference number Écart de lacet, non utilisé.
---@param bodySlipAngle number Angle de dérive de caisse ajusté (rad).
---@param frontSlipAngle number Non utilisé.
---@param rearSlipAngle number Non utilisé.
---@param dt number Pas de temps (s).
---@return boolean  Toujours false (voir notes).
function controller_drivingDynamics_supervisors_components_awdControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt) end

--- Renvoie une copie de la configuration.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:176
---@return table  Copie de la configuration.
function controller_drivingDynamics_supervisors_components_awdControl.getConfig() end

--- Remet à false les indicateurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:114
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_supervisors_components_awdControl.init(jbeamData) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:147
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_supervisors_components_awdControl.initLastStage(jbeamData) end

--- Cherche l'actionneur AWD, s'enregistre auprès des superviseurs et lit controlMode et slipAngleThreshold.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:120
---@param jbeamData table Données jbeam (voir notes).
function controller_drivingDynamics_supervisors_components_awdControl.initSecondStage(jbeamData) end

--- Mémorise la référence au CMU.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:94
---@param cmu table Contrôleur CMU.
function controller_drivingDynamics_supervisors_components_awdControl.registerCMU(cmu) end

--- Remet à false les indicateurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:108
function controller_drivingDynamics_supervisors_components_awdControl.reset() end

--- Envoie la configuration au CMU (paquet de debug).
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:180
function controller_drivingDynamics_supervisors_components_awdControl.sendConfigData() end

--- Remplace la configuration complète.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:171
---@param configTable table Table {tractionControl, yawControl, controlMode}.
function controller_drivingDynamics_supervisors_components_awdControl.setConfig(configTable) end

--- Active/désactive les paquets de debug.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:88
---@param debugEnabled boolean Vrai pour activer.
function controller_drivingDynamics_supervisors_components_awdControl.setDebugMode(debugEnabled) end

--- Applique des paramètres (voir notes) et recalcule la méthode de contrôle selon controlMode.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:159
---@param parameters table<string, any> Paramètres à appliquer.
function controller_drivingDynamics_supervisors_components_awdControl.setParameters(parameters) end

--- Désactive le composant.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:150
function controller_drivingDynamics_supervisors_components_awdControl.shutdown() end

--- Vide (version debug : envoie un paquet d'état).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:75
---@param dt number Pas de temps graphique (s).
function controller_drivingDynamics_supervisors_components_awdControl.updateGFX(dt) end

return controller_drivingDynamics_supervisors_components_awdControl
