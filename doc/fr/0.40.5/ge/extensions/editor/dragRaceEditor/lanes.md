# `editor_dragRaceEditor_lanes`

*Fichier : `lua/ge/extensions/editor/dragRaceEditor/lanes.lua` · VM : Game Engine (GE) · 296 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dragRaceEditor_lanes` : `extensions.load("editor_dragRaceEditor_lanes")`, puis la globale `editor_dragRaceEditor_lanes`

Gère la liste des voies (lanes) du drag race dans l'éditeur : chargement depuis gameplay_drag_saveSystem, sélection, ajout, suppression, sauvegarde en fichier <id>.lane.json dans le dossier drag du niveau, et dessin de l'interface ImGui (liste et détails : ID, noms, couleur, ordre, boundaryId).

## Remarques

- Les index de sélection commencent à 1 ; -1 signifie aucune sélection.
- Couleurs proposées : blue, red, green, yellow, purple, orange.
- Les waypoints des voies viennent du prefab du strip, la section Waypoints n'affiche qu'un texte d'aide.
- drawAxisBox dessine deux fois certains triangles avec des permutations différentes ; drawTransformsPreview écrit le nom de la voie en (0,0,0).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dragRaceEditor_lanes.addLane()` | Ajoute une voie « New Lane » (couleur blue, laneOrder suivant, waypointIds vide, metadata created/modified), la sélectionne et marque des modifications non sauvées. | 49 |
| `editor_dragRaceEditor_lanes.drawAxisBox(corner, x, y, z, clr)` | Dessine en debug une boîte pleine (triangles colorés et arêtes noires) à partir d'un coin et de trois vecteurs d'axes. | 245 |
| `editor_dragRaceEditor_lanes.drawLaneDetails()` | Dessine le panneau ImGui des détails de la voie sélectionnée (Basics, Waypoints, Boundary) ; les champs modifient la voie et marquent des changements non sauvés. *(interne)* | 146 |
| `editor_dragRaceEditor_lanes.drawLanesSection()` | Dessine le panneau ImGui de la liste des voies (boutons Add Lane, Remove, Save, liste sélectionnable avec infobulle). *(interne)* | 97 |
| `editor_dragRaceEditor_lanes.drawTransformsPreview()` | Affiche en debug 3D le texte « Lane: <nom> » à l'origine pour la voie sélectionnée. *(interne)* | 238 |
| `editor_dragRaceEditor_lanes.getAllLanes()` | Renvoie la liste des voies chargées. | 22 |
| `editor_dragRaceEditor_lanes.getSelectedLane()` | Renvoie la voie sélectionnée. | 34 |
| `editor_dragRaceEditor_lanes.getSelectedLaneIndex()` | Index (base 1) de la voie sélectionnée, -1 si aucune. | 26 |
| `editor_dragRaceEditor_lanes.loadAllLanes()` | Charge toutes les voies via dragSaveSystem.getAllLanes(). | 17 |
| `editor_dragRaceEditor_lanes.removeSelectedLane()` | Supprime la voie sélectionnée et déplace la sélection sur la précédente ; -1 si la liste devient vide. | 70 |
| `editor_dragRaceEditor_lanes.saveLane(lane)` | Sauvegarde la voie dans <dossier drag du niveau>/<lane.id>.lane.json via dragSaveSystem.saveLane. | 84 |
| `editor_dragRaceEditor_lanes.selectLane(index)` | Sélectionne la voie d'index donné et journalise son nom. | 41 |
| `editor_dragRaceEditor_lanes.setSelectedLaneIndex(index)` | Fixe l'index sélectionné sans journaliser. | 30 |

### Détail des paramètres

#### `editor_dragRaceEditor_lanes.drawAxisBox(corner, x, y, z, clr)`

Dessine en debug une boîte pleine (triangles colorés et arêtes noires) à partir d'un coin et de trois vecteurs d'axes.

- `corner` (*vec3*) : coin de la boîte
- `x` (*vec3*) : premier vecteur d'arête
- `y` (*vec3*) : deuxième vecteur d'arête
- `z` (*vec3*) : troisième vecteur d'arête
- `clr` (*ColorF*) : couleur de remplissage

#### `editor_dragRaceEditor_lanes.getAllLanes()`

Renvoie la liste des voies chargées.

- **renvoie** : table tableau de voies

#### `editor_dragRaceEditor_lanes.getSelectedLane()`

Renvoie la voie sélectionnée.

- **renvoie** : table|nil voie ou nil si l'index est hors bornes

#### `editor_dragRaceEditor_lanes.getSelectedLaneIndex()`

Index (base 1) de la voie sélectionnée, -1 si aucune.

- **renvoie** : integer index

#### `editor_dragRaceEditor_lanes.saveLane(lane)`

Sauvegarde la voie dans <dossier drag du niveau>/<lane.id>.lane.json via dragSaveSystem.saveLane.

- `lane` (*table*) : voie à sauver
- **renvoie** : boolean false si pas de voie ou aucun niveau chargé, sinon le résultat de dragSaveSystem.saveLane

#### `editor_dragRaceEditor_lanes.selectLane(index)`

Sélectionne la voie d'index donné et journalise son nom.

- `index` (*integer*) : index base 1

#### `editor_dragRaceEditor_lanes.setSelectedLaneIndex(index)`

Fixe l'index sélectionné sans journaliser.

- `index` (*integer*) : index base 1, -1 pour aucune

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawTextAdvanced`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dragRaceEditor/lanes.lua`.*
