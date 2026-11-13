# `gameplay_crawl_saveSystem`

*Fichier : `lua/ge/extensions/gameplay/crawl/saveSystem.lua` · VM : Game Engine (GE) · 861 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crawl_saveSystem` : `extensions.load("gameplay_crawl_saveSystem")`, puis la globale `gameplay_crawl_saveSystem`

Système de fichiers du mode crawl. Il lit et écrit les quatre types de fichiers JSON d'un niveau, dans /levels/<niveau>/crawls/ : *.trail.json (parcours), *.boundary.json (zone limite, objet gameplay/sites/zone), *.path.json (noeuds du chemin) et *.startingPosition.json (position de départ). Chaque objet est chargé à la demande puis mis en cache, avec _filePath, _fileName, _dir et _ext ajoutés ; l'id d'un objet est son chemin de fichier. Il gère aussi les scores du joueur par parcours (meilleur temps, meilleurs points de pénalité, tentatives), stockés dans settings/cloud/crawlTrails/ en freeroam ou dans le profil de carrière (/career/crawlTrails/).

## Exemple

```lua
local trails = gameplay_crawl_saveSystem.getAllTrails()
local stats = gameplay_crawl_saveSystem.getPlayerTrailStats(trails[1]._filePath)
```

## Remarques

- Un id de trail/boundary/path/startingPosition est le chemin complet du fichier ; son extension doit être .trail.json, .boundary.json, .path.json ou .startingPosition.json, sinon loadFromFile refuse.
- Dans un chemin, les positions sont des tableaux {x,y,z} dans le JSON (champ position) et des vec3 en mémoire (champ pos) ; les rotations sont des quaternions {x,y,z,w}.
- Plus petit = meilleur : bestPenaltyPoints et bestTime valent math.huge tant qu'aucun score n'est enregistré (à tester avec < math.huge).
- Les fonctions getAllBoundaries, getAllPaths et getAllStartingPositions ne prennent pas de levelPath et listent toujours le niveau courant ; getAllTrails accepte un levelPath.
- getStartingPositionById(id, trail) retourne nil si trail.isFromMission est vrai ou si l'id est vide.
- En carrière, les scores sont sauvegardés par onSaveCurrentProfile (si marqués _dirty) ; hors carrière ils sont écrits immédiatement.
- Incohérence : saveCrawlData n'enregistre que les trails ayant un champ id, alors que les parcours chargés utilisent _filePath comme identifiant (le champ id n'est pas posé par deserializeTrail).
- Le cache n'est jamais invalidé automatiquement par un changement de fichier ; utiliser clearCache.
- Les constantes savePathFreeroam/savePathCareer en tête de fichier sont commentées (réservées à un usage futur).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crawl_saveSystem.addNewPlayerScore(trailId, time, penaltyPoints)` | Enregistre une tentative : met à jour le meilleur temps (si > 0 et meilleur), les meilleurs points de pénalité (si >= 0 et plus bas) et incrémente le nombre de tentatives, puis sauvegarde. | 774 |
| `gameplay_crawl_saveSystem.cleanup()` | Vide tous les caches. | 840 |
| `gameplay_crawl_saveSystem.clearCache(type)` | Vide le cache d'un type ('trails', 'boundaries', 'paths' ou 'startingPositions') ou de tous. | 67 |
| `gameplay_crawl_saveSystem.ensurePlayerSaveDirectories()` | Crée le dossier de sauvegarde freeroam settings/cloud/crawlTrails/ s'il n'existe pas. | 687 |
| `gameplay_crawl_saveSystem.getAllBoundaries()` | Charge toutes les zones limites du niveau courant. | 646 |
| `gameplay_crawl_saveSystem.getAllBoundaryFiles(levelPath)` | Liste les fichiers *.boundary.json. | 621 |
| `gameplay_crawl_saveSystem.getAllPathFiles(levelPath)` | Liste les fichiers *.path.json. | 625 |
| `gameplay_crawl_saveSystem.getAllPaths()` | Charge tous les chemins du niveau courant. | 658 |
| `gameplay_crawl_saveSystem.getAllStartingPositionFiles(levelPath)` | Liste les fichiers *.startingPosition.json. | 629 |
| `gameplay_crawl_saveSystem.getAllStartingPositions()` | Charge toutes les positions de départ du niveau courant. | 670 |
| `gameplay_crawl_saveSystem.getAllTrailFiles(levelPath)` | Liste les chemins des fichiers *.trail.json d'un dossier (non récursif). | 617 |
| `gameplay_crawl_saveSystem.getAllTrails(levelPath)` | Charge tous les parcours d'un dossier. | 634 |
| `gameplay_crawl_saveSystem.getBoundaryById(boundaryId)` | Charge (avec cache) une zone limite, créée comme objet zone puis désérialisée. | 569 |
| `gameplay_crawl_saveSystem.getCurrentLevelCrawlPath()` | Retourne le dossier des fichiers crawl du niveau courant. | 20 |
| `gameplay_crawl_saveSystem.getPathById(pathId)` | Charge (avec cache) un chemin ; les noeuds ont pos (vec3), rotation (quat), radius, flags, name. | 578 |
| `gameplay_crawl_saveSystem.getPlayerCrawlTrailById(trailId)` | Retourne les données de score d'un parcours. | 723 |
| `gameplay_crawl_saveSystem.getPlayerCrawlTrailsById()` | Charge (une fois) les scores du joueur pour tous les parcours du niveau courant, depuis le dossier freeroam ou le profil de carrière. | 727 |
| `gameplay_crawl_saveSystem.getPlayerTrailStats(trailId)` | Retourne les statistiques du joueur sur un parcours. | 827 |
| `gameplay_crawl_saveSystem.getStartingPositionById(startingPositionId, trail)` | Charge (avec cache) une position de départ. Retourne nil pour un parcours issu d'une mission ou un id vide. | 587 |
| `gameplay_crawl_saveSystem.getTrailById(trailId)` | Charge (avec cache) un parcours à partir de son chemin de fichier. | 560 |
| `gameplay_crawl_saveSystem.isTrailFromMission(trail)` | Indique si un parcours est issu d'une mission (isFromMission). | 857 |
| `gameplay_crawl_saveSystem.loadCrawlData(filename)` | Charge un fichier de données crawl (name, description, icon, metadata, liste d'ids de trails) et résout chaque trail via getTrailById. | 428 |
| `gameplay_crawl_saveSystem.onCareerActive()` | Hook appelé quand la carrière change d'état : oublie les scores chargés pour les relire depuis le bon dossier. *(interne)* *(hook)* | 695 |
| `gameplay_crawl_saveSystem.onSaveCurrentProfile(currentSavePath)` | Hook appelé lors de la sauvegarde du profil de carrière : écrit les scores de parcours modifiés (_dirty). *(interne)* *(hook)* | 705 |
| `gameplay_crawl_saveSystem.resetPlayerTrailScores(trailId)` | Remet à zéro (math.huge, dates 0, tentatives 0) les scores d'un parcours et les sauvegarde. | 815 |
| `gameplay_crawl_saveSystem.saveBoundary(boundary, filePath)` | Écrit une zone limite en JSON (via boundary:onSerialize()) et la met en cache. | 322 |
| `gameplay_crawl_saveSystem.saveCrawlData(saveData, filepath)` | Écrit un fichier de données crawl : métadonnées et ids des trails (voir notes sur le champ id). | 469 |
| `gameplay_crawl_saveSystem.savePath(path, filePath)` | Écrit un chemin (liste de noeuds : name, position, rotation, radius 4.0 par défaut, flags) en JSON et le met en cache. | 357 |
| `gameplay_crawl_saveSystem.savePlayerCrawlTrailScoresForTrailById(trailId)` | Marque les scores du parcours comme modifiés ; hors carrière, les écrit tout de suite dans settings/cloud/crawlTrails/. | 713 |
| `gameplay_crawl_saveSystem.saveStartingPosition(startingPosition, filePath)` | Écrit une position de départ (transform position/rotation/radius 10.0 par défaut, iconPosition, metadata) en JSON et la met en cache. | 392 |
| `gameplay_crawl_saveSystem.saveTrail(trail, filePath)` | Sérialise un parcours et l'écrit en JSON (création du dossier si besoin), puis le met en cache. | 287 |

### Détail des paramètres

#### `gameplay_crawl_saveSystem.addNewPlayerScore(trailId, time, penaltyPoints)`

Enregistre une tentative : met à jour le meilleur temps (si > 0 et meilleur), les meilleurs points de pénalité (si >= 0 et plus bas) et incrémente le nombre de tentatives, puis sauvegarde.

- `trailId` (*string*) : Id du parcours.
- `time` (*number|nil*) : Temps en secondes.
- `penaltyPoints` (*number|nil*) : Points de pénalité.
- **renvoie** : table|nil {isNewBestTime, isNewBestPenaltyPoints, bestTime, bestPenaltyPoints} ; nil si le parcours est inconnu (parcours de mission).

#### `gameplay_crawl_saveSystem.clearCache(type)`

Vide le cache d'un type ('trails', 'boundaries', 'paths' ou 'startingPositions') ou de tous.

- `type` (*string|nil*) : Clé du cache ; tous les caches si nil.

#### `gameplay_crawl_saveSystem.getAllBoundaries()`

Charge toutes les zones limites du niveau courant.

- **renvoie** : table[] Zones.

#### `gameplay_crawl_saveSystem.getAllBoundaryFiles(levelPath)`

Liste les fichiers *.boundary.json.

- `levelPath` (*string|nil*) : Dossier ; niveau courant si nil.
- **renvoie** : string[] Chemins de fichiers.

#### `gameplay_crawl_saveSystem.getAllPathFiles(levelPath)`

Liste les fichiers *.path.json.

- `levelPath` (*string|nil*) : Dossier ; niveau courant si nil.
- **renvoie** : string[] Chemins de fichiers.

#### `gameplay_crawl_saveSystem.getAllPaths()`

Charge tous les chemins du niveau courant.

- **renvoie** : table[] Chemins.

#### `gameplay_crawl_saveSystem.getAllStartingPositionFiles(levelPath)`

Liste les fichiers *.startingPosition.json.

- `levelPath` (*string|nil*) : Dossier ; niveau courant si nil.
- **renvoie** : string[] Chemins de fichiers.

#### `gameplay_crawl_saveSystem.getAllStartingPositions()`

Charge toutes les positions de départ du niveau courant.

- **renvoie** : table[] Positions de départ.

#### `gameplay_crawl_saveSystem.getAllTrailFiles(levelPath)`

Liste les chemins des fichiers *.trail.json d'un dossier (non récursif).

- `levelPath` (*string|nil*) : Dossier ; dossier crawl du niveau courant si nil.
- **renvoie** : string[] Chemins de fichiers.

#### `gameplay_crawl_saveSystem.getAllTrails(levelPath)`

Charge tous les parcours d'un dossier.

- `levelPath` (*string|nil*) : Dossier ; niveau courant si nil.
- **renvoie** : table[] Parcours.

#### `gameplay_crawl_saveSystem.getBoundaryById(boundaryId)`

Charge (avec cache) une zone limite, créée comme objet zone puis désérialisée.

- `boundaryId` (*string*) : Chemin du fichier .boundary.json.
- **renvoie** : table|nil Zone.

#### `gameplay_crawl_saveSystem.getCurrentLevelCrawlPath()`

Retourne le dossier des fichiers crawl du niveau courant.

- **renvoie** : string|nil '/levels/<niveau>/crawls/', ou nil si aucun niveau n'est chargé.

#### `gameplay_crawl_saveSystem.getPathById(pathId)`

Charge (avec cache) un chemin ; les noeuds ont pos (vec3), rotation (quat), radius, flags, name.

- `pathId` (*string*) : Chemin du fichier .path.json.
- **renvoie** : table|nil Chemin {name, description, nodes, id}.

#### `gameplay_crawl_saveSystem.getPlayerCrawlTrailById(trailId)`

Retourne les données de score d'un parcours.

- `trailId` (*string*) : Id (chemin de fichier) du parcours.
- **renvoie** : table|nil {id, trail, saveData}.

#### `gameplay_crawl_saveSystem.getPlayerCrawlTrailsById()`

Charge (une fois) les scores du joueur pour tous les parcours du niveau courant, depuis le dossier freeroam ou le profil de carrière.

- **renvoie** : table<string, table> Dictionnaire id -> {id, trail, saveData{bestTime, bestPenaltyPoints, bestTimeDate, bestPenaltyPointsDate, attempts}}.

#### `gameplay_crawl_saveSystem.getPlayerTrailStats(trailId)`

Retourne les statistiques du joueur sur un parcours.

- `trailId` (*string*) : Id du parcours.
- **renvoie** : table|nil {bestTime, bestPenaltyPoints, attempts} ; nil si inconnu.

#### `gameplay_crawl_saveSystem.getStartingPositionById(startingPositionId, trail)`

Charge (avec cache) une position de départ. Retourne nil pour un parcours issu d'une mission ou un id vide.

- `startingPositionId` (*string|nil*) : Chemin du fichier .startingPosition.json.
- `trail` (*table|nil*) : Parcours ; ignoré si isFromMission.
- **renvoie** : table|nil Position de départ {transform, iconPosition, …}.

#### `gameplay_crawl_saveSystem.getTrailById(trailId)`

Charge (avec cache) un parcours à partir de son chemin de fichier.

- `trailId` (*string*) : Chemin du fichier .trail.json.
- **renvoie** : table|nil Parcours, avec _filePath, _fileName, _dir, _ext.

#### `gameplay_crawl_saveSystem.isTrailFromMission(trail)`

Indique si un parcours est issu d'une mission (isFromMission).

- `trail` (*table|nil*) : Parcours.
- **renvoie** : boolean true si isFromMission est vrai.

#### `gameplay_crawl_saveSystem.loadCrawlData(filename)`

Charge un fichier de données crawl (name, description, icon, metadata, liste d'ids de trails) et résout chaque trail via getTrailById.

- `filename` (*string*) : Fichier JSON à lire.
- **renvoie** : table|nil {name, description, icon ('rockCrawling01' par défaut), metadata, trails}.

#### `gameplay_crawl_saveSystem.onSaveCurrentProfile(currentSavePath)`

Hook appelé lors de la sauvegarde du profil de carrière : écrit les scores de parcours modifiés (_dirty).

- `currentSavePath` (*string*) : Dossier du profil courant.

#### `gameplay_crawl_saveSystem.resetPlayerTrailScores(trailId)`

Remet à zéro (math.huge, dates 0, tentatives 0) les scores d'un parcours et les sauvegarde.

- `trailId` (*string*) : Id du parcours.

#### `gameplay_crawl_saveSystem.saveBoundary(boundary, filePath)`

Écrit une zone limite en JSON (via boundary:onSerialize()) et la met en cache.

- `boundary` (*table*) : Zone (objet gameplay/sites/zone).
- `filePath` (*string*) : Chemin du fichier .boundary.json.
- **renvoie** : boolean true si écrit.

#### `gameplay_crawl_saveSystem.saveCrawlData(saveData, filepath)`

Écrit un fichier de données crawl : métadonnées et ids des trails (voir notes sur le champ id).

- `saveData` (*table*) : {name, description, icon, metadata, trails}.
- `filepath` (*string*) : Fichier de sortie.
- **renvoie** : boolean true si écrit.

#### `gameplay_crawl_saveSystem.savePath(path, filePath)`

Écrit un chemin (liste de noeuds : name, position, rotation, radius 4.0 par défaut, flags) en JSON et le met en cache.

- `path` (*table*) : Chemin {name, description, nodes}.
- `filePath` (*string*) : Chemin du fichier .path.json.
- **renvoie** : boolean true si écrit.

#### `gameplay_crawl_saveSystem.savePlayerCrawlTrailScoresForTrailById(trailId)`

Marque les scores du parcours comme modifiés ; hors carrière, les écrit tout de suite dans settings/cloud/crawlTrails/.

- `trailId` (*string*) : Id du parcours.

#### `gameplay_crawl_saveSystem.saveStartingPosition(startingPosition, filePath)`

Écrit une position de départ (transform position/rotation/radius 10.0 par défaut, iconPosition, metadata) en JSON et la met en cache.

- `startingPosition` (*table*) : Position de départ.
- `filePath` (*string*) : Chemin du fichier .startingPosition.json.
- **renvoie** : boolean true si écrit.

#### `gameplay_crawl_saveSystem.saveTrail(trail, filePath)`

Sérialise un parcours et l'écrit en JSON (création du dossier si besoin), puis le met en cache.

- `trail` (*table*) : Parcours (name, description, pathId, boundaryId, startingPositionId, rules, prefabs…).
- `filePath` (*string*) : Chemin du fichier .trail.json.
- **renvoie** : boolean true si écrit.

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crawl/saveSystem.lua`.*
