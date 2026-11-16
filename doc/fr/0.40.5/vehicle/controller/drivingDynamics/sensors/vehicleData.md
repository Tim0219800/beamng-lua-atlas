# `controller_drivingDynamics_sensors_vehicleData`

*Fichier : `lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua` · VM : Véhicule · 370 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `drivingDynamics/sensors/vehicleData` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Capteur « données véhicule » du système drivingDynamics (type "auxiliary", defaultOrder 54). Il identifie les quatre roues d'angle (avant/arrière, gauche/droite) par leur position, calcule une fois la géométrie du véhicule (empattement, distances centre de gravité-essieux, voie, masse, vitesse caractéristique, inertie en lacet) puis, à chaque pas, les angles de braquage réels des roues et les rapports de vitesse de roue dus au rayon de virage. Les autres modules drivingDynamics (yawControl, STMEstimate, virtualSensors, composants) lisent ces valeurs via cmu.vehicleData.

## Remarques

- Clés jbeam lues dans initSecondStage : skewStiffnessFront, skewStiffnessRear (rigidités de dérive, défaut 0), cornerWheels (liste de noms de roues, défaut {"FR","FL","RR","RL"}). Si v.config.partConfigFilename existe, le fichier <vehiclePath>drivingDynamics/<nomConfig>.stat.json est lu et sa section vehicleData (skewStiffnessFront, skewStiffnessRear, cornerWheelData) prend le dessus.
- Si exactement 4 roues d'angle ne sont pas trouvées, une erreur est journalisée et isActive reste false (les statistiques ne sont pas calculées).
- Angles de roue en rad : les angles avant sont multipliés par le signe de sensorHub.steeringInput (positif = braquage à gauche d'après la convention de l'ESC) ; les angles arrière ne reçoivent pas de signe. turningCircleSpeedRatios[nomRoue] = rapport de vitesse attendu dû au virage (1 pour les roues intérieures, outer/inner pour les roues extérieures) ; sous 3 m/s le rayon de virage vient de la géométrie des roues (obj:wheelTurnRadius), au-dessus de 5 m/s de l'accélération latérale, avec transition linéaire entre les deux.
- vehicleStats contient wheelBase, invWheelBase, distanceCOGFrontAxle, distanceCOGRearAxle, trackWidth, trackWidthRefLeft/Right, mass, characteristicSpeed, invSquaredCharacteristicSpeed, skewStiffnessFront/Rear, inertiaZ, ainsi que cogWithoutWheels, cogWithWheels et refNodePos remplis à l'init (non listés dans la table initiale). Les distances en m, la masse en kg, characteristicSpeed en m/s.
- Bug/incohérence : setDebugMode affecte M.update = isDebugEnabled and update or updateDebug (inversé par rapport au sens attendu) ; sans conséquence car update et updateDebug font la même chose.
- updateGFX est vide en mode normal ; en debug il envoie un paquet avec angles et rayons de virage via CMU.sendDebugPacket.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_drivingDynamics_sensors_vehicleData.init(jbeamData)` | Ne fait rien. *(interne)* | 241 |
| `controller_drivingDynamics_sensors_vehicleData.initSecondStage(jbeamData)` | Lit la configuration, identifie les roues d'angle, calcule la géométrie, la vitesse caractéristique et l'inertie en lacet, puis passe isActive à true. *(interne)* | 244 |
| `controller_drivingDynamics_sensors_vehicleData.registerCMU(cmu)` | Mémorise la référence au CMU (sensorHub, virtualSensors, sendDebugPacket). *(interne)* | 347 |
| `controller_drivingDynamics_sensors_vehicleData.reset()` | Réinitialise le lisseur de l'accélération latérale utilisé pour le rayon de virage. *(interne)* | 237 |
| `controller_drivingDynamics_sensors_vehicleData.setDebugMode(debugEnabled)` | Active/désactive les journaux et paquets de debug. | 340 |
| `controller_drivingDynamics_sensors_vehicleData.shutdown()` | Désactive le capteur (isActive=false, updateGFX et update à nil). | 351 |
| `controller_drivingDynamics_sensors_vehicleData.update(dt)` | Pas physique : met à jour angles de roue, rayons de virage et turningCircleSpeedRatios. *(interne)* | 94 |
| `controller_drivingDynamics_sensors_vehicleData.updateGFX(dt)` | Vide en mode normal ; remplacé par une version qui envoie un paquet de debug en mode debug. *(interne)* | 142 |

### Détail des paramètres

#### `controller_drivingDynamics_sensors_vehicleData.init(jbeamData)`

Ne fait rien.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_sensors_vehicleData.initSecondStage(jbeamData)`

Lit la configuration, identifie les roues d'angle, calcule la géométrie, la vitesse caractéristique et l'inertie en lacet, puis passe isActive à true.

- `jbeamData` (*table*) : Données jbeam (voir notes).

#### `controller_drivingDynamics_sensors_vehicleData.registerCMU(cmu)`

Mémorise la référence au CMU (sensorHub, virtualSensors, sendDebugPacket).

- `cmu` (*table*) : Contrôleur CMU.

#### `controller_drivingDynamics_sensors_vehicleData.setDebugMode(debugEnabled)`

Active/désactive les journaux et paquets de debug.

- `debugEnabled` (*boolean*) : Vrai pour activer.

#### `controller_drivingDynamics_sensors_vehicleData.update(dt)`

Pas physique : met à jour angles de roue, rayons de virage et turningCircleSpeedRatios.

- `dt` (*number*) : Pas de temps (s).

#### `controller_drivingDynamics_sensors_vehicleData.updateGFX(dt)`

Vide en mode normal ; remplacé par une version qui envoie un paquet de debug en mode debug.

- `dt` (*number*) : Pas de temps graphique (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | Ordre d'exécution par défaut (54). |
| `frontLeftWheelAngle` | number | Angle de la roue avant gauche (rad), signé par la direction de braquage. |
| `frontRightWheelAngle` | number | Angle de la roue avant droite (rad), signé par la direction de braquage. |
| `frontWheelAngle` | number | Moyenne des deux angles avant (rad). |
| `isActive` | boolean | Vrai quand les quatre roues d'angle ont été trouvées et la géométrie calculée. |
| `rearLeftWheelAngle` | number | Angle de la roue arrière gauche (rad), non signé. |
| `rearRightWheelAngle` | number | Angle de la roue arrière droite (rad), non signé. |
| `rearWheelAngle` | number | Moyenne des deux angles arrière (rad). |
| `turningCircleSpeedRatios` | table<string, number> | Rapport de vitesse attendu par nom de roue d'angle, dû au virage (1 = pas de correction). |
| `type` | string | "auxiliary". |
| `vehicleStats` | table | Géométrie et paramètres dynamiques calculés (voir notes). |
| `wheelAccess` | table | Accès aux données des roues d'angle : frontRight, frontLeft, rearRight, rearLeft (entrées de wheels.wheels, nil tant que non trouvées). |

## Appels vers le moteur (C++)

- `obj:` `calcCenterOfGravityRel`, `nodeLength`, `nodeVecPlanarCosRightForward`, `wheelTurnRadius`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua`.*
