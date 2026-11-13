# `editor_crawlEditor`

*Fichier : `lua/ge/extensions/editor/crawlEditor.lua` · VM : Game Engine (GE) · 1444 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_crawlEditor` : `extensions.load("editor_crawlEditor")`, puis la globale `editor_crawlEditor`

Éditeur de données de « crawl » (escalade/rock crawling) du World Editor, fenêtre « Crawl Data Editor » (menu Gameplay). Il charge, édite et sauvegarde quatre types d'objets via gameplay/crawl/saveSystem : trails (parcours reliant un chemin, une frontière et une position de départ), paths (nœuds), boundaries (zones) et starting positions. Il liste aussi les objets venant de missions (/gameplay/missions/<niveau>/crawl/<mission>/). Il délègue l'édition aux sous-modules crawlEditor/paths, boundaries, trails, startingPositions, input et missionPortTool, enregistre quatre modes d'édition (pathEditMode, boundaryEditMode, startingPositionEditMode, trailEditMode) et dessine en permanence les nœuds, frontières et positions de départ sélectionnés. Utile à un moddeur qui crée des parcours de crawl pour un niveau ou veut lire les données chargées depuis une autre extension.

## Exemple

```lua
extensions.load('editor_crawlEditor')
local trails = editor_crawlEditor.getAllTrails()
local p = editor_crawlEditor.getSelectedPath()
```

## Remarques

- Les index de sélection (selectedTrailIndex…) commencent à 1 ; 0 ou -1 = aucune sélection. Pour trails, paths et boundaries, les index > #allX désignent les objets de mission (missionX[index - #allX]) ; les starting positions n'ont pas d'équivalent mission.
- markAsDirty(objectType, index) met le drapeau _dirty sur l'objet ; ses types valides sont « trail », « path », « boundary » et « startingPosition ». Un index hors limites est ignoré sans erreur.
- Les objets de mission sont marqués _isFromMission = true et _missionName. Le bouton Save d'un trail déplace le trail entre dossier de mission et dossier de niveau selon l'écart entre isFromMission (voulu) et _isFromMission (actuel) ; moveTrailToMission est local, seul moveTrailToLevel est exporté.
- renameObjectFile refuse de renommer si la cible existe déjà, renomme le fichier avec FS:renameFile, met à jour les références pathId/boundaryId/startingPositionId(/Reversed) des trails du niveau puis resauvegarde l'objet renommé.
- Dossiers : fichiers de niveau dans /levels/<niveau>/crawls/ (*.trail.json, *.path.json, *.boundary.json, *.startingPosition.json) ; fichiers de mission dans /gameplay/missions/<niveau>/crawl/<mission>/. Le chargement n'a lieu qu'à la première ouverture de la fenêtre quand un niveau est chargé, ou en appelant loadAllObjects().
- onSerialize/onDeserialized conservent entre rechargements Lua : currentFileDir, currentFileName, crawlData, currentTab et les quatre index de sélection.
- Incohérence : getAllX() renvoie les tables internes (modifiables) ; les getters getSelectedX() renvoient nil si l'index est hors limites.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_crawlEditor.getAllBoundaries()` | Renvoie la liste des frontières de niveau. | 1419 |
| `editor_crawlEditor.getAllMissionBoundaries()` | Renvoie la liste des frontières issues des missions. | 1420 |
| `editor_crawlEditor.getAllMissionPaths()` | Renvoie la liste des chemins issus des missions. | 1418 |
| `editor_crawlEditor.getAllMissionTrails()` | Renvoie la liste des trails provenant des missions crawl du niveau courant. | 1416 |
| `editor_crawlEditor.getAllPaths()` | Renvoie la liste des chemins de niveau. | 1417 |
| `editor_crawlEditor.getAllStartingPositions()` | Renvoie la liste des positions de départ. | 1421 |
| `editor_crawlEditor.getAllTrails()` | Renvoie la liste des trails de niveau chargés. | 1415 |
| `editor_crawlEditor.getSelectedBoundary()` | Renvoie la frontière sélectionnée (de niveau ou de mission). | 280 |
| `editor_crawlEditor.getSelectedBoundaryIndex()` | Renvoie l'index de la frontière sélectionnée. | 1424 |
| `editor_crawlEditor.getSelectedPath()` | Renvoie le chemin sélectionné (de niveau ou de mission). | 271 |
| `editor_crawlEditor.getSelectedPathIndex()` | Renvoie l'index du chemin sélectionné. | 1423 |
| `editor_crawlEditor.getSelectedStartingPosition()` | Renvoie la position de départ sélectionnée. | 289 |
| `editor_crawlEditor.getSelectedStartingPositionIndex()` | Renvoie l'index de la position de départ sélectionnée. | 1425 |
| `editor_crawlEditor.getSelectedTrail()` | Renvoie le trail sélectionné (de niveau ou de mission). | 262 |
| `editor_crawlEditor.getSelectedTrailIndex()` | Renvoie l'index du trail sélectionné. | 1422 |
| `editor_crawlEditor.loadAllObjects()` | Recharge depuis le disque trails, paths, boundaries et starting positions (via saveSystem.getAll...Files / get...ById), ainsi que ceux des missions crawl du niveau courant. Vide d'abord les listes en mémoire. | 167 |
| `editor_crawlEditor.markAsDirty(objectType, index)` | Marque un objet comme modifié (non sauvegardé). | 304 |
| `editor_crawlEditor.moveTrailToLevel(trail)` | Déplace un trail de mission vers /levels/<niveau>/crawls/ : réécrit pathId et boundaryId vers ce dossier, sauve le trail, supprime l'ancien fichier, puis recharge tout. Échoue si le trail n'est pas de mission, si aucun niveau n'est chargé ou si le fichier existe déjà. | 456 |
| `editor_crawlEditor.onDeserialized(data)` | Restaure l'état renvoyé par onSerialize (index à -1 par défaut). *(interne)* *(hook)* | 860 |
| `editor_crawlEditor.onEditorGui()` | Appelé à chaque frame : met à jour la souris (crawlEditor/input), dessine les surcouches permanentes (nœuds, frontières, positions de départ), la fenêtre (menu File avec Save All, listes à gauche, détails à droite, boutons Save/Delete) et la fenêtre de portage de missions. *(interne)* *(hook)* | 873 |
| `editor_crawlEditor.onEditorInitialized()` | Enregistre la fenêtre « Crawl Data Editor » (1800x900), l'entrée de menu (groupe Gameplay) et les quatre modes d'édition avec leurs raccourcis auxiliaires. Appelé une fois à l'initialisation de l'éditeur. *(interne)* *(hook)* | 781 |
| `editor_crawlEditor.onSerialize()` | Hook de sérialisation avant rechargement Lua : renvoie dossier/nom de fichier courants, crawlData, onglet courant et index de sélection. *(interne)* *(hook)* | 846 |
| `editor_crawlEditor.renameObjectFile(oldFilePath, newFilePath, objectType)` | Renomme le fichier d'un objet crawl et met à jour les références des trails. | 74 |
| `editor_crawlEditor.setSelectedBoundaryIndex(index)` | Définit l'index de la frontière sélectionnée. | 1428 |
| `editor_crawlEditor.setSelectedPathIndex(index)` | Définit l'index du chemin sélectionné. | 1427 |
| `editor_crawlEditor.setSelectedStartingPositionIndex(index)` | Définit l'index de la position de départ sélectionnée. | 1429 |
| `editor_crawlEditor.setSelectedTrailIndex(index)` | Définit l'index du trail sélectionné sans toucher aux autres sélections. | 1426 |

### Détail des paramètres

#### `editor_crawlEditor.getAllBoundaries()`

Renvoie la liste des frontières de niveau.

- **renvoie** : table Liste de frontières

#### `editor_crawlEditor.getAllMissionBoundaries()`

Renvoie la liste des frontières issues des missions.

- **renvoie** : table Liste de frontières de mission

#### `editor_crawlEditor.getAllMissionPaths()`

Renvoie la liste des chemins issus des missions.

- **renvoie** : table Liste de chemins de mission

#### `editor_crawlEditor.getAllMissionTrails()`

Renvoie la liste des trails provenant des missions crawl du niveau courant.

- **renvoie** : table Liste de trails de mission

#### `editor_crawlEditor.getAllPaths()`

Renvoie la liste des chemins de niveau.

- **renvoie** : table Liste de chemins

#### `editor_crawlEditor.getAllStartingPositions()`

Renvoie la liste des positions de départ.

- **renvoie** : table Liste de positions de départ

#### `editor_crawlEditor.getAllTrails()`

Renvoie la liste des trails de niveau chargés.

- **renvoie** : table Liste de trails (table interne)

#### `editor_crawlEditor.getSelectedBoundary()`

Renvoie la frontière sélectionnée (de niveau ou de mission).

- **renvoie** : table|nil Frontière ou nil

#### `editor_crawlEditor.getSelectedBoundaryIndex()`

Renvoie l'index de la frontière sélectionnée.

- **renvoie** : integer Index

#### `editor_crawlEditor.getSelectedPath()`

Renvoie le chemin sélectionné (de niveau ou de mission).

- **renvoie** : table|nil Chemin ou nil

#### `editor_crawlEditor.getSelectedPathIndex()`

Renvoie l'index du chemin sélectionné.

- **renvoie** : integer Index

#### `editor_crawlEditor.getSelectedStartingPosition()`

Renvoie la position de départ sélectionnée.

- **renvoie** : table|nil Position de départ ou nil

#### `editor_crawlEditor.getSelectedStartingPositionIndex()`

Renvoie l'index de la position de départ sélectionnée.

- **renvoie** : integer Index

#### `editor_crawlEditor.getSelectedTrail()`

Renvoie le trail sélectionné (de niveau ou de mission).

- **renvoie** : table|nil Trail ou nil

#### `editor_crawlEditor.getSelectedTrailIndex()`

Renvoie l'index du trail sélectionné.

- **renvoie** : integer Index (> 0 si sélectionné)

#### `editor_crawlEditor.markAsDirty(objectType, index)`

Marque un objet comme modifié (non sauvegardé).

- `objectType` (*string*) : « trail », « path », « boundary » ou « startingPosition »
- `index` (*integer*) : Index global (objets de mission inclus sauf pour startingPosition)

#### `editor_crawlEditor.moveTrailToLevel(trail)`

Déplace un trail de mission vers /levels/<niveau>/crawls/ : réécrit pathId et boundaryId vers ce dossier, sauve le trail, supprime l'ancien fichier, puis recharge tout. Échoue si le trail n'est pas de mission, si aucun niveau n'est chargé ou si le fichier existe déjà.

- `trail` (*table*) : Trail avec _isFromMission = true
- **renvoie** : boolean true si déplacé

#### `editor_crawlEditor.onDeserialized(data)`

Restaure l'état renvoyé par onSerialize (index à -1 par défaut).

- `data` (*table|nil*) : Données de onSerialize

#### `editor_crawlEditor.onSerialize()`

Hook de sérialisation avant rechargement Lua : renvoie dossier/nom de fichier courants, crawlData, onglet courant et index de sélection.

- **renvoie** : table Données à restaurer

#### `editor_crawlEditor.renameObjectFile(oldFilePath, newFilePath, objectType)`

Renomme le fichier d'un objet crawl et met à jour les références des trails.

- `oldFilePath` (*string*) : Ancien chemin
- `newFilePath` (*string*) : Nouveau chemin (ne doit pas exister)
- `objectType` (*string*) : « trail », « path », « boundary » ou « startingPosition »
- **renvoie** : boolean true si renommé ; false si chemins identiques/nil, cible existante ou échec

#### `editor_crawlEditor.setSelectedBoundaryIndex(index)`

Définit l'index de la frontière sélectionnée.

- `index` (*integer*) : Index

#### `editor_crawlEditor.setSelectedPathIndex(index)`

Définit l'index du chemin sélectionné.

- `index` (*integer*) : Index

#### `editor_crawlEditor.setSelectedStartingPositionIndex(index)`

Définit l'index de la position de départ sélectionnée.

- `index` (*integer*) : Index

#### `editor_crawlEditor.setSelectedTrailIndex(index)`

Définit l'index du trail sélectionné sans toucher aux autres sélections.

- `index` (*integer*) : Index (1 = premier)

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `findFiles`, `removeFile`, `renameFile`, `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/crawlEditor.lua`.*
