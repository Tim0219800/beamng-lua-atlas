---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant de contrôle de lacet (type "auxiliary", defaultOrder 70) pour l'aérodynamique active. Il s'enregistre auprès du superviseur yawControl (ordre 30) ; quand le véhicule survire (angle de dérive de caisse de signe opposé au lacet et supérieur à un seuil), il écrit electrics.values.yawControlRequestReduceOversteer (1 ou 0) que les éléments aéro (ailerons, volets) du véhicule peuvent lire pour réduire le survirage. Ne sert pas à l'antipatinage ni à l'ABS.
--- Accès : contrôleur `drivingDynamics/supervisors/components/aeroControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_drivingDynamics_supervisors_components_aeroControl
---@field actAsABSControl function nop.
---@field componentOrderABSControl number 1000 : jamais utilisé comme ABS.
---@field componentOrderTractionControl number 1000 : jamais utilisé comme antipatinage.
---@field componentOrderYawControl number 30 : ordre d'appel par yawControl.
---@field defaultOrder number Ordre d'exécution par défaut (70).
---@field isActingAsABS boolean Toujours false.
---@field isActingAsTC boolean Toujours false.
---@field isActingAsYC boolean Vrai quand la réduction de survirage est demandée.
---@field isActive boolean Vrai après initSecondStage.
---@field type string "auxiliary".
local controller_drivingDynamics_supervisors_components_aeroControl = {}

--- Appelé par tractionControl ; ne fait rien (renvoie false, remplacée par nop à l'init).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:34
---@param wheelGroup table Groupe de roues.
---@param dt number Pas de temps (s).
---@return boolean  false.
function controller_drivingDynamics_supervisors_components_aeroControl.actAsTractionControl(wheelGroup, dt) end

--- Appelé par yawControl à chaque pas fixe : détecte le survirage via l'angle de dérive de caisse et met à jour electrics.values.yawControlRequestReduceOversteer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:41
---@param measuredYaw number Lacet mesuré (rad/s).
---@param expectedYaw number Lacet attendu (rad/s), non utilisé.
---@param yawDifference number Écart de lacet, non utilisé.
---@param bodySlipAngle number Angle de dérive de caisse ajusté (rad).
---@param frontSlipAngle number Angle de dérive avant (rad), non utilisé.
---@param rearSlipAngle number Angle de dérive arrière (rad), non utilisé.
---@param dt number Pas de temps (s).
---@return boolean  Vrai si la réduction de survirage est demandée.
function controller_drivingDynamics_supervisors_components_aeroControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt) end

--- Renvoie une copie de la configuration.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:137
---@return table  Copie de la configuration.
function controller_drivingDynamics_supervisors_components_aeroControl.getConfig() end

--- Remet à false les indicateurs d'action.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:90
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_supervisors_components_aeroControl.init(jbeamData) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:112
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_supervisors_components_aeroControl.initLastStage(jbeamData) end

--- S'enregistre auprès de yawControl, lit slipAngleThreshold et passe isActive à true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:96
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_supervisors_components_aeroControl.initSecondStage(jbeamData) end

--- Mémorise la référence au CMU.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:76
---@param cmu table Contrôleur CMU.
function controller_drivingDynamics_supervisors_components_aeroControl.registerCMU(cmu) end

--- Remet à zéro les indicateurs et le lisseur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:83
function controller_drivingDynamics_supervisors_components_aeroControl.reset() end

--- Envoie la configuration au CMU (paquet de debug).
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:141
function controller_drivingDynamics_supervisors_components_aeroControl.sendConfigData() end

--- Remplace la configuration complète.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:132
---@param configTable table Table {yawControl = {isEnabled, slipAngleThreshold}}.
function controller_drivingDynamics_supervisors_components_aeroControl.setConfig(configTable) end

--- Active/désactive les paquets de debug.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:70
---@param debugEnabled boolean Vrai pour activer.
function controller_drivingDynamics_supervisors_components_aeroControl.setDebugMode(debugEnabled) end

--- Applique des paramètres (voir notes) via CMU.applyParameter.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:124
---@param parameters table<string, any> Ex. {["yawControl.slipAngleThreshold"] = 0.3}.
function controller_drivingDynamics_supervisors_components_aeroControl.setParameters(parameters) end

--- Désactive le composant.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:115
function controller_drivingDynamics_supervisors_components_aeroControl.shutdown() end

--- Vide (version debug : envoie un paquet d'état au CMU).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:57
---@param dt number Pas de temps graphique (s).
function controller_drivingDynamics_supervisors_components_aeroControl.updateGFX(dt) end

return controller_drivingDynamics_supervisors_components_aeroControl
