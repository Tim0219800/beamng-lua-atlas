---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant du système drivingDynamics qui réduit le couple moteur via device.throttleFactor, pour l'antipatinage (ordre 40) et le contrôle de lacet (ordre 40). Pour chaque moteur concerné, le facteur final est min(facteur antipatinage, facteur lacet), recalculé à chaque pas fixe. L'antipatinage utilise un PID sur le glissement maximal du groupe de roues du moteur ; le lacet utilise trois PID (écart de lacet, dérive de caisse, dérive avant). N'est pas utilisable pour l'ABS.
--- Accès : contrôleur `drivingDynamics/supervisors/components/motorTorqueControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_drivingDynamics_supervisors_components_motorTorqueControl
---@field actAsABSControl function nop.
---@field componentOrderABSControl number 1000 : inutilisé.
---@field componentOrderTractionControl number 40.
---@field componentOrderYawControl number 40.
---@field defaultOrder number Ordre d'exécution par défaut (70).
---@field isActingAsABS boolean Toujours false.
---@field isActingAsTC boolean Vrai quand le couple est réduit pour l'antipatinage.
---@field isActingAsYC boolean Vrai quand le couple est réduit par le contrôle de lacet.
---@field isActive boolean Vrai après init.
---@field type string "auxiliary".
local controller_drivingDynamics_supervisors_components_motorTorqueControl = {}

--- Appelé par tractionControl : calcule le facteur de couple du moteur d'un groupe de roues d'après le glissement maximal du groupe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:54
---@param wheelGroup table Groupe de roues {motor, maxSlip…}.
---@param dt number Pas de temps (s).
---@return boolean  Vrai si le couple est réduit.
function controller_drivingDynamics_supervisors_components_motorTorqueControl.actAsTractionControl(wheelGroup, dt) end

--- Appelé par yawControl : calcule un facteur de couple commun à tous les moteurs contrôlés d'après l'écart de lacet, l'angle de dérive de caisse (survirage seulement) et la dérive avant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:80
---@param measuredYaw number Lacet mesuré (rad/s).
---@param expectedYaw number Non utilisé.
---@param yawDifference number Écart de lacet.
---@param bodySlipAngle number Angle de dérive de caisse ajusté (rad).
---@param frontSlipAngle number Angle de dérive avant (rad).
---@param rearSlipAngle number Non utilisé.
---@param dt number Pas de temps (s).
---@return boolean  Vrai si le couple est réduit.
function controller_drivingDynamics_supervisors_components_motorTorqueControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt) end

--- Renvoie une copie de la configuration.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:348
---@return table  Copie de la configuration.
function controller_drivingDynamics_supervisors_components_motorTorqueControl.getConfig() end

--- Passe isActive à true et remet à false les indicateurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:173
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_supervisors_components_motorTorqueControl.init(jbeamData) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:308
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_supervisors_components_motorTorqueControl.initLastStage(jbeamData) end

--- Lit la configuration, crée les PID, liste les moteurs contrôlés et s'enregistre auprès des superviseurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:190
---@param jbeamData table Données jbeam (voir notes).
function controller_drivingDynamics_supervisors_components_motorTorqueControl.initSecondStage(jbeamData) end

--- Mémorise la référence au CMU.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:147
---@param cmu table Contrôleur CMU.
function controller_drivingDynamics_supervisors_components_motorTorqueControl.registerCMU(cmu) end

--- Remet à zéro les indicateurs et les PID.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:151
function controller_drivingDynamics_supervisors_components_motorTorqueControl.reset() end

--- Envoie la configuration au CMU.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:352
function controller_drivingDynamics_supervisors_components_motorTorqueControl.sendConfigData() end

--- Remplace la configuration complète.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:343
---@param configTable table Table {tractionControl, yawControl}.
function controller_drivingDynamics_supervisors_components_motorTorqueControl.setConfig(configTable) end

--- Active/désactive les paquets de debug.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:141
---@param debugEnabled boolean Vrai pour activer.
function controller_drivingDynamics_supervisors_components_motorTorqueControl.setDebugMode(debugEnabled) end

--- Applique des paramètres (voir notes) puis reconfigure les PID d'antipatinage.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:320
---@param parameters table<string, any> Paramètres à appliquer.
function controller_drivingDynamics_supervisors_components_motorTorqueControl.setParameters(parameters) end

--- Désactive le composant.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:311
function controller_drivingDynamics_supervisors_components_motorTorqueControl.shutdown() end

--- Applique à chaque moteur contrôlé throttleFactor = min(facteur TC, facteur YC).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:41
---@param dt number Pas de temps (s).
function controller_drivingDynamics_supervisors_components_motorTorqueControl.updateFixedStep(dt) end

--- Vide (version debug : envoie un paquet détaillé).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:104
---@param dt number Pas de temps graphique (s).
function controller_drivingDynamics_supervisors_components_motorTorqueControl.updateGFX(dt) end

return controller_drivingDynamics_supervisors_components_motorTorqueControl
