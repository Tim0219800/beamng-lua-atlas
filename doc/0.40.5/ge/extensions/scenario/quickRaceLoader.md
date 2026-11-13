# `scenario_quickRaceLoader`

*Fichier : `lua/ge/extensions/scenario/quickRaceLoader.lua` · VM : Game Engine (GE) · 614 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_quickRaceLoader` : `extensions.load("scenario_quickRaceLoader")`, puis la globale `scenario_quickRaceLoader`

Chargeur des courses rapides (quickrace). Il parcourt les niveaux (levels/<niveau>/quickrace/*.json, fichiers .race.json compris) et les pistes du Track Editor (dossier trackEditor/ des documents utilisateur), fabrique la liste des niveaux et pistes affichée par l'écran de sélection, puis transforme un choix (piste, véhicule, type de course) en scénario via scenario_scenariosLoader.processScenarioData et le lance. Un moddeur de piste de quickrace s'en sert indirectement : ses fichiers sont lus par getTracks.

## Exemple

```lua
-- lister les niveaux ayant des quickraces et leurs pistes
local levels = scenario_quickRaceLoader.getQuickraceList()
for _, lvl in ipairs(levels) do
  for _, t in ipairs(lvl.tracks) do log('I', 'x', lvl.levelName .. ' / ' .. t.name) end
end
```

## Remarques

- Un fichier de piste est un JSON lu par getTracks. Champs utilisés : name, difficulty, closed (sinon lapCount forcé à 1), lapCount, defaultLaps (avec raceFile), reversible, allowRollingStart, tod (indice 0 à 9 vers une heure du jour, défaut 3), lapConfig, startLineCheckpoint, finishLineCheckpoint, spawnSpheres {standing, standingReverse, rolling, rollingReverse} (défaut <trackName>_standing_spawn etc.), prefabs / reversePrefabs / forwardPrefabs, luaFile (relatif à levels/<niveau>/quickrace/), startHTML (défaut quickrace/<trackName>.html), introType (défaut 'htmlOnly', 'none' sans HTML), procedural, flowgraph, classification {closed, allowRollingStart, reversible}.
- Un fichier dont l'extension est 'race.json' est traité comme piste basée sur un chemin de course (raceFile = ce fichier).
- Les prefabs <trackName>.prefab[.json], <trackName>_reverse.prefab[.json] et <trackName>_forward.prefab[.json] du dossier quickrace/ sont ajoutés automatiquement s'ils existent.
- Les images de prévisualisation sont <trackName>.jpg et <trackName>_reverse.jpg dans le dossier de la piste.
- Le niveau 'driver_training' ne liste que les pistes procédurales, tous les autres niveaux que les pistes non procédurales. Le niveau 'smallgrid' est renommé « Track Editor Tracks ».
- Les pistes Track Editor : un fichier trackEditor/<nom>.json doit avoir un champ version, sinon il est ignoré avec un message (ancien format). Elles sont rattachées au niveau trackData.level (défaut 'smallgrid').
- loadQuickrace : inverse lapConfig si trackFile.reverse (et échange les checkpoints de départ et d'arrivée si la piste n'est pas fermée), ajoute finishLineCheckpoint en fin de lapConfig, fixe isQuickRace = true et l'heure du jour d'après le tableau tod, sauf si levelInfo.disableQuickraceTimeOfDay.
- loadQuickrace modifie les tables passées (scenarioFile, trackFile) en place.
- Code mort : mimicProcTracks et getCustomTracks ne sont pas exportées. Dans loadQuickrace, scenarioFile.isReverse = false est écrit deux fois.
- getLevel recalcule toute la liste des niveaux à chaque appel (coûteux), et getLevelTrack en dépend.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_quickRaceLoader.customPreviewLoader(levelInfo, levelName)` | Détermine les images d'aperçu d'un niveau : levelInfo.previews préfixés par le dossier du niveau, sinon les fichiers <niveau>_preview*.png puis .jpg à la racine du niveau. Écrit levelInfo.directory et levelInfo.previews. | 189 |
| `scenario_quickRaceLoader.getLevel(levelName)` | Retrouve un niveau de la liste des quickraces par son nom de dossier ou son titre. | 162 |
| `scenario_quickRaceLoader.getLevelList()` | Renvoie la liste des noms de niveaux (dossiers de levels/ contenant info.json). | 17 |
| `scenario_quickRaceLoader.getLevelTrack(levelName, trackName)` | Retrouve une piste d'un niveau par son nom. | 175 |
| `scenario_quickRaceLoader.getQuickraceList(levelList)` | Construit la liste des niveaux qui contiennent des quickraces (fichiers JSON de levels/<niveau>/quickrace/ ou pistes Track Editor). Chaque entrée décrit un pseudo-scénario pour l'UI : levelName, levelInfo, name, previews, tracks, trackCount, vehicles (scenario_player0 joueur), playersCountRange, etc. | 49 |
| `scenario_quickRaceLoader.getTrackEditorTracks()` | Lit les fichiers trackEditor/*.json de l'utilisateur et crée une piste quickrace pour chacun (nom, auteur, difficulté 37 par défaut, lapCount selon connected/defaultLaps, aperçu jpg/png, spawnSpheres '_standing_spawn' etc., luaFile util/trackBuilder/quickraceSetup). | 233 |
| `scenario_quickRaceLoader.getTracks(quickraceFiles, levelName, lvlName)` | Analyse les fichiers quickrace d'un niveau et renvoie la liste des pistes complétées avec les valeurs par défaut (voir notes), triée par nom. | 339 |
| `scenario_quickRaceLoader.loadQuickrace(scenarioKey, scenarioFile, trackFile, vehicleFile, raceType)` | Transforme une piste et un véhicule choisis en scénario complet : renseigne scenarioFile (track, vehicle, name, lapCount, lapConfig, prefabs, startHTML, introType, isReverse, rollingStart, levelObjects.tod, isQuickRace, quickraceType) puis appelle scenario_scenariosLoader.processScenarioData. | 451 |
| `scenario_quickRaceLoader.loadTrackBuilderJSON(originalFilename)` | Lit le JSON d'une piste du Track Editor : trackEditor/<nom>.json. | 320 |
| `scenario_quickRaceLoader.startQuickrace(scenarioFile, trackFile, vehicleFile, raceType)` | Démarre une quickrace. Si un niveau est déjà chargé, décale le démarrage jusqu'à son déchargement. Sinon charge les extensions de quickRaceModules, le luaFile de la piste (et util/trackBuilder/splineTrack pour une piste Track Editor), construit le scénario avec loadQuickrace et appelle scenario_scenarios.executeScenario. | 551 |
| `scenario_quickRaceLoader.uiEventStartHotlapping()` | Appelé par l'UI (application hotlapping) : charge core_hotlapping à la demande si aucun scénario n'est en cours puis appelle core_hotlapping.startHotlapping(). *(interne)* | 581 |
| `scenario_quickRaceLoader.uiHotlappingAppDestroyed()` | Appelé par l'UI quand l'application hotlapping est détruite : décharge core_hotlapping si aucun scénario n'est en cours. *(interne)* | 593 |

### Détail des paramètres

#### `scenario_quickRaceLoader.customPreviewLoader(levelInfo, levelName)`

Détermine les images d'aperçu d'un niveau : levelInfo.previews préfixés par le dossier du niveau, sinon les fichiers <niveau>_preview*.png puis .jpg à la racine du niveau. Écrit levelInfo.directory et levelInfo.previews.

- `levelInfo` (*table*) : Entrée de niveau en cours de construction (doit avoir levelInfo.levelInfo).
- `levelName` (*string*) : Nom de dossier du niveau.
- **renvoie** : string[] Liste de chemins d'images (avertissement dans le log si vide).

#### `scenario_quickRaceLoader.getLevel(levelName)`

Retrouve un niveau de la liste des quickraces par son nom de dossier ou son titre.

- `levelName` (*string*) : Nom de dossier ou titre (levelInfo.title).
- **renvoie** : table|nil Entrée de niveau, ou nil.

#### `scenario_quickRaceLoader.getLevelList()`

Renvoie la liste des noms de niveaux (dossiers de levels/ contenant info.json).

- **renvoie** : string[] Noms de niveaux ; liste vide si le dossier levels/ n'existe pas.

#### `scenario_quickRaceLoader.getLevelTrack(levelName, trackName)`

Retrouve une piste d'un niveau par son nom.

- `levelName` (*string*) : Nom ou titre du niveau.
- `trackName` (*string*) : Champ name de la piste.
- **renvoie** : table|nil La piste, ou nil.

#### `scenario_quickRaceLoader.getQuickraceList(levelList)`

Construit la liste des niveaux qui contiennent des quickraces (fichiers JSON de levels/<niveau>/quickrace/ ou pistes Track Editor). Chaque entrée décrit un pseudo-scénario pour l'UI : levelName, levelInfo, name, previews, tracks, trackCount, vehicles (scenario_player0 joueur), playersCountRange, etc.

- `levelList` (*string[]|nil*) : Niveaux à examiner ; défaut getLevelList().
- **renvoie** : table[] Liste d'entrées de niveau avec au moins une piste.

#### `scenario_quickRaceLoader.getTrackEditorTracks()`

Lit les fichiers trackEditor/*.json de l'utilisateur et crée une piste quickrace pour chacun (nom, auteur, difficulté 37 par défaut, lapCount selon connected/defaultLaps, aperçu jpg/png, spawnSpheres '_standing_spawn' etc., luaFile util/trackBuilder/quickraceSetup).

- **renvoie** : table<string, table[]> Pistes regroupées par nom de niveau.

#### `scenario_quickRaceLoader.getTracks(quickraceFiles, levelName, lvlName)`

Analyse les fichiers quickrace d'un niveau et renvoie la liste des pistes complétées avec les valeurs par défaut (voir notes), triée par nom.

- `quickraceFiles` (*string[]*) : Chemins des fichiers JSON de quickrace.
- `levelName` (*string*) : Nom du dossier du niveau.
- `lvlName` (*string*) : Nom du niveau, utilisé pour détecter 'driver_training' (pistes procédurales).
- **renvoie** : table[] Pistes, avec trackName, directory, previews, spawnSpheres, official, etc.

#### `scenario_quickRaceLoader.loadQuickrace(scenarioKey, scenarioFile, trackFile, vehicleFile, raceType)`

Transforme une piste et un véhicule choisis en scénario complet : renseigne scenarioFile (track, vehicle, name, lapCount, lapConfig, prefabs, startHTML, introType, isReverse, rollingStart, levelObjects.tod, isQuickRace, quickraceType) puis appelle scenario_scenariosLoader.processScenarioData.

- `scenarioKey` (*string|nil*) : Clé du scénario (nil depuis startQuickrace).
- `scenarioFile` (*table*) : Entrée de niveau de getQuickraceList, modifiée en place.
- `trackFile` (*table*) : Piste choisie ; track.reverse, track.rollingStart et track.tod sont lus.
- `vehicleFile` (*table*) : Véhicule choisi (model, config, file...).
- `raceType` (*string*) : Type de course, stocké dans quickraceType (déduit du code).
- **renvoie** : table Scénario traité.

#### `scenario_quickRaceLoader.loadTrackBuilderJSON(originalFilename)`

Lit le JSON d'une piste du Track Editor : trackEditor/<nom>.json.

- `originalFilename` (*string*) : Nom de la piste sans dossier ni extension.
- **renvoie** : table|nil Contenu du JSON, ou nil (fichier absent ou illisible, message d'info dans le log).

#### `scenario_quickRaceLoader.startQuickrace(scenarioFile, trackFile, vehicleFile, raceType)`

Démarre une quickrace. Si un niveau est déjà chargé, décale le démarrage jusqu'à son déchargement. Sinon charge les extensions de quickRaceModules, le luaFile de la piste (et util/trackBuilder/splineTrack pour une piste Track Editor), construit le scénario avec loadQuickrace et appelle scenario_scenarios.executeScenario.

- `scenarioFile` (*table*) : Entrée de niveau.
- `trackFile` (*table*) : Piste choisie.
- `vehicleFile` (*table*) : Véhicule choisi.
- `raceType` (*string*) : Type de course.

## Champs

| Champ | Type | Description |
|---|---|---|
| `quickRaceModules` | string[] | Extensions chargées au démarrage d'une quickrace : scenario_scenarios, statistics_statistics, scenario_waypoints, scenario_quickRace, core_hotlapping. |

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/quickRaceLoader.lua`.*
