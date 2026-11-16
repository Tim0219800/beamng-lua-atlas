# `controller_vehicleController_shiftLogic_automaticGearbox`

*Fichier : `lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua` · VM : Véhicule · 756 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `vehicleController/shiftLogic/automaticGearbox` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Logique de boîte automatique (modes P R N D S 1-9 M, convertisseur de couple avec verrouillage partiel). Chargé par vehicleController quand le device « gearbox » est de type automaticGearbox. Selon le mode de boîte (arcade ou realistic), il décide du rapport cible à partir des points de passage (agressivité, patinage), gère les gaz/frein (inversion automatique en marche arrière en arcade, frein auto à l'arrêt) et le verrouillage du convertisseur (electrics.values.lockupClutchRatio).

## Exemple

```lua
-- depuis un autre contrôleur ou la console du véhicule
controller.mainController.shiftToGearIndex(0) -- délégué à ce module
-- jbeam : "automaticModes":"PRNDS21M", "torqueConverterLockupRPM":1800
```

## Remarques

- Clés jbeam lues dans init : automaticModes (défaut "PRNDS21M"; lettres P R N D S 1-9 M, « M » est remplacé par M1..Mn selon maxGearIndex), hShifterModePositions (table mode -> index de levier ; défaut {[-1]=R,[0]=N,P,D,S,2,1,M1}), defaultAutomaticMode (N), defaultAutomaticForwardMode (premier mode avant, sinon D), maxGearChangeTime / minGearChangeTime / sportGearChangeTime (0), autoDownShiftInM (true), autoDownShiftInMMinGear (2), throttleCoefWhileShifting (1), torqueConverterLockupRPM, torqueConverterLockupRange, torqueConverterLockupMinGear (0), torqueConverterHasPartialLockup (true), torqueConverterMinPartialLockupRatio ou torqueConverterLockupRatioWhileShifting (0.67), partialLockupTipInThreshold (0.85), partialLockupTipInGain (1.5), torqueConverterLockupRate (5), torqueConverterLockupInRate (2x rate), torqueConverterLockupOutRate (rate).
- Le verrouillage du convertisseur n'est actif que si torqueConverterLockupRPM > 0 et si un device « torqueConverter » existe.
- Contrat commun des modules shiftLogic : gearboxHandling, timer, timerConstants, inputValues, shiftPreventionData, shiftBehavior, smoothedValues sont injectés par vehicleController (nil jusqu'à l'injection).
- updateGearboxGFX est nop à la création puis remplacé dans gearboxBehaviorChanged par la fonction « inGear » du mode de boîte courant, et temporairement par « whileShifting » pendant un changement de rapport.
- En mode arcade, shiftUp/shiftDown affichent seulement un avertissement (warnCannotShiftSequential) et shiftToGearIndex bascule en realistic.
- Incohérence : init met M.minGearIndex = abs(minGearIndex) alors que updateExposedData (chaque frame) le remplace par gearbox.minGearIndex (signé).
- M.running et M.isShifting sont écrits par updateExposedData sans être déclarés initialement.
- applyGearboxModeRestrictions peut stocker des chaînes (index de mode M extrait de la chaîne) dans maxGearIndex/minGearIndex, comparées ensuite avec des nombres : Lua convertit les chaînes numériques pour les comparaisons arithmétiques mais pas pour < / > entre chaîne et nombre (risque d'erreur) ; seulement déduit du code.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_vehicleController_shiftLogic_automaticGearbox.areShiftLEDsInUse()` | Vrai si on n'est pas en arcade et en mode manuel M. *(interne)* | 95 |
| `controller_vehicleController_shiftLogic_automaticGearbox.gearboxBehaviorChanged(behavior)` | Appelé par vehicleController lors d'un changement arcade/realistic : choisit la logique correspondante et, en arcade, recale le mode (mode avant par défaut, R ou N selon le rapport). *(interne)* | 159 |
| `controller_vehicleController_shiftLogic_automaticGearbox.getGearName()` | Nom du rapport affiché : P/R/N/D, "S<n>" en mode S, "M<n>" en manuel, sinon le nom du mode. | 99 |
| `controller_vehicleController_shiftLogic_automaticGearbox.getGearPosition()` | Position du levier pour animation : (index-1)/(nombre de modes-1) et index de mode. | 109 |
| `controller_vehicleController_shiftLogic_automaticGearbox.getState()` | État sauvegardable : {grb_mde = mode courant}. | 723 |
| `controller_vehicleController_shiftLogic_automaticGearbox.init(jbeamData, sharedFunctionTable)` | Lit les devices (mainEngine, gearbox, torqueConverter), construit la liste des modes, la table du levier en H, les paramètres de verrouillage et applique le mode par défaut. Appelé par vehicleController (init et reset). *(interne)* | 594 |
| `controller_vehicleController_shiftLogic_automaticGearbox.sendTorqueData()` | Demande au moteur d'envoyer ses courbes de couple à l'UI. *(interne)* | 588 |
| `controller_vehicleController_shiftLogic_automaticGearbox.setDefaultForwardMode(mode)` | Définit le mode « avant » par défaut (D, S, M1...) et l'applique si on roule déjà en avant. | 182 |
| `controller_vehicleController_shiftLogic_automaticGearbox.setState(data)` | Restaure le mode courant depuis data.grb_mde. | 729 |
| `controller_vehicleController_shiftLogic_automaticGearbox.shiftDown()` | Mode realistic : recule d'un cran dans la liste des modes. Avec gearboxSafety, refuse de descendre sous M1 au-dessus de 2 m/s ou un rapport qui ferait surrégimer. | 239 |
| `controller_vehicleController_shiftLogic_automaticGearbox.shiftToGearIndex(index)` | Mode realistic : sélectionne le mode correspondant à la position du levier en H (hShifterModePositions) ; mode inexistant -> message et N. | 283 |
| `controller_vehicleController_shiftLogic_automaticGearbox.shiftUp()` | Mode realistic : avance d'un cran dans la liste des modes (P->R->N->D...). Avec gearboxSafety, refuse un rapport manuel qui ferait dépasser maxAV au moteur. | 196 |

### Détail des paramètres

#### `controller_vehicleController_shiftLogic_automaticGearbox.areShiftLEDsInUse()`

Vrai si on n'est pas en arcade et en mode manuel M.

- **renvoie** : boolean Utiliser les LEDs de régime ?

#### `controller_vehicleController_shiftLogic_automaticGearbox.gearboxBehaviorChanged(behavior)`

Appelé par vehicleController lors d'un changement arcade/realistic : choisit la logique correspondante et, en arcade, recale le mode (mode avant par défaut, R ou N selon le rapport).

- `behavior` (*string*) : "arcade" ou "realistic".

#### `controller_vehicleController_shiftLogic_automaticGearbox.getGearName()`

Nom du rapport affiché : P/R/N/D, "S<n>" en mode S, "M<n>" en manuel, sinon le nom du mode.

- **renvoie** : string Nom affiché.

#### `controller_vehicleController_shiftLogic_automaticGearbox.getGearPosition()`

Position du levier pour animation : (index-1)/(nombre de modes-1) et index de mode.

- **renvoie** : number Position normalisée 0..1.
- **renvoie** : integer Index de mode.

#### `controller_vehicleController_shiftLogic_automaticGearbox.getState()`

État sauvegardable : {grb_mde = mode courant}.

- **renvoie** : table|nil Table d'état.

#### `controller_vehicleController_shiftLogic_automaticGearbox.init(jbeamData, sharedFunctionTable)`

Lit les devices (mainEngine, gearbox, torqueConverter), construit la liste des modes, la table du levier en H, les paramètres de verrouillage et applique le mode par défaut. Appelé par vehicleController (init et reset).

- `jbeamData` (*table*) : Données jbeam (voir notes).
- `sharedFunctionTable` (*table*) : sharedFunctions de vehicleController.

#### `controller_vehicleController_shiftLogic_automaticGearbox.setDefaultForwardMode(mode)`

Définit le mode « avant » par défaut (D, S, M1...) et l'applique si on roule déjà en avant.

- `mode` (*string*) : Nom du mode ("M1" bascule en manuel sur le rapport courant).

#### `controller_vehicleController_shiftLogic_automaticGearbox.setState(data)`

Restaure le mode courant depuis data.grb_mde.

- `data` (*table*) : Table produite par getState.

#### `controller_vehicleController_shiftLogic_automaticGearbox.shiftToGearIndex(index)`

Mode realistic : sélectionne le mode correspondant à la position du levier en H (hShifterModePositions) ; mode inexistant -> message et N.

- `index` (*integer*) : Position du levier (-1 R, 0 N, 1.. selon table).

## Champs

| Champ | Type | Description |
|---|---|---|
| `brake` | number | Frein décidé (0..1) ; en arcade, au moins arcadeAutoBrakeAmount à l'arrêt sans gaz. |
| `checkEngine` | boolean | Vrai si le moteur est désactivé. |
| `clutchRatio` | number | Toujours 1 (boîte automatique, pas d'embrayage piloté). |
| `currentGearIndex` | integer | Index de rapport visé par la logique. |
| `energyStorages` | table<integer, string> | Réservoirs du moteur principal. |
| `engineLoad` | number | Charge moteur. |
| `engineThrottle` | number | Gaz effectivement appliqués au moteur. |
| `engineTorque` | number | Couple de combustion. |
| `flywheelTorque` | number | Couple moteur en sortie. |
| `gearboxHandling` | table|nil | Injecté par vehicleController. |
| `gearboxTorque` | number | Couple de sortie de boîte. |
| `idleRPM` | number | Régime de ralenti. |
| `ignition` | boolean | ignitionLevel > 1. |
| `inputValues` | table|nil | Injecté. |
| `isArcadeSwitched` | boolean | Vrai quand gaz et frein sont permutés (arcade, marche arrière). |
| `isEngineRunning` | number | 1 si le moteur tourne, 0 sinon. |
| `isManualModeActive` | boolean | Vrai en modes M1..Mn. |
| `isSportModeActive` | boolean | Vrai en mode S. |
| `maxGearIndex` | integer | Plus grand rapport avant. |
| `maxRPM` | number | Régime maximal. |
| `minGearIndex` | integer | Plus petit index de rapport (marche arrière) ; voir notes sur le signe. |
| `oilTemp` | number | Température d'huile moteur. |
| `rpm` | number | Régime moteur en tr/min. |
| `shiftBehavior` | table|nil | Injecté (shiftUpAV / shiftDownAV en rad/s). |
| `shiftPreventionData` | table|nil | Injecté. |
| `shiftingAggression` | number | Recopie de smoothedValues.drivingAggression. |
| `smoothedAvgAVInput` | number | Vitesse angulaire de sortie de la boîte (rad/s), sert à vehicleController. |
| `smoothedValues` | table|nil | Injecté. |
| `throttle` | number | Gaz décidés (0..1), éventuellement inversés en marche arrière arcade ou limités pendant un passage. |
| `timer` | table|nil | Injecté. |
| `timerConstants` | table|nil | Injecté. |
| `updateGearboxGFX` | function | Boucle de décision courante : nop, puis inGear/whileShifting du mode de boîte actif. |
| `waterTemp` | number | Température liquide de refroidissement. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua`.*
