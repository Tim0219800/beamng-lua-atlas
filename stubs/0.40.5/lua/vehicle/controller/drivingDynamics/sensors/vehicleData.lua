---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Capteur « données véhicule » du système drivingDynamics (type "auxiliary", defaultOrder 54). Il identifie les quatre roues d'angle (avant/arrière, gauche/droite) par leur position, calcule une fois la géométrie du véhicule (empattement, distances centre de gravité-essieux, voie, masse, vitesse caractéristique, inertie en lacet) puis, à chaque pas, les angles de braquage réels des roues et les rapports de vitesse de roue dus au rayon de virage. Les autres modules drivingDynamics (yawControl, STMEstimate, virtualSensors, composants) lisent ces valeurs via cmu.vehicleData.
--- Accès : contrôleur `drivingDynamics/sensors/vehicleData` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_drivingDynamics_sensors_vehicleData
---@field defaultOrder number Ordre d'exécution par défaut (54).
---@field frontLeftWheelAngle number Angle de la roue avant gauche (rad), signé par la direction de braquage.
---@field frontRightWheelAngle number Angle de la roue avant droite (rad), signé par la direction de braquage.
---@field frontWheelAngle number Moyenne des deux angles avant (rad).
---@field isActive boolean Vrai quand les quatre roues d'angle ont été trouvées et la géométrie calculée.
---@field rearLeftWheelAngle number Angle de la roue arrière gauche (rad), non signé.
---@field rearRightWheelAngle number Angle de la roue arrière droite (rad), non signé.
---@field rearWheelAngle number Moyenne des deux angles arrière (rad).
---@field turningCircleSpeedRatios table<string, number> Rapport de vitesse attendu par nom de roue d'angle, dû au virage (1 = pas de correction).
---@field type string "auxiliary".
---@field vehicleStats table Géométrie et paramètres dynamiques calculés (voir notes).
---@field wheelAccess table Accès aux données des roues d'angle : frontRight, frontLeft, rearRight, rearLeft (entrées de wheels.wheels, nil tant que non trouvées).
local controller_drivingDynamics_sensors_vehicleData = {}

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua:241
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_sensors_vehicleData.init(jbeamData) end

--- Lit la configuration, identifie les roues d'angle, calcule la géométrie, la vitesse caractéristique et l'inertie en lacet, puis passe isActive à true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua:244
---@param jbeamData table Données jbeam (voir notes).
function controller_drivingDynamics_sensors_vehicleData.initSecondStage(jbeamData) end

--- Mémorise la référence au CMU (sensorHub, virtualSensors, sendDebugPacket).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua:347
---@param cmu table Contrôleur CMU.
function controller_drivingDynamics_sensors_vehicleData.registerCMU(cmu) end

--- Réinitialise le lisseur de l'accélération latérale utilisé pour le rayon de virage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua:237
function controller_drivingDynamics_sensors_vehicleData.reset() end

--- Active/désactive les journaux et paquets de debug.
---Source : lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua:340
---@param debugEnabled boolean Vrai pour activer.
function controller_drivingDynamics_sensors_vehicleData.setDebugMode(debugEnabled) end

--- Désactive le capteur (isActive=false, updateGFX et update à nil).
---Source : lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua:351
function controller_drivingDynamics_sensors_vehicleData.shutdown() end

--- Pas physique : met à jour angles de roue, rayons de virage et turningCircleSpeedRatios.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua:94
---@param dt number Pas de temps (s).
function controller_drivingDynamics_sensors_vehicleData.update(dt) end

--- Vide en mode normal ; remplacé par une version qui envoie un paquet de debug en mode debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua:142
---@param dt number Pas de temps graphique (s).
function controller_drivingDynamics_sensors_vehicleData.updateGFX(dt) end

return controller_drivingDynamics_sensors_vehicleData
