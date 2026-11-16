# `controller_vehicleController_shiftLogic_cvtGearbox2`

*Fichier : `lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua` · VM : Véhicule · 620 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `vehicleController/shiftLogic/cvtGearbox2` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Seconde logique de boîte CVT, pilotée par une carte (régime cible = f(vitesse roues, agressivité)) au lieu d'un simple interpolateur. Modes P R N D S. Le mode S active des rapports fixes simulés (« paliers » sport) avec délai entre changements. Chargé par vehicleController via jbeam shiftLogicName = "cvtGearbox2" (le device « gearbox » doit être de type cvtGearbox pour la sélection automatique, sinon nommer le module explicitement). Règle le rapport continu par gearbox:setGearRatio et un verrouillage de convertisseur par hystérésis.

## Remarques

- Clés jbeam lues dans init : cvtGearRatioSmoothingIn (6), cvtGearRatioSmoothingOut (4), cvtLockupSmoothing (5), automaticModes ("PRND"), defaultAutomaticMode ("N"), lockupMinWheelspeed (2 m/s), lockupMinRpmDiff (50), lockupMaxRpmDiff (400), cvtTargetRPMMap (données pour interpolatedMap : axes vitesse roues / agressivité -> tr/min), cvtSportGearShiftCooldown (1 s), cvtSportGearRatios (tableau de rapports décroissants).
- Le régime cible vient de cvtTargetRPMMap:get(wheelspeed, drivingAggression) ; rapport visé = régime cible / vitesse de sortie de boîte, borné par minGearRatio/maxGearRatio, puis lissé. En R, rapport = maxGearRatio.
- Bug repéré : init met toujours cvtHandling.useFixedGearRatios = false à la lecture de cvtSportGearRatios (valide ou non) ; l'option n'est réactivée que par applyGearboxMode en mode S, appelée en fin d'init. Si cvtTargetRPMMap est absent, loadData reçoit nil.
- Le verrouillage (lockupClutchRatio) n'est actif que si un device « torqueConverter » existe et lockupMinWheelspeed > 0 ; il dépend de l'écart régime cible - régime moteur, de la vitesse et des gaz.
- Pas de logique « whileShifting » : updateGearboxGFX reste inGear. En arcade shiftUp/Down affichent un avertissement ; shiftToGearIndex bascule en realistic.
- Rapport virtuel : P=-2, R=-1, N=0, D=1, S=2. currentGearIndex = 0 en P/N.
- Contrat commun shiftLogic : gearboxHandling, timer, timerConstants, inputValues, shiftPreventionData, shiftBehavior, smoothedValues injectés par vehicleController. M.running écrit sans déclaration.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_vehicleController_shiftLogic_cvtGearbox2.areShiftLEDsInUse()` | Vrai hors arcade en mode manuel (jamais en pratique). *(interne)* | 104 |
| `controller_vehicleController_shiftLogic_cvtGearbox2.gearboxBehaviorChanged(behavior)` | Sélectionne la logique arcade ou realistic. *(interne)* | 144 |
| `controller_vehicleController_shiftLogic_cvtGearbox2.getGearName()` | Nom du mode : P, R, N, D, ou "S<n>" en sport (n = palier fixe courant). | 108 |
| `controller_vehicleController_shiftLogic_cvtGearbox2.getGearPosition()` | Position du levier normalisée et index de mode. | 118 |
| `controller_vehicleController_shiftLogic_cvtGearbox2.getState()` | État sauvegardable {grb_mde = mode}. | 588 |
| `controller_vehicleController_shiftLogic_cvtGearbox2.init(jbeamData, sharedFunctionTable)` | Crée lisseurs, liste des modes, paramètres de lockup, carte de régime cible et rapports fixes du mode S ; applique le mode par défaut. Appelé par vehicleController (init et reset). *(interne)* | 430 |
| `controller_vehicleController_shiftLogic_cvtGearbox2.sendTorqueData()` | Demande au moteur d'envoyer ses courbes de couple à l'UI. *(interne)* | 424 |
| `controller_vehicleController_shiftLogic_cvtGearbox2.setState(data)` | Restaure le mode depuis data.grb_mde. | 594 |
| `controller_vehicleController_shiftLogic_cvtGearbox2.shiftDown()` | Realistic : mode précédent. | 189 |
| `controller_vehicleController_shiftLogic_cvtGearbox2.shiftToGearIndex(index)` | Realistic : mode correspondant à la position du levier ; inexistant -> message et N. | 201 |
| `controller_vehicleController_shiftLogic_cvtGearbox2.shiftUp()` | Realistic : mode suivant (P->R->N->D->S). | 177 |

### Détail des paramètres

#### `controller_vehicleController_shiftLogic_cvtGearbox2.areShiftLEDsInUse()`

Vrai hors arcade en mode manuel (jamais en pratique).

- **renvoie** : boolean LEDs utilisées ?

#### `controller_vehicleController_shiftLogic_cvtGearbox2.gearboxBehaviorChanged(behavior)`

Sélectionne la logique arcade ou realistic.

- `behavior` (*string*) : "arcade" ou "realistic".

#### `controller_vehicleController_shiftLogic_cvtGearbox2.getGearName()`

Nom du mode : P, R, N, D, ou "S<n>" en sport (n = palier fixe courant).

- **renvoie** : string Nom affiché.

#### `controller_vehicleController_shiftLogic_cvtGearbox2.getGearPosition()`

Position du levier normalisée et index de mode.

- **renvoie** : number (index-1)/(nombre de modes-1)
- **renvoie** : integer Index de mode.

#### `controller_vehicleController_shiftLogic_cvtGearbox2.getState()`

État sauvegardable {grb_mde = mode}.

- **renvoie** : table|nil État.

#### `controller_vehicleController_shiftLogic_cvtGearbox2.init(jbeamData, sharedFunctionTable)`

Crée lisseurs, liste des modes, paramètres de lockup, carte de régime cible et rapports fixes du mode S ; applique le mode par défaut. Appelé par vehicleController (init et reset).

- `jbeamData` (*table*) : Données jbeam.
- `sharedFunctionTable` (*table*) : sharedFunctions.

#### `controller_vehicleController_shiftLogic_cvtGearbox2.setState(data)`

Restaure le mode depuis data.grb_mde.

- `data` (*table*) : Table produite par getState.

#### `controller_vehicleController_shiftLogic_cvtGearbox2.shiftToGearIndex(index)`

Realistic : mode correspondant à la position du levier ; inexistant -> message et N.

- `index` (*integer*) : Position du levier (-1 R, 0 N, 1 P, 2 D, 3 S).

## Champs

| Champ | Type | Description |
|---|---|---|
| `brake` | number | Frein (0..1). |
| `checkEngine` | boolean | Moteur désactivé. |
| `clutchRatio` | number | Toujours 1. |
| `currentGearIndex` | integer | Index virtuel (R -1, N/P 0, D 1, S 2). |
| `energyStorages` | table<integer, string> | Réservoirs du moteur. |
| `engineLoad` | number | Charge moteur. |
| `engineThrottle` | number | Gaz appliqués au moteur. |
| `engineTorque` | number | Couple de combustion. |
| `engineTorqueData` | table |  |
| `flywheelTorque` | number | Couple moteur. |
| `gearboxHandling` | table|nil | Injecté par vehicleController. |
| `gearboxTorque` | number | Couple de sortie de boîte. |
| `idleRPM` | number | Ralenti. |
| `ignition` | boolean | ignitionLevel > 1. |
| `inputValues` | table|nil | Injecté. |
| `isArcadeSwitched` | boolean | Gaz/frein permutés. |
| `isEngineRunning` | number | 1 si le moteur tourne. |
| `isManualModeActive` | boolean | Vrai en modes M (non disponibles en pratique). |
| `isSportModeActive` | boolean | Vrai en mode S. |
| `maxGearIndex` | integer | Plus grand index de la boîte. |
| `maxRPM` | number | Régime max. |
| `minGearIndex` | integer | Valeur absolue du plus petit index (init). |
| `oilTemp` | number | Température d'huile. |
| `rpm` | number | Régime moteur (tr/min). |
| `shiftBehavior` | table|nil | Injecté. |
| `shiftPreventionData` | table|nil | Injecté. |
| `shiftingAggression` | number | Recopie de drivingAggression. |
| `smoothedAvgAVInput` | number | Vitesse angulaire de sortie de boîte (rad/s). |
| `smoothedValues` | table|nil | Injecté. |
| `throttle` | number | Gaz (0..1), permutés avec le frein en marche arrière arcade. |
| `throttleInput` | number |  |
| `timer` | table|nil | Injecté. |
| `timerConstants` | table|nil | Injecté. |
| `torqueToMinRPM` | table |  |
| `updateGearboxGFX` | function | nop puis inGear du mode actif. |
| `waterTemp` | number | Température du liquide de refroidissement. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua`.*
