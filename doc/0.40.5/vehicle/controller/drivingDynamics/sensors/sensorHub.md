# `controller_drivingDynamics_sensors_sensorHub`

*Fichier : `lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua` · VM : Véhicule · 211 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `drivingDynamics/sensors/sensorHub` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Capteur central de la Driving Dynamics Suite : à chaque pas physique il lit les vitesses angulaires (roulis, tangage, lacet), l'attitude (roll, pitch), les accélérations X/Y/Z (via `sensors.ffiSensors`), les entrées du conducteur, et calcule des versions lissées ainsi qu'un « bruit » d'accélération (écart entre enveloppes haute et basse, limité à 150). Les autres contrôleurs de `drivingDynamics/` (superviseurs, actionneurs, CMU) lisent ces champs, accessibles par `CMU.sensorHub` ou `CMU.getSensor("sensorHub")`. Ordre d'appel : `defaultOrder = 52`.

## Remarques

- Unités : accélérations en m/s² (repère véhicule : X avant, Y côté, Z vertical non inertiel avec gravité incluse), vitesses angulaires en rad/s, angles roll/pitch en radians, `gravity` en m/s².
- Champs aussi écrits mais non listés ci-dessous : `throttleInput`, `brakeInput` (electrics throttle et brake) ; en mode debug seulement : `worldVelocity`, `directionVector`, `directionVectorUp`, `directionVectorLeft`.
- Bug : `yawAcceleration` = (yawAV - lastYawAV) / dt, mais `lastYawAV` n'est jamais mis à jour après init (reste 0), donc la valeur est yawAV / dt, pas une vraie accélération.
- `vX` et `vY` (vitesse longitudinale et latérale) ne sont calculées que dans la variante debug (`updateDebug`), sinon elles restent à 0.
- `shutdown` met `isActive` à false et `update`/`updateGFX` à nil (le gestionnaire doit rappeler cacheAllControllerFunctions pour les retirer).
- Il n'y a pas de clé jbeam lue.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_drivingDynamics_sensors_sensorHub.init(jbeamData)` | Lit la gravité, marque le capteur actif. *(interne)* | 172 |
| `controller_drivingDynamics_sensors_sensorHub.initLastStage()` | Vide. *(interne)* | 178 |
| `controller_drivingDynamics_sensors_sensorHub.registerCMU(cmu)` | Appelée par le CMU lors de son initSecondStage pour donner une référence vers lui (utilisée pour le debug). *(interne)* | 188 |
| `controller_drivingDynamics_sensors_sensorHub.reset()` | Réinitialise tous les lisseurs. *(interne)* | 155 |
| `controller_drivingDynamics_sensors_sensorHub.setDebugMode(debugEnabled)` | Bascule entre les variantes normale et debug de update/updateGFX. *(interne)* | 181 |
| `controller_drivingDynamics_sensors_sensorHub.shutdown()` | Arrête le capteur : isActive = false et fonctions d'update retirées. *(interne)* | 192 |
| `controller_drivingDynamics_sensors_sensorHub.update(dt)` | Pas physique : lit et lisse vitesses angulaires, attitude, accélérations et bruit. Remplacée par updateDebug en mode debug. *(interne)* | 71 |
| `controller_drivingDynamics_sensors_sensorHub.updateGFX(dt)` | Chaque frame : met à jour la gravité. En mode debug, envoie aussi le paquet de debug au CMU. *(interne)* | 144 |

### Détail des paramètres

#### `controller_drivingDynamics_sensors_sensorHub.init(jbeamData)`

Lit la gravité, marque le capteur actif.

- `jbeamData` (*table*) : Données jbeam (non utilisées).

#### `controller_drivingDynamics_sensors_sensorHub.registerCMU(cmu)`

Appelée par le CMU lors de son initSecondStage pour donner une référence vers lui (utilisée pour le debug).

- `cmu` (*table*) : Module CMU.

#### `controller_drivingDynamics_sensors_sensorHub.setDebugMode(debugEnabled)`

Bascule entre les variantes normale et debug de update/updateGFX.

- `debugEnabled` (*boolean*) : true pour remplir et envoyer le paquet de debug.

#### `controller_drivingDynamics_sensors_sensorHub.update(dt)`

Pas physique : lit et lisse vitesses angulaires, attitude, accélérations et bruit. Remplacée par updateDebug en mode debug.

- `dt` (*number*) : Pas physique en secondes.

#### `controller_drivingDynamics_sensors_sensorHub.updateGFX(dt)`

Chaque frame : met à jour la gravité. En mode debug, envoie aussi le paquet de debug au CMU.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `accNoiseX` | number | Niveau de bruit d'accélération X (0 à 150). |
| `accNoiseY` | number | Niveau de bruit d'accélération Y (0 à 150). |
| `accNoiseZ` | number | Niveau de bruit d'accélération Z (après retrait de la gravité, 0 à 150). |
| `accelerationX` | number | Accélération longitudinale brute (m/s²). |
| `accelerationXSmooth` | number | accelerationX lissée. |
| `accelerationY` | number | Accélération latérale brute (m/s²). |
| `accelerationYSmooth` | number | accelerationY lissée. |
| `accelerationZ` | number | Accélération verticale brute non inertielle (m/s²). |
| `accelerationZSmooth` | number | accelerationZ lissée. |
| `defaultOrder` | number | 52. |
| `gravity` | number | Gravité du monde (`obj:getGravity()`), mise à jour chaque frame GFX. |
| `isActive` | boolean | true après init, false après shutdown. |
| `pitch` | number | Angle de tangage en rad. |
| `pitchAV` | number | Vitesse angulaire de tangage en rad/s. |
| `pitchAVSmooth` | number | pitchAV lissée. |
| `roll` | number | Angle de roulis en rad. |
| `rollAV` | number | Vitesse angulaire de roulis en rad/s. |
| `rollAVSmooth` | number | rollAV lissée. |
| `steeringInput` | number | Valeur de `electrics.values.steering_input`. |
| `type` | string | "auxiliary". |
| `vX` | number | Vitesse longitudinale en m/s (calculée seulement en mode debug). |
| `vY` | number | Vitesse latérale en m/s (calculée seulement en mode debug). |
| `yawAV` | number | Vitesse angulaire de lacet en rad/s. |
| `yawAVSmooth` | number | yawAV lissée. |
| `yawAcceleration` | number | Voir la note : vaut yawAV / dt en pratique. |

## Appels vers le moteur (C++)

- `obj:` `getDirectionVector`, `getDirectionVectorUp`, `getGravity`, `getRollPitchYawAngularVelocity`, `getRollPitchYawRad`, `getVelocity`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua`.*
