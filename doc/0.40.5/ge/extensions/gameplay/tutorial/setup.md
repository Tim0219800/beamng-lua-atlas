# `gameplay_tutorial_setup`

*Fichier : `lua/ge/extensions/gameplay/tutorial/setup.lua` · VM : Game Engine (GE) · 409 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_tutorial_setup` : `extensions.load("gameplay_tutorial_setup")`, puis la globale `gameplay_tutorial_setup`

Mise en place de la scène du didacticiel : préfabs, sites (zones de stationnement), véhicule du didacticiel (sunburst2, config apmTutorial_sunburst), placement du joueur à pied, blocage d'actions d'entrée, et réinitialisation « hors limites » avec fondu d'écran. Utilisé par gameplay_tutorial_runtime et par les étapes ; il ne retient que l'id du véhicule, pas l'objet.

## Remarques

- Le fichier de sites chargé est /gameplay/tutorials/tutorialZones.sites.json ; les points utilisés sont tutorialCarStart, playerWalkingStart, dragPlayerStart et dragCarStart.
- Les préfabs sont chargés depuis gameplay/tutorials/<id>.prefab.json et nommés <id>Prefab.
- La réinitialisation hors limites passe par ui_fadeScreen : le callback est exécuté quand onScreenFadeState reçoit l'état 2.
- Le véhicule du didacticiel est gelé (setFreeze), boîte en mode realistic, contact coupé à l'apparition.
- Les boîtes de vitesses sont bloquées par défaut (blockedActions) ; unblockGearActions() les libère.
- Le message d'avertissement hors zone est écrit en anglais en dur et n'est pas passé par le système de traduction.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_tutorial_setup.activateOutOfBoundsSystem()` | Active le système de limites de zone (outOfBoundsSystemActive = true). | 39 |
| `gameplay_tutorial_setup.cleanup()` | Remet tout à zéro : drapeaux, handlers de reset, préfabs créés (supprimés, collision rechargée) et tutorialVehicleId. | 115 |
| `gameplay_tutorial_setup.isOutOfBoundsResetAllowed()` | Indique si la réinitialisation hors limites est autorisée. | 31 |
| `gameplay_tutorial_setup.loadTutorialSites()` | Charge le fichier de sites du didacticiel via gameplay_sites_sitesManager.loadSites et le stocke dans tutorialSites. | 144 |
| `gameplay_tutorial_setup.onLoadingScreenFadeout()` | Hook appelé à la fin du fondu de l'écran de chargement ; passe loadingScreenFadeoutComplete à true. *(interne)* *(hook)* | 195 |
| `gameplay_tutorial_setup.onScreenFadeState(state)` | Hook appelé lors des changements d'état du fondu d'écran ; à l'état 2 et si un reset est en attente, exécute le callback, arrête le fondu et affiche l'avertissement. *(interne)* *(hook)* | 339 |
| `gameplay_tutorial_setup.placePlayerAtDragStart()` | Met le joueur à pied et le téléporte au site dragPlayerStart (ou 6 m derrière dragCarStart), orienté vers l'avant. | 353 |
| `gameplay_tutorial_setup.placePlayerBackInTutorialVehicle()` | Remet le joueur dans le véhicule du didacticiel s'il marche ou conduit autre chose. | 376 |
| `gameplay_tutorial_setup.placePlayerBackToParkingStart()` | Téléporte le joueur : à pied, au site playerWalkingStart ; en véhicule, le véhicule du didacticiel à tutorialCarStart, et fait monter le joueur dedans s'il n'y est pas. | 288 |
| `gameplay_tutorial_setup.runCurrentStepOutOfBoundsReset()` | Lance le reset hors limites avec le handler de l'étape courante, sinon avec le placement au point de départ. | 322 |
| `gameplay_tutorial_setup.runOutOfBoundsResetWithFade(resetCallback)` | Lance un fondu d'écran de 0,3 s ; le callback sera exécuté à l'état 2 du fondu. Ignoré si un reset est déjà en attente. | 315 |
| `gameplay_tutorial_setup.setActivePrefabs(prefabStates)` | Active ou désactive des préfabs de gameplay/tutorials/ selon une table id -> booléen ; ne touche que ceux dont l'état change. Recharge la collision si quelque chose a changé. | 69 |
| `gameplay_tutorial_setup.setOutOfBoundsResetAllowed(allowed)` | Autorise ou non la réinitialisation hors limites (à autoriser une fois les pop-ups d'accueil fermés). | 27 |
| `gameplay_tutorial_setup.setOutOfBoundsResetHandler(resetCallback)` | Définit le callback de réinitialisation propre à l'étape courante (sinon placePlayerBackToParkingStart est utilisé). | 35 |
| `gameplay_tutorial_setup.setupBlockedActions()` | Construit la liste d'actions bloquées (modèles de groupes à true + actions individuelles à true) et l'enregistre comme groupe tutorialBlockedActions du filtre d'actions du joueur 0. | 390 |
| `gameplay_tutorial_setup.setupPlayer()` | Met le joueur en mode marche à la position playerWalkingStart (ou à une position par défaut codée en dur) puis le replace au point de départ ; passe vehicleSetupComplete à true. | 199 |
| `gameplay_tutorial_setup.setupVehicles()` | Remet à false les drapeaux de préparation, puis fait apparaître le véhicule du didacticiel et appelle setupPlayer une fois prêt. | 189 |
| `gameplay_tutorial_setup.showOutOfBoundsWarning()` | Affiche pendant 3 s une tâche message « Please stay inside of the evaluation zone. » dans la liste de tâches de l'interface (SetTasklistTask puis DiscardTasklistItem). | 331 |
| `gameplay_tutorial_setup.spawnPrefab(prefabPath, pos, rot, name)` | Fait apparaître un préfab dans MissionGroup (canSave = false) et le mémorise pour le nettoyage. | 43 |
| `gameplay_tutorial_setup.spawnTutorialVehicle(thenFunction)` | Fait apparaître la sunburst2 du didacticiel au site tutorialCarStart (sans y entrer), enregistre son id, règle la boîte en realistic, gèle le véhicule et coupe le contact, puis appelle thenFunction. | 223 |
| `gameplay_tutorial_setup.unblockGearActions()` | Met toutes les actions de vitesse de blockedActions à false et réapplique le filtre. | 281 |

### Détail des paramètres

#### `gameplay_tutorial_setup.isOutOfBoundsResetAllowed()`

Indique si la réinitialisation hors limites est autorisée.

- **renvoie** : boolean 

#### `gameplay_tutorial_setup.loadTutorialSites()`

Charge le fichier de sites du didacticiel via gameplay_sites_sitesManager.loadSites et le stocke dans tutorialSites.

- **renvoie** : table|nil Sites chargés, nil en cas d'échec.

#### `gameplay_tutorial_setup.onScreenFadeState(state)`

Hook appelé lors des changements d'état du fondu d'écran ; à l'état 2 et si un reset est en attente, exécute le callback, arrête le fondu et affiche l'avertissement.

- `state` (*integer*) : État du fondu (2 = écran complètement noirci, déduit du code).

#### `gameplay_tutorial_setup.runOutOfBoundsResetWithFade(resetCallback)`

Lance un fondu d'écran de 0,3 s ; le callback sera exécuté à l'état 2 du fondu. Ignoré si un reset est déjà en attente.

- `resetCallback` (*function|nil*) : Callback de reset ; placePlayerBackToParkingStart si nil.

#### `gameplay_tutorial_setup.setActivePrefabs(prefabStates)`

Active ou désactive des préfabs de gameplay/tutorials/ selon une table id -> booléen ; ne touche que ceux dont l'état change. Recharge la collision si quelque chose a changé.

- `prefabStates` (*table<string, boolean>*) : Id de préfab -> actif ou non.

#### `gameplay_tutorial_setup.setOutOfBoundsResetAllowed(allowed)`

Autorise ou non la réinitialisation hors limites (à autoriser une fois les pop-ups d'accueil fermés).

- `allowed` (*boolean*) : true pour autoriser.

#### `gameplay_tutorial_setup.setOutOfBoundsResetHandler(resetCallback)`

Définit le callback de réinitialisation propre à l'étape courante (sinon placePlayerBackToParkingStart est utilisé).

- `resetCallback` (*function|nil*) : Fonction sans argument.

#### `gameplay_tutorial_setup.spawnPrefab(prefabPath, pos, rot, name)`

Fait apparaître un préfab dans MissionGroup (canSave = false) et le mémorise pour le nettoyage.

- `prefabPath` (*string*) : Chemin du fichier prefab.
- `pos` (*vec3*) : Position.
- `rot` (*quat*) : Rotation.
- `name` (*string|nil*) : Nom de l'objet ; généré (tutorial_prefab_…) si absent.
- **renvoie** : userdata|nil Objet préfab, nil en cas d'échec.

#### `gameplay_tutorial_setup.spawnTutorialVehicle(thenFunction)`

Fait apparaître la sunburst2 du didacticiel au site tutorialCarStart (sans y entrer), enregistre son id, règle la boîte en realistic, gèle le véhicule et coupe le contact, puis appelle thenFunction.

- `thenFunction` (*function|nil*) : Appelée quand le véhicule a répondu à la requête mainController/gearboxMode.
- **renvoie** : userdata|nil Objet véhicule, nil si l'apparition a échoué.

## Champs

| Champ | Type | Description |
|---|---|---|
| `blockedActions` | table<string, boolean> | Actions d'entrée individuelles bloquées (gear1..8, gearN, gearR, shiftUp, shiftDown, setShifterMode : toutes à true par défaut). |
| `blockedActionsTemplates` | table<string, boolean> | Groupes d'actions (aiControls, bigMap, freeCam, resetPhysics, walkingMode, vehicleSwitching…) bloqués quand la valeur est true. |
| `loadingScreenFadeoutComplete` | boolean | true après onLoadingScreenFadeout. |
| `outOfBoundsSystemActive` | boolean | true après activateOutOfBoundsSystem(). |
| `tutorialSites` | table|nil | Sites chargés (parkingSpots, etc.) ; nil tant que loadTutorialSites n'a pas réussi. |
| `tutorialVehicleId` | integer|nil | Id du véhicule du didacticiel (nil avant spawn et après cleanup). Les étapes utilisent getObjectByID dessus. |
| `vehicleSetupComplete` | boolean | true quand le véhicule est prêt et le joueur placé (fin de setupPlayer). |

**Évènements UI (guihooks.trigger) :** `DiscardTasklistItem`, `SetTasklistTask`

## Appels vers le moteur (C++)

- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/tutorial/setup.lua`.*
