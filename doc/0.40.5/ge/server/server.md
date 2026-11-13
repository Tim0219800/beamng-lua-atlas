# `server`

*Fichier : `lua/ge/server/server.lua` · VM : Game Engine (GE) · 424 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `server`

Chargement et déchargement d'un niveau côté « serveur » du jeu (mode solo/freeroam). `createGame` ouvre l'écran de chargement puis exécute la séquence complète : datablocks et matériaux, création du monde physique, chargement des objets du niveau (dossier main/ JSON, ou ancien format .mis), décals, démarrage de la physique, création de la caméra et du joueur, puis fondu de sortie. `destroy` fait l'inverse. Les durées de chaque étape sont journalisées.

## Exemple

```lua
server.createGame('/levels/gridmap_v2/info.json')
-- ligne de commande : server.setLevelOffset(100, 0, 0) avant le chargement décale tout le niveau
```

## Remarques

- Bug : M.loadingProgress est copié à l'import du module alors que la variable locale est affectée plus tard (createGameActual) ; le champ exporté vaut donc toujours nil.
- Hooks émis : onClientCustomObjectSpawning (après chargement des objets), onPlayerCameraReady (après spawn du joueur), onLoadingScreenFadeout (fin du chargement). Évènement UI : MenuHide (fadeoutLoadingScreen avec skipStart).
- Ne pas retirer les VariableRegistry.set('$loadingLevel', ...) : utilisées côté C++.
- Si le niveau est introuvable ou qu'il n'y a pas de MissionGroup, createGameActual journalise une erreur et s'arrête sans fondu de sortie.
- Fonctions locales non exportées : endMission (nettoie MissionGroup, MissionCleanup, décals, audio…) et patchLoadingContext (applique le décalage de niveau).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `server.createGame(levelPath, customLoadingFunction)` | Charge un niveau. Demande l'écran de chargement à core_gamestate, puis exécute createGameActual (datablocks, matériaux, objets, physique, spawn caméra et joueur). Si customLoadingFunction est donné, le fondu de sortie est retardé : c'est à cette fonction d'appeler server.fadeoutLoadingScreen. | 405 |
| `server.destroy(p)` | Détruit la session : met $missionRunning à faux, termine le niveau (endMission), détruit le monde physique, supprime les datablocks et incrémente $Server::Session. | 376 |
| `server.fadeoutLoadingScreen(skipStart)` | Termine le chargement : demande la sortie de l'écran de chargement, appelle clientPostStartMission/clientStartMission (sauf si skipStart), coupe le chargement, émet onLoadingScreenFadeout et journalise la durée. Sans effet (avertissement) si aucun chargement n'est en cours. | 338 |
| `server.setLevelOffset(x, y, z)` | Définit un décalage global appliqué à la transformée de tuile du prochain niveau chargé. Appeler sans argument supprime le décalage ; avec des arguments incomplets, journalise une erreur. | 61 |

### Détail des paramètres

#### `server.createGame(levelPath, customLoadingFunction)`

Charge un niveau. Demande l'écran de chargement à core_gamestate, puis exécute createGameActual (datablocks, matériaux, objets, physique, spawn caméra et joueur). Si customLoadingFunction est donné, le fondu de sortie est retardé : c'est à cette fonction d'appeler server.fadeoutLoadingScreen.

- `levelPath` (*string*) : chemin du niveau (info.json, .mis ou dossier/nom de niveau ; mis en minuscules)
- `customLoadingFunction` (*function|nil*) : appelée à la place du fondu de sortie automatique

#### `server.destroy(p)`

Détruit la session : met $missionRunning à faux, termine le niveau (endMission), détruit le monde physique, supprime les datablocks et incrémente $Server::Session.

- `p` (*table|nil*) : profileur optionnel exposant :add(nom) pour marquer les étapes

#### `server.fadeoutLoadingScreen(skipStart)`

Termine le chargement : demande la sortie de l'écran de chargement, appelle clientPostStartMission/clientStartMission (sauf si skipStart), coupe le chargement, émet onLoadingScreenFadeout et journalise la durée. Sans effet (avertissement) si aucun chargement n'est en cours.

- `skipStart` (*boolean|nil*) : si vrai, saute clientPostStartMission/clientStartMission et déclenche guihooks MenuHide

#### `server.setLevelOffset(x, y, z)`

Définit un décalage global appliqué à la transformée de tuile du prochain niveau chargé. Appeler sans argument supprime le décalage ; avec des arguments incomplets, journalise une erreur.

- `x` (*number|nil*) : décalage X en mètres ; nil annule le décalage
- `y` (*number|nil*) : décalage Y en mètres
- `z` (*number|nil*) : décalage Z en mètres

## Champs

| Champ | Type | Description |
|---|---|---|
| `loadingProgress` | any | Exporté à l'initialisation du module, donc nil (voir notes) ; la vraie valeur est le handle LoadingManager local. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onClientCustomObjectSpawning` — écouté par 2 module(s)
- `onLoadingScreenFadeout` — écouté par 7 module(s)
- `onPlayerCameraReady` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `MenuHide`

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`
- `Sim.` `deserializeObjectsFromFile`
- `TorqueScriptLua.` `exec`
- `be:` `decalManagerLoad`, `deleteDataBlocks`, `physicsDestroyWorld`, `physicsInitWorld`, `physicsStartSimulation`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/server/server.lua`.*
