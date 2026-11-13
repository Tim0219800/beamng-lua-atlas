---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Capteurs virtuels du système drivingDynamics (type "auxiliary", defaultOrder 56) : estime la vitesse réelle du véhicule (virtual.speed), l'angle de dérive de caisse (bodySlipAngle) et la vitesse de roue de référence, sans capteur de vitesse sol. Il intègre l'accélération mesurée à partir de la position du centre de gravité, la corrige par des critères de remise à zéro (arrêt, roulage libre, ligne droite, cohérence des accélérations de roues) et publie des indices de confiance (trustWorthiness). Les superviseurs (yawControl, tractionControl) et les fournisseurs de glissement lisent cmu.virtualSensors.virtual et .trustWorthiness.
--- Accès : contrôleur `drivingDynamics/sensors/virtualSensors` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_drivingDynamics_sensors_virtualSensors
---@field defaultOrder number Ordre d'exécution par défaut (56).
---@field isActive boolean Vrai après init, faux après shutdown.
---@field reference table Valeurs de référence calculées uniquement en mode debug : bodySlipAngle (rad) et speed (m/s) issus du capteur de vitesse du moteur physique.
---@field trustWorthiness table Indices de confiance 0..1 : pitch, roll, jerk (jamais modifié, reste 1), bodySlipAngle, wheelSpeed, virtualSpeed, recoverySpeed ; needsFullReset (boolean).
---@field type string "auxiliary".
---@field virtual table Estimations : speed, integratedSpeed, avgWheelSpeed (jamais mis à jour), avgNonPropulsedWheelSpeed (jamais mis à jour), wheelSpeed, imuAcceleration, recoveryWheelSpeed, recoveryWheelCount, bodySlipAngle, bodySlipAngleIntegrated, bodySlipAngleLowSpeed, bodySlipAngleLowSpeedTrust, lastBodySlipAngle, bodySlipAngleRate.
local controller_drivingDynamics_sensors_virtualSensors = {}

--- Remet à zéro les estimations et confiances, vide les caches et passe isActive à true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua:617
---@param jbeamData table Données jbeam (inutilisées).
function controller_drivingDynamics_sensors_virtualSensors.init(jbeamData) end

--- Calcule le décalage du centre de gravité par rapport au nœud de référence, nécessaire à la dérivation de l'accélération à partir de la position.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua:648
function controller_drivingDynamics_sensors_virtualSensors.initLastStage() end

--- Mémorise la référence au CMU (sensorHub, vehicleData, systemDegradationDetected/Resolved, logDebugMessage, sendDebugPacket).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua:676
---@param cmu table Contrôleur CMU.
function controller_drivingDynamics_sensors_virtualSensors.registerCMU(cmu) end

--- Remet à zéro tout l'état d'estimation (vitesse, dérive, lisseurs, probabilités, échantillonnage de position).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua:560
---@param jbeamData table Données jbeam (inutilisées).
function controller_drivingDynamics_sensors_virtualSensors.reset(jbeamData) end

--- Active/désactive les paquets de debug et le calcul des valeurs de référence.
---Source : lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua:669
---@param debugEnabled boolean Vrai pour activer.
function controller_drivingDynamics_sensors_virtualSensors.setDebugMode(debugEnabled) end

--- Désactive le capteur (isActive=false, updateGFX, update et updateWheelsIntermediate à nil).
---Source : lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua:680
function controller_drivingDynamics_sensors_virtualSensors.shutdown() end

--- Pas physique : intègre l'accélération pour virtual.speed et met à jour l'angle de dérive de caisse (basse vitesse par géométrie de roue avant, haute vitesse par intégration, mélange entre 4 et 5 m/s).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua:488
---@param dt number Pas de temps (s).
function controller_drivingDynamics_sensors_virtualSensors.update(dt) end

--- Pas fixe : met à jour vitesse de roue, vitesse de récupération et indices de confiance / conditions de remise à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua:420
---@param dt number Pas de temps (s).
function controller_drivingDynamics_sensors_virtualSensors.updateFixedStep(dt) end

--- Vide en mode normal ; envoie un paquet de debug riche en mode debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua:513
---@param dt number Pas de temps graphique (s).
function controller_drivingDynamics_sensors_virtualSensors.updateGFX(dt) end

return controller_drivingDynamics_sensors_virtualSensors
