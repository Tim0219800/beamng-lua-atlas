# `controller_vehicleController_shiftLogic_manualGearbox`

*Fichier : `lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua` · VM : Véhicule · 714 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `vehicleController/shiftLogic/manualGearbox` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Logique de boîte manuelle (levier en H ou touches monter/descendre) avec embrayage automatique ou manuel. Chargé par vehicleController quand le device « gearbox » est de type manualGearbox. En arcade, la boîte choisit seule le rapport (points de passage, marche arrière auto) et pilote l'embrayage au démarrage ; en realistic, le conducteur choisit le rapport, la machine à états gère embrayage, point mort, synchronisation (rev-match) et engagement.

## Exemple

```lua
controller.mainController.shiftToGearIndex(3) -- engage le 3e (mode realistic) ; en arcade bascule d'abord en realistic
```

## Remarques

- Clés jbeam lues dans init : clutchLaunchTargetRPM (3000), clutchLaunchStartRPM (2000), clutchInRate (25), clutchOutRate (25), revMatchThrottle (0.5).
- Machine à états de changement de rapport (clutchHandling.shiftState) : clutchIn -> neutral -> waitingForShift -> shift -> (gearGrind) -> clutchOut. En realistic le passage attend le relâchement de la touche (shiftUpOnUp/shiftDownOnUp) ou un shiftToGearIndex ; waitingForShift est abandonné après 2 s en passage direct.
- gearboxSafety : un rapport qui ferait dépasser engine.maxAV est refusé (on garde le rapport précédent).
- autoClutch (réglage utilisateur) : sinon l'embrayage suit directement 1 - inputValues.clutch. autoThrottle : permet le rev-match automatique (throttle = revMatchThrottle).
- Le module expose M.shiftUpOnDown/shiftDownOnDown/shiftUpOnUp/shiftDownOnUp/shiftToGearIndex qui sont ré-affectés dans gearboxBehaviorChanged selon le mode ; vehicleController appelle donc la version du mode courant.
- En arcade, shiftUp/Down affichent un avertissement ; shiftToGearIndex bascule en realistic.
- Contrat commun shiftLogic : gearboxHandling, timer, timerConstants, inputValues, shiftPreventionData, shiftBehavior, smoothedValues injectés par vehicleController.
- M.running est écrit sans être déclaré. init met M.minGearIndex = abs(minGearIndex) mais updateExposedData le réécrit ensuite avec la valeur signée.
- gearboxBehaviorChanged : passer en realistic sans autoClutch avec rapport 1 ou -1 engagé remet la boîte au point mort.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_vehicleController_shiftLogic_manualGearbox.areShiftLEDsInUse()` | Vrai hors arcade. *(interne)* | 82 |
| `controller_vehicleController_shiftLogic_manualGearbox.gearboxBehaviorChanged(behavior)` | Sélectionne la logique du mode (arcade/realistic) et réaffecte les fonctions de passage. *(interne)* | 94 |
| `controller_vehicleController_shiftLogic_manualGearbox.getGearName()` | Renvoie l'index de rapport numérique de la boîte (pas de chaîne). | 86 |
| `controller_vehicleController_shiftLogic_manualGearbox.getGearPosition()` | Toujours 0, 0 (non utilisé pour manuelles et séquentielles). | 90 |
| `controller_vehicleController_shiftLogic_manualGearbox.getState()` | État sauvegardable : {grb_idx = rapport courant}. | 683 |
| `controller_vehicleController_shiftLogic_manualGearbox.init(jbeamData, sharedFunctionTable)` | Récupère mainEngine et gearbox, construit les logiques arcade/realistic, lit les paramètres d'embrayage (voir notes). Appelé par vehicleController à l'init et au reset. *(interne)* | 605 |
| `controller_vehicleController_shiftLogic_manualGearbox.sendTorqueData()` | Demande au moteur d'envoyer ses courbes de couple à l'UI. *(interne)* | 599 |
| `controller_vehicleController_shiftLogic_manualGearbox.setState(data)` | Restaure le rapport via shiftToGearIndex(data.grb_idx). | 689 |
| `controller_vehicleController_shiftLogic_manualGearbox.shiftDownOnDown()` | Appui sur descendre : demande le rapport inférieur et lance la séquence. | 152 |
| `controller_vehicleController_shiftLogic_manualGearbox.shiftDownOnUp()` | Relâchement de descendre, même logique que shiftUpOnUp. | 176 |
| `controller_vehicleController_shiftLogic_manualGearbox.shiftToGearIndex(index)` | Demande directement un rapport (borné, sécurité surrégime) ; passage direct (levier en H). Index 0 depuis gearGrind remet au point mort. | 185 |
| `controller_vehicleController_shiftLogic_manualGearbox.shiftUpOnDown()` | Appui sur monter : demande le rapport suivant (borné min/max, sécurité surrégime) et lance la séquence de passage. | 119 |
| `controller_vehicleController_shiftLogic_manualGearbox.shiftUpOnUp()` | Relâchement de monter : en attente de passage, déclenche l'engagement ; sinon mémorise que l'entrée est terminée. | 143 |

### Détail des paramètres

#### `controller_vehicleController_shiftLogic_manualGearbox.areShiftLEDsInUse()`

Vrai hors arcade.

- **renvoie** : boolean LEDs de passage utilisées ?

#### `controller_vehicleController_shiftLogic_manualGearbox.gearboxBehaviorChanged(behavior)`

Sélectionne la logique du mode (arcade/realistic) et réaffecte les fonctions de passage.

- `behavior` (*string*) : "arcade" ou "realistic".

#### `controller_vehicleController_shiftLogic_manualGearbox.getGearName()`

Renvoie l'index de rapport numérique de la boîte (pas de chaîne).

- **renvoie** : integer gearbox.gearIndex

#### `controller_vehicleController_shiftLogic_manualGearbox.getGearPosition()`

Toujours 0, 0 (non utilisé pour manuelles et séquentielles).

- **renvoie** : number 0
- **renvoie** : number 0

#### `controller_vehicleController_shiftLogic_manualGearbox.getState()`

État sauvegardable : {grb_idx = rapport courant}.

- **renvoie** : table|nil État.

#### `controller_vehicleController_shiftLogic_manualGearbox.init(jbeamData, sharedFunctionTable)`

Récupère mainEngine et gearbox, construit les logiques arcade/realistic, lit les paramètres d'embrayage (voir notes). Appelé par vehicleController à l'init et au reset.

- `jbeamData` (*table*) : Données jbeam.
- `sharedFunctionTable` (*table*) : sharedFunctions.

#### `controller_vehicleController_shiftLogic_manualGearbox.setState(data)`

Restaure le rapport via shiftToGearIndex(data.grb_idx).

- `data` (*table*) : Table produite par getState.

#### `controller_vehicleController_shiftLogic_manualGearbox.shiftToGearIndex(index)`

Demande directement un rapport (borné, sécurité surrégime) ; passage direct (levier en H). Index 0 depuis gearGrind remet au point mort.

- `index` (*integer*) : Rapport voulu.

## Champs

| Champ | Type | Description |
|---|---|---|
| `brake` | number | Frein décidé (0..1). |
| `checkEngine` | boolean | Moteur désactivé. |
| `clutchRatio` | number | Taux d'embrayage (1 = embrayé). |
| `currentGearIndex` | integer | Rapport courant de la boîte. |
| `energyStorages` | table<integer, string> | Réservoirs du moteur. |
| `engineLoad` | number | Charge moteur. |
| `engineThrottle` | number | Gaz appliqués au moteur. |
| `engineTorque` | number | Couple de combustion. |
| `flywheelTorque` | number | Couple volant moteur. |
| `gearboxHandling` | table|nil | Injecté par vehicleController. |
| `gearboxTorque` | number | Couple de sortie de boîte. |
| `idleRPM` | number | Régime de ralenti. |
| `ignition` | boolean | ignitionLevel > 1. |
| `inputValues` | table|nil | Injecté. |
| `isArcadeSwitched` | boolean | Gaz/frein permutés (arcade marche arrière). |
| `isEngineRunning` | number | 1 si le moteur tourne. |
| `isShifting` | boolean | Vrai pendant un changement de rapport (hors attente du conducteur). |
| `isSportModeActive` | boolean | Toujours false. |
| `maxGearIndex` | integer | Plus grand rapport avant. |
| `maxRPM` | number | Régime maximal. |
| `minGearIndex` | integer | Plus petit index (marche arrière). |
| `oilTemp` | number | Température d'huile. |
| `rpm` | number | Régime moteur (tr/min). |
| `shiftBehavior` | table|nil | Injecté. |
| `shiftPreventionData` | table|nil | Injecté. |
| `shiftingAggression` | number | Coefficient 0.3..1 de vitesse de passage calculé par calculateShiftAggression. |
| `smoothedAvgAVInput` | number | Vitesse angulaire de sortie de boîte (rad/s). |
| `smoothedValues` | table|nil | Injecté. |
| `throttle` | number | Gaz décidés (0..1), nuls pendant un changement de rapport au-delà du 1er sauf rev-match. |
| `timer` | table|nil | Injecté. |
| `timerConstants` | table|nil | Injecté. |
| `updateGearboxGFX` | function | nop puis inGear/whileShifting du mode actif. |
| `waterTemp` | number | Température de liquide de refroidissement. |

## Appels vers le moteur (C++)

- `obj:` `getSimulationTimeScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua`.*
