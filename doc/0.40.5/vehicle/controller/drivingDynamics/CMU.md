# `controller_drivingDynamics_CMU`

*Fichier : `lua/vehicle/controller/drivingDynamics/CMU.lua` · VM : Véhicule · 528 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `drivingDynamics/CMU` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

CMU (centre de gestion de la dynamique de conduite, Driving Dynamics Suite) : contrôleur chef d'orchestre des sous-contrôleurs du dossier `drivingDynamics/` (capteurs `sensors/`, superviseurs `supervisors/`, actionneurs `actuators/`). Il les retrouve et les enregistre (`registerCMU`), expose des accesseurs (getSensor, getSupervisor, getActuator...), détecte retournement et crash, gère l'état global du système (normal, degraded, offline), le voyant d'avertissement clignotant, des callbacks de calibration, et un canal de debug UDP (par défaut 127.0.0.1:54812) pour un outil externe. Ordre d'appel : `defaultOrder = 50`.

## Exemple

```lua
local cmu = controller.getControllerSafe("drivingDynamics/CMU")
local hub = cmu.getSensor("sensorHub")
for _, a in ipairs(cmu.getActuators()) do print(a.name) end
```

## Remarques

- Clés jbeam lues par init : `debugSettings.peerIP` ("127.0.0.1"), `debugSettings.peerPort` (54812), `indicateUI`.
- Bug : `indicateUI = jbeamData.indicateUI == nil and true or false` donne true seulement si la clé est absente ; si le jbeam met explicitement `indicateUI` à true, la valeur devient false.
- `enableDebugHeartbeat` vaut toujours true (`true or not shippingBuild`) : le heartbeat UDP « BNGDSE » est envoyé à 1 Hz et les commandes reçues sont lues, si la socket UDP s'est connectée.
- Commandes UDP reconnues (format `type->nomContrôleur[->json]`) : RequestConfig, EnableDebugMode, SetConfig, SetProperty. EnableDebugMode ne vérifie pas que le destinataire existe (erreur si nom inconnu).
- Electrics écrits : `dseCrashStopped`, `dseRollOverStopped`, `dseRollingOver` (1 ou nil), `dseWarningPulse` (voyant ; 1 fixe si le système n'est pas normal), `isYCBrakeActive` et `isTCBrakeActive` (0 à l'init). Lit `postCrashBrakeTriggered`.
- Le voyant clignote à 0,15 s quand le superviseur `yawControl` ou `tractionControl` agit (`isActing`).
- initLastStage : si un sous-contrôleur n'a pas `isActive`, tous les systèmes sont arrêtés (`shutdown`) et l'état passe à offline.
- `systemDegradationDetected` marque le dommage `drivingDynamics/systemStateDegraded` dans damageTracker.
- Aucun superviseur ni capteur n'est défini dans ce lot ; seuls les actionneurs et sensorHub du lot sont documentés.
- Les champs updateCalibrationCallback, updateFixedStepCalibrationCallback et updateGFXCalibrationCallback valent `nop` (fonction vide) tant qu'aucune callback n'est enregistrée ; sensorHub, vehicleData et virtualSensors sont nil jusqu'à initSecondStage.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_drivingDynamics_CMU.applyParameter(currentParameters, initialParameters, changedParameters, name)` | Modifie un paramètre d'une table de configuration identifié par un chemin pointé (ex. "uiDisplayData.simplePowertrainApp.activeColor"). La valeur "default" restaure la valeur initiale. Ne crée jamais de nouveau paramètre. | 440 |
| `controller_drivingDynamics_CMU.disableSystemsForCalibration()` | Désactive tous les superviseurs (`setParameters({isEnabled = false})`) pour permettre une calibration. | 74 |
| `controller_drivingDynamics_CMU.getActuator(actuatorName)` | Retrouve un actionneur par son nom de fichier dans `drivingDynamics/actuators/`. | 424 |
| `controller_drivingDynamics_CMU.getActuators()` | Liste tous les actionneurs chargés. | 436 |
| `controller_drivingDynamics_CMU.getConfig()` | Renvoie une copie de la configuration du CMU. | 488 |
| `controller_drivingDynamics_CMU.getSensor(sensorName)` | Retrouve un capteur par son nom de fichier dans `drivingDynamics/sensors/`. | 416 |
| `controller_drivingDynamics_CMU.getSensors()` | Liste tous les capteurs chargés. | 432 |
| `controller_drivingDynamics_CMU.getSupervisor(supervisorName)` | Retrouve un superviseur par son nom de fichier dans `drivingDynamics/supervisors/` (ex. yawControl, tractionControl). | 420 |
| `controller_drivingDynamics_CMU.getSupervisors()` | Liste tous les superviseurs chargés. | 428 |
| `controller_drivingDynamics_CMU.init(jbeamData)` | Ouvre la socket UDP de debug, prépare les paramètres de contrôle (affichage UI) et efface les electrics de crash. *(interne)* | 301 |
| `controller_drivingDynamics_CMU.initLastStage()` | Vérifie que tous les sous-contrôleurs sont actifs (sinon les arrête), remet l'état à normal et envoie un paquet de debug d'init. *(interne)* | 365 |
| `controller_drivingDynamics_CMU.initSecondStage()` | Recense les sous-contrôleurs du dossier drivingDynamics/, les enregistre auprès du CMU (`registerCMU`), retrouve les capteurs de base et désactive le mode debug. *(interne)* | 335 |
| `controller_drivingDynamics_CMU.logDebugMessage(source, message)` | Ajoute un message de debug (paquet `systemDebugMessage`) à la file envoyée par UDP. | 248 |
| `controller_drivingDynamics_CMU.registerCalibrationCallback(callback, callbackType)` | Enregistre une fonction appelée à chaque pas (update, updateFixedStep ou updateGFX) pendant une calibration. | 81 |
| `controller_drivingDynamics_CMU.reset(jbeamData)` | Efface les paquets de debug, les electrics de crash et les lisseurs, et remet l'état à normal. *(interne)* | 290 |
| `controller_drivingDynamics_CMU.sendDebugPacket(packet)` | Ajoute un paquet à la file de debug (en y inscrivant `vehicleID`). | 95 |
| `controller_drivingDynamics_CMU.setConfig(configTable)` | Remplace toute la configuration du CMU. | 484 |
| `controller_drivingDynamics_CMU.setDebugMode(debugEnabled)` | Active ou désactive le mode debug du CMU (choix de la variante de updateGFX) et le propage à tous les sous-contrôleurs ayant `setDebugMode`, puis reconstruit les caches. | 279 |
| `controller_drivingDynamics_CMU.setParameters(parameters)` | Modifie les paramètres d'affichage du CMU (uiDisplayData.simplePowertrainApp.activeColor, offColor, doUpdate) et `notifySystemStateDegraded` ; met à jour le bouton « DSE » du contrôleur driveModes si présent. | 471 |
| `controller_drivingDynamics_CMU.systemDegradationDetected(reason)` | Passe le système en état degraded, loggue la raison dans le debug et marque le dommage `systemStateDegraded`. | 253 |
| `controller_drivingDynamics_CMU.systemDegradationResolved()` | Repasse le système en état normal et efface le dommage `systemStateDegraded`. | 263 |
| `controller_drivingDynamics_CMU.update(dt)` | Pas physique : exécute les callbacks de calibration de type update. *(interne)* | 244 |
| `controller_drivingDynamics_CMU.updateFixedStep(dt)` | Pas fixe (100 Hz) : exécute les callbacks de calibration de type updateFixedStep. *(interne)* | 240 |
| `controller_drivingDynamics_CMU.updateGFX(dt)` | Chaque frame : détecte retournement et crash, anime le voyant d'avertissement, exécute les callbacks de calibration GFX et (selon le mode debug) échange les paquets UDP. Remplacée par une variante debug via setDebugMode. *(interne)* | 188 |

### Détail des paramètres

#### `controller_drivingDynamics_CMU.applyParameter(currentParameters, initialParameters, changedParameters, name)`

Modifie un paramètre d'une table de configuration identifié par un chemin pointé (ex. "uiDisplayData.simplePowertrainApp.activeColor"). La valeur "default" restaure la valeur initiale. Ne crée jamais de nouveau paramètre.

- `currentParameters` (*table*) : Configuration courante (modifiée).
- `initialParameters` (*table*) : Configuration initiale (pour "default").
- `changedParameters` (*table*) : Table des changements, indexée par chemin pointé.
- `name` (*string*) : Chemin pointé du paramètre.
- **renvoie** : boolean true si un paramètre a été modifié.

#### `controller_drivingDynamics_CMU.getActuator(actuatorName)`

Retrouve un actionneur par son nom de fichier dans `drivingDynamics/actuators/`.

- `actuatorName` (*string*) : Nom du type d'actionneur.
- **renvoie** : table|nil Le sous-contrôleur.

#### `controller_drivingDynamics_CMU.getActuators()`

Liste tous les actionneurs chargés.

- **renvoie** : table[] Sous-contrôleurs du dossier actuators.

#### `controller_drivingDynamics_CMU.getConfig()`

Renvoie une copie de la configuration du CMU.

- **renvoie** : table Copie profonde des paramètres de contrôle.

#### `controller_drivingDynamics_CMU.getSensor(sensorName)`

Retrouve un capteur par son nom de fichier dans `drivingDynamics/sensors/`.

- `sensorName` (*string*) : Nom du type de capteur (ex. "sensorHub").
- **renvoie** : table|nil Le sous-contrôleur.

#### `controller_drivingDynamics_CMU.getSensors()`

Liste tous les capteurs chargés.

- **renvoie** : table[] Sous-contrôleurs du dossier sensors.

#### `controller_drivingDynamics_CMU.getSupervisor(supervisorName)`

Retrouve un superviseur par son nom de fichier dans `drivingDynamics/supervisors/` (ex. yawControl, tractionControl).

- `supervisorName` (*string*) : Nom du type de superviseur.
- **renvoie** : table|nil Le sous-contrôleur.

#### `controller_drivingDynamics_CMU.getSupervisors()`

Liste tous les superviseurs chargés.

- **renvoie** : table[] Sous-contrôleurs du dossier supervisors.

#### `controller_drivingDynamics_CMU.init(jbeamData)`

Ouvre la socket UDP de debug, prépare les paramètres de contrôle (affichage UI) et efface les electrics de crash.

- `jbeamData` (*table*) : Données jbeam du CMU.

#### `controller_drivingDynamics_CMU.logDebugMessage(source, message)`

Ajoute un message de debug (paquet `systemDebugMessage`) à la file envoyée par UDP.

- `source` (*string*) : Origine du message.
- `message` (*string*) : Texte.

#### `controller_drivingDynamics_CMU.registerCalibrationCallback(callback, callbackType)`

Enregistre une fonction appelée à chaque pas (update, updateFixedStep ou updateGFX) pendant une calibration.

- `callback` (*function*) : Fonction appelée avec dt.
- `callbackType` (*string*) : "update", "updateFixedStep" ou "updateGFX".

#### `controller_drivingDynamics_CMU.reset(jbeamData)`

Efface les paquets de debug, les electrics de crash et les lisseurs, et remet l'état à normal.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_CMU.sendDebugPacket(packet)`

Ajoute un paquet à la file de debug (en y inscrivant `vehicleID`).

- `packet` (*table*) : Paquet de debug (sourceType, packetType, ...).

#### `controller_drivingDynamics_CMU.setConfig(configTable)`

Remplace toute la configuration du CMU.

- `configTable` (*table*) : Nouvelle configuration.

#### `controller_drivingDynamics_CMU.setDebugMode(debugEnabled)`

Active ou désactive le mode debug du CMU (choix de la variante de updateGFX) et le propage à tous les sous-contrôleurs ayant `setDebugMode`, puis reconstruit les caches.

- `debugEnabled` (*boolean*) : true pour envoyer les données de debug à 30 Hz.

#### `controller_drivingDynamics_CMU.setParameters(parameters)`

Modifie les paramètres d'affichage du CMU (uiDisplayData.simplePowertrainApp.activeColor, offColor, doUpdate) et `notifySystemStateDegraded` ; met à jour le bouton « DSE » du contrôleur driveModes si présent.

- `parameters` (*table*) : Table indexée par chemins pointés.

#### `controller_drivingDynamics_CMU.systemDegradationDetected(reason)`

Passe le système en état degraded, loggue la raison dans le debug et marque le dommage `systemStateDegraded`.

- `reason` (*string*) : Raison de la dégradation.

#### `controller_drivingDynamics_CMU.update(dt)`

Pas physique : exécute les callbacks de calibration de type update.

- `dt` (*number*) : Pas physique en secondes.

#### `controller_drivingDynamics_CMU.updateFixedStep(dt)`

Pas fixe (100 Hz) : exécute les callbacks de calibration de type updateFixedStep.

- `dt` (*number*) : Pas en secondes.

#### `controller_drivingDynamics_CMU.updateGFX(dt)`

Chaque frame : détecte retournement et crash, anime le voyant d'avertissement, exécute les callbacks de calibration GFX et (selon le mode debug) échange les paquets UDP. Remplacée par une variante debug via setDebugMode.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | 50. |
| `sensorHub` | table|nil | Sous-contrôleur `drivingDynamics/sensors/sensorHub` (rempli par initSecondStage). |
| `systemState` | string | État global du système : "normal", "degraded" ou "offline". |
| `systemStates` | table<string, string> | Constantes : normal, degraded, offline. |
| `type` | string | "auxiliary". |
| `updateCalibrationCallback` | function | nop ou fonction qui exécute les callbacks de calibration de type update. |
| `updateFixedStepCalibrationCallback` | function | nop ou fonction qui exécute les callbacks de type updateFixedStep. |
| `updateGFXCalibrationCallback` | function | nop ou fonction qui exécute les callbacks de type updateGFX. |
| `vehicleData` | table|nil | Sous-contrôleur `sensors/vehicleData` (rempli par initSecondStage). |
| `virtualSensors` | table|nil | Sous-contrôleur `sensors/virtualSensors` (rempli par initSecondStage). |
| `warningLightPulse` | integer | 0 ou 1, bascule toutes les 0,15 s pour le clignotement du voyant. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/drivingDynamics/CMU.lua`.*
