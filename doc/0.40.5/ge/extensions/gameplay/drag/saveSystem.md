# `gameplay_drag_saveSystem`

*Fichier : `lua/ge/extensions/gameplay/drag/saveSystem.lua` · VM : Game Engine (GE) · 951 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_saveSystem` : `extensions.load("gameplay_drag_saveSystem")`, puis la globale `gameplay_drag_saveSystem`

Chargement et sauvegarde des données de drag. Lit les pistes (fichiers *.strip.json et *.dragSettings.json, ou ancien format converti), reconstruit couloirs, waypoints, zones et timers, synchronise les waypoints avec les objets BeamNGWaypoint de la scène, précalcule le point d'arrêt IA, et fait apparaître/supprime les prefabs (arbre, panneaux, décorations, chemins). Gère aussi les fichiers du joueur : meilleurs temps par véhicule (carnet de dial) et historique des tickets, dans le dossier settings/ de l'utilisateur.

## Remarques

- Fichiers écrits : settings/dragDialBest.json (meilleurs temps par hash de config), settings/dragDialHistory.jsonl (une ligne JSON par course, ajoutée en fin de fichier) et settings/dragDialTimes.json (ancien fichier, relu et migré une fois). Copie de sauvegarde carrière : <dossier de save>/dragDialTimes.json.
- Les clés du carnet sont des hash du fichier de config du véhicule (FS:hashFile sur pc_file) ou 'vehicle_<id>' si indisponible ; time_1_4 sert de valeur de repli (10 s par défaut).
- DEFAULT_TIMERS : reactionTime (0.178 m), time_60 (60 pi), time_330, time_1_8, time_1000, time_1_4 (important), velAt_1_8, velAt_1_4 ; distances en mètres (402.336 m = 1/4 de mile).
- Les waypoints de couloir sont nommés <stripId>_wp_<type>_<couloir> dans la scène ; ceux de la piste <stripId>_<type>. Ils doivent exister dans le niveau (prefab) : le module ne les crée pas, il les renomme si besoin et relit leur transform.
- Phases par défaut d'une piste : stage (dependency), countdown (dependency), race, stop. Valeurs par défaut : dragType 'headsUpRace', context 'freeroam', arbre '.500'.
- normalizeTimersConfig ne conserve pas shortLabel : les timers fournis par un fichier dragSettings perdent ce champ (utilisé par le ticket), contrairement à DEFAULT_TIMERS.
- Le point d'arrêt automatique de l'IA (autoStopName) est cherché dans le graphe de navigation à plus de 350 m de la ligne d'arrivée, sauf si la piste définit un waypoint drag_stop.
- onCareerActive ne fait rien.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_saveSystem.convertLegacyData(legacyData)` | Convertit l'ancien format de piste (stripInfo, strip.lanes) en structure actuelle (strip, lanes, waypoints), ajoute les timers par défaut et synchronise les waypoints avec la scène. | 415 |
| `gameplay_drag_saveSystem.ensureDialCache()` | Charge une seule fois par session le carnet de dial (settings/dragDialTimes.json, historique .jsonl, overlay des meilleurs temps) et migre l'ancien historique hors du JSON principal. | 614 |
| `gameplay_drag_saveSystem.generateHashFromFile(vehicleId)` | Hash stable de la config du véhicule (hash du fichier .pc) servant de clé pour dial et historique ; mis en cache. Retourne 'vehicle_<id>' si les détails ou le fichier sont indisponibles. | 723 |
| `gameplay_drag_saveSystem.getAllLanes()` | Tous les couloirs de toutes les pistes (*.strip.json) du niveau courant, avec _stripId et _stripName ajoutés. | 887 |
| `gameplay_drag_saveSystem.getAllStrips()` | Données brutes de toutes les pistes *.strip.json du dossier dragstrips du niveau courant (avec _filePath). | 870 |
| `gameplay_drag_saveSystem.getCurrentLevelDragPath()` | Chemin /levels/<niveau>/dragstrips/ du niveau courant. | 261 |
| `gameplay_drag_saveSystem.getCurrentSavePath()` | Chemin de sauvegarde carrière courant. | 752 |
| `gameplay_drag_saveSystem.getDialTimes()` | Meilleurs temps par hash de config, sans l'historique ; time_1_4 vaut au moins 10 par défaut. | 706 |
| `gameplay_drag_saveSystem.getHistory(id)` | Historique des tickets enregistrés. Avec id, filtre sur la piste correspondante du niveau courant (par id de dragSettings, nom de fichier ou id de strip). | 770 |
| `gameplay_drag_saveSystem.getRecentHistory(count)` | Les count derniers tickets toutes pistes confondues, du plus récent au plus ancien (stripInfo.timestamp). | 851 |
| `gameplay_drag_saveSystem.laneWaypointSceneName(stripId, wpType, laneIndex)` | Nom canonique dans la scène d'un waypoint de couloir : <stripId>_wp_<type>_<couloir> (le « _wp_ » évite la collision avec les feux d'arbre). | 118 |
| `gameplay_drag_saveSystem.loadCompleteDragRaceData(stripId)` | Charge une piste complète depuis un fichier .strip.json : couloirs (waypoints, boundary, zone, stageToEndNormalized), waypoints de piste, zone de piste, phases/prefabs/timers par défaut ; puis synchronise avec la scène. | 267 |
| `gameplay_drag_saveSystem.loadDragStripData(filepath)` | Charge un fichier de réglages de piste : format modulaire (champ stripId pointant vers un .strip.json, plus dragType, context, phases, prefabs, timers) ou ancien format converti par convertLegacyData. | 375 |
| `gameplay_drag_saveSystem.loadPrefabs(data)` | Fait apparaître dans la scène les prefabs utilisés de data.prefabs (christmasTree, displaySign, decorations, paths) à l'origine et stocke leur prefabId. | 919 |
| `gameplay_drag_saveSystem.onCareerActive()` | Hook de carrière activée ; ne fait rien. *(interne)* *(hook)* | 867 |
| `gameplay_drag_saveSystem.onSaveCurrentProfile(currentSavePath)` | Hook : à la sauvegarde du profil, copie le carnet de dial dans le dossier de sauvegarde (saveDialFile). *(interne)* *(hook)* | 863 |
| `gameplay_drag_saveSystem.resolveAutoStopWaypoints(dragData)` | Précalcule pour chaque couloir le nom du nœud de navigation où l'IA doit s'arrêter (lane.autoStopName), à plus de 350 m de la ligne d'arrivée. Ne fait rien si la piste a un waypoint drag_stop ou si le graphe n'existe pas. | 239 |
| `gameplay_drag_saveSystem.saveDialFile(dir)` | Écrit le carnet de dial dans <dir>/dragDialTimes.json. | 758 |
| `gameplay_drag_saveSystem.saveDialTimes(dragData, timeslip)` | Pour chaque racer jouable, met à jour son meilleur temps (timer important) si battu, et ajoute le ticket à l'historique (mémoire et fichier .jsonl, avec configHash par pilote). Écrit settings/dragDialBest.json si un record change. | 650 |
| `gameplay_drag_saveSystem.saveLane(lane, filePath)` | Écrit un couloir en JSON (mise en forme lisible). | 915 |
| `gameplay_drag_saveSystem.saveStrip(strip, filePath)` | Écrit une piste en JSON après avoir renommé les waypoints de chaque couloir selon laneWaypointSceneName. | 901 |
| `gameplay_drag_saveSystem.syncDragStripWaypointsWithSceneTree(dragData)` | Pour chaque waypoint de couloir et de piste, retrouve le BeamNGWaypoint de la scène à son nom canonique, le renomme si besoin, relit sa position/rotation/échelle, et calcule lane.stageToEndNormalized. Rebuild le graphe de navigation (map.reset) si un renommage a eu lieu. | 158 |
| `gameplay_drag_saveSystem.unloadPrefabs(data)` | Supprime de la scène les prefabs utilisés (par prefabId) et efface prefabId. | 938 |

### Détail des paramètres

#### `gameplay_drag_saveSystem.convertLegacyData(legacyData)`

Convertit l'ancien format de piste (stripInfo, strip.lanes) en structure actuelle (strip, lanes, waypoints), ajoute les timers par défaut et synchronise les waypoints avec la scène.

- `legacyData` (*table*) : Données dans l'ancien format.
- **renvoie** : table|nil Données converties, nil si legacyData est nil.

#### `gameplay_drag_saveSystem.ensureDialCache()`

Charge une seule fois par session le carnet de dial (settings/dragDialTimes.json, historique .jsonl, overlay des meilleurs temps) et migre l'ancien historique hors du JSON principal.

- **renvoie** : table Cache indexé par hash de config véhicule ({time_1_4, ..., history}).

#### `gameplay_drag_saveSystem.generateHashFromFile(vehicleId)`

Hash stable de la config du véhicule (hash du fichier .pc) servant de clé pour dial et historique ; mis en cache. Retourne 'vehicle_<id>' si les détails ou le fichier sont indisponibles.

- `vehicleId` (*integer|nil*) : ID du véhicule (défaut : véhicule du joueur 0).
- **renvoie** : string Hash ou clé de repli.

#### `gameplay_drag_saveSystem.getAllLanes()`

Tous les couloirs de toutes les pistes (*.strip.json) du niveau courant, avec _stripId et _stripName ajoutés.

- **renvoie** : table[] Couloirs.

#### `gameplay_drag_saveSystem.getAllStrips()`

Données brutes de toutes les pistes *.strip.json du dossier dragstrips du niveau courant (avec _filePath).

- **renvoie** : table[] Pistes.

#### `gameplay_drag_saveSystem.getCurrentLevelDragPath()`

Chemin /levels/<niveau>/dragstrips/ du niveau courant.

- **renvoie** : string|nil Chemin, nil (log E) si le niveau est inconnu.

#### `gameplay_drag_saveSystem.getCurrentSavePath()`

Chemin de sauvegarde carrière courant.

- **renvoie** : string Chemin, chaîne vide hors carrière.

#### `gameplay_drag_saveSystem.getDialTimes()`

Meilleurs temps par hash de config, sans l'historique ; time_1_4 vaut au moins 10 par défaut.

- **renvoie** : table<string, table> Table hash vers {time_1_4, autres timers}.

#### `gameplay_drag_saveSystem.getHistory(id)`

Historique des tickets enregistrés. Avec id, filtre sur la piste correspondante du niveau courant (par id de dragSettings, nom de fichier ou id de strip).

- `id` (*string|nil*) : Identifiant de piste/installation ; nil = tout l'historique.
- **renvoie** : table {history = tickets[]}.

#### `gameplay_drag_saveSystem.getRecentHistory(count)`

Les count derniers tickets toutes pistes confondues, du plus récent au plus ancien (stripInfo.timestamp).

- `count` (*integer*) : Nombre maximum de tickets.
- **renvoie** : table[] Tickets.

#### `gameplay_drag_saveSystem.laneWaypointSceneName(stripId, wpType, laneIndex)`

Nom canonique dans la scène d'un waypoint de couloir : <stripId>_wp_<type>_<couloir> (le « _wp_ » évite la collision avec les feux d'arbre).

- `stripId` (*string*) : Identifiant de piste.
- `wpType` (*string*) : Type de waypoint (stage, endLine...).
- `laneIndex` (*integer*) : Indice du couloir.
- **renvoie** : string Nom d'objet.

#### `gameplay_drag_saveSystem.loadCompleteDragRaceData(stripId)`

Charge une piste complète depuis un fichier .strip.json : couloirs (waypoints, boundary, zone, stageToEndNormalized), waypoints de piste, zone de piste, phases/prefabs/timers par défaut ; puis synchronise avec la scène.

- `stripId` (*string*) : Chemin du fichier strip JSON.
- **renvoie** : table|nil Données complètes, nil (log E) en cas d'échec de lecture.

#### `gameplay_drag_saveSystem.loadDragStripData(filepath)`

Charge un fichier de réglages de piste : format modulaire (champ stripId pointant vers un .strip.json, plus dragType, context, phases, prefabs, timers) ou ancien format converti par convertLegacyData.

- `filepath` (*string*) : Chemin du fichier JSON (.dragSettings.json).
- **renvoie** : table|nil Données de piste ou nil.

#### `gameplay_drag_saveSystem.loadPrefabs(data)`

Fait apparaître dans la scène les prefabs utilisés de data.prefabs (christmasTree, displaySign, decorations, paths) à l'origine et stocke leur prefabId.

- `data` (*table*) : Données de piste avec prefabs[clé] = {isUsed, path, treeType}.

#### `gameplay_drag_saveSystem.onSaveCurrentProfile(currentSavePath)`

Hook : à la sauvegarde du profil, copie le carnet de dial dans le dossier de sauvegarde (saveDialFile).

- `currentSavePath` (*string|nil*) : Dossier de sauvegarde courant.

#### `gameplay_drag_saveSystem.resolveAutoStopWaypoints(dragData)`

Précalcule pour chaque couloir le nom du nœud de navigation où l'IA doit s'arrêter (lane.autoStopName), à plus de 350 m de la ligne d'arrivée. Ne fait rien si la piste a un waypoint drag_stop ou si le graphe n'existe pas.

- `dragData` (*table*) : Données de piste.

#### `gameplay_drag_saveSystem.saveDialFile(dir)`

Écrit le carnet de dial dans <dir>/dragDialTimes.json.

- `dir` (*string*) : Dossier cible.
- **renvoie** : boolean Succès de l'écriture.

#### `gameplay_drag_saveSystem.saveDialTimes(dragData, timeslip)`

Pour chaque racer jouable, met à jour son meilleur temps (timer important) si battu, et ajoute le ticket à l'historique (mémoire et fichier .jsonl, avec configHash par pilote). Écrit settings/dragDialBest.json si un record change.

- `dragData` (*table*) : Données de course courantes.
- `timeslip` (*table|nil*) : Ticket à enregistrer dans l'historique.

#### `gameplay_drag_saveSystem.saveLane(lane, filePath)`

Écrit un couloir en JSON (mise en forme lisible).

- `lane` (*table*) : Couloir.
- `filePath` (*string*) : Fichier cible.
- **renvoie** : boolean Succès.

#### `gameplay_drag_saveSystem.saveStrip(strip, filePath)`

Écrit une piste en JSON après avoir renommé les waypoints de chaque couloir selon laneWaypointSceneName.

- `strip` (*table*) : Piste (id, lanes avec waypoints[] ayant un type).
- `filePath` (*string*) : Fichier cible.
- **renvoie** : boolean Succès.

#### `gameplay_drag_saveSystem.syncDragStripWaypointsWithSceneTree(dragData)`

Pour chaque waypoint de couloir et de piste, retrouve le BeamNGWaypoint de la scène à son nom canonique, le renomme si besoin, relit sa position/rotation/échelle, et calcule lane.stageToEndNormalized. Rebuild le graphe de navigation (map.reset) si un renommage a eu lieu.

- `dragData` (*table*) : Données de piste (strip.id requis).

#### `gameplay_drag_saveSystem.unloadPrefabs(data)`

Supprime de la scène les prefabs utilisés (par prefabId) et efface prefabId.

- `data` (*table*) : Données de piste avec prefabs.

## Champs

| Champ | Type | Description |
|---|---|---|
| `DEFAULT_TIMERS` | table[] | Timers par défaut d'une piste : {id, label, labelKey, shortLabel, type = 'distanceTimer'\|'velocity', distance (m), important}. |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`, `hashFile`, `removeFile`, `renameFile`
- `be:` `getPlayerVehicleID`
- `obj:` `getClassName`, `getName`, `getPosition`, `getRotation`, `getScale`, `setName`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/saveSystem.lua`.*
