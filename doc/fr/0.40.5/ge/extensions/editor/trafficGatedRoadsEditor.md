# `editor_trafficGatedRoadsEditor`

*Fichier : `lua/ge/extensions/editor/trafficGatedRoadsEditor.lua` · VM : Game Engine (GE) · 444 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_trafficGatedRoadsEditor` : `extensions.load("editor_trafficGatedRoadsEditor")`, puis la globale `editor_trafficGatedRoadsEditor`

Éditeur « Traffic Gated Roads » (menu Traffic) : place des sphères (affichées comme des cylindres verticaux de 20 m de haut, rayon réglable) dans le monde et les enregistre dans un JSON, par défaut /gameplay/trafficGatedRoads.json. Chaque sphère a id, name, pos {x,y,z}, quat {x,y,z,w} et radius (10 par défaut). Ctrl+clic ajoute une sphère, Maj+clic duplique la sélection, clic sélectionne, Suppr supprime ; un gizmo déplace, tourne ou redimensionne. Le rôle de ces données dans le trafic n'est pas défini dans ce fichier.

## Remarques

- Le bouton SAVE et le menu Save sont désactivés tant que le chemin est celui par défaut : il faut passer par Save As.
- Le déplacement avec « Snap to Terrain » lance un raycast statique vers le bas depuis 50 m au-dessus du point.
- L'état (data, filePath, sélection, nextId) est conservé lors d'un rechargement Lua via onSerialize / onDeserialized.
- Quitter la fenêtre rebascule l'éditeur en mode objectSelect ; reprendre le focus réactive le mode d'édition.
- M.allowGizmo renvoie false (et non nil) hors mode d'édition, alors que la fonction locale du même nom peut renvoyer nil.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_trafficGatedRoadsEditor.allowGizmo()` | Vrai quand le mode d'édition courant est « Edit Traffic Gated Roads » : le gizmo n'est alors autorisé. | 441 |
| `editor_trafficGatedRoadsEditor.loadData(fp)` | Charge un fichier JSON de sphères (jsonReadFile). En cas d'échec, logue une erreur et ne change rien. Sinon remplace les données, mémorise le chemin, efface la sélection et recalcule nextId. | 209 |
| `editor_trafficGatedRoadsEditor.onDeserialized(d)` | Hook appelé après un rechargement Lua : restaure l'état renvoyé par onSerialize. *(interne)* *(hook)* | 423 |
| `editor_trafficGatedRoadsEditor.onEditorGui()` | Hook appelé chaque frame d'interface : dessine la fenêtre (menu File, SAVE, liste de sphères, nom, position, rayon, case Snap to Terrain), traite la souris, dessine les cylindres avec debugDrawer:drawCylinder et le gizmo (déplacement, rotation, échelle). *(interne)* *(hook)* | 230 |
| `editor_trafficGatedRoadsEditor.onEditorInitialized()` | Hook de l'éditeur : crée le mode d'édition trafficGatedRoadsEditMode (clic gauche = Select), enregistre la fenêtre (400x500) et l'entrée de menu Traffic. *(interne)* *(hook)* | 389 |
| `editor_trafficGatedRoadsEditor.onEditorToolWindowHide(windowName)` | Hook appelé quand une fenêtre d'outil est masquée : si c'est celle-ci, revient au mode objectSelect. *(interne)* *(hook)* | 402 |
| `editor_trafficGatedRoadsEditor.onSerialize()` | Hook appelé avant un rechargement Lua : renvoie l'état à conserver. *(interne)* *(hook)* | 414 |
| `editor_trafficGatedRoadsEditor.onWindowGotFocus(windowName)` | Hook appelé quand une fenêtre prend le focus : si c'est celle-ci, réactive le mode d'édition. *(interne)* *(hook)* | 408 |
| `editor_trafficGatedRoadsEditor.saveData(fp)` | Écrit les données dans un fichier JSON (jsonWriteFile, mise en forme lisible) et mémorise le chemin. | 203 |
| `editor_trafficGatedRoadsEditor.show()` | Efface la sélection d'objets, affiche la fenêtre et passe en mode d'édition trafficGatedRoadsEditMode. | 375 |

### Détail des paramètres

#### `editor_trafficGatedRoadsEditor.allowGizmo()`

Vrai quand le mode d'édition courant est « Edit Traffic Gated Roads » : le gizmo n'est alors autorisé.

- **renvoie** : boolean Mode d'édition actif.

#### `editor_trafficGatedRoadsEditor.loadData(fp)`

Charge un fichier JSON de sphères (jsonReadFile). En cas d'échec, logue une erreur et ne change rien. Sinon remplace les données, mémorise le chemin, efface la sélection et recalcule nextId.

- `fp` (*string|nil*) : Chemin du fichier ; sans effet si nil.

#### `editor_trafficGatedRoadsEditor.onDeserialized(d)`

Hook appelé après un rechargement Lua : restaure l'état renvoyé par onSerialize.

- `d` (*table|nil*) : État sérialisé.

#### `editor_trafficGatedRoadsEditor.onEditorToolWindowHide(windowName)`

Hook appelé quand une fenêtre d'outil est masquée : si c'est celle-ci, revient au mode objectSelect.

- `windowName` (*string*) : Nom de la fenêtre masquée.

#### `editor_trafficGatedRoadsEditor.onSerialize()`

Hook appelé avant un rechargement Lua : renvoie l'état à conserver.

- **renvoie** : table { data, filePath, selectedIdx, nextId }.

#### `editor_trafficGatedRoadsEditor.onWindowGotFocus(windowName)`

Hook appelé quand une fenêtre prend le focus : si c'est celle-ci, réactive le mode d'édition.

- `windowName` (*string*) : Nom de la fenêtre.

#### `editor_trafficGatedRoadsEditor.saveData(fp)`

Écrit les données dans un fichier JSON (jsonWriteFile, mise en forme lisible) et mémorise le chemin.

- `fp` (*string|nil*) : Chemin ; par défaut le chemin courant.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/trafficGatedRoadsEditor.lua`.*
