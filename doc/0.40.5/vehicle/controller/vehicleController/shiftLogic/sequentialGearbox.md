# `controller_vehicleController_shiftLogic_sequentialGearbox`

*Fichier : `lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua` · VM : Véhicule · 512 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `vehicleController/shiftLogic/sequentialGearbox` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Logique de boîte séquentielle (un cran à la fois avec monter/descendre, sans levier en H) avec coupure d'allumage à la montée et embrayage automatique optionnel. Chargé par vehicleController quand le device « gearbox » est de type sequentialGearbox. En arcade la boîte choisit seule le rapport selon les points de passage ; en realistic le conducteur passe les rapports et le changement est quasi instantané (coupure d'allumage puis setGearIndex).

## Remarques

- Clés jbeam lues dans init : ignitionCutTime (0.15 s), clutchLaunchTargetRPM (3000), clutchLaunchStartRPM (2000).
- Constantes locales : neutralRejectTime 0.75 s (refuse un passage en neutre juste après une demande de neutre via levier en H, utile pour les levier H -> séquentiel).
- gearboxSafety : un rapport qui ferait dépasser engine.maxAV est refusé.
- shiftToGearIndex limite par défaut le saut à +/-1 rapport sauf si ignoreSequentialBounds est vrai (utilisé par setState). L'index 0 est ignoré si le rapport courant a une valeur absolue > 1.
- En arcade, shiftUp/Down affichent un avertissement (warnCannotShiftSequential) ; shiftToGearIndex bascule en realistic.
- Coupure d'allumage (engine:cutIgnition) lors d'une montée avec gaz > 0 sur un rapport avant.
- updateExposedData met shiftingAggression à 1 en permanence.
- Incohérence : updateInGear lit engine.idleAVStartOffset sans test nil (contrairement à manualGearbox), erreur si le moteur n'a pas ce champ. M.running est écrit sans être déclaré ; M.isShifting est déclaré après coup (valeur initiale dans le fichier). init met M.minGearIndex = abs(...) puis updateExposedData le réécrit signé.
- Contrat commun shiftLogic : gearboxHandling, timer, timerConstants, inputValues, shiftPreventionData, shiftBehavior, smoothedValues injectés par vehicleController.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_vehicleController_shiftLogic_sequentialGearbox.areShiftLEDsInUse()` | Vrai hors arcade. *(interne)* | 74 |
| `controller_vehicleController_shiftLogic_sequentialGearbox.gearboxBehaviorChanged(behavior)` | Choisit la logique du mode ; passer en realistic sans autoClutch avec rapport 1/-1 remet la boîte au point mort. *(interne)* | 86 |
| `controller_vehicleController_shiftLogic_sequentialGearbox.getGearName()` | Index de rapport numérique de la boîte. | 78 |
| `controller_vehicleController_shiftLogic_sequentialGearbox.getGearPosition()` | Toujours 0, 0 (non utilisé). | 82 |
| `controller_vehicleController_shiftLogic_sequentialGearbox.getState()` | État sauvegardable {grb_idx = rapport courant}. | 483 |
| `controller_vehicleController_shiftLogic_sequentialGearbox.init(jbeamData, sharedFunctionTable)` | Récupère mainEngine et gearbox, construit les logiques arcade/realistic, lit ignitionCutTime et les paramètres de lancement d'embrayage. Appelé par vehicleController (init et reset). *(interne)* | 418 |
| `controller_vehicleController_shiftLogic_sequentialGearbox.sendTorqueData()` | Demande au moteur d'envoyer ses courbes de couple à l'UI. *(interne)* | 412 |
| `controller_vehicleController_shiftLogic_sequentialGearbox.setState(data)` | Restaure le rapport (saut libre). | 489 |
| `controller_vehicleController_shiftLogic_sequentialGearbox.shiftDown()` | Rapport précédent (borné, sécurité surrégime). | 116 |
| `controller_vehicleController_shiftLogic_sequentialGearbox.shiftToGearIndex(index, ignoreSequentialBounds)` | Demande un rapport (par défaut limité à +/-1 du courant). | 134 |
| `controller_vehicleController_shiftLogic_sequentialGearbox.shiftUp()` | Rapport suivant (borné, sécurité surrégime) ; sera exécuté dans whileShifting. | 98 |

### Détail des paramètres

#### `controller_vehicleController_shiftLogic_sequentialGearbox.areShiftLEDsInUse()`

Vrai hors arcade.

- **renvoie** : boolean LEDs utilisées ?

#### `controller_vehicleController_shiftLogic_sequentialGearbox.gearboxBehaviorChanged(behavior)`

Choisit la logique du mode ; passer en realistic sans autoClutch avec rapport 1/-1 remet la boîte au point mort.

- `behavior` (*string*) : "arcade" ou "realistic".

#### `controller_vehicleController_shiftLogic_sequentialGearbox.getGearName()`

Index de rapport numérique de la boîte.

- **renvoie** : integer gearbox.gearIndex

#### `controller_vehicleController_shiftLogic_sequentialGearbox.getGearPosition()`

Toujours 0, 0 (non utilisé).

- **renvoie** : number 0
- **renvoie** : number 0

#### `controller_vehicleController_shiftLogic_sequentialGearbox.getState()`

État sauvegardable {grb_idx = rapport courant}.

- **renvoie** : table|nil État.

#### `controller_vehicleController_shiftLogic_sequentialGearbox.init(jbeamData, sharedFunctionTable)`

Récupère mainEngine et gearbox, construit les logiques arcade/realistic, lit ignitionCutTime et les paramètres de lancement d'embrayage. Appelé par vehicleController (init et reset).

- `jbeamData` (*table*) : Données jbeam.
- `sharedFunctionTable` (*table*) : sharedFunctions.

#### `controller_vehicleController_shiftLogic_sequentialGearbox.setState(data)`

Restaure le rapport (saut libre).

- `data` (*table*) : Table produite par getState.

#### `controller_vehicleController_shiftLogic_sequentialGearbox.shiftToGearIndex(index, ignoreSequentialBounds)`

Demande un rapport (par défaut limité à +/-1 du courant).

- `index` (*integer*) : Rapport voulu.
- `ignoreSequentialBounds` (*boolean|nil*) : Si vrai, autorise un saut de plusieurs rapports.

## Champs

| Champ | Type | Description |
|---|---|---|
| `brake` | number | Frein décidé (0..1). |
| `checkEngine` | boolean | Moteur désactivé. |
| `clutchRatio` | number | Taux d'embrayage (1 = embrayé). |
| `currentGearIndex` | integer | Rapport courant. |
| `energyStorages` | table<integer, string> | Réservoirs du moteur. |
| `engineLoad` | number | Charge moteur. |
| `engineThrottle` | number | Gaz appliqués au moteur. |
| `engineTorque` | number | Couple de combustion. |
| `flywheelTorque` | number | Couple moteur. |
| `gearboxHandling` | table|nil | Injecté par vehicleController. |
| `gearboxTorque` | number | Couple de sortie de boîte. |
| `idleRPM` | number | Ralenti. |
| `ignition` | boolean | ignitionLevel > 1. |
| `inputValues` | table|nil | Injecté. |
| `isArcadeSwitched` | boolean | Gaz/frein permutés (arcade, marche arrière). |
| `isEngineRunning` | number | 1 si le moteur tourne. |
| `isSportModeActive` | boolean | Toujours false. |
| `maxGearIndex` | integer | Plus grand rapport avant. |
| `maxRPM` | number | Régime max. |
| `minGearIndex` | integer | Plus petit index (marche arrière). |
| `oilTemp` | number | Température d'huile. |
| `rpm` | number | Régime moteur (tr/min). |
| `shiftBehavior` | table|nil | Injecté. |
| `shiftPreventionData` | table|nil | Injecté. |
| `shiftingAggression` | number | Toujours 1. |
| `smoothedAvgAVInput` | number | Vitesse angulaire de sortie de boîte (rad/s). |
| `smoothedValues` | table|nil | Injecté. |
| `throttle` | number | Gaz décidés (0..1). |
| `timer` | table|nil | Injecté. |
| `timerConstants` | table|nil | Injecté. |
| `updateGearboxGFX` | function | nop puis inGear/whileShifting du mode actif. |
| `waterTemp` | number | Température du liquide de refroidissement. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua`.*
