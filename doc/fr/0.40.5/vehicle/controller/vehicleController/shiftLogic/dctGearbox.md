# `controller_vehicleController_shiftLogic_dctGearbox`

*Fichier : `lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua` · VM : Véhicule · 899 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `vehicleController/shiftLogic/dctGearbox` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Logique de boîte à double embrayage (DCT) à modes automatiques P R N D S 1 2 M. Chargé par vehicleController quand le device « gearbox » est de type dctGearbox. Deux arbres (access1/access2 : gearIndex1/2, clutchRatio1/2, setGearIndex1/2) alternent : l'arbre primaire est engagé, le secondaire pré-sélectionne le rapport suivant (dctPredictNextGear) et le changement croise les deux embrayages. Gère le rev-match en rétrogradage, le lancement et les modes arcade/realistic.

## Remarques

- Clés jbeam lues dans init : clutchLaunchTargetRPM (3000), clutchLaunchStartRPM (2000), revMatchThrottle (0.5), automaticModes ("PRNDS21M"), defaultAutomaticMode ("N"), autoDownShiftInM (true), dctClutchTime (0.05), defaultForwardMode ("D").
- Le rev-match rétrogradage met electrics.values.clutchRatio1/clutchRatio2 à 0 et force les gaz à revMatchThrottle jusqu'à ce que le régime atteigne la cible (marge de 500 tr/min) ou que revMatchExpired (timerConstants) soit dépassé.
- Le rapport suivant est choisi sur l'arbre secondaire ; si le rapport voulu n'est pas sur le même arbre (parité), un rapport « auxiliaire » est engagé d'abord.
- En arcade shiftUp/shiftDown affichent un avertissement ; shiftToGearIndex bascule en realistic (réel : sharedFunctions.switchToRealisticBehavior).
- getGearName/getGearPosition suivent le même principe que automaticGearbox (nom du mode, préfixes S/M).
- init met M.minGearIndex = abs(...) mais updateExposedData le réécrit signé. M.running est écrit sans déclaration.
- Contrat commun shiftLogic : gearboxHandling, timer, timerConstants, inputValues, shiftPreventionData, shiftBehavior, smoothedValues injectés par vehicleController.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_vehicleController_shiftLogic_dctGearbox.areShiftLEDsInUse()` | Vrai hors arcade en mode manuel M. *(interne)* | 98 |
| `controller_vehicleController_shiftLogic_dctGearbox.gearboxBehaviorChanged(behavior)` | Sélectionne la logique arcade/realistic. *(interne)* | 142 |
| `controller_vehicleController_shiftLogic_dctGearbox.getGearName()` | Nom du rapport affiché (mode, ou S/M + rapport). | 102 |
| `controller_vehicleController_shiftLogic_dctGearbox.getGearPosition()` | Position du levier normalisée et index de mode. | 116 |
| `controller_vehicleController_shiftLogic_dctGearbox.getState()` | État sauvegardable {grb_mde = mode}. | 866 |
| `controller_vehicleController_shiftLogic_dctGearbox.init(jbeamData, sharedFunctionTable)` | Récupère mainEngine et gearbox, construit modes, logiques arcade/realistic, paramètres d'embrayage et DCT, applique le mode avant par défaut puis le mode courant. Appelé par vehicleController (init et reset). *(interne)* | 750 |
| `controller_vehicleController_shiftLogic_dctGearbox.sendTorqueData()` | Demande au moteur d'envoyer ses courbes de couple à l'UI. *(interne)* | 744 |
| `controller_vehicleController_shiftLogic_dctGearbox.setDefaultForwardMode(mode)` | Définit le mode avant par défaut (D, S, M1...) et l'applique si on est déjà en marche avant. | 197 |
| `controller_vehicleController_shiftLogic_dctGearbox.setState(data)` | Restaure le mode depuis data.grb_mde. | 872 |
| `controller_vehicleController_shiftLogic_dctGearbox.shiftDown()` | Realistic : mode précédent / rapport inférieur en M. | 244 |
| `controller_vehicleController_shiftLogic_dctGearbox.shiftToGearIndex(index)` | Realistic : sélectionne le mode correspondant à la position du levier. | 278 |
| `controller_vehicleController_shiftLogic_dctGearbox.shiftUp()` | Realistic : mode suivant dans la liste ; en manuel M monte d'un rapport (avec sécurité surrégime si gearboxSafety). | 211 |

### Détail des paramètres

#### `controller_vehicleController_shiftLogic_dctGearbox.areShiftLEDsInUse()`

Vrai hors arcade en mode manuel M.

- **renvoie** : boolean LEDs utilisées ?

#### `controller_vehicleController_shiftLogic_dctGearbox.gearboxBehaviorChanged(behavior)`

Sélectionne la logique arcade/realistic.

- `behavior` (*string*) : "arcade" ou "realistic".

#### `controller_vehicleController_shiftLogic_dctGearbox.getGearName()`

Nom du rapport affiché (mode, ou S/M + rapport).

- **renvoie** : string Nom affiché.

#### `controller_vehicleController_shiftLogic_dctGearbox.getGearPosition()`

Position du levier normalisée et index de mode.

- **renvoie** : number Position 0..1.
- **renvoie** : integer Index de mode.

#### `controller_vehicleController_shiftLogic_dctGearbox.getState()`

État sauvegardable {grb_mde = mode}.

- **renvoie** : table|nil État.

#### `controller_vehicleController_shiftLogic_dctGearbox.init(jbeamData, sharedFunctionTable)`

Récupère mainEngine et gearbox, construit modes, logiques arcade/realistic, paramètres d'embrayage et DCT, applique le mode avant par défaut puis le mode courant. Appelé par vehicleController (init et reset).

- `jbeamData` (*table*) : Données jbeam.
- `sharedFunctionTable` (*table*) : sharedFunctions.

#### `controller_vehicleController_shiftLogic_dctGearbox.setDefaultForwardMode(mode)`

Définit le mode avant par défaut (D, S, M1...) et l'applique si on est déjà en marche avant.

- `mode` (*string*) : Nom du mode.

#### `controller_vehicleController_shiftLogic_dctGearbox.setState(data)`

Restaure le mode depuis data.grb_mde.

- `data` (*table*) : Table produite par getState.

#### `controller_vehicleController_shiftLogic_dctGearbox.shiftToGearIndex(index)`

Realistic : sélectionne le mode correspondant à la position du levier.

- `index` (*integer*) : Position du levier.

## Champs

| Champ | Type | Description |
|---|---|---|
| `brake` | number | Frein décidé (0..1). |
| `checkEngine` | boolean | Moteur désactivé. |
| `clutchRatio` | number | Taux d'embrayage global (les ratios par arbre sont dans electrics clutchRatio1/2). |
| `currentGearIndex` | integer | Rapport courant ou rapport visé pendant un changement. |
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
| `isManualModeActive` | boolean | Vrai en modes M. |
| `isSportModeActive` | boolean | Vrai en mode S. |
| `maxGearIndex` | integer | Plus grand rapport avant. |
| `maxRPM` | number | Régime max. |
| `minGearIndex` | integer | Plus petit index (marche arrière). |
| `oilTemp` | number | Température d'huile. |
| `rpm` | number | Régime moteur (tr/min). |
| `shiftBehavior` | table|nil | Injecté. |
| `shiftPreventionData` | table|nil | Injecté. |
| `shiftingAggression` | number | Agressivité de changement de rapport. |
| `smoothedAvgAVInput` | number | Vitesse angulaire de sortie de boîte (rad/s). |
| `smoothedValues` | table|nil | Injecté. |
| `throttle` | number | Gaz décidés (0..1) ; conservés en montée, coupés en descente sauf rev-match. |
| `timer` | table|nil | Injecté. |
| `timerConstants` | table|nil | Injecté. |
| `updateGearboxGFX` | function | nop puis inGear/whileShifting du mode actif. |
| `waterTemp` | number | Température du liquide de refroidissement. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua`.*
