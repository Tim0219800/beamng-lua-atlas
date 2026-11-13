---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Superviseur de contrôle de lacet (ESC moderne, type "auxiliary", defaultOrder 60) de l'architecture drivingDynamics. À chaque pas fixe il demande le lacet attendu à la première yawProvider qui répond (ex. STMEstimate), le compare au lacet mesuré (sensorHub.yawAVSmooth), calcule l'écart et les angles de dérive avant/arrière, puis appelle actAsYawControl de chaque composant enregistré (brakeControl, motorTorqueControl, awdControl…). Il pilote le voyant electrics.values.esc/escActive.
--- Accès : contrôleur `drivingDynamics/supervisors/yawControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_drivingDynamics_supervisors_yawControl
---@field defaultOrder number Ordre d'exécution par défaut (60).
---@field isActing boolean Vrai quand le contrôle de lacet intervient de façon soutenue (indicateur lissé >= 1).
---@field isActive boolean Vrai après init, faux après shutdown.
---@field type string "auxiliary".
local controller_drivingDynamics_supervisors_yawControl = {}

--- Renvoie une copie de la configuration.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:201
---@return table  Copie de {isEnabled}.
function controller_drivingDynamics_supervisors_yawControl.getConfig() end

--- Réinitialise paramètres, fournisseurs et composants et met isActive à true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:139
---@param jbeamData table Données jbeam (inutilisées).
function controller_drivingDynamics_supervisors_yawControl.init(jbeamData) end

--- Trie fournisseurs et composants selon leur ordre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:156
---@param jbeamData table Données jbeam (inutilisées).
function controller_drivingDynamics_supervisors_yawControl.initLastStage(jbeamData) end

--- Met electrics.values.hasESC à true et sauvegarde les paramètres initiaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:150
---@param jbeamData table Données jbeam (inutilisées).
function controller_drivingDynamics_supervisors_yawControl.initSecondStage(jbeamData) end

--- Mémorise la référence au CMU (virtualSensors, vehicleData, sensorHub, sendDebugPacket, applyParameter, warningLightPulse).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:122
---@param cmu table Contrôleur CMU.
function controller_drivingDynamics_supervisors_yawControl.registerCMU(cmu) end

--- Ajoute un composant exposant actAsYawControl.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:131
---@param component table Composant de contrôle.
function controller_drivingDynamics_supervisors_yawControl.registerComponent(component) end

--- Ajoute un fournisseur de lacet attendu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:126
---@param yawProvider table Fournisseur exposant calculateExpectedYaw.
function controller_drivingDynamics_supervisors_yawControl.registerYawProvider(yawProvider) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:136
function controller_drivingDynamics_supervisors_yawControl.reset() end

--- Envoie la configuration au CMU (paquet de debug "config").
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:205
function controller_drivingDynamics_supervisors_yawControl.sendConfigData() end

--- Remplace la configuration et propage isEnabled.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:196
---@param configTable table Table {isEnabled}.
function controller_drivingDynamics_supervisors_yawControl.setConfig(configTable) end

--- Active/désactive l'envoi de paquets de debug (écarts de lacet, angles de dérive, vitesse utilisée) au CMU.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:116
---@param debugEnabled boolean Vrai pour activer.
function controller_drivingDynamics_supervisors_yawControl.setDebugMode(debugEnabled) end

--- Modifie isEnabled via CMU.applyParameter ; propagé aux fournisseurs (clé "isEnabled") et aux composants (clé "yawControl.isEnabled").
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:190
---@param parameters table<string, any> Ex. {isEnabled = false}.
function controller_drivingDynamics_supervisors_yawControl.setParameters(parameters) end

--- Désactive le superviseur (isActive=false, updateGFX, update et updateFixedStep à nil).
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:174
function controller_drivingDynamics_supervisors_yawControl.shutdown() end

--- Pas fixe : calcule lacet attendu, écart, angles de dérive, puis appelle les composants.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:43
---@param dt number Pas de temps (s).
function controller_drivingDynamics_supervisors_yawControl.updateFixedStep(dt) end

--- Met à jour electrics.values.esc et escActive depuis l'état lissé (remplacé par une version avec paquet de debug si setDebugMode(true)).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:91
---@param dt number Pas de temps graphique (s).
function controller_drivingDynamics_supervisors_yawControl.updateGFX(dt) end

return controller_drivingDynamics_supervisors_yawControl
