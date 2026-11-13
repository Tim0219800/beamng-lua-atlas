# `gameplay_freeformDelivery_freeformDelivery`

*Fichier : `lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua` · VM : Game Engine (GE) · 680 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_freeformDelivery_freeformDelivery` : `extensions.load("gameplay_freeformDelivery_freeformDelivery")`, puis la globale `gameplay_freeformDelivery_freeformDelivery`

Module principal du mode de livraison libre (freeform delivery). Il orchestre le cycle de vie d'une livraison décrite par un fichier delivery.delivery.json : load (chargement via le loader, installation des véhicules, routes, odomètre, filtre d'actions), start (objectifs, marqueurs, tasklist, hints, chronomètre), finish (arrêt de l'UI, gel des véhicules, état « terminé »), reset (retour à l'état chargé) et teardown (suppression des véhicules et déchargement). À chaque frame il met à jour tous les sous-modules (goals, markers, tasklist, hints, routes, odometer, vehicleSleep), affiche le chrono et enregistre un menu radial (quickAccess) pour terminer la livraison ou choisir un itinéraire.

## Exemple

```lua
extensions.load('gameplay_freeformDelivery_freeformDelivery')
gameplay_freeformDelivery_freeformDelivery.load('gameplay/missions/driver_training/delivery/001-deliveryIntro/delivery.delivery.json')
-- attendre isLoaded() == true (setup asynchrone), puis :
gameplay_freeformDelivery_freeformDelivery.start()
```

## Remarques

- États : chargement en attente (setupPending), isLoaded (prêt à démarrer), isActive (en cours), isFinished (terminé ou échoué, véhicules toujours présents), isFailed + failReason. load() refuse de charger si une livraison est déjà chargée, active ou terminée : appeler teardown() d'abord.
- load() lance le setup de façon asynchrone ; isLoaded passe à true dans onUpdate quand setup et odomètre sont terminés. Délai maximal 20 s (SETUP_TIMEOUT_SECONDS), sinon teardown automatique.
- load() bloque pour le joueur 0 les actions : vehicleTeleporting, vehicleMenues, physicsControls, aiControls, vehicleSwitching, freeCam, funStuff (groupe freeformDeliveryBlockedActions) ; teardown() les débloque. Il appelle aussi gameplay_freeformDelivery_debug.toggleDebugWindow(), qui n'ouvre en réalité rien (voir la description du module debug).
- Le temps est mesuré avec os.clock() (temps réel, pas le temps simulé) : la pause ne l'arrête pas.
- La fin automatique est déclenchée par gameplay_freeformDelivery_goals.updateCompletionTimer(dtReal) ; la fin manuelle passe par le menu radial /root/sandbox/delivery/ qui émet onGameplayActivityAborted puis finish().
- Le menu quickAccess n'est enregistré qu'à l'ouverture du menu radial (onBeforeRadialOpened) et est retiré dans finish/teardown.
- Chaque fonction qui change d'état (start, finish, reset) renvoie false avec un avertissement si l'état ne le permet pas.
- Le champ dependencies est exposé et liste 20 extensions chargées avant (core_vehicles, core_gamestate, sitesManager, flowgraphManager, quickAccess, tous les sous-modules freeformDelivery, groundMarkers, actionFilter, genericMissionData). Le commentaire indique que setExtensionUnloadMode(M, "manual") est désactivé.

**Dépendances (chargées avant) :** `core_vehicles`, `core_gamestate`, `gameplay_sites_sitesManager`, `core_flowgraphManager`, `core_quickAccess`, `gameplay_freeformDelivery_utils`, `gameplay_freeformDelivery_loader`, `gameplay_freeformDelivery_setup`, `gameplay_freeformDelivery_goals`, `gameplay_freeformDelivery_tasklist`, `gameplay_freeformDelivery_markers`, `gameplay_freeformDelivery_endScreen`, `gameplay_freeformDelivery_hints`, `gameplay_freeformDelivery_routes`, `gameplay_freeformDelivery_debug`, `gameplay_freeformDelivery_odometer`, `gameplay_freeformDelivery_vehicleSleep`, `core_groundMarkers`, `core_input_actionFilter`, `ui_apps_genericMissionData`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_freeformDelivery_freeformDelivery.cleanup()` | Ancienne fonction de nettoyage, conservée pour compatibilité : appelle teardown() sans argument. | 666 |
| `gameplay_freeformDelivery_freeformDelivery.finish(failed, reason)` | Termine la livraison active (réussie ou échouée) : enregistre le temps écoulé dans currentDelivery.elapsedTime, masque marqueurs, tasklist, hints, routes et odomètre, gèle les véhicules, efface le chrono et passe à l'état terminé (isFinished). Les objectifs restent évaluables. | 235 |
| `gameplay_freeformDelivery_freeformDelivery.getCurrentDelivery()` | Renvoie la table de la livraison courante (données du loader, plus elapsedTime après finish). | 174 |
| `gameplay_freeformDelivery_freeformDelivery.getFailReason()` | Renvoie la raison de l'échec transmise à finish. | 112 |
| `gameplay_freeformDelivery_freeformDelivery.getProgress()` | Renvoie l'avancement des objectifs (gameplay_freeformDelivery_goals.getProgress) quand la livraison est active ou terminée. | 296 |
| `gameplay_freeformDelivery_freeformDelivery.getResults()` | Renvoie les statistiques de fin (gameplay_freeformDelivery_endScreen.collectStatistics) quand la livraison est active ou terminée et a démarré. | 305 |
| `gameplay_freeformDelivery_freeformDelivery.getSetupPending()` | Indique si le setup asynchrone est encore en cours. | 183 |
| `gameplay_freeformDelivery_freeformDelivery.getStartTime()` | Renvoie l'instant de démarrage (os.clock()), 0 si pas démarrée. | 178 |
| `gameplay_freeformDelivery_freeformDelivery.isActive()` | Indique si la livraison est en cours (objectifs et chrono actifs). Utilisé par quickAccess. | 97 |
| `gameplay_freeformDelivery_freeformDelivery.isFailed()` | Indique si la livraison s'est terminée par un échec. | 107 |
| `gameplay_freeformDelivery_freeformDelivery.isFinished()` | Indique si la livraison est terminée (réussie ou échouée) mais pas encore démantelée. | 102 |
| `gameplay_freeformDelivery_freeformDelivery.isLoaded()` | Indique si le chargement et le setup sont terminés (prêt à démarrer). | 170 |
| `gameplay_freeformDelivery_freeformDelivery.load(path)` | Charge une livraison : lit le fichier via gameplay_freeformDelivery_loader.load, installe véhicules et joueur (setup), prépare routes, odomètre et vehicleSleep, bloque des actions et appelle le basculement de la fenêtre de debug. Le setup se termine plus tard (voir isLoaded). | 117 |
| `gameplay_freeformDelivery_freeformDelivery.onBeforeRadialOpened()` | Hook : à l'ouverture du menu radial, enregistre les entrées quickAccess de la livraison (terminer, itinéraires). *(interne)* *(hook)* | 505 |
| `gameplay_freeformDelivery_freeformDelivery.onClientEndMission()` | Hook : fin de niveau ; appelle teardown(). *(interne)* *(hook)* | 674 |
| `gameplay_freeformDelivery_freeformDelivery.onExtensionUnloaded()` | Hook : déchargement de l'extension ; appelle teardown(). *(interne)* *(hook)* | 670 |
| `gameplay_freeformDelivery_freeformDelivery.onQuickAccessLoaded()` | Hook : quickAccess rechargé ; autorise un nouvel enregistrement des entrées. *(interne)* *(hook)* | 509 |
| `gameplay_freeformDelivery_freeformDelivery.onUpdate(dtReal, dtSim, dtRaw)` | Appelé à chaque frame : surveille la fin du setup (et son délai de 20 s), puis si la livraison est active met à jour le cache des véhicules, les objectifs, marqueurs, tasklist, hints, routes, odomètre et vehicleSleep, affiche le chrono via ui_apps_genericMissionData et termine la livraison quand le minuteur d'achèvement des objectifs expire. *(interne)* *(hook)* | 538 |
| `gameplay_freeformDelivery_freeformDelivery.reset()` | Remet une livraison active ou terminée à l'état chargé : nettoie tous les sous-modules, dégèle les véhicules, restaure leurs positions et refait le placement du joueur. Il faut rappeler start() ensuite. | 315 |
| `gameplay_freeformDelivery_freeformDelivery.start()` | Démarre la livraison chargée : reconfigure routes, odomètre et vehicleSleep, puis active objectifs, marqueurs, tasklist et hints, et lance le chronomètre. Exige que isLoaded soit vrai et que la livraison ne soit pas déjà active. | 187 |
| `gameplay_freeformDelivery_freeformDelivery.teardown(keepVehicles)` | Démantèle complètement la livraison : débloque les actions, nettoie les sous-modules, dégèle puis supprime les véhicules et le prefab (sauf keepVehicles), vide les POI bruts, retire le menu quickAccess et remet tous les états à zéro. Sans effet si rien n'est chargé. | 624 |

### Détail des paramètres

#### `gameplay_freeformDelivery_freeformDelivery.finish(failed, reason)`

Termine la livraison active (réussie ou échouée) : enregistre le temps écoulé dans currentDelivery.elapsedTime, masque marqueurs, tasklist, hints, routes et odomètre, gèle les véhicules, efface le chrono et passe à l'état terminé (isFinished). Les objectifs restent évaluables.

- `failed` (*boolean|nil*) : true si la livraison est un échec.
- `reason` (*string|nil*) : Raison de l'échec, conservée dans getFailReason.
- **renvoie** : boolean true si terminée, false s'il n'y avait pas de livraison active.

#### `gameplay_freeformDelivery_freeformDelivery.getCurrentDelivery()`

Renvoie la table de la livraison courante (données du loader, plus elapsedTime après finish).

- **renvoie** : table|nil Livraison, nil si aucune.

#### `gameplay_freeformDelivery_freeformDelivery.getFailReason()`

Renvoie la raison de l'échec transmise à finish.

- **renvoie** : string|nil Raison, nil sinon.

#### `gameplay_freeformDelivery_freeformDelivery.getProgress()`

Renvoie l'avancement des objectifs (gameplay_freeformDelivery_goals.getProgress) quand la livraison est active ou terminée.

- **renvoie** : table|nil {total, completed, required, requiredCompleted, allRequiredComplete}, nil si seulement chargée.

#### `gameplay_freeformDelivery_freeformDelivery.getResults()`

Renvoie les statistiques de fin (gameplay_freeformDelivery_endScreen.collectStatistics) quand la livraison est active ou terminée et a démarré.

- **renvoie** : table|nil Statistiques (temps, objectifs, dégâts) ou nil.

#### `gameplay_freeformDelivery_freeformDelivery.getSetupPending()`

Indique si le setup asynchrone est encore en cours.

- **renvoie** : boolean true tant que le setup n'est pas terminé.

#### `gameplay_freeformDelivery_freeformDelivery.getStartTime()`

Renvoie l'instant de démarrage (os.clock()), 0 si pas démarrée.

- **renvoie** : number Instant en secondes.

#### `gameplay_freeformDelivery_freeformDelivery.isActive()`

Indique si la livraison est en cours (objectifs et chrono actifs). Utilisé par quickAccess.

- **renvoie** : boolean true si active.

#### `gameplay_freeformDelivery_freeformDelivery.isFailed()`

Indique si la livraison s'est terminée par un échec.

- **renvoie** : boolean true si échec.

#### `gameplay_freeformDelivery_freeformDelivery.isFinished()`

Indique si la livraison est terminée (réussie ou échouée) mais pas encore démantelée.

- **renvoie** : boolean true si terminée.

#### `gameplay_freeformDelivery_freeformDelivery.isLoaded()`

Indique si le chargement et le setup sont terminés (prêt à démarrer).

- **renvoie** : boolean true si prêt.

#### `gameplay_freeformDelivery_freeformDelivery.load(path)`

Charge une livraison : lit le fichier via gameplay_freeformDelivery_loader.load, installe véhicules et joueur (setup), prépare routes, odomètre et vehicleSleep, bloque des actions et appelle le basculement de la fenêtre de debug. Le setup se termine plus tard (voir isLoaded).

- `path` (*string*) : Chemin du fichier delivery.delivery.json.
- **renvoie** : boolean true si le chargement a démarré, false si une livraison est déjà en place ou si le fichier/setup a échoué.

#### `gameplay_freeformDelivery_freeformDelivery.onUpdate(dtReal, dtSim, dtRaw)`

Appelé à chaque frame : surveille la fin du setup (et son délai de 20 s), puis si la livraison est active met à jour le cache des véhicules, les objectifs, marqueurs, tasklist, hints, routes, odomètre et vehicleSleep, affiche le chrono via ui_apps_genericMissionData et termine la livraison quand le minuteur d'achèvement des objectifs expire.

- `dtReal` (*number*) : Delta temps réel.
- `dtSim` (*number*) : Delta temps simulé.
- `dtRaw` (*number*) : Delta temps brut.

#### `gameplay_freeformDelivery_freeformDelivery.reset()`

Remet une livraison active ou terminée à l'état chargé : nettoie tous les sous-modules, dégèle les véhicules, restaure leurs positions et refait le placement du joueur. Il faut rappeler start() ensuite.

- **renvoie** : boolean true si réinitialisée, false s'il n'y a rien à réinitialiser.

#### `gameplay_freeformDelivery_freeformDelivery.start()`

Démarre la livraison chargée : reconfigure routes, odomètre et vehicleSleep, puis active objectifs, marqueurs, tasklist et hints, et lance le chronomètre. Exige que isLoaded soit vrai et que la livraison ne soit pas déjà active.

- **renvoie** : boolean true si démarrée.

#### `gameplay_freeformDelivery_freeformDelivery.teardown(keepVehicles)`

Démantèle complètement la livraison : débloque les actions, nettoie les sous-modules, dégèle puis supprime les véhicules et le prefab (sauf keepVehicles), vide les POI bruts, retire le menu quickAccess et remet tous les états à zéro. Sans effet si rien n'est chargé.

- `keepVehicles` (*boolean|nil*) : true pour conserver les véhicules spawnés (faux par défaut).

## Champs

| Champ | Type | Description |
|---|---|---|
| `debug` | table | Configuration de debug lue par les sous-modules : {enabled = false, targetAreas = {location, zone, parkingSpot = true}, p = nil (LuaProfiler)}. |
| `dependencies` | string[] | Extensions chargées avant : core_vehicles, core_gamestate, gameplay_sites_sitesManager, core_flowgraphManager, core_quickAccess, gameplay_freeformDelivery_{utils, loader, setup, goals, tasklist, markers, endScreen, hints, routes, debug, odometer, vehicleSleep}, core_groundMarkers, core_input_actionFilter, ui_apps_genericMissionData. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGameplayActivityAborted`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua`.*
