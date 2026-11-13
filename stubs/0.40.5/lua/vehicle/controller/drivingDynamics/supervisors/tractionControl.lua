---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Superviseur d'antipatinage (TCS) de la nouvelle architecture drivingDynamics (type "auxiliary", defaultOrder 65). Il ne calcule rien lui-même : à chaque pas fixe, pour chaque groupe de roues (un groupe par moteur listé dans tractionControlledMotors) il demande le glissement à la première slipProvider qui réussit, puis appelle actAsTractionControl de chaque composant enregistré (motorTorqueControl, brakeControl, diffControl, etc.). Il pilote aussi le voyant electrics.values.tcs/tcsActive. Les fournisseurs et composants s'enregistrent eux-mêmes via registerSlipProvider/registerComponent ; le CMU (drivingDynamics) appelle registerCMU.
--- Accès : contrôleur `drivingDynamics/supervisors/tractionControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_drivingDynamics_supervisors_tractionControl
---@field defaultOrder number Ordre d'exécution par défaut (65).
---@field isActing boolean Vrai quand le TCS intervient de façon soutenue (indicateur lissé >= 1).
---@field isActive boolean Vrai après init, faux après shutdown.
---@field tractionControlledWheels table Liste de {wheel = wd de la roue, wheelGroup = groupe}, remplie à initSecondStage.
---@field type string "auxiliary".
local controller_drivingDynamics_supervisors_tractionControl = {}

--- Renvoie une copie de la configuration courante.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:235
---@return table  Copie de {isEnabled, velocityOffsetThreshold}.
function controller_drivingDynamics_supervisors_tractionControl.getConfig() end

--- Vide les listes de fournisseurs et composants, lit velocityOffsetThreshold et passe isActive à true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:137
---@param jbeamData table Données jbeam du contrôleur.
function controller_drivingDynamics_supervisors_tractionControl.init(jbeamData) end

--- Trie fournisseurs de glissement et composants selon leur ordre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:190
---@param jbeamData table Données jbeam du contrôleur.
function controller_drivingDynamics_supervisors_tractionControl.initLastStage(jbeamData) end

--- Construit les groupes de roues à partir de tractionControlledMotors (powertrain.getDevice / getChildWheels), initialise lissage et glissement par roue, met electrics.values.hasTCS à true et sauvegarde les paramètres initiaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:148
---@param jbeamData table Données jbeam du contrôleur.
function controller_drivingDynamics_supervisors_tractionControl.initSecondStage(jbeamData) end

--- Mémorise la référence au CMU (accès à virtualSensors, sensorHub, applyParameter, sendDebugPacket).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:112
---@param cmu table Contrôleur CMU.
function controller_drivingDynamics_supervisors_tractionControl.registerCMU(cmu) end

--- Ajoute un composant qui doit exposer actAsTractionControl(wheelGroup, dt) et setParameters.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:116
---@param component table Composant de contrôle.
function controller_drivingDynamics_supervisors_tractionControl.registerComponent(component) end

--- Ajoute un fournisseur qui doit exposer calculateSlipTractionControl(wheelGroup, steeringCoef, velocityOffset, dt) renvoyant vrai si le glissement a été calculé, et setParameters.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:121
---@param slipProvider table Fournisseur de glissement.
function controller_drivingDynamics_supervisors_tractionControl.registerSlipProvider(slipProvider) end

--- Remet à zéro le glissement (slip, lastSlip, slipRange) et les lisseurs de toutes les roues.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:126
function controller_drivingDynamics_supervisors_tractionControl.reset() end

--- Envoie la configuration au CMU sous forme de paquet de debug (packetType "config").
---Source : lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:239
function controller_drivingDynamics_supervisors_tractionControl.sendConfigData() end

--- Remplace toute la configuration (controlParameters) et propage isEnabled.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:230
---@param configTable table Table {isEnabled, velocityOffsetThreshold}.
function controller_drivingDynamics_supervisors_tractionControl.setConfig(configTable) end

--- Active/désactive l'envoi de paquets de debug (vitesse de roue, glissement, slipRange) au CMU.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:106
---@param debugEnabled boolean Vrai pour activer.
function controller_drivingDynamics_supervisors_tractionControl.setDebugMode(debugEnabled) end

--- Modifie velocityOffsetThreshold et/ou isEnabled via CMU.applyParameter ; un changement de isEnabled est propagé aux fournisseurs et composants sous la clé "tractionControl.isEnabled".
---Source : lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:223
---@param parameters table<string, any> Paramètres à appliquer, ex. {isEnabled = false}.
function controller_drivingDynamics_supervisors_tractionControl.setParameters(parameters) end

--- Désactive le superviseur (isActive=false, updateGFX et update mis à nil).
---Source : lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:208
function controller_drivingDynamics_supervisors_tractionControl.shutdown() end

--- Pas fixe : calcule le glissement par groupe via les fournisseurs puis laisse les composants agir ; mémorise si au moins un composant est intervenu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:42
---@param dt number Pas de temps (s).
function controller_drivingDynamics_supervisors_tractionControl.updateFixedStep(dt) end

--- Met à jour les valeurs electrics du voyant TCS (remplacé par une version avec paquet de debug si setDebugMode(true)).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:72
---@param dt number Pas de temps graphique (s).
function controller_drivingDynamics_supervisors_tractionControl.updateGFX(dt) end

return controller_drivingDynamics_supervisors_tractionControl
