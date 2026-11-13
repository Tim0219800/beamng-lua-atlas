# `scenario_quickRace`

*Fichier : `lua/ge/extensions/scenario/quickRace.lua` · VM : Game Engine (GE) · 410 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_quickRace` : `extensions.load("scenario_quickRace")`, puis la globale `scenario_quickRace`

Logique d'une course rapide (quickrace) : charge les prefabs et le flowgraph de la piste, crée le véhicule du joueur à la position de départ, convertit le chemin de course (fichier raceFile) en noeuds et configuration de tour (lapConfig) pour le système de scénario, puis enregistre les temps et les highscores. Elle ne s'active que pour les scénarios fabriqués par scenario_quickRaceLoader (scenario.isQuickRace).

## Remarques

- Les hooks onRaceWaypointReached et onRaceResult sortent immédiatement si le scénario courant n'a pas isQuickRace.
- M.addCheckPoint et M.loadCheckpoints sont exportés mais valent nil (variables locales jamais définies) : à ne pas utiliser.
- Dans onRaceWaypointReached, le temps de chaque tour est obtenu en retranchant les temps cumulés précédents ; les highscores du tour seul utilisent la clé getConfigKey(false, nil, 0).
- Dans onRaceWaypointReached, la boucle qui incrémente scenario.highscores.singleRound utilise l'index k au lieu de v : comportement douteux.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_quickRace.changeTimeTrialConfig()` | Bascule l'écran de configuration quickrace en cours de course : ouvre le menu 'menu.quickrace' en mettant la simulation en pause, ou ferme et reprend (simTimeAuthority.pause). | 365 |
| `scenario_quickRace.getConfigKey(rolling, reverse, laps)` | Construit la clé de configuration utilisée pour les highscores : 'standing' ou 'rolling', suffixe 'Reverse' si reverse, puis le nombre de tours. Les arguments nil se rabattent sur scenario.rollingStart, scenario.isReverse et scenario.lapCount. | 238 |
| `scenario_quickRace.getNodesOnBranch(segment, config)` | Parcourt récursivement les segments d'un chemin de course et renvoie la liste des noms de noeuds générés (_generatedName) ; aux embranchements, ajoute une sous-liste de marqueurs '__b<id>' et remplit config.branches. *(interne)* | 67 |
| `scenario_quickRace.getVehicleBrand(scenario)` | Renvoie la marque du véhicule du scénario (scenario.vehicle.file.Brand). | 310 |
| `scenario_quickRace.getVehicleName(scenario)` | Renvoie le nom du véhicule du scénario (scenario.vehicle.file.Name). | 314 |
| `scenario_quickRace.loadVehicle(scenario)` | Crée le véhicule du joueur (scenario.vehicle) nommé 'scenario_player0' avec core_vehicles.spawnNewVehicle, à la position de départ calculée (startTransform du raceFile, ou à défaut la spawnSphere standing/rolling[/Reverse] de la piste), puis l'ajoute au groupe ScenarioObjectsGroup. Si la spawnSphere est introuvable, utilise 0/0/0 avec une erreur dans le log. | 167 |
| `scenario_quickRace.onClientEndMission()` | Hook de fin de mission : arrête et supprime le flowgraph de la piste s'il existe. *(interne)* *(hook)* | 140 |
| `scenario_quickRace.onCountdownEnded()` | Hook appelé par l'UI à la fin du compte à rebours : dégèle le véhicule joueur (controller.setFreeze(0)) et vide la liste des temps. *(interne)* *(hook)* | 227 |
| `scenario_quickRace.onCustomWaypoints(sc)` | Hook appelé par le chargeur de scénario. Inverse le chemin si track.reverse, lance path:autoConfig(), génère sc.generatedNodes (noeuds nommés '__generated_from_path__<id>' avec pos, radius, rot), sc.startTimerCheckpoint, sc.lapConfig, sc.initialLapConfig, et éventuellement sc.BranchLapConfig et sc.lapConfigBranches, puis les fusionne dans sc.nodes. *(interne)* *(hook)* | 89 |
| `scenario_quickRace.onLoadCustomPrefabs(sc)` | Hook appelé par le chargeur de scénario. Si la piste (sc.track) définit un flowgraph, le charge et le lance en mode transitoire ; si elle définit raceFile, lit le JSON, construit un gameplay/race/path dans sc.path et calcule sc.track.startTransform selon rollingStart et reverse. Termine par loadVehicle(sc). *(interne)* *(hook)* | 17 |
| `scenario_quickRace.onRaceResult(final)` | Hook appelé à la fin de la course. Enregistre le temps final (final.finalTime en secondes, converti en ms) dans les highscores, remplit scenario.highscores (scores, place, singleScores) et scenario.detailedRecord pour l'écran de résultats. *(interne)* *(hook)* | 318 |
| `scenario_quickRace.onRaceWaypointReached(wpInfo)` | Hook appelé par le système de course à chaque waypoint. Au dernier waypoint (ou retour au premier), calcule le temps du tour, l'enregistre dans les highscores (core_highscores.setScenarioHighscoresCustom) et met à jour scenario.highscores.singleRound. *(interne)* *(hook)* | 260 |
| `scenario_quickRace.onScenarioLoaded(sc)` | Hook appelé quand le scénario est chargé. Allume les antibrouillards et les feux du véhicule joueur si track.tod vaut 0, 1 ou 8 (nuit), et inverse la direction (rot) des noeuds si track.reverse. *(interne)* *(hook)* | 148 |
| `scenario_quickRace.onUiChangedState(curUIState, prevUIState)` | Hook appelé quand l'état de l'UI change : si on revient de 'menu.quickrace' vers 'menu' alors que timeTrialOpen est vrai, referme la configuration. *(interne)* *(hook)* | 381 |

### Détail des paramètres

#### `scenario_quickRace.getConfigKey(rolling, reverse, laps)`

Construit la clé de configuration utilisée pour les highscores : 'standing' ou 'rolling', suffixe 'Reverse' si reverse, puis le nombre de tours. Les arguments nil se rabattent sur scenario.rollingStart, scenario.isReverse et scenario.lapCount.

- `rolling` (*boolean|nil*) : Départ lancé.
- `reverse` (*boolean|nil*) : Sens inverse.
- `laps` (*integer|nil*) : Nombre de tours.
- **renvoie** : string Par exemple 'rollingReverse3'.

#### `scenario_quickRace.getNodesOnBranch(segment, config)`

Parcourt récursivement les segments d'un chemin de course et renvoie la liste des noms de noeuds générés (_generatedName) ; aux embranchements, ajoute une sous-liste de marqueurs '__b<id>' et remplit config.branches.

- `segment` (*table*) : Segment de départ (objet de path.segments).
- `config` (*table*) : Table de configuration modifiée : reçoit config.branches.
- **renvoie** : table Liste ordonnée de noms de noeuds (pouvant contenir des sous-listes pour les embranchements).

#### `scenario_quickRace.getVehicleBrand(scenario)`

Renvoie la marque du véhicule du scénario (scenario.vehicle.file.Brand).

- `scenario` (*table*) : Scénario quickrace.
- **renvoie** : string Marque.

#### `scenario_quickRace.getVehicleName(scenario)`

Renvoie le nom du véhicule du scénario (scenario.vehicle.file.Name).

- `scenario` (*table*) : Scénario quickrace.
- **renvoie** : string Nom.

#### `scenario_quickRace.loadVehicle(scenario)`

Crée le véhicule du joueur (scenario.vehicle) nommé 'scenario_player0' avec core_vehicles.spawnNewVehicle, à la position de départ calculée (startTransform du raceFile, ou à défaut la spawnSphere standing/rolling[/Reverse] de la piste), puis l'ajoute au groupe ScenarioObjectsGroup. Si la spawnSphere est introuvable, utilise 0/0/0 avec une erreur dans le log.

- `scenario` (*table*) : Scénario quickrace (scenario.vehicle, scenario.track).

#### `scenario_quickRace.onCustomWaypoints(sc)`

Hook appelé par le chargeur de scénario. Inverse le chemin si track.reverse, lance path:autoConfig(), génère sc.generatedNodes (noeuds nommés '__generated_from_path__<id>' avec pos, radius, rot), sc.startTimerCheckpoint, sc.lapConfig, sc.initialLapConfig, et éventuellement sc.BranchLapConfig et sc.lapConfigBranches, puis les fusionne dans sc.nodes.

- `sc` (*table*) : Scénario quickrace.

#### `scenario_quickRace.onLoadCustomPrefabs(sc)`

Hook appelé par le chargeur de scénario. Si la piste (sc.track) définit un flowgraph, le charge et le lance en mode transitoire ; si elle définit raceFile, lit le JSON, construit un gameplay/race/path dans sc.path et calcule sc.track.startTransform selon rollingStart et reverse. Termine par loadVehicle(sc).

- `sc` (*table*) : Scénario quickrace (sc.track, sc.vehicle).

#### `scenario_quickRace.onRaceResult(final)`

Hook appelé à la fin de la course. Enregistre le temps final (final.finalTime en secondes, converti en ms) dans les highscores, remplit scenario.highscores (scores, place, singleScores) et scenario.detailedRecord pour l'écran de résultats.

- `final` (*table*) : Résultat final, avec finalTime en secondes.

#### `scenario_quickRace.onRaceWaypointReached(wpInfo)`

Hook appelé par le système de course à chaque waypoint. Au dernier waypoint (ou retour au premier), calcule le temps du tour, l'enregistre dans les highscores (core_highscores.setScenarioHighscoresCustom) et met à jour scenario.highscores.singleRound.

- `wpInfo` (*table*) : Informations de waypoint : next, time (temps cumulé).

#### `scenario_quickRace.onScenarioLoaded(sc)`

Hook appelé quand le scénario est chargé. Allume les antibrouillards et les feux du véhicule joueur si track.tod vaut 0, 1 ou 8 (nuit), et inverse la direction (rot) des noeuds si track.reverse.

- `sc` (*table*) : Scénario quickrace.

#### `scenario_quickRace.onUiChangedState(curUIState, prevUIState)`

Hook appelé quand l'état de l'UI change : si on revient de 'menu.quickrace' vers 'menu' alors que timeTrialOpen est vrai, referme la configuration.

- `curUIState` (*string*) : Nouvel état de l'UI.
- `prevUIState` (*string*) : État précédent.

## Champs

| Champ | Type | Description |
|---|---|---|
| `addCheckPoint` | any |  ⚠ référence `addCheckPoint` non définie dans le fichier (vaut probablement nil) |
| `loadCheckpoints` | any |  ⚠ référence `loadCheckpoints` non définie dans le fichier (vaut probablement nil) |

**Évènements UI (guihooks.trigger) :** `MenuItemNavigation`

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/quickRace.lua`.*
