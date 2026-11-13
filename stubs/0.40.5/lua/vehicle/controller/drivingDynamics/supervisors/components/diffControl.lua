---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant de contrôle de lacet agissant sur les différentiels avant/arrière à pilotage électronique (type "auxiliary", defaultOrder 70). Il s'enregistre auprès de tractionControl (ordre 20, sans action) et de yawControl (ordre 10). Quand le véhicule survire sous accélération, il règle overrideMin/overrideMax des contrôleurs de différentiel (activeDiffLock ou electronicDiffLock) pour verrouiller ou ouvrir le différentiel selon l'angle de dérive de caisse.
--- Accès : contrôleur `drivingDynamics/supervisors/components/diffControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_drivingDynamics_supervisors_components_diffControl
---@field actAsABSControl function nop.
---@field componentOrderABSControl number 1000 : inutilisé.
---@field componentOrderTractionControl number 20.
---@field componentOrderYawControl number 10.
---@field defaultOrder number Ordre d'exécution par défaut (70).
---@field isActingAsABS boolean Toujours false.
---@field isActingAsTC boolean Toujours false.
---@field isActingAsYC boolean Vrai quand un différentiel est actuellement forcé.
---@field isActive boolean Vrai après initSecondStage.
---@field type string "auxiliary".
local controller_drivingDynamics_supervisors_components_diffControl = {}

--- Appelé par tractionControl ; ne fait rien et renvoie false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:52
---@param wheelGroup table Groupe de roues.
---@param dt number Pas de temps (s).
---@return boolean  false.
function controller_drivingDynamics_supervisors_components_diffControl.actAsTractionControl(wheelGroup, dt) end

--- Appelé par yawControl : remet à zéro les overrides puis, en cas de survirage sous accélération, applique les méthodes de contrôle avant/arrière.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:126
---@param measuredYaw number Lacet mesuré (rad/s).
---@param expectedYaw number Lacet attendu.
---@param yawDifference number Écart de lacet.
---@param bodySlipAngle number Angle de dérive de caisse ajusté (rad).
---@param frontSlipAngle number Non utilisé.
---@param rearSlipAngle number Non utilisé.
---@param dt number Pas de temps (s).
---@return boolean  Toujours false (voir notes).
function controller_drivingDynamics_supervisors_components_diffControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt) end

--- Renvoie une copie de la configuration.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:271
---@return table  Copie de la configuration.
function controller_drivingDynamics_supervisors_components_diffControl.getConfig() end

--- Remet à false les indicateurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:178
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_supervisors_components_diffControl.init(jbeamData) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:235
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_supervisors_components_diffControl.initLastStage(jbeamData) end

--- Cherche les contrôleurs de différentiel, s'enregistre auprès des superviseurs et lit les seuils.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:184
---@param jbeamData table Données jbeam (voir notes).
function controller_drivingDynamics_supervisors_components_diffControl.initSecondStage(jbeamData) end

--- Mémorise la référence au CMU.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:165
---@param cmu table Contrôleur CMU.
function controller_drivingDynamics_supervisors_components_diffControl.registerCMU(cmu) end

--- Remet à false les indicateurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:172
function controller_drivingDynamics_supervisors_components_diffControl.reset() end

--- Envoie la configuration au CMU (paquet de debug).
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:275
function controller_drivingDynamics_supervisors_components_diffControl.sendConfigData() end

--- Remplace la configuration complète.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:266
---@param configTable table Table {tractionControl, yawControl}.
function controller_drivingDynamics_supervisors_components_diffControl.setConfig(configTable) end

--- Active/désactive les paquets de debug.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:159
---@param debugEnabled boolean Vrai pour activer.
function controller_drivingDynamics_supervisors_components_diffControl.setDebugMode(debugEnabled) end

--- Applique les paramètres yawControl.* (isEnabled et les huit seuils) via CMU.applyParameter.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:247
---@param parameters table<string, any> Paramètres à appliquer.
function controller_drivingDynamics_supervisors_components_diffControl.setParameters(parameters) end

--- Désactive le composant.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:238
function controller_drivingDynamics_supervisors_components_diffControl.shutdown() end

--- Vide (version debug : envoie un paquet d'état).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:147
---@param dt number Pas de temps graphique (s).
function controller_drivingDynamics_supervisors_components_diffControl.updateGFX(dt) end

return controller_drivingDynamics_supervisors_components_diffControl
