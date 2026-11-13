# `core_levels`

*Fichier : `lua/ge/extensions/core/levels.lua` · VM : Game Engine (GE) · 597 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_levels` : `extensions.load("core_levels")`, puis la globale `core_levels`

Extension GE `core_levels` : catalogue des niveaux (dossiers de /levels/), lecture de leur info.json, et lancement d'un niveau (startLevel). Un moddeur s'en sert pour lister les cartes disponibles (y compris celles venant de mods), retrouver le titre ou l'aperçu d'une carte, ou charger une carte par script. La liste est calculée une fois (lecture disque lente) puis mise en cache ; le cache est invalidé quand un fichier sous /levels/ change.

## Exemple

```lua
local lvl = core_levels.getLevelByName('west_coast_usa')
if lvl then log('I','', lvl.title .. ' ' .. tostring(lvl.supportsTraffic)) end
-- charger une carte (le dossier ou le fichier .level.json)
core_levels.startLevel('/levels/gridmap_v2/')
```

## Remarques

- getList() parcourt /levels/ : les entrées de la liste sont les tables de info.json enrichies (levelName, dir, misFilePath, fullfilename, modID, modName, modTitle, official, previews, spawnPoints, minimap, multiseat.maxPlayers, supportsTraffic, supportsTimeOfDay). Les clés de info.json non listées sont conservées telles quelles.
- Un niveau sans point d'entrée (dossier main/, ancien fichier principal, ou un .mis) est ignoré avec une erreur dans le log. Si un niveau existe en .level.json et en .mis, seule la version json est gardée.
- Le dossier /levels/mod_info est ignoré. Le flag obsolète `hidden` de info.json est converti en `isAuxiliary` avec un avertissement.
- Les chemins d'aperçu (`previews`, `spawnPoints[].previews`, `minimap[].file`) sont préfixés par le dossier du niveau. Les niveaux sans `previews` voient leur `title` écrasé par le nom du dossier (levelName), même si info.json avait un title.
- Bug probable dans getList : l'appel `imageExistsDefault(l.dirEntry..'.png', imageExistsDefault(l.dirEntry..'_preview.png'))` imbrique le 2e appel comme valeur par défaut du premier au lieu de lui passer deux arguments distincts (déduit du code).
- getLevelPreview écrit une ligne `print` à chaque appel non mis en cache, ce qui pollue le log.
- Les caches de titre, d'aperçu et d'options d'heure sont indexés par nom de niveau en minuscules ; la recherche par nom est insensible à la casse.
- startLevel ne fait rien si un chargement 'levels' est déjà en cours. Si un niveau est déjà chargé (scenetree.MissionCleanup existe), on se déconnecte d'abord, puis on charge. Le paramètre spawnVehicle est mémorisé dans une variable locale et consommé par maybeSpawnDefaultVehicle.
- onGetRawPoiListForLevel ne vérifie pas que levelInfo soit non nil : un niveau inconnu provoquerait une erreur (levelInfo.spawnPoints).

**Dépendances (chargées avant) :** `freeroam_levelStats`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_levels.expandMissionFileName(missionFileName)` | Résout un nom de fichier de niveau : renvoie tel quel un dossier existant, sinon le fichier développé s'il existe, sinon essaie les variantes .level.json et .mis. | 443 |
| `core_levels.getLevelByName(levelName)` | Cherche un niveau par son nom de dossier, sans tenir compte de la casse. | 246 |
| `core_levels.getLevelName(path)` | Extrait le nom du niveau d'un chemin de la forme '/levels/<nom>/...'. | 512 |
| `core_levels.getLevelNames()` | Renvoie seulement les noms (levelName) des niveaux, dans l'ordre de getList. | 225 |
| `core_levels.getLevelPaths()` | Renvoie les dossiers des niveaux, chacun terminé par '/'. | 233 |
| `core_levels.getLevelPreview(levelName)` | Renvoie le premier chemin d'image d'aperçu du niveau. Résultat mis en cache ; écrit une ligne dans le log à chaque calcul. | 281 |
| `core_levels.getLevelTitle(levelName)` | Renvoie le titre affichable du niveau (champ title, sinon levelName). Résultat mis en cache. | 256 |
| `core_levels.getList()` | Renvoie le tableau de tous les niveaux valides, triés par nom sans tenir compte de la casse. Construit au premier appel (lent, accès disque) puis mis en cache. Renvoie {} si /levels/ n'existe pas. | 74 |
| `core_levels.getListWithStats()` | Renvoie la liste des niveaux avec les statistiques d'interface fournies par freeroam_levelStats. | 567 |
| `core_levels.getSimpleList()` | Alias de getLevelNames, gardé pour compatibilité. | 225 |
| `core_levels.getTimeOfDayOptions(levelName)` | Renvoie les choix d'heure de la journée proposés pour le niveau (pris dans core_environment.getDefaultTimeOfDayOptions), uniquement si le niveau a supportsTimeOfDay. Triés : valeurs > 0.5 en premier (croissantes), puis valeurs <= 0.5 (croissantes). | 311 |
| `core_levels.isListLoaded()` | Indique si le cache de la liste des niveaux est déjà construit. | 220 |
| `core_levels.maybeSpawnDefaultVehicle()` | Fait apparaître le véhicule joueur ('thePlayer') choisi via startLevel (ou le véhicule par défaut) au point d'apparition 'player', l'ajoute à MissionCleanup et MissionGroup et le marque canSave = false. Appelé par le flux de chargement de niveau. *(interne)* | 382 |
| `core_levels.onClientPostStartMission()` | Hook appelé après le démarrage d'un niveau côté client : régénère tous les DecalRoad de la scène. *(interne)* *(hook)* | 434 |
| `core_levels.onFilesChanged(files)` | Hook appelé quand des fichiers changent. Si un chemin commence par '/levels/', vide tous les caches et renvoie la liste à l'interface (onLevelsChanged). *(interne)* *(hook)* | 359 |
| `core_levels.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook de collecte des points d'intérêt d'un niveau : ajoute à `elements` un POI de type spawnPoint (marqueur de grande carte, voyage rapide) pour chaque spawnPoint qui a un objectname trouvé dans la scène. En mode carrière, seuls les points découverts sont ajoutés. *(interne)* *(hook)* | 539 |
| `core_levels.requestData()` | Alias de notifyUI : envoie à l'interface la liste avec statistiques via guihooks.trigger('onLevelsChanged', levels, uiStats). | 241 |
| `core_levels.startLevel(levelPath, delayedStart, customLoadingFunction, spawnVehicle)` | Charge un niveau avec écran de chargement 'levels'. Se déconnecte d'abord si un niveau est déjà chargé. Ignoré si un chargement est déjà en cours. | 516 |

### Détail des paramètres

#### `core_levels.expandMissionFileName(missionFileName)`

Résout un nom de fichier de niveau : renvoie tel quel un dossier existant, sinon le fichier développé s'il existe, sinon essaie les variantes .level.json et .mis.

- `missionFileName` (*string*) : Chemin du niveau (dossier, .mis, .level.json ou sans extension).
- **renvoie** : string|nil Chemin existant trouvé, ou nil (aucun return explicite).

#### `core_levels.getLevelByName(levelName)`

Cherche un niveau par son nom de dossier, sans tenir compte de la casse.

- `levelName` (*string*) : Nom du niveau (ex. 'west_coast_usa').
- **renvoie** : table|nil L'entrée de getList, ou nil si introuvable.

#### `core_levels.getLevelName(path)`

Extrait le nom du niveau d'un chemin de la forme '/levels/<nom>/...'.

- `path` (*string*) : Chemin virtuel contenant levels/<nom>/.
- **renvoie** : string|nil Nom du niveau, ou nil si le motif ne correspond pas.

#### `core_levels.getLevelNames()`

Renvoie seulement les noms (levelName) des niveaux, dans l'ordre de getList.

- **renvoie** : string[] Noms de dossiers des niveaux.

#### `core_levels.getLevelPaths()`

Renvoie les dossiers des niveaux, chacun terminé par '/'.

- **renvoie** : string[] Chemins du type '/levels/gridmap_v2/'.

#### `core_levels.getLevelPreview(levelName)`

Renvoie le premier chemin d'image d'aperçu du niveau. Résultat mis en cache ; écrit une ligne dans le log à chaque calcul.

- `levelName` (*string|nil*) : Nom du niveau.
- **renvoie** : string|nil Chemin de l'image, ou nil.

#### `core_levels.getLevelTitle(levelName)`

Renvoie le titre affichable du niveau (champ title, sinon levelName). Résultat mis en cache.

- `levelName` (*string|nil*) : Nom du niveau ; nil renvoie nil.
- **renvoie** : string|nil Titre, ou nil si le niveau est inconnu.

#### `core_levels.getList()`

Renvoie le tableau de tous les niveaux valides, triés par nom sans tenir compte de la casse. Construit au premier appel (lent, accès disque) puis mis en cache. Renvoie {} si /levels/ n'existe pas.

- **renvoie** : table[] Liste des infos de niveau (info.json enrichi, voir notes).

#### `core_levels.getListWithStats()`

Renvoie la liste des niveaux avec les statistiques d'interface fournies par freeroam_levelStats.

- **renvoie** : table { levels = getList(), uiStats = freeroam_levelStats.getUiStats() }

#### `core_levels.getSimpleList()`

Alias de getLevelNames, gardé pour compatibilité.

- **renvoie** : string[] Noms de dossiers des niveaux.

#### `core_levels.getTimeOfDayOptions(levelName)`

Renvoie les choix d'heure de la journée proposés pour le niveau (pris dans core_environment.getDefaultTimeOfDayOptions), uniquement si le niveau a supportsTimeOfDay. Triés : valeurs > 0.5 en premier (croissantes), puis valeurs <= 0.5 (croissantes).

- `levelName` (*string|nil*) : Nom du niveau ; nil renvoie {}.
- **renvoie** : table[] Éléments { key, value, label }. Vide si non supporté ou niveau inconnu.

#### `core_levels.isListLoaded()`

Indique si le cache de la liste des niveaux est déjà construit.

- **renvoie** : boolean true si getList a déjà été calculée et pas invalidée depuis.

#### `core_levels.onFilesChanged(files)`

Hook appelé quand des fichiers changent. Si un chemin commence par '/levels/', vide tous les caches et renvoie la liste à l'interface (onLevelsChanged).

- `files` (*table[]*) : Éléments avec un champ filename.

#### `core_levels.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook de collecte des points d'intérêt d'un niveau : ajoute à `elements` un POI de type spawnPoint (marqueur de grande carte, voyage rapide) pour chaque spawnPoint qui a un objectname trouvé dans la scène. En mode carrière, seuls les points découverts sont ajoutés.

- `levelIdentifier` (*string*) : Nom du niveau.
- `elements` (*table[]*) : Liste de POI à compléter (modifiée en place).

#### `core_levels.startLevel(levelPath, delayedStart, customLoadingFunction, spawnVehicle)`

Charge un niveau avec écran de chargement 'levels'. Se déconnecte d'abord si un niveau est déjà chargé. Ignoré si un chargement est déjà en cours.

- `levelPath` (*string*) : Dossier du niveau ou fichier main.level.json (converti en dossier si le fichier n'existe pas).
- `delayedStart` (*boolean|nil*) : Si vrai, termine d'abord le mode de jeu actif (endActiveGameMode) puis charge.
- `customLoadingFunction` (*function|nil*) : Transmise à server.createGame pour remplacer le chargement standard (déduit du code).
- `spawnVehicle` (*table|false|nil*) : Véhicule à faire apparaître au chargement : { modèle, options } ; false = aucun ; nil = véhicule par défaut.
- **renvoie** : any Résultat de la déconnexion ou du chargement ; false si le chemin est invalide ; nil sinon.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant celle-ci : { "freeroam_levelStats" }. |
| `levelsDir` | string | Toujours '/levels/', conservé pour compatibilité avec d'anciens scripts. |

**Évènements UI (guihooks.trigger) :** `onLevelsChanged`

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `expandFilename`, `fileExists`, `findFiles`
- `core_environment.` `getDefaultTimeOfDayOptions`
- `obj:` `getPosition`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/levels.lua`.*
