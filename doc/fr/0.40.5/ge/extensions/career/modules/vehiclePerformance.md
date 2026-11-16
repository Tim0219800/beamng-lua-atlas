# `career_modules_vehiclePerformance`

*Fichier : `lua/ge/extensions/career/modules/vehiclePerformance.lua` · VM : Game Engine (GE) · 654 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_vehiclePerformance` : `extensions.load("career_modules_vehiclePerformance")`, puis la globale `career_modules_vehiclePerformance`

Certification de performance (« indice de performance ») des véhicules de la carrière, depuis l'ordinateur du garage. startDragTest enchaîne, avec util_stepHandler, un test de drag sur la piste alderStrip (west_coast_usa) enregistré (puissance, temps 0-60, 60 ft, 330 ft, 1/8, 1000 ft, 1/4 de mile, vitesses, freinage), puis un test de skidpad de 10 tours piloté par l'IA (accélération latérale). Les données sont stockées dans vehicle.certificationData, l'historique (10 entrées max) dans performanceHistory, puis converties en scores et classe par gameplay_vehiclePerformance. Gère aussi les caméras de test, le blocage d'actions pendant le test et l'annulation (utilisateur, véhicule bloqué, moteur cassé).

## Remarques

- Pendant le test, les autres véhicules d'inventaire sont désactivés et le trafic dispersé ; le véhicule est rempli de carburant ; un groupe d'actions bloquées certificationBlockedActions est activé (menu radial, grande carte, marche, reset physique, nodegrabber, déclencheurs, mode de boîte).
- Le test est annulé si le véhicule bouge de moins de 0,1 m pendant 7 s (considéré bloqué) ou si le moteur subit un sur-couple catastrophique / se bloque (annulation après 3 s).
- cancelTest(delay, userAborted) : delay = secondes d'attente (temps réel) avant de passer à la dernière étape ; userAborted ~= false et test en cours émet le hook onGameplayActivityAborted.
- invalidateCertification déplace l'ancienne certification dans l'historique et la supprime ; l'achat de tuning l'appelle.
- Le temps 0-60 mph est calculé en observant la vitesse (26,8224 m/s) pendant la course, en retranchant le temps de réaction.
- addScoresToPerformanceData débloque les succès PERFOMANCE_INDEX (orthographe du code) et, pour la classe X, HIGH_END_PERFORMANCE ; le test complet débloque PERFORMANCE_INDEXED.
- Le hook onVehicleDamaged est appelé par un callback d'injection Lua côté véhicule (damageTracker.registerDamageUpdateCallback) qui sérialise les données.
- Dans getAggregateScoresFromVehId et getVehicleClass, le retour est nil si le véhicule n'a pas de certificationData.

**Dépendances (chargées avant) :** `ui_vehicleSelector_vehicleSpecifications`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_vehiclePerformance.addScoresToPerformanceData(performanceData)` | Ajoute à un bloc de données les champs performanceAggregateScores et vehicleClass et débloque les succès associés. | 537 |
| `career_modules_vehiclePerformance.cancelTest(delay, userAborted)` | Demande l'annulation du test en cours et arrête le zoom caméra et le test de skidpad. | 546 |
| `career_modules_vehiclePerformance.getActiveVehicleUiData()` | Données UI du véhicule actif (career_modules_inventory.getVehicleUiData). | 616 |
| `career_modules_vehiclePerformance.getAggregateScoresFromVehId(inventoryId)` | Retourne les scores agrégés (gameplay_vehiclePerformance.getAggregateScores) d'après la certification d'un véhicule. | 509 |
| `career_modules_vehiclePerformance.getVehicleClass(inventoryId)` | Retourne la classe de performance d'un véhicule (gameplay_vehiclePerformance.getClassFromData). | 516 |
| `career_modules_vehiclePerformance.invalidateCertification(inventoryId)` | Archive la certification actuelle d'un véhicule dans son historique puis la supprime (appelée après un changement de pièces ou de tuning). | 56 |
| `career_modules_vehiclePerformance.isTestInProgress()` | Indique si un test de certification est en cours. | 637 |
| `career_modules_vehiclePerformance.onBeamNGTrigger(data)` | Hook de triggers : change la trajectoire de caméra (drag_pi_2 à 5) à l'entrée des triggers dragStageTrigger, drag60ftTrigger, dragTestTrigger2/3, et passe à la caméra externe à la sortie de dragEndCamTrigger. Ne traite que le véhicule du test. *(interne)* *(hook)* | 555 |
| `career_modules_vehiclePerformance.onComputerAddFunctions(menuData, computerFunctions)` | Hook de l'ordinateur du garage : ajoute le bouton « indice de performance » pour chaque véhicule du garage (désactivé tant que le véhicule de départ n'est pas acheté). *(interne)* *(hook)* | 588 |
| `career_modules_vehiclePerformance.onDragCountdownStarted(vehId, dial)` | Hook de drag : 1 s après le début du compte à rebours, passe à la caméra de départ (derrière le véhicule). *(interne)* *(hook)* | 580 |
| `career_modules_vehiclePerformance.onRouteMount(context, toRoute, fromRoute, data)` | Hook du routeur d'UI : attache les données du véhicule actif à data.vehicleData lors du montage de la route. *(interne)* *(hook)* | 623 |
| `career_modules_vehiclePerformance.onUpdate(dtReal)` | Hook de mise à jour : met à jour le zoom de la caméra de freinage. *(interne)* *(hook)* | 75 |
| `career_modules_vehiclePerformance.onVehicleDamaged(damageData, damageDataDelta)` | Appelé depuis le véhicule via un callback de damageTracker : annule le test après 3 s en cas de sur-couple catastrophique ou de moteur bloqué. *(interne)* *(hook)* | 627 |
| `career_modules_vehiclePerformance.openMenu(options)` | Définit le véhicule actif et navigue vers l'écran career.computer.vehiclePerformance. | 611 |
| `career_modules_vehiclePerformance.startDragTest()` | Lance le test de certification complet sur le véhicule actif (activeInventoryId) : fondu au noir, apparition du véhicule, test de drag enregistré, puis skidpad (10 tours), sauvegarde des résultats, remise en garage et retour à l'écran de performance. Si la sauvegarde automatique est active, sauvegarde la carrière à la fin. | 116 |
| `career_modules_vehiclePerformance.translatePerformanceDataForUi(performanceData)` | Traduit en place les champs drivetrain, fuelType, inductionType d'un bloc de données de performance pour l'affichage. | 523 |

### Détail des paramètres

#### `career_modules_vehiclePerformance.addScoresToPerformanceData(performanceData)`

Ajoute à un bloc de données les champs performanceAggregateScores et vehicleClass et débloque les succès associés.

- `performanceData` (*table*) : Données de performance (modifiées en place).

#### `career_modules_vehiclePerformance.cancelTest(delay, userAborted)`

Demande l'annulation du test en cours et arrête le zoom caméra et le test de skidpad.

- `delay` (*number|nil*) : Délai en secondes avant l'arrêt effectif, 0 par défaut.
- `userAborted` (*boolean|nil*) : false si l'annulation est automatique (pas de hook onGameplayActivityAborted).

#### `career_modules_vehiclePerformance.getActiveVehicleUiData()`

Données UI du véhicule actif (career_modules_inventory.getVehicleUiData).

- **renvoie** : table|nil Données UI, nil si aucun véhicule actif.

#### `career_modules_vehiclePerformance.getAggregateScoresFromVehId(inventoryId)`

Retourne les scores agrégés (gameplay_vehiclePerformance.getAggregateScores) d'après la certification d'un véhicule.

- `inventoryId` (*integer*) : Id d'inventaire.
- **renvoie** : table|nil Scores, ou nil sans certification.

#### `career_modules_vehiclePerformance.getVehicleClass(inventoryId)`

Retourne la classe de performance d'un véhicule (gameplay_vehiclePerformance.getClassFromData).

- `inventoryId` (*integer*) : Id d'inventaire.
- **renvoie** : table|nil Classe, ou nil sans certification.

#### `career_modules_vehiclePerformance.invalidateCertification(inventoryId)`

Archive la certification actuelle d'un véhicule dans son historique puis la supprime (appelée après un changement de pièces ou de tuning).

- `inventoryId` (*integer*) : Id d'inventaire.

#### `career_modules_vehiclePerformance.isTestInProgress()`

Indique si un test de certification est en cours.

- **renvoie** : boolean|nil true pendant le test, nil sinon.

#### `career_modules_vehiclePerformance.onBeamNGTrigger(data)`

Hook de triggers : change la trajectoire de caméra (drag_pi_2 à 5) à l'entrée des triggers dragStageTrigger, drag60ftTrigger, dragTestTrigger2/3, et passe à la caméra externe à la sortie de dragEndCamTrigger. Ne traite que le véhicule du test.

- `data` (*table*) : {triggerName, event ("enter"|"exit"), subjectID}.

#### `career_modules_vehiclePerformance.onComputerAddFunctions(menuData, computerFunctions)`

Hook de l'ordinateur du garage : ajoute le bouton « indice de performance » pour chaque véhicule du garage (désactivé tant que le véhicule de départ n'est pas acheté).

- `menuData` (*table*) : Données du menu.
- `computerFunctions` (*table*) : Table à remplir.

#### `career_modules_vehiclePerformance.onDragCountdownStarted(vehId, dial)`

Hook de drag : 1 s après le début du compte à rebours, passe à la caméra de départ (derrière le véhicule).

- `vehId` (*integer*) : Id du véhicule.
- `dial` (*any*) : Valeur de dial (non utilisée).

#### `career_modules_vehiclePerformance.onRouteMount(context, toRoute, fromRoute, data)`

Hook du routeur d'UI : attache les données du véhicule actif à data.vehicleData lors du montage de la route.

- `context` (*any*) : Contexte du routeur.
- `toRoute` (*any*) : Route cible.
- `fromRoute` (*any*) : Route d'origine.
- `data` (*table*) : Table de données de la route (reçoit vehicleData).

#### `career_modules_vehiclePerformance.onUpdate(dtReal)`

Hook de mise à jour : met à jour le zoom de la caméra de freinage.

- `dtReal` (*number*) : Delta temps réel (s).

#### `career_modules_vehiclePerformance.onVehicleDamaged(damageData, damageDataDelta)`

Appelé depuis le véhicule via un callback de damageTracker : annule le test après 3 s en cas de sur-couple catastrophique ou de moteur bloqué.

- `damageData` (*table*) : Données de dégâts.
- `damageDataDelta` (*table*) : Variation des dégâts (champ engine).

#### `career_modules_vehiclePerformance.openMenu(options)`

Définit le véhicule actif et navigue vers l'écran career.computer.vehiclePerformance.

- `options` (*table*) : {inventoryId = integer}.

#### `career_modules_vehiclePerformance.translatePerformanceDataForUi(performanceData)`

Traduit en place les champs drivetrain, fuelType, inductionType d'un bloc de données de performance pour l'affichage.

- `performanceData` (*table|nil*) : Données de performance (modifiées en place).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"ui_vehicleSelector_vehicleSpecifications"}. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGameplayActivityAborted`

## Appels vers le moteur (C++)

- `be:` `getObjectOOBBHalfAxisXYZ`
- `scenetree.` `findObject`

**Charge les extensions :** `gameplay_drag_dragTypes_headsUpRace`, `util_stepHandler`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/vehiclePerformance.lua`.*
