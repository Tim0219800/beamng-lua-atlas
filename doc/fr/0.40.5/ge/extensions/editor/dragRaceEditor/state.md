# `editor_dragRaceEditor_state`

*Fichier : `lua/ge/extensions/editor/dragRaceEditor/state.lua` · VM : Game Engine (GE) · 185 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dragRaceEditor_state` : `extensions.load("editor_dragRaceEditor_state")`, puis la globale `editor_dragRaceEditor_state`

État partagé de l'éditeur de drag race : une seule table locale State (données de course, fichier courant, index de sélection voie/facility/strip, souris, pile undo/redo, erreur affichée, cible d'édition de zone, recherche). Tous les autres sous-modules y accèdent via des getters/setters triviaux.

## Remarques

- Module de simples accesseurs : chaque getXxx renvoie State.xxx et chaque setXxx l'affecte, sans validation.
- Valeurs initiales : dossier courant "/levels/", index de sélection -1, maxUndoSteps 20, usingPrefabs et hasEndCamera sont des im.BoolPtr(false).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dragRaceEditor_state.getCurrentFileDir()` | Dossier du fichier courant. | 104 |
| `editor_dragRaceEditor_state.getCurrentFileName()` | Nom du fichier courant. | 112 |
| `editor_dragRaceEditor_state.getDragRaceData()` | Données de course en cours d'édition. | 48 |
| `editor_dragRaceEditor_state.getErrorTimeout()` | Durée restante (s) d'affichage de l'erreur. | 148 |
| `editor_dragRaceEditor_state.getHasEndCamera()` | Pointeur ImGui booléen « a une caméra de fin ». | 160 |
| `editor_dragRaceEditor_state.getHasUnsavedChanges()` | Indique s'il y a des modifications non sauvegardées. | 88 |
| `editor_dragRaceEditor_state.getLastError()` | Dernier message d'erreur affiché. | 140 |
| `editor_dragRaceEditor_state.getMaxUndoSteps()` | Nombre maximal d'étapes d'annulation (20). | 136 |
| `editor_dragRaceEditor_state.getMouseInfo()` | Table d'info souris remplie par utils.updateMouseInfo. | 80 |
| `editor_dragRaceEditor_state.getRedoStack()` | Pile de rétablissement. | 128 |
| `editor_dragRaceEditor_state.getSearch()` | Objet searchUtil utilisé pour les listes déroulantes avec recherche. | 164 |
| `editor_dragRaceEditor_state.getSelectedFacilityIndex()` | Index de facility sélectionnée (-1 si aucune). | 64 |
| `editor_dragRaceEditor_state.getSelectedLaneIndex()` | Index de voie sélectionnée (-1 si aucune). | 56 |
| `editor_dragRaceEditor_state.getSelectedStripIndex()` | Index de strip sélectionné (-1 si aucun). | 72 |
| `editor_dragRaceEditor_state.getState()` | Renvoie la table State complète. | 40 |
| `editor_dragRaceEditor_state.getTransforms()` | Table des transformations de l'éditeur. | 96 |
| `editor_dragRaceEditor_state.getUndoStack()` | Pile d'annulation (copies de dragRaceData). | 120 |
| `editor_dragRaceEditor_state.getUsingPrefabs()` | Pointeur ImGui booléen « utilise des prefabs ». | 156 |
| `editor_dragRaceEditor_state.getZoneEditPreviousEditMode()` | Mode d'édition de l'éditeur actif avant l'entrée en édition de zone. | 176 |
| `editor_dragRaceEditor_state.getZoneEditTarget()` | Cible de l'édition de zone (type stripZone ou laneZone, avec strip/lane). | 168 |
| `editor_dragRaceEditor_state.setCurrentFileDir(dir)` | Fixe le dossier du fichier courant. | 108 |
| `editor_dragRaceEditor_state.setCurrentFileName(name)` | Fixe le nom du fichier courant. | 116 |
| `editor_dragRaceEditor_state.setDragRaceData(data)` | Fixe les données de course. | 52 |
| `editor_dragRaceEditor_state.setErrorTimeout(timeout)` | Fixe la durée restante d'affichage de l'erreur. | 152 |
| `editor_dragRaceEditor_state.setHasUnsavedChanges(value)` | Fixe le drapeau de modifications non sauvées. | 92 |
| `editor_dragRaceEditor_state.setLastError(error)` | Fixe le message d'erreur. | 144 |
| `editor_dragRaceEditor_state.setMouseInfo(info)` | Fixe la table d'info souris. | 84 |
| `editor_dragRaceEditor_state.setRedoStack(stack)` | Remplace la pile de rétablissement. | 132 |
| `editor_dragRaceEditor_state.setSelectedFacilityIndex(index)` | Fixe l'index de facility sélectionnée. | 68 |
| `editor_dragRaceEditor_state.setSelectedLaneIndex(index)` | Fixe l'index de voie sélectionnée. | 60 |
| `editor_dragRaceEditor_state.setSelectedStripIndex(index)` | Fixe l'index de strip sélectionné. | 76 |
| `editor_dragRaceEditor_state.setState(newState)` | Remplace toute la table State. | 44 |
| `editor_dragRaceEditor_state.setTransforms(transforms)` | Fixe la table des transformations. | 100 |
| `editor_dragRaceEditor_state.setUndoStack(stack)` | Remplace la pile d'annulation. | 124 |
| `editor_dragRaceEditor_state.setZoneEditPreviousEditMode(mode)` | Mémorise le mode d'édition précédent. | 180 |
| `editor_dragRaceEditor_state.setZoneEditTarget(target)` | Fixe la cible d'édition de zone. | 172 |

### Détail des paramètres

#### `editor_dragRaceEditor_state.getCurrentFileDir()`

Dossier du fichier courant.

- **renvoie** : string dossier, "/levels/" par défaut

#### `editor_dragRaceEditor_state.getCurrentFileName()`

Nom du fichier courant.

- **renvoie** : string|nil nom

#### `editor_dragRaceEditor_state.getDragRaceData()`

Données de course en cours d'édition.

- **renvoie** : table|nil dragRaceData

#### `editor_dragRaceEditor_state.getErrorTimeout()`

Durée restante (s) d'affichage de l'erreur.

- **renvoie** : number secondes

#### `editor_dragRaceEditor_state.getHasEndCamera()`

Pointeur ImGui booléen « a une caméra de fin ».

- **renvoie** : userdata im.BoolPtr

#### `editor_dragRaceEditor_state.getHasUnsavedChanges()`

Indique s'il y a des modifications non sauvegardées.

- **renvoie** : boolean drapeau

#### `editor_dragRaceEditor_state.getLastError()`

Dernier message d'erreur affiché.

- **renvoie** : string|nil message

#### `editor_dragRaceEditor_state.getMaxUndoSteps()`

Nombre maximal d'étapes d'annulation (20).

- **renvoie** : integer 20

#### `editor_dragRaceEditor_state.getMouseInfo()`

Table d'info souris remplie par utils.updateMouseInfo.

- **renvoie** : table|nil mouseInfo

#### `editor_dragRaceEditor_state.getRedoStack()`

Pile de rétablissement.

- **renvoie** : table pile

#### `editor_dragRaceEditor_state.getSearch()`

Objet searchUtil utilisé pour les listes déroulantes avec recherche.

- **renvoie** : table searchUtil

#### `editor_dragRaceEditor_state.getSelectedFacilityIndex()`

Index de facility sélectionnée (-1 si aucune).

- **renvoie** : integer index

#### `editor_dragRaceEditor_state.getSelectedLaneIndex()`

Index de voie sélectionnée (-1 si aucune).

- **renvoie** : integer index

#### `editor_dragRaceEditor_state.getSelectedStripIndex()`

Index de strip sélectionné (-1 si aucun).

- **renvoie** : integer index

#### `editor_dragRaceEditor_state.getState()`

Renvoie la table State complète.

- **renvoie** : table état

#### `editor_dragRaceEditor_state.getTransforms()`

Table des transformations de l'éditeur.

- **renvoie** : table transforms

#### `editor_dragRaceEditor_state.getUndoStack()`

Pile d'annulation (copies de dragRaceData).

- **renvoie** : table pile

#### `editor_dragRaceEditor_state.getUsingPrefabs()`

Pointeur ImGui booléen « utilise des prefabs ».

- **renvoie** : userdata im.BoolPtr

#### `editor_dragRaceEditor_state.getZoneEditPreviousEditMode()`

Mode d'édition de l'éditeur actif avant l'entrée en édition de zone.

- **renvoie** : any mode

#### `editor_dragRaceEditor_state.getZoneEditTarget()`

Cible de l'édition de zone (type stripZone ou laneZone, avec strip/lane).

- **renvoie** : table|nil cible

#### `editor_dragRaceEditor_state.setCurrentFileDir(dir)`

Fixe le dossier du fichier courant.

- `dir` (*string*) : dossier

#### `editor_dragRaceEditor_state.setCurrentFileName(name)`

Fixe le nom du fichier courant.

- `name` (*string|nil*) : nom

#### `editor_dragRaceEditor_state.setDragRaceData(data)`

Fixe les données de course.

- `data` (*table|nil*) : données

#### `editor_dragRaceEditor_state.setErrorTimeout(timeout)`

Fixe la durée restante d'affichage de l'erreur.

- `timeout` (*number*) : secondes

#### `editor_dragRaceEditor_state.setHasUnsavedChanges(value)`

Fixe le drapeau de modifications non sauvées.

- `value` (*boolean*) : drapeau

#### `editor_dragRaceEditor_state.setLastError(error)`

Fixe le message d'erreur.

- `error` (*string|nil*) : message

#### `editor_dragRaceEditor_state.setMouseInfo(info)`

Fixe la table d'info souris.

- `info` (*table|nil*) : mouseInfo

#### `editor_dragRaceEditor_state.setRedoStack(stack)`

Remplace la pile de rétablissement.

- `stack` (*table*) : pile

#### `editor_dragRaceEditor_state.setSelectedFacilityIndex(index)`

Fixe l'index de facility sélectionnée.

- `index` (*integer*) : index

#### `editor_dragRaceEditor_state.setSelectedLaneIndex(index)`

Fixe l'index de voie sélectionnée.

- `index` (*integer*) : index

#### `editor_dragRaceEditor_state.setSelectedStripIndex(index)`

Fixe l'index de strip sélectionné.

- `index` (*integer*) : index

#### `editor_dragRaceEditor_state.setState(newState)`

Remplace toute la table State.

- `newState` (*table*) : nouvel état

#### `editor_dragRaceEditor_state.setTransforms(transforms)`

Fixe la table des transformations.

- `transforms` (*table*) : transforms

#### `editor_dragRaceEditor_state.setUndoStack(stack)`

Remplace la pile d'annulation.

- `stack` (*table*) : pile

#### `editor_dragRaceEditor_state.setZoneEditPreviousEditMode(mode)`

Mémorise le mode d'édition précédent.

- `mode` (*any*) : mode

#### `editor_dragRaceEditor_state.setZoneEditTarget(target)`

Fixe la cible d'édition de zone.

- `target` (*table|nil*) : cible

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dragRaceEditor/state.lua`.*
