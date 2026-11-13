---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/CMU.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- CMU (centre de gestion de la dynamique de conduite, Driving Dynamics Suite) : contrôleur chef d'orchestre des sous-contrôleurs du dossier `drivingDynamics/` (capteurs `sensors/`, superviseurs `supervisors/`, actionneurs `actuators/`). Il les retrouve et les enregistre (`registerCMU`), expose des accesseurs (getSensor, getSupervisor, getActuator...), détecte retournement et crash, gère l'état global du système (normal, degraded, offline), le voyant d'avertissement clignotant, des callbacks de calibration, et un canal de debug UDP (par défaut 127.0.0.1:54812) pour un outil externe. Ordre d'appel : `defaultOrder = 50`.
--- Accès : contrôleur `drivingDynamics/CMU` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_drivingDynamics_CMU
---@field defaultOrder number 50.
---@field sensorHub table|nil Sous-contrôleur `drivingDynamics/sensors/sensorHub` (rempli par initSecondStage).
---@field systemState string État global du système : "normal", "degraded" ou "offline".
---@field systemStates table<string, string> Constantes : normal, degraded, offline.
---@field type string "auxiliary".
---@field updateCalibrationCallback function nop ou fonction qui exécute les callbacks de calibration de type update.
---@field updateFixedStepCalibrationCallback function nop ou fonction qui exécute les callbacks de type updateFixedStep.
---@field updateGFXCalibrationCallback function nop ou fonction qui exécute les callbacks de type updateGFX.
---@field vehicleData table|nil Sous-contrôleur `sensors/vehicleData` (rempli par initSecondStage).
---@field virtualSensors table|nil Sous-contrôleur `sensors/virtualSensors` (rempli par initSecondStage).
---@field warningLightPulse integer 0 ou 1, bascule toutes les 0,15 s pour le clignotement du voyant.
local controller_drivingDynamics_CMU = {}

--- Modifie un paramètre d'une table de configuration identifié par un chemin pointé (ex. "uiDisplayData.simplePowertrainApp.activeColor"). La valeur "default" restaure la valeur initiale. Ne crée jamais de nouveau paramètre.
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:440
---@param currentParameters table Configuration courante (modifiée).
---@param initialParameters table Configuration initiale (pour "default").
---@param changedParameters table Table des changements, indexée par chemin pointé.
---@param name string Chemin pointé du paramètre.
---@return boolean  true si un paramètre a été modifié.
function controller_drivingDynamics_CMU.applyParameter(currentParameters, initialParameters, changedParameters, name) end

--- Désactive tous les superviseurs (`setParameters({isEnabled = false})`) pour permettre une calibration.
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:74
function controller_drivingDynamics_CMU.disableSystemsForCalibration() end

--- Retrouve un actionneur par son nom de fichier dans `drivingDynamics/actuators/`.
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:424
---@param actuatorName string Nom du type d'actionneur.
---@return table|nil  Le sous-contrôleur.
function controller_drivingDynamics_CMU.getActuator(actuatorName) end

--- Liste tous les actionneurs chargés.
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:436
---@return table[]  Sous-contrôleurs du dossier actuators.
function controller_drivingDynamics_CMU.getActuators() end

--- Renvoie une copie de la configuration du CMU.
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:488
---@return table  Copie profonde des paramètres de contrôle.
function controller_drivingDynamics_CMU.getConfig() end

--- Retrouve un capteur par son nom de fichier dans `drivingDynamics/sensors/`.
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:416
---@param sensorName string Nom du type de capteur (ex. "sensorHub").
---@return table|nil  Le sous-contrôleur.
function controller_drivingDynamics_CMU.getSensor(sensorName) end

--- Liste tous les capteurs chargés.
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:432
---@return table[]  Sous-contrôleurs du dossier sensors.
function controller_drivingDynamics_CMU.getSensors() end

--- Retrouve un superviseur par son nom de fichier dans `drivingDynamics/supervisors/` (ex. yawControl, tractionControl).
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:420
---@param supervisorName string Nom du type de superviseur.
---@return table|nil  Le sous-contrôleur.
function controller_drivingDynamics_CMU.getSupervisor(supervisorName) end

--- Liste tous les superviseurs chargés.
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:428
---@return table[]  Sous-contrôleurs du dossier supervisors.
function controller_drivingDynamics_CMU.getSupervisors() end

--- Ouvre la socket UDP de debug, prépare les paramètres de contrôle (affichage UI) et efface les electrics de crash.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:301
---@param jbeamData table Données jbeam du CMU.
function controller_drivingDynamics_CMU.init(jbeamData) end

--- Vérifie que tous les sous-contrôleurs sont actifs (sinon les arrête), remet l'état à normal et envoie un paquet de debug d'init.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:365
function controller_drivingDynamics_CMU.initLastStage() end

--- Recense les sous-contrôleurs du dossier drivingDynamics/, les enregistre auprès du CMU (`registerCMU`), retrouve les capteurs de base et désactive le mode debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:335
function controller_drivingDynamics_CMU.initSecondStage() end

--- Ajoute un message de debug (paquet `systemDebugMessage`) à la file envoyée par UDP.
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:248
---@param source string Origine du message.
---@param message string Texte.
function controller_drivingDynamics_CMU.logDebugMessage(source, message) end

--- Enregistre une fonction appelée à chaque pas (update, updateFixedStep ou updateGFX) pendant une calibration.
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:81
---@param callback function Fonction appelée avec dt.
---@param callbackType string "update", "updateFixedStep" ou "updateGFX".
function controller_drivingDynamics_CMU.registerCalibrationCallback(callback, callbackType) end

--- Efface les paquets de debug, les electrics de crash et les lisseurs, et remet l'état à normal.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:290
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_CMU.reset(jbeamData) end

--- Ajoute un paquet à la file de debug (en y inscrivant `vehicleID`).
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:95
---@param packet table Paquet de debug (sourceType, packetType, ...).
function controller_drivingDynamics_CMU.sendDebugPacket(packet) end

--- Remplace toute la configuration du CMU.
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:484
---@param configTable table Nouvelle configuration.
function controller_drivingDynamics_CMU.setConfig(configTable) end

--- Active ou désactive le mode debug du CMU (choix de la variante de updateGFX) et le propage à tous les sous-contrôleurs ayant `setDebugMode`, puis reconstruit les caches.
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:279
---@param debugEnabled boolean true pour envoyer les données de debug à 30 Hz.
function controller_drivingDynamics_CMU.setDebugMode(debugEnabled) end

--- Modifie les paramètres d'affichage du CMU (uiDisplayData.simplePowertrainApp.activeColor, offColor, doUpdate) et `notifySystemStateDegraded` ; met à jour le bouton « DSE » du contrôleur driveModes si présent.
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:471
---@param parameters table Table indexée par chemins pointés.
function controller_drivingDynamics_CMU.setParameters(parameters) end

--- Passe le système en état degraded, loggue la raison dans le debug et marque le dommage `systemStateDegraded`.
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:253
---@param reason string Raison de la dégradation.
function controller_drivingDynamics_CMU.systemDegradationDetected(reason) end

--- Repasse le système en état normal et efface le dommage `systemStateDegraded`.
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:263
function controller_drivingDynamics_CMU.systemDegradationResolved() end

--- Pas physique : exécute les callbacks de calibration de type update.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:244
---@param dt number Pas physique en secondes.
function controller_drivingDynamics_CMU.update(dt) end

--- Pas fixe (100 Hz) : exécute les callbacks de calibration de type updateFixedStep.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:240
---@param dt number Pas en secondes.
function controller_drivingDynamics_CMU.updateFixedStep(dt) end

--- Chaque frame : détecte retournement et crash, anime le voyant d'avertissement, exécute les callbacks de calibration GFX et (selon le mode debug) échange les paquets UDP. Remplacée par une variante debug via setDebugMode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/CMU.lua:188
---@param dt number Pas de temps en secondes.
function controller_drivingDynamics_CMU.updateGFX(dt) end

return controller_drivingDynamics_CMU
