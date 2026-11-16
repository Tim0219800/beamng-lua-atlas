# `controller_vehicleController_shiftLogic_dummy`

*Fichier : `lua/vehicle/controller/vehicleController/shiftLogic/dummy.lua` · VM : Véhicule · 148 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `vehicleController/shiftLogic/dummy` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Module de logique de boîte « neutre » chargé par vehicleController quand le véhicule n'a pas de device « gearbox » (ou via jbeam shiftLogicName = "dummy"). Il recopie simplement les entrées throttle/brake du conducteur, lit le régime du moteur « mainEngine » s'il existe et remplit les valeurs (températures, charge, couples, état moteur) que vehicleController publie dans electrics. Aucun passage de rapport.

## Remarques

- Contrat commun à tous les modules shiftLogic : vehicleController injecte avant chaque frame gearboxHandling, timer, timerConstants, inputValues, shiftPreventionData, shiftBehavior et smoothedValues (nil à la création du module), puis lit throttle, brake, clutchRatio, rpm, etc.
- gearboxBehaviorChanged, shiftUp, shiftDown et shiftToGearIndex valent `nop` (global du moteur, non défini dans ce fichier) : ne font rien.
- updateGearboxGFX écrit aussi M.running et M.isShifting, qui ne sont pas déclarés dans le tableau initial du module (vehicleController ne lit pas M.running ; il lit isShifting).
- Le clutchRatio reste à 0 et le moteur reçoit la valeur de throttle brute (0 si moteur désactivé).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_vehicleController_shiftLogic_dummy.areShiftLEDsInUse()` | Toujours false : pas de LEDs de changement de rapport. *(interne)* | 55 |
| `controller_vehicleController_shiftLogic_dummy.getGearName()` | Nom de rapport affiché : chaîne vide. | 59 |
| `controller_vehicleController_shiftLogic_dummy.getGearPosition()` | Position du levier pour animation : 0, 0. | 63 |
| `controller_vehicleController_shiftLogic_dummy.init(jbeamData, sharedFunctionTable)` | Mémorise sharedFunctions, récupère les devices mainEngine et gearbox, remet les valeurs à zéro et lit maxRPM/idleRPM/énergie du moteur. Appelé par vehicleController à l'init et au reset. *(interne)* | 94 |
| `controller_vehicleController_shiftLogic_dummy.sendTorqueData()` | Demande au moteur d'envoyer ses courbes de couple à l'UI (si un moteur existe). *(interne)* | 88 |
| `controller_vehicleController_shiftLogic_dummy.updateGearboxGFX(dt)` | Chaque frame : recopie les entrées et met à jour rpm, températures, charge, couples, ignition et état du moteur. *(interne)* | 67 |

### Détail des paramètres

#### `controller_vehicleController_shiftLogic_dummy.areShiftLEDsInUse()`

Toujours false : pas de LEDs de changement de rapport.

- **renvoie** : boolean false

#### `controller_vehicleController_shiftLogic_dummy.getGearName()`

Nom de rapport affiché : chaîne vide.

- **renvoie** : string ""

#### `controller_vehicleController_shiftLogic_dummy.getGearPosition()`

Position du levier pour animation : 0, 0.

- **renvoie** : number gear_A
- **renvoie** : number gearModeIndex

#### `controller_vehicleController_shiftLogic_dummy.init(jbeamData, sharedFunctionTable)`

Mémorise sharedFunctions, récupère les devices mainEngine et gearbox, remet les valeurs à zéro et lit maxRPM/idleRPM/énergie du moteur. Appelé par vehicleController à l'init et au reset.

- `jbeamData` (*table*) : Données jbeam (non utilisées).
- `sharedFunctionTable` (*table*) : Utilitaires sharedFunctions de vehicleController.

#### `controller_vehicleController_shiftLogic_dummy.updateGearboxGFX(dt)`

Chaque frame : recopie les entrées et met à jour rpm, températures, charge, couples, ignition et état du moteur.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `brake` | number | Recopie de inputValues.brake. |
| `checkEngine` | boolean | Vrai si le moteur est désactivé (isDisabled). |
| `clutchRatio` | number | Toujours 0. |
| `currentGearIndex` | integer | Toujours 0. |
| `energyStorages` | table<integer, string> | Noms des réservoirs du moteur (sharedFunctions.getEnergyStorages). |
| `engineLoad` | number | Charge instantanée du moteur. |
| `engineThrottle` | number | Gaz envoyés au moteur (0 si moteur désactivé). |
| `engineTorque` | number | Couple de combustion du moteur. |
| `flywheelTorque` | number | Couple de sortie du moteur (outputTorque1). |
| `gearboxBehaviorChanged` | function | nop. |
| `gearboxHandling` | table|nil | Injecté par vehicleController. |
| `gearboxTorque` | number | Couple de sortie du device gearbox. |
| `idleRPM` | number | Ralenti du moteur (tr/min) lu à l'init. |
| `ignition` | boolean | Vrai si electrics.values.ignitionLevel > 1. |
| `inputValues` | table|nil | Injecté : {throttle, clutch} bornés 0..1 (ou overrides electrics). |
| `isArcadeSwitched` | boolean | Toujours false. |
| `isEngineRunning` | number | 1 si le moteur tourne (régime > 80% de starterMaxAV et démarreur dégagé) ou s'il n'a pas de démarreur, sinon 0. |
| `isSportModeActive` | boolean | Toujours false. |
| `maxGearIndex` | integer | Toujours 0. |
| `maxRPM` | number | Régime max du moteur lu à l'init. |
| `minGearIndex` | integer | Toujours 0. |
| `oilTemp` | number | Température d'huile du moteur. |
| `rpm` | number | Régime moteur en tr/min (outputAV1 du mainEngine). |
| `shiftBehavior` | table|nil | Injecté par vehicleController. |
| `shiftDown` | function | nop. |
| `shiftPreventionData` | table|nil | Injecté par vehicleController. |
| `shiftToGearIndex` | function | nop. |
| `shiftUp` | function | nop. |
| `shiftingAggression` | number | Toujours 0. |
| `smoothedAvgAVInput` | number | Vitesse angulaire (rad/s) de sortie du device « gearbox » (0 si absent). |
| `smoothedValues` | table|nil | Injecté par vehicleController. |
| `throttle` | number | Recopie de inputValues.throttle. |
| `timer` | table|nil | Injecté par vehicleController. |
| `timerConstants` | table|nil | Injecté par vehicleController. |
| `waterTemp` | number | Température de liquide de refroidissement (ou d'huile à défaut). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/vehicleController/shiftLogic/dummy.lua`.*
