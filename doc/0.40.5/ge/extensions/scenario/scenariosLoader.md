# `scenario_scenariosLoader`

*Fichier : `lua/ge/extensions/scenario/scenariosLoader.lua` · VM : Game Engine (GE) · 640 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_scenariosLoader` : `extensions.load("scenario_scenariosLoader")`, puis la globale `scenario_scenariosLoader`

Charge et normalise les fichiers de scénario (.json dans levels/<niveau>/scenarios/), les listes pour l'UI et les démarre. processScenarioData complète la table lue du JSON avec des valeurs par défaut (véhicules, extensions, prefabs, aperçus, nombre de joueurs, lapConfig, listes d'actions autorisées/interdites, tentatives). start() décharge le niveau courant si besoin, charge les extensions de scénario (scenario_scenarios, scenario_waypoints, statistics_statistics, scenario_raceUI, scenario_raceGoals) et appelle scenario_scenarios.executeScenario, ou lance un flowgraph. Un moddeur l'utilise pour lister (getList) ou lancer (startByPath, load) un scénario.

## Exemple

```lua
-- lancer un scénario par son chemin (extension .json ajoutée si absente)
scenario_scenariosLoader.startByPath('/levels/gridmap_v2/scenarios/monscenario.json')
-- lister
for _, sc in ipairs(scenario_scenariosLoader.getList()) do print(sc.name, sc.levelName) end
```

## Remarques

- Dépend de core_levels (M.dependencies). Chargée au démarrage du jeu (liste startupExtensions de main.lua).
- Format du fichier : le JSON d'un scénario est un tableau d'un seul élément ; loadScenario ignore les fichiers dont le tableau n'a pas exactement 1 élément.
- Valeurs par défaut posées par processScenarioData : vehicles = {scenario_player0 = {playerUsable=true, startFocus=true}, ['*'] = {playerUsable=false}} ; difficulty 'easy' ; introType 'htmlOnly' ; extensions += {name = scenarioName, optional = true} ; playersCountRange {min>=1, max>=min} ; lapCount 1 ; radiusMultiplierAI 1 ; extraTime 0 ; whiteListActions += 'default_whitelist_scenario' ; blackListActions += 'default_blacklist_scenario' ; BranchLapConfig = lapConfig ; lapConfig = seules les chaînes de BranchLapConfig ; initialLapConfig = copie ; attemptsInfo complété (allowedAttempts 0, delayPerAttempt 1, attemptNumber 0...).
- Déductions faites à partir du chemin : levelName (dossier avant /scenarios/), scenarioName (nom du fichier), directory, mission (fichier principal du niveau, sinon .mis, sinon dossier du niveau), startHTML (<scenarioName>.html s'il existe), previews (<scenarioName>*.jpg du dossier), prefabs (prefabs du dossier du scénario ou du niveau dont le nom contient scenarioName ou est listé dans prefabs), map (titre de levels/<niveau>/info.json).
- Le réglage restrictScenarios (vrai par défaut) conserve les listes noires d'actions ; s'il est faux, whiteListActions est vidée et blackListActions ne bloque plus que vehicleTeleporting. Forcé à vrai en build shipping si une campagne est active.
- getList : parcourt les dossiers scenarios/ de tous les niveaux et flowgraphEditor/scenarios/, puis les flowgraphs *.flow.json avec isScenario, puis les missions marquées isAvailableAsScenario (sauf skipMissions). En build shipping les scénarios restrictToCampaign sont masqués sauf includeAll. Lit les fichiers avec des systemYield : à appeler depuis un job.
- start(sc) : si un niveau est chargé (scenetree.MissionGroup existe), il appelle endActiveGameMode puis se relance après un délai de 3 frames. Pour un scénario flowgraph (sc.flowgraph) : charge le manager, applique sc.variables, unloadAutoExtensions + loadPresetExtensions, émet onFlowgraphScenarioStarted(sc) et lance le manager (qui s'arrête à la fin du niveau). Pour un scénario classique : unloadAutoExtensions, loadPresetExtensions, charge M.scenarioModules puis scenario_scenarios.executeScenario(sc). Renvoie true seulement dans le cas d'erreur de flowgraph introuvable.
- Bug/incohérence : reloadScenarioSourcefile (rechargement automatique quand le fichier source change) teste « scenarios and ... » où scenarios est une globale inexistante (nil) à cet endroit (la variable locale du même nom est déclarée plus bas) : la fonction retourne immédiatement et onFileChanged ne recharge donc jamais le scénario. En outre elle logue toujours l'erreur « Unable to reload scenario » même après un start réussi (pas de return).
- Bug/incohérence : processScenarioData lit scenarioData.levelName pour info.json même si scenarioFilename est nil ; ok pour getScenarioDataForMission qui fournit levelName, mais pas pour un flowgraph sans nom de niveau (tmp = '/levels/nil/info.json').
- Champs exportés non documentés : M.dependencies, M.scenarioModules (liste des extensions chargées par start), M.prefabCache (cache par niveau des prefabs trouvés), M.processedScenarioCache (table jamais remplie dans ce fichier).

**Dépendances (chargées avant) :** `core_levels`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_scenariosLoader.getLevels(subdirectory, levelList)` | Liste les niveaux contenant un sous-dossier de scénarios (cas des routes de bus) avec, pour chaque ligne de bus (*.buslines.json), une copie du premier scénario du niveau adaptée à la route (nom, aperçu, véhicule, point de départ, busdriver.routeID, variance, strictStop=true, traffic=false). | 552 |
| `scenario_scenariosLoader.getList(subdirectory, includeAll, skipMissions)` | Liste tous les scénarios disponibles : fichiers .json des niveaux, flowgraphs isScenario, et missions disponibles comme scénarios. Sert à l'UI et à techCore. | 326 |
| `scenario_scenariosLoader.getScenarioDataForMission(m)` | Transforme une mission (gameplay_missions) en scénario utilisable par l'UI (flowgraph loadMissionAsScenario.flow.json, variables level et missionId, previews, auteur, difficulté, infos de mod). | 283 |
| `scenario_scenariosLoader.load(name)` | Cherche dans getList() les scénarios dont name == name et démarre chacun (pas de break). | 515 |
| `scenario_scenariosLoader.loadScenario(scenarioPath, key)` | Lit un fichier de scénario (JSON, tableau à 1 élément) et le passe à processScenarioData. Logue une erreur si le fichier est introuvable. | 261 |
| `scenario_scenariosLoader.onFileChanged(filename, type)` | Hook (émis par main.lua pour chaque fichier modifié) : censé recharger le scénario si son fichier source change (inopérant, voir notes). *(interne)* *(hook)* | 506 |
| `scenario_scenariosLoader.processScenarioData(scenarioKey, scenarioData, scenarioFilename)` | Complète et normalise une table de scénario (voir notes) : déduit levelName, scenarioName, directory, mission, previews, prefabs, métadonnées de mod, applique les valeurs par défaut et renvoie la même table. | 39 |
| `scenario_scenariosLoader.start(sc)` | Appelée quand l'utilisateur choisit un scénario dans l'UI : arrête la campagne, décharge le niveau en cours si besoin, puis lance le scénario (classique ou flowgraph). | 426 |
| `scenario_scenariosLoader.startByPath(path)` | Charge puis démarre le scénario d'un fichier (ajoute .json si absent). | 470 |

### Détail des paramètres

#### `scenario_scenariosLoader.getLevels(subdirectory, levelList)`

Liste les niveaux contenant un sous-dossier de scénarios (cas des routes de bus) avec, pour chaque ligne de bus (*.buslines.json), une copie du premier scénario du niveau adaptée à la route (nom, aperçu, véhicule, point de départ, busdriver.routeID, variance, strictStop=true, traffic=false).

- `subdirectory` (*string*) : sous-dossier dans scenarios/ (ex. 'busdriver')
- `levelList` (*table<integer, string>|nil*) : niveaux à parcourir (tous par défaut)
- **renvoie** : table<integer, table> niveaux {levelName, levelInfo, official, previews, scenarios}

#### `scenario_scenariosLoader.getList(subdirectory, includeAll, skipMissions)`

Liste tous les scénarios disponibles : fichiers .json des niveaux, flowgraphs isScenario, et missions disponibles comme scénarios. Sert à l'UI et à techCore.

- `subdirectory` (*string|nil*) : sous-dossier de scenarios/ à restreindre
- `includeAll` (*boolean|nil*) : inclure aussi les scénarios restreints à la campagne et toutes les missions
- `skipMissions` (*boolean|nil*) : ne pas ajouter les missions
- **renvoie** : table<integer, table> scénarios

#### `scenario_scenariosLoader.getScenarioDataForMission(m)`

Transforme une mission (gameplay_missions) en scénario utilisable par l'UI (flowgraph loadMissionAsScenario.flow.json, variables level et missionId, previews, auteur, difficulté, infos de mod).

- `m` (*table*) : mission
- **renvoie** : table scénario normalisé

#### `scenario_scenariosLoader.load(name)`

Cherche dans getList() les scénarios dont name == name et démarre chacun (pas de break).

- `name` (*string*) : nom du scénario

#### `scenario_scenariosLoader.loadScenario(scenarioPath, key)`

Lit un fichier de scénario (JSON, tableau à 1 élément) et le passe à processScenarioData. Logue une erreur si le fichier est introuvable.

- `scenarioPath` (*string*) : chemin du fichier
- `key` (*any*) : clé de scénario (facultatif)
- **renvoie** : table|nil scénario normalisé

#### `scenario_scenariosLoader.onFileChanged(filename, type)`

Hook (émis par main.lua pour chaque fichier modifié) : censé recharger le scénario si son fichier source change (inopérant, voir notes).

- `filename` (*string*) : fichier modifié
- `type` (*string*) : type de changement

#### `scenario_scenariosLoader.processScenarioData(scenarioKey, scenarioData, scenarioFilename)`

Complète et normalise une table de scénario (voir notes) : déduit levelName, scenarioName, directory, mission, previews, prefabs, métadonnées de mod, applique les valeurs par défaut et renvoie la même table.

- `scenarioKey` (*any*) : clé mémorisée dans scenarioData.scenarioKey (nil possible)
- `scenarioData` (*table*) : scénario brut (modifié en place)
- `scenarioFilename` (*string|nil*) : chemin du .json ; nil pour un scénario créé depuis une mission
- **renvoie** : table scénario normalisé

#### `scenario_scenariosLoader.start(sc)`

Appelée quand l'utilisateur choisit un scénario dans l'UI : arrête la campagne, décharge le niveau en cours si besoin, puis lance le scénario (classique ou flowgraph).

- `sc` (*table*) : scénario normalisé
- **renvoie** : boolean|nil true si le flowgraph est introuvable

#### `scenario_scenariosLoader.startByPath(path)`

Charge puis démarre le scénario d'un fichier (ajoute .json si absent).

- `path` (*string*) : chemin du scénario
- **renvoie** : boolean false si le fichier n'existe pas, sinon true

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {'core_levels'} |
| `prefabCache` | table | Cache [cheminDuNiveau][dossier][nomMinuscule] = chemin du prefab, rempli par buildPrefabCache. |
| `processedScenarioCache` | table | Table vide, jamais utilisée dans ce fichier. |
| `scenarioModules` | table<integer, string> | Extensions chargées par start() : scenario_scenarios, scenario_waypoints, statistics_statistics, scenario_raceUI, scenario_raceGoals. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onFlowgraphScenarioStarted` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/scenariosLoader.lua`.*
