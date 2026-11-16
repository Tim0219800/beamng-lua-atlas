# `controller_vehicleController_shiftLogic_cvtGearbox`

*Fichier : `lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua` · VM : Véhicule · 486 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `vehicleController/shiftLogic/cvtGearbox` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Logique de boîte à variation continue (CVT), modes P R N D. Chargé par vehicleController quand le device « gearbox » est de type cvtGearbox. Au lieu de choisir un rapport discret, il règle chaque frame le rapport continu (gearbox:setGearRatio) pour amener le régime moteur vers un régime cible interpolé entre cvtLowRPM et cvtHighRPM selon l'agressivité de conduite, et pilote un verrouillage de convertisseur simple (electrics.values.lockupClutchRatio).

## Remarques

- Clés jbeam lues dans init : cvtGearRatioSmoothingIn (20), cvtGearRatioSmoothingOut (5), cvtTargetAVSmoothingIn (0.5), cvtTargetAVSmoothingOut (2), automaticModes ("PRND"), defaultAutomaticMode ("N"), cvtAggression (0.5), cvtHighRPM, cvtLowRPM (par défaut les points de passage highShiftUpRPM / lowShiftUpRPM du rapport 1), torqueConverterLockupRPM, torqueConverterLockupRange (20% du RPM de verrouillage), torqueConverterLockupMinGear (0).
- Le rapport n'est ajusté que si |gearbox.outputAV1| > 10 rad/s ; à l'arrêt le rapport est maxGearRatio.
- Le lockup est une rampe linéaire sur le régime moteur (pas de verrouillage partiel contrairement à automaticGearbox).
- Il n'y a pas de logique « whileShifting » : updateGearboxGFX reste toujours inGear du mode courant. En arcade shiftUp/shiftDown affichent un avertissement et shiftToGearIndex bascule en realistic.
- Les index de rapport sont virtuels : P=-2, R=-1, N=0, D=1 (cvtGearIndexLookup). currentGearIndex vaut 0 en P et N.
- Incohérence : un mode « M » ou « S » listé dans availableModes n'existe pas (seuls P R N D), le code de gestion M reste mais n'est jamais utilisé ; applyGearboxModeRestrictions manipule des modes 1/2 inexistants.
- M.throttleInput est assigné dans init sans être déclaré ; M.running l'est aussi (updateExposedData).
- Contrat commun shiftLogic : gearboxHandling, timer, timerConstants, inputValues, shiftPreventionData, shiftBehavior, smoothedValues injectés par vehicleController.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_vehicleController_shiftLogic_cvtGearbox.areShiftLEDsInUse()` | Vrai hors arcade en mode manuel (jamais en pratique). *(interne)* | 98 |
| `controller_vehicleController_shiftLogic_cvtGearbox.gearboxBehaviorChanged(behavior)` | Sélectionne la logique arcade ou realistic. *(interne)* | 132 |
| `controller_vehicleController_shiftLogic_cvtGearbox.getGearName()` | Nom du mode courant (P, R, N, D). | 102 |
| `controller_vehicleController_shiftLogic_cvtGearbox.getGearPosition()` | Position du levier normalisée et index de mode. | 106 |
| `controller_vehicleController_shiftLogic_cvtGearbox.getState()` | État sauvegardable {grb_mde = mode}. | 454 |
| `controller_vehicleController_shiftLogic_cvtGearbox.init(jbeamData, sharedFunctionTable)` | Crée les lisseurs de rapport et de régime cible, la liste des modes, les paramètres de lockup et applique le mode par défaut. Appelé par vehicleController (init et reset). *(interne)* | 333 |
| `controller_vehicleController_shiftLogic_cvtGearbox.sendTorqueData()` | Demande au moteur d'envoyer ses courbes de couple à l'UI. *(interne)* | 327 |
| `controller_vehicleController_shiftLogic_cvtGearbox.setState(data)` | Restaure le mode depuis data.grb_mde. | 460 |
| `controller_vehicleController_shiftLogic_cvtGearbox.shiftDown()` | Realistic : passe au mode précédent. | 173 |
| `controller_vehicleController_shiftLogic_cvtGearbox.shiftToGearIndex(index)` | Realistic : choisit le mode correspondant à la position du levier (-1 R, 0 N, 1 P, 2 D) ; inexistant -> message et N. | 185 |
| `controller_vehicleController_shiftLogic_cvtGearbox.shiftUp()` | Realistic : passe au mode suivant dans la liste (P->R->N->D). | 161 |

### Détail des paramètres

#### `controller_vehicleController_shiftLogic_cvtGearbox.areShiftLEDsInUse()`

Vrai hors arcade en mode manuel (jamais en pratique).

- **renvoie** : boolean LEDs utilisées ?

#### `controller_vehicleController_shiftLogic_cvtGearbox.gearboxBehaviorChanged(behavior)`

Sélectionne la logique arcade ou realistic.

- `behavior` (*string*) : "arcade" ou "realistic".

#### `controller_vehicleController_shiftLogic_cvtGearbox.getGearName()`

Nom du mode courant (P, R, N, D).

- **renvoie** : string Mode.

#### `controller_vehicleController_shiftLogic_cvtGearbox.getGearPosition()`

Position du levier normalisée et index de mode.

- **renvoie** : number (index-1)/(nombre de modes-1)
- **renvoie** : integer Index de mode.

#### `controller_vehicleController_shiftLogic_cvtGearbox.getState()`

État sauvegardable {grb_mde = mode}.

- **renvoie** : table|nil État.

#### `controller_vehicleController_shiftLogic_cvtGearbox.init(jbeamData, sharedFunctionTable)`

Crée les lisseurs de rapport et de régime cible, la liste des modes, les paramètres de lockup et applique le mode par défaut. Appelé par vehicleController (init et reset).

- `jbeamData` (*table*) : Données jbeam.
- `sharedFunctionTable` (*table*) : sharedFunctions.

#### `controller_vehicleController_shiftLogic_cvtGearbox.setState(data)`

Restaure le mode depuis data.grb_mde.

- `data` (*table*) : Table produite par getState.

#### `controller_vehicleController_shiftLogic_cvtGearbox.shiftToGearIndex(index)`

Realistic : choisit le mode correspondant à la position du levier (-1 R, 0 N, 1 P, 2 D) ; inexistant -> message et N.

- `index` (*integer*) : Position du levier.

## Champs

| Champ | Type | Description |
|---|---|---|
| `brake` | number | Frein (0..1), au moins arcadeAutoBrakeAmount à l'arrêt en arcade. |
| `checkEngine` | boolean | Moteur désactivé. |
| `clutchRatio` | number | Toujours 1 (pas d'embrayage piloté). |
| `currentGearIndex` | integer | Index virtuel (R -1, N/P 0, D 1). |
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
| `isArcadeSwitched` | boolean | Gaz/frein permutés. |
| `isEngineRunning` | number | 1 si le moteur tourne. |
| `isManualModeActive` | boolean | Vrai en modes M (non disponibles en pratique). |
| `isSportModeActive` | boolean | Vrai en mode S (non disponible en pratique). |
| `maxGearIndex` | integer | Plus grand index de la boîte. |
| `maxRPM` | number | Régime max. |
| `minGearIndex` | integer | Valeur absolue du plus petit index (init), puis non mise à jour. |
| `oilTemp` | number | Température d'huile. |
| `rpm` | number | Régime moteur (tr/min). |
| `shiftBehavior` | table|nil | Injecté. |
| `shiftPreventionData` | table|nil | Injecté. |
| `shiftingAggression` | number | Recopie de smoothedValues.drivingAggression. |
| `smoothedAvgAVInput` | number | Vitesse angulaire de sortie de boîte (rad/s). |
| `smoothedValues` | table|nil | Injecté. |
| `throttle` | number | Gaz (0..1), permutés avec le frein en marche arrière arcade. |
| `throttleInput` | number |  |
| `timer` | table|nil | Injecté. |
| `timerConstants` | table|nil | Injecté. |
| `updateGearboxGFX` | function | nop puis inGear du mode actif. |
| `waterTemp` | number | Température du liquide de refroidissement. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua`.*
