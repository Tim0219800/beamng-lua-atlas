# `controller_drivingDynamics_supervisors_components_brakeControl`

*Fichier : `lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua` · VM : Véhicule · 622 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `drivingDynamics/supervisors/components/brakeControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Composant de freinage du système drivingDynamics (type "auxiliary", defaultOrder 70). Il agit comme antipatinage (ordre 30), contrôle de lacet (ordre 50) et ABS (ordre 50) en freinant des roues individuelles. Le freinage antipatinage et de lacet est ajouté chaque pas à wheel.desiredBrakingTorque dans updateWheelsIntermediate ; l'ABS remplace les fonctions de calcul du couple de frein de chaque roue (wheels.setWheelBrakeUpdate). Chaque rôle est géré par des régulateurs PID parallèles configurables dans le jbeam ou via setParameters.

## Remarques

- Clés jbeam de premier niveau : useForTractionControl, useForYawControl, useForABSControl (booléens, vrai par défaut) ; tractionControl (table, obligatoire pour activer le rôle TC) avec wheelGroupSettings (table d'en-tête : motorName, slipThreshold (0.2), slipRangeThreshold (0), maxVelocity (1, m/s), kP/kI/kD (0), integralInCoef (20), integralOutCoef (2)) ; yawControl (table, obligatoire pour activer le rôle YC) avec PIDSettings (table d'en-tête : type = yawAV|slipAngle|frontAxleSlipAngle, kP, kI, kD, integralInCoef, integralOutCoef), yawAVThreshold (0.4), slipAngleThreshold (0.1), frontAxleSlipAngleThreshold (0.2) ; absControl.wheelSettings (table d'en-tête : wheelName, absFrequency (100 Hz), slipThreshold (0.2), kP (5), kI (0.5), kD (0.1), integralInCoef (20), integralOutCoef (20), minSteeringCoef (0.3), steeringCoefYawRate (0.2)).
- Bug potentiel : initSecondStage lit jbeamData.absControl.wheelSettings dès que le superviseur absControl existe et que useForABSControl est vrai, sans vérifier que jbeamData.absControl est défini (erreur Lua si absent).
- Contrôle de lacet : trois PID (écart de lacet, angle de dérive de caisse, angle de dérive combiné avant/arrière) ; le plus fort choisit la roue à freiner : survirage -> roue avant extérieure, sous-virage -> roue arrière intérieure ; le facteur est réduit à basse vitesse de roue (antiblocage, 2..5 rad/s).
- Antipatinage : un PID par roue sur le glissement, pondéré par la vitesse (annulé au-dessus de maxVelocity+1 m/s) et par la plage de glissement du groupe ; le facteur de frein final par roue vaut min(TC + YC, 1) * wheel.brakeTorque, appliqué avec max().
- ABS : à chaque période absTime (1/absFrequency) un PID calcule un coefficient de freinage absCoef selon le glissement, réduit en cas de lacet élevé (steeringCoef) ; sans vitesse > 2 m/s l'ABS est inactif (absCoef = 1). Les limites de couple gauche/droite/centre (absBrakeTorqueLimits) empêchent une roue de freiner bien plus fort que la roue opposée.
- electrics.values.isYCBrakeActive, isTCBrakeActive, isABSBrakeActive (0/1) sont écrites chaque image ; isABSBrakeActive vaut toujours 0 (commentaire « TODO fix whatever this is » dans le code).
- setParameters accepte de nombreuses clés : tractionControl.isEnabled, tractionControl.wheelGroupSettings.<moteur>.(slipThreshold|slipRangeThreshold|maxVelocity), tractionControl.wheelBrakingPID.<roue>.(kP|kI|kD|integralInCoef|integralOutCoef), yawControl.(isEnabled|slipAngleThreshold|yawAvThreshold|frontAxleSlipAngleThreshold), absControl.wheelSettings.<roue>.(kP|kI|kD|integralInCoef|integralOutCoef|slipThreshold|absFrequency|minSteeringCoef|steeringCoefYawRate). Les paramètres des PID de lacet (PIDSettings) sont lus mais pas modifiables via setParameters (ils sont appliqués seulement par setConfig).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_drivingDynamics_supervisors_components_brakeControl.actAsABSControl(wheelData, brake, vehicleVelocity, dt)` | Appelé par le superviseur absControl pour chaque roue : met à jour périodiquement le coefficient ABS (absCoef) via un PID sur le glissement. *(interne)* | 213 |
| `controller_drivingDynamics_supervisors_components_brakeControl.actAsTractionControl(wheelGroup, dt)` | Appelé par tractionControl pour chaque groupe de roues : calcule le facteur de freinage de chaque roue d'après son glissement. *(interne)* | 69 |
| `controller_drivingDynamics_supervisors_components_brakeControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt)` | Appelé par yawControl : choisit la roue à freiner selon le PID dominant (écart de lacet, angle de dérive de caisse, dérive avant) et fixe son facteur de frein. *(interne)* | 106 |
| `controller_drivingDynamics_supervisors_components_brakeControl.getConfig()` | Renvoie une copie de la configuration. | 591 |
| `controller_drivingDynamics_supervisors_components_brakeControl.init(jbeamData)` | Remet à false les indicateurs d'action. *(interne)* | 330 |
| `controller_drivingDynamics_supervisors_components_brakeControl.initLastStage(jbeamData)` | Mémorise le nombre de roues. *(interne)* | 533 |
| `controller_drivingDynamics_supervisors_components_brakeControl.initSecondStage(jbeamData)` | Lit la configuration, crée les PID et s'enregistre auprès de tractionControl, yawControl et absControl selon leur présence ; installe les fonctions de frein ABS sur les roues. *(interne)* | 373 |
| `controller_drivingDynamics_supervisors_components_brakeControl.registerCMU(cmu)` | Mémorise la référence au CMU. *(interne)* | 299 |
| `controller_drivingDynamics_supervisors_components_brakeControl.reset()` | Remet à zéro indicateurs et PID et réinstalle les fonctions de frein ABS. *(interne)* | 309 |
| `controller_drivingDynamics_supervisors_components_brakeControl.sendConfigData()` | Envoie la configuration au CMU. | 595 |
| `controller_drivingDynamics_supervisors_components_brakeControl.setConfig(configTable)` | Remplace la configuration complète et reconfigure les PID. | 586 |
| `controller_drivingDynamics_supervisors_components_brakeControl.setDebugMode(debugEnabled)` | Active/désactive les paquets de debug. | 293 |
| `controller_drivingDynamics_supervisors_components_brakeControl.setParameters(parameters)` | Applique des paramètres (voir notes) puis reconfigure les PID. | 546 |
| `controller_drivingDynamics_supervisors_components_brakeControl.shutdown()` | Désactive le composant. | 537 |
| `controller_drivingDynamics_supervisors_components_brakeControl.updateGFX(dt)` | Écrit electrics.values.isYCBrakeActive/isTCBrakeActive/isABSBrakeActive puis les remet à zéro (version debug : envoie aussi un paquet détaillé). *(interne)* | 245 |
| `controller_drivingDynamics_supervisors_components_brakeControl.updateWheelsIntermediate(dt)` | Chaque pas : ajoute à wheel.desiredBrakingTorque le frein TC/YC de chaque roue contrôlée et fait tourner les limites de couple ABS. *(interne)* | 51 |

### Détail des paramètres

#### `controller_drivingDynamics_supervisors_components_brakeControl.actAsABSControl(wheelData, brake, vehicleVelocity, dt)`

Appelé par le superviseur absControl pour chaque roue : met à jour périodiquement le coefficient ABS (absCoef) via un PID sur le glissement.

- `wheelData` (*table*) : Données de roue {wheelName, slip}.
- `brake` (*number*) : Entrée de frein 0..1.
- `vehicleVelocity` (*number*) : Vitesse du véhicule (m/s).
- `dt` (*number*) : Pas de temps (s).
- **renvoie** : boolean Vrai si l'ABS réduit le freinage (absCoef < 0.9).

#### `controller_drivingDynamics_supervisors_components_brakeControl.actAsTractionControl(wheelGroup, dt)`

Appelé par tractionControl pour chaque groupe de roues : calcule le facteur de freinage de chaque roue d'après son glissement.

- `wheelGroup` (*table*) : Groupe de roues {name, wheels, wheelCount, slipRange…}.
- `dt` (*number*) : Pas de temps (s).
- **renvoie** : boolean Vrai si un frein antipatinage est demandé.

#### `controller_drivingDynamics_supervisors_components_brakeControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt)`

Appelé par yawControl : choisit la roue à freiner selon le PID dominant (écart de lacet, angle de dérive de caisse, dérive avant) et fixe son facteur de frein.

- `measuredYaw` (*number*) : Lacet mesuré (rad/s).
- `expectedYaw` (*number*) : Lacet attendu, non utilisé.
- `yawDifference` (*number*) : Écart de lacet (positif = survirage).
- `bodySlipAngle` (*number*) : Angle de dérive de caisse ajusté (rad).
- `frontSlipAngle` (*number*) : Angle de dérive de l'essieu avant (rad).
- `rearSlipAngle` (*number*) : Angle de dérive de l'essieu arrière (rad).
- `dt` (*number*) : Pas de temps (s).
- **renvoie** : boolean Vrai si une roue est freinée par le contrôle de lacet.

#### `controller_drivingDynamics_supervisors_components_brakeControl.getConfig()`

Renvoie une copie de la configuration.

- **renvoie** : table Copie de la configuration.

#### `controller_drivingDynamics_supervisors_components_brakeControl.init(jbeamData)`

Remet à false les indicateurs d'action.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_supervisors_components_brakeControl.initLastStage(jbeamData)`

Mémorise le nombre de roues.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_supervisors_components_brakeControl.initSecondStage(jbeamData)`

Lit la configuration, crée les PID et s'enregistre auprès de tractionControl, yawControl et absControl selon leur présence ; installe les fonctions de frein ABS sur les roues.

- `jbeamData` (*table*) : Données jbeam (voir notes).

#### `controller_drivingDynamics_supervisors_components_brakeControl.registerCMU(cmu)`

Mémorise la référence au CMU.

- `cmu` (*table*) : Contrôleur CMU.

#### `controller_drivingDynamics_supervisors_components_brakeControl.setConfig(configTable)`

Remplace la configuration complète et reconfigure les PID.

- `configTable` (*table*) : Table {tractionControl, yawControl, absControl}.

#### `controller_drivingDynamics_supervisors_components_brakeControl.setDebugMode(debugEnabled)`

Active/désactive les paquets de debug.

- `debugEnabled` (*boolean*) : Vrai pour activer.

#### `controller_drivingDynamics_supervisors_components_brakeControl.setParameters(parameters)`

Applique des paramètres (voir notes) puis reconfigure les PID.

- `parameters` (*table<string, any>*) : Paramètres à appliquer.

#### `controller_drivingDynamics_supervisors_components_brakeControl.updateGFX(dt)`

Écrit electrics.values.isYCBrakeActive/isTCBrakeActive/isABSBrakeActive puis les remet à zéro (version debug : envoie aussi un paquet détaillé).

- `dt` (*number*) : Pas de temps graphique (s).

#### `controller_drivingDynamics_supervisors_components_brakeControl.updateWheelsIntermediate(dt)`

Chaque pas : ajoute à wheel.desiredBrakingTorque le frein TC/YC de chaque roue contrôlée et fait tourner les limites de couple ABS.

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `componentOrderABSControl` | number | 50. |
| `componentOrderTractionControl` | number | 30. |
| `componentOrderYawControl` | number | 50. |
| `defaultOrder` | number | Ordre d'exécution par défaut (70). |
| `isActingAsABS` | boolean | Vrai quand l'ABS limite le freinage. |
| `isActingAsTC` | boolean | Vrai quand un frein d'antipatinage est actif. |
| `isActingAsYC` | boolean | Vrai quand un frein de contrôle de lacet est actif. |
| `isActive` | boolean | Vrai après initSecondStage. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua`.*
