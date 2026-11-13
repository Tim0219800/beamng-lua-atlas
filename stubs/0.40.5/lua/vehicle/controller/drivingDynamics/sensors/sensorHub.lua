---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Capteur central de la Driving Dynamics Suite : à chaque pas physique il lit les vitesses angulaires (roulis, tangage, lacet), l'attitude (roll, pitch), les accélérations X/Y/Z (via `sensors.ffiSensors`), les entrées du conducteur, et calcule des versions lissées ainsi qu'un « bruit » d'accélération (écart entre enveloppes haute et basse, limité à 150). Les autres contrôleurs de `drivingDynamics/` (superviseurs, actionneurs, CMU) lisent ces champs, accessibles par `CMU.sensorHub` ou `CMU.getSensor("sensorHub")`. Ordre d'appel : `defaultOrder = 52`.
--- Accès : contrôleur `drivingDynamics/sensors/sensorHub` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_drivingDynamics_sensors_sensorHub
---@field accNoiseX number Niveau de bruit d'accélération X (0 à 150).
---@field accNoiseY number Niveau de bruit d'accélération Y (0 à 150).
---@field accNoiseZ number Niveau de bruit d'accélération Z (après retrait de la gravité, 0 à 150).
---@field accelerationX number Accélération longitudinale brute (m/s²).
---@field accelerationXSmooth number accelerationX lissée.
---@field accelerationY number Accélération latérale brute (m/s²).
---@field accelerationYSmooth number accelerationY lissée.
---@field accelerationZ number Accélération verticale brute non inertielle (m/s²).
---@field accelerationZSmooth number accelerationZ lissée.
---@field defaultOrder number 52.
---@field gravity number Gravité du monde (`obj:getGravity()`), mise à jour chaque frame GFX.
---@field isActive boolean true après init, false après shutdown.
---@field pitch number Angle de tangage en rad.
---@field pitchAV number Vitesse angulaire de tangage en rad/s.
---@field pitchAVSmooth number pitchAV lissée.
---@field roll number Angle de roulis en rad.
---@field rollAV number Vitesse angulaire de roulis en rad/s.
---@field rollAVSmooth number rollAV lissée.
---@field steeringInput number Valeur de `electrics.values.steering_input`.
---@field type string "auxiliary".
---@field vX number Vitesse longitudinale en m/s (calculée seulement en mode debug).
---@field vY number Vitesse latérale en m/s (calculée seulement en mode debug).
---@field yawAV number Vitesse angulaire de lacet en rad/s.
---@field yawAVSmooth number yawAV lissée.
---@field yawAcceleration number Voir la note : vaut yawAV / dt en pratique.
local controller_drivingDynamics_sensors_sensorHub = {}

--- Lit la gravité, marque le capteur actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua:172
---@param jbeamData table Données jbeam (non utilisées).
function controller_drivingDynamics_sensors_sensorHub.init(jbeamData) end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua:178
function controller_drivingDynamics_sensors_sensorHub.initLastStage() end

--- Appelée par le CMU lors de son initSecondStage pour donner une référence vers lui (utilisée pour le debug).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua:188
---@param cmu table Module CMU.
function controller_drivingDynamics_sensors_sensorHub.registerCMU(cmu) end

--- Réinitialise tous les lisseurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua:155
function controller_drivingDynamics_sensors_sensorHub.reset() end

--- Bascule entre les variantes normale et debug de update/updateGFX.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua:181
---@param debugEnabled boolean true pour remplir et envoyer le paquet de debug.
function controller_drivingDynamics_sensors_sensorHub.setDebugMode(debugEnabled) end

--- Arrête le capteur : isActive = false et fonctions d'update retirées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua:192
function controller_drivingDynamics_sensors_sensorHub.shutdown() end

--- Pas physique : lit et lisse vitesses angulaires, attitude, accélérations et bruit. Remplacée par updateDebug en mode debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua:71
---@param dt number Pas physique en secondes.
function controller_drivingDynamics_sensors_sensorHub.update(dt) end

--- Chaque frame : met à jour la gravité. En mode debug, envoie aussi le paquet de debug au CMU.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua:144
---@param dt number Pas de temps en secondes.
function controller_drivingDynamics_sensors_sensorHub.updateGFX(dt) end

return controller_drivingDynamics_sensors_sensorHub
