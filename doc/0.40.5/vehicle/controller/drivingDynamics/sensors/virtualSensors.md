# `controller_drivingDynamics_sensors_virtualSensors`

*Fichier : `lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua` · VM : Véhicule · 701 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `drivingDynamics/sensors/virtualSensors` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Capteurs virtuels du système drivingDynamics (type "auxiliary", defaultOrder 56) : estime la vitesse réelle du véhicule (virtual.speed), l'angle de dérive de caisse (bodySlipAngle) et la vitesse de roue de référence, sans capteur de vitesse sol. Il intègre l'accélération mesurée à partir de la position du centre de gravité, la corrige par des critères de remise à zéro (arrêt, roulage libre, ligne droite, cohérence des accélérations de roues) et publie des indices de confiance (trustWorthiness). Les superviseurs (yawControl, tractionControl) et les fournisseurs de glissement lisent cmu.virtualSensors.virtual et .trustWorthiness.

## Remarques

- Unités : vitesses en m/s, angles en rad, accélérations en m/s², taux de variation en rad/s. virtual.speed est signée (négative en marche arrière).
- L'accélération longitudinale/latérale et le taux de lacet sont calculés par différences de la position du centre de gravité, échantillonnée à 250 Hz ; une accélération > 200 m/s² (~20 g) est traitée comme une téléportation et ignorée.
- trustWorthiness : pitch, roll, bodySlipAngle, wheelSpeed, virtualSpeed (0 à 1), recoverySpeed (0 à 1), needsFullReset (booléen). Une dégradation (dérive de l'angle de dérive, accélérations > 20/30/40 m/s² selon l'axe, vitesses angulaires > 5 rad/s, bruit d'accélération, écart vitesse virtuelle/vitesse de récupération > 1 m/s) met needsFullReset à true, confiance à 0 et appelle CMU.systemDegradationDetected ; une remise à zéro est résolue quand le véhicule est arrêté, roule librement ou va tout droit avec roues cohérentes (probabilités >= 0.99).
- Les probabilités de remise à zéro sont des fractions de conditions vraies (accélérations basses, tangage/roulis bas, vitesses angulaires basses, pédales, braquage nul...) lissées dans le temps.
- virtual.recoveryWheelSpeed est la moyenne des vitesses de roues (corrigées du rayon de virage) dont l'accélération concorde avec l'accélération IMU lissée ; virtual.wheelSpeed est la moyenne des roues non motrices (sinon de toutes les roues).
- Bug/incohérence : virtual.avgWheelSpeed et virtual.avgNonPropulsedWheelSpeed sont déclarés et envoyés au debug mais jamais mis à jour (restent à 0) ; updateWheelSpeed calcule des moyennes locales sans les stocker. M.reference n'est rempli qu'en mode debug (vitesse et angle de dérive de référence issus de sensorHub.vX/vY).
- Les variables refNodeCoGTransformation* sont initialisées mais ne servent plus (restes d'une ancienne méthode).
- L'ordre dans updateTrustWorthiness fait que trustWorthiness.virtualSpeed est calculé avec la confiance bodySlipAngle du pas précédent (déduit du code).
- reset(jbeamData) remet à zéro tout l'état d'estimation ; init en remet un sous-ensemble et active isActive.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_drivingDynamics_sensors_virtualSensors.init(jbeamData)` | Remet à zéro les estimations et confiances, vide les caches et passe isActive à true. *(interne)* | 617 |
| `controller_drivingDynamics_sensors_virtualSensors.initLastStage()` | Calcule le décalage du centre de gravité par rapport au nœud de référence, nécessaire à la dérivation de l'accélération à partir de la position. *(interne)* | 648 |
| `controller_drivingDynamics_sensors_virtualSensors.registerCMU(cmu)` | Mémorise la référence au CMU (sensorHub, vehicleData, systemDegradationDetected/Resolved, logDebugMessage, sendDebugPacket). *(interne)* | 676 |
| `controller_drivingDynamics_sensors_virtualSensors.reset(jbeamData)` | Remet à zéro tout l'état d'estimation (vitesse, dérive, lisseurs, probabilités, échantillonnage de position). *(interne)* | 560 |
| `controller_drivingDynamics_sensors_virtualSensors.setDebugMode(debugEnabled)` | Active/désactive les paquets de debug et le calcul des valeurs de référence. | 669 |
| `controller_drivingDynamics_sensors_virtualSensors.shutdown()` | Désactive le capteur (isActive=false, updateGFX, update et updateWheelsIntermediate à nil). | 680 |
| `controller_drivingDynamics_sensors_virtualSensors.update(dt)` | Pas physique : intègre l'accélération pour virtual.speed et met à jour l'angle de dérive de caisse (basse vitesse par géométrie de roue avant, haute vitesse par intégration, mélange entre 4 et 5 m/s). *(interne)* | 488 |
| `controller_drivingDynamics_sensors_virtualSensors.updateFixedStep(dt)` | Pas fixe : met à jour vitesse de roue, vitesse de récupération et indices de confiance / conditions de remise à zéro. *(interne)* | 420 |
| `controller_drivingDynamics_sensors_virtualSensors.updateGFX(dt)` | Vide en mode normal ; envoie un paquet de debug riche en mode debug. *(interne)* | 513 |

### Détail des paramètres

#### `controller_drivingDynamics_sensors_virtualSensors.init(jbeamData)`

Remet à zéro les estimations et confiances, vide les caches et passe isActive à true.

- `jbeamData` (*table*) : Données jbeam (inutilisées).

#### `controller_drivingDynamics_sensors_virtualSensors.registerCMU(cmu)`

Mémorise la référence au CMU (sensorHub, vehicleData, systemDegradationDetected/Resolved, logDebugMessage, sendDebugPacket).

- `cmu` (*table*) : Contrôleur CMU.

#### `controller_drivingDynamics_sensors_virtualSensors.reset(jbeamData)`

Remet à zéro tout l'état d'estimation (vitesse, dérive, lisseurs, probabilités, échantillonnage de position).

- `jbeamData` (*table*) : Données jbeam (inutilisées).

#### `controller_drivingDynamics_sensors_virtualSensors.setDebugMode(debugEnabled)`

Active/désactive les paquets de debug et le calcul des valeurs de référence.

- `debugEnabled` (*boolean*) : Vrai pour activer.

#### `controller_drivingDynamics_sensors_virtualSensors.update(dt)`

Pas physique : intègre l'accélération pour virtual.speed et met à jour l'angle de dérive de caisse (basse vitesse par géométrie de roue avant, haute vitesse par intégration, mélange entre 4 et 5 m/s).

- `dt` (*number*) : Pas de temps (s).

#### `controller_drivingDynamics_sensors_virtualSensors.updateFixedStep(dt)`

Pas fixe : met à jour vitesse de roue, vitesse de récupération et indices de confiance / conditions de remise à zéro.

- `dt` (*number*) : Pas de temps (s).

#### `controller_drivingDynamics_sensors_virtualSensors.updateGFX(dt)`

Vide en mode normal ; envoie un paquet de debug riche en mode debug.

- `dt` (*number*) : Pas de temps graphique (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | Ordre d'exécution par défaut (56). |
| `isActive` | boolean | Vrai après init, faux après shutdown. |
| `reference` | table | Valeurs de référence calculées uniquement en mode debug : bodySlipAngle (rad) et speed (m/s) issus du capteur de vitesse du moteur physique. |
| `trustWorthiness` | table | Indices de confiance 0..1 : pitch, roll, jerk (jamais modifié, reste 1), bodySlipAngle, wheelSpeed, virtualSpeed, recoverySpeed ; needsFullReset (boolean). |
| `type` | string | "auxiliary". |
| `virtual` | table | Estimations : speed, integratedSpeed, avgWheelSpeed (jamais mis à jour), avgNonPropulsedWheelSpeed (jamais mis à jour), wheelSpeed, imuAcceleration, recoveryWheelSpeed, recoveryWheelCount, bodySlipAngle, bodySlipAngleIntegrated, bodySlipAngleLowSpeed, bodySlipAngleLowSpeedTrust, lastBodySlipAngle, bodySlipAngleRate. |

## Appels vers le moteur (C++)

- `obj:` `getDirectionVectorUpXYZ`, `getDirectionVectorXYZ`, `getPositionXYZ`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua`.*
