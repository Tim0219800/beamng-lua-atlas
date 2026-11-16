# `controller_vehicleController_shiftLogic_electricMotor`

*Fichier : `lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua` · VM : Véhicule · 695 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `vehicleController/shiftLogic/electricMotor` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Logique de « boîte » pour véhicules électriques : modes P R N D qui fixent le sens de rotation (motorDirection) des moteurs électriques, freinage régénératif (régénération au frein, conduite à une pédale par niveaux de force), compensation par freins à friction à basse vitesse et arrêt en douceur. Chargé par vehicleController quand le device « gearbox » est de type electricMotor (ou shiftLogicName). Il calcule M.regen (coefficient 0..1 appliqué aux moteurs) et ajuste M.brake pour les freins à friction. Publie electrics.values.regenFromBrake, regenFromOnePedal, regenThrottle, maxRegenStrength et lit regenStrength.

## Remarques

- Clés jbeam lues dans init : motorNames (nom ou liste ; défaut {"mainMotor"}), regenSmoothingRate (20), regenSmoothingAccel (5), onePedalSmoothStopBrakeReleaseAmount (0.85), onePedalRegenCoef (0.5), onePedalFrictionBrakeCoef (1), regenStrengthLevels (3), defaultRegenStrength (= regenStrengthLevels), regenThrottleNeutralPoint (0.15), automaticModes ("PRND"), defaultAutomaticMode ("P").
- Les modes P et N ne permettent pas la régénération (regenHandling.unavailableGears) ; régen forcée à 0.
- Conduite à une pédale : le niveau de force vient de electrics.values.regenStrength (0..regenStrengthLevels) ; la zone de gaz sous regenThrottleNeutralPoint (augmenté avec la vitesse jusqu'à 2.5 m/s) génère de la régénération, au-dessus c'est du gaz positif (M.throttle est remappé).
- M.regen est réduit par l'ESC actif, par un fort déport latéral (|sensors.gx2| > 5 -> x0.8) et par le frein d'urgence (frein >= 1 -> x0.5).
- Au niveau de force maximal, les freins à friction compensent la perte de régénération à basse vitesse puis se verrouillent à l'arrêt (smoothStopTimeToLatch 0.25 s).
- En P, le frein est au moins arcadeAutoBrakeAmount ; l'allumage < 2 force le mode P.
- Sans moteur trouvé : log d'erreur « No motors have been specified ». M.checkEngine est mis à 0 (nombre) alors que les autres modules utilisent un booléen.
- Enregistre une entrée de menu rapide (radial) pour régler la régénération (niveaux off / niveaux / full).
- Contrat commun shiftLogic : gearboxHandling, timer, timerConstants, inputValues, shiftPreventionData, shiftBehavior, smoothedValues injectés par vehicleController. M.running écrit sans déclaration.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_vehicleController_shiftLogic_electricMotor.areShiftLEDsInUse()` | Toujours false. *(interne)* | 105 |
| `controller_vehicleController_shiftLogic_electricMotor.gearboxBehaviorChanged(behavior)` | Sélectionne la logique arcade ou realistic. *(interne)* | 117 |
| `controller_vehicleController_shiftLogic_electricMotor.getGearName()` | Nom du mode (P, R, N, D). | 109 |
| `controller_vehicleController_shiftLogic_electricMotor.getGearPosition()` | Position du levier normalisée et index de mode. | 113 |
| `controller_vehicleController_shiftLogic_electricMotor.getState()` | État sauvegardable {grb_mde = mode}. | 661 |
| `controller_vehicleController_shiftLogic_electricMotor.init(jbeamData, sharedFunctionTable)` | Récupère les moteurs, construit les courbes frein/régénération, les lisseurs, les modes, enregistre le menu rapide et applique le mode par défaut. Appelé par vehicleController (init et reset). *(interne)* | 499 |
| `controller_vehicleController_shiftLogic_electricMotor.onDeserialize(data)` | Hook de chargement : restaure electrics.values.regenStrength (borné). *(interne)* *(hook)* | 651 |
| `controller_vehicleController_shiftLogic_electricMotor.onSerialize()` | Hook de sauvegarde : {regenLevel = niveau de régénération}. *(interne)* *(hook)* | 657 |
| `controller_vehicleController_shiftLogic_electricMotor.sendTorqueData()` | Demande à chaque moteur d'envoyer ses courbes de couple à l'UI. *(interne)* | 415 |
| `controller_vehicleController_shiftLogic_electricMotor.setIgnition(enabled)` | Allume ou coupe l'allumage de tous les moteurs ; appelé par vehicleController.setEngineIgnition quand il n'y a pas de device moteur principal. | 421 |
| `controller_vehicleController_shiftLogic_electricMotor.setState(data)` | Restaure le mode depuis data.grb_mde. | 667 |
| `controller_vehicleController_shiftLogic_electricMotor.shiftDown()` | Realistic : mode précédent. | 159 |
| `controller_vehicleController_shiftLogic_electricMotor.shiftToGearIndex(index)` | Realistic : sélectionne le mode du levier ; inexistant -> message et N. | 170 |
| `controller_vehicleController_shiftLogic_electricMotor.shiftUp()` | Realistic : mode suivant dans la liste (P->R->N->D) et mise à jour du sens des moteurs. | 148 |

### Détail des paramètres

#### `controller_vehicleController_shiftLogic_electricMotor.areShiftLEDsInUse()`

Toujours false.

- **renvoie** : boolean false

#### `controller_vehicleController_shiftLogic_electricMotor.gearboxBehaviorChanged(behavior)`

Sélectionne la logique arcade ou realistic.

- `behavior` (*string*) : "arcade" ou "realistic".

#### `controller_vehicleController_shiftLogic_electricMotor.getGearName()`

Nom du mode (P, R, N, D).

- **renvoie** : string Mode.

#### `controller_vehicleController_shiftLogic_electricMotor.getGearPosition()`

Position du levier normalisée et index de mode.

- **renvoie** : number Position 0..1.
- **renvoie** : integer Index de mode.

#### `controller_vehicleController_shiftLogic_electricMotor.getState()`

État sauvegardable {grb_mde = mode}.

- **renvoie** : table|nil État.

#### `controller_vehicleController_shiftLogic_electricMotor.init(jbeamData, sharedFunctionTable)`

Récupère les moteurs, construit les courbes frein/régénération, les lisseurs, les modes, enregistre le menu rapide et applique le mode par défaut. Appelé par vehicleController (init et reset).

- `jbeamData` (*table*) : Données jbeam.
- `sharedFunctionTable` (*table*) : sharedFunctions.

#### `controller_vehicleController_shiftLogic_electricMotor.onDeserialize(data)`

Hook de chargement : restaure electrics.values.regenStrength (borné).

- `data` (*table*) : Table produite par onSerialize.

#### `controller_vehicleController_shiftLogic_electricMotor.onSerialize()`

Hook de sauvegarde : {regenLevel = niveau de régénération}.

- **renvoie** : table Données.

#### `controller_vehicleController_shiftLogic_electricMotor.setIgnition(enabled)`

Allume ou coupe l'allumage de tous les moteurs ; appelé par vehicleController.setEngineIgnition quand il n'y a pas de device moteur principal.

- `enabled` (*boolean*) : Allumage actif ?

#### `controller_vehicleController_shiftLogic_electricMotor.setState(data)`

Restaure le mode depuis data.grb_mde.

- `data` (*table*) : Table produite par getState.

#### `controller_vehicleController_shiftLogic_electricMotor.shiftToGearIndex(index)`

Realistic : sélectionne le mode du levier ; inexistant -> message et N.

- `index` (*integer*) : Position du levier (-1 R, 0 N, 1 P, 2 D).

## Champs

| Champ | Type | Description |
|---|---|---|
| `brake` | number | Frein à friction final après déduction de la régénération. |
| `checkEngine` | boolean | Déclaré booléen, mais mis à 0 (nombre) par updateExposedData. |
| `clutchRatio` | number | Toujours 1. |
| `currentGearIndex` | integer | R -1, N/P 0, D 1. |
| `energyStorages` | table<integer, string> | Batteries des moteurs. |
| `engineLoad` | number | Charge moyenne des moteurs. |
| `engineThrottle` | number | Recopie de throttle. |
| `engineTorque` | number | Somme des couples moteurs. |
| `flywheelTorque` | number | Idem engineTorque. |
| `gearboxHandling` | table|nil | Injecté par vehicleController. |
| `gearboxTorque` | number | Idem engineTorque. |
| `idleRPM` | number | 0. |
| `ignition` | boolean | ignitionLevel > 1. |
| `inputValues` | table|nil | Injecté. |
| `isArcadeSwitched` | boolean | Gaz/frein permutés (arcade, marche arrière). |
| `isEngineRunning` | number | Toujours 1. |
| `isSportModeActive` | boolean | Toujours false en pratique. |
| `maxGearIndex` | integer | Plus grand index. |
| `maxRPM` | number | Plus grand régime max des moteurs. |
| `minGearIndex` | integer | Valeur absolue du plus petit index. |
| `oilTemp` | number | 0. |
| `regen` | number | Coefficient de régénération courant (0..1) appliqué aux moteurs. |
| `rpm` | number | Plus grand régime des moteurs (tr/min, valeur absolue). |
| `shiftBehavior` | table|nil | Injecté. |
| `shiftPreventionData` | table|nil | Injecté. |
| `shiftingAggression` | number | 0 par défaut. |
| `smoothedAvgAVInput` | number | Vitesse angulaire moyenne des devices de catégorie « engine » (rad/s). |
| `smoothedValues` | table|nil | Injecté. |
| `throttle` | number | Gaz (0..1), remappés en conduite à une pédale. |
| `throttleInput` | number |  |
| `timer` | table|nil | Injecté. |
| `timerConstants` | table|nil | Injecté. |
| `updateGearboxGFX` | function | nop puis inGear du mode actif. |
| `waterTemp` | number | 0. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua`.*
