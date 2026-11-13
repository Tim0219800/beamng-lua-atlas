# `editor_mapJsonEditor`

*Fichier : `lua/ge/extensions/editor/mapJsonEditor.lua` · VM : Game Engine (GE) · 820 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_mapJsonEditor` : `extensions.load("editor_mapJsonEditor")`, puis la globale `editor_mapJsonEditor`

Éditeur du fichier navgraph levels/<niveau>/map.json (menu Window > Roads > Map Json Editor). Ce fichier contient des segments de route manuels : chaînes ordonnées et nommées de BeamNGWaypoint avec surcharges de drivabilité, sens, voies, vitesse limite, etc. Les waypoints sont des objets de la scène, le fichier ne les référence que par nom. map.lua surveille le fichier et recharge le navgraph quand il est écrit. L'outil dessine les segments et waypoints en 3D (debugDrawer) et ajoute un mode d'édition « Edit Map Json ».

## Exemple

```lua
editor_mapJsonEditor.show()
editor_mapJsonEditor.saveFile()
```

## Remarques

- Clic gauche : sélectionner un segment ; Ctrl + clic gauche : ajouter un waypoint au segment.
- À la sauvegarde, les clés connues sont écrites dans un ordre fixe (drivability, oneWay, flipDirection, autoLanes, lanesLeft, lanesRight, autoJunction, hiddenInNavi, gatedRoad, type, speedLimit), les autres clés sont ajoutées triées pour ne rien perdre ; le format compact d'origine est conservé.
- Une liste nodes donnée sous forme de chaîne dans le fichier est développée en tableau au chargement.
- onSerialize/onDeserialized conservent les données non sauvegardées lors d'un rechargement Lua ; onEditorExitLevel les efface.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_mapJsonEditor.loadFile(fp)` | Lit un fichier map.json, remet la sélection à zéro et rescanne les waypoints de la scène. | 133 |
| `editor_mapJsonEditor.onDeserialized(d)` | Restaure l'état après un rechargement Lua. *(interne)* *(hook)* | 798 |
| `editor_mapJsonEditor.onEditorExitLevel()` | Appelé à la sortie du niveau : efface données, chemin, sélection et caches. *(interne)* *(hook)* | 784 |
| `editor_mapJsonEditor.onEditorGui()` | Dessine la fenêtre de l'outil (ouvrir/nouveau, SAVE, liste des segments et nœuds, options d'affichage) et le dessin 3D à chaque frame. *(interne)* *(hook)* | 659 |
| `editor_mapJsonEditor.onEditorInitialized()` | Définit le mode d'édition mapJsonEditMode, enregistre la fenêtre et l'entrée de menu (groupe Roads). *(interne)* *(hook)* | 758 |
| `editor_mapJsonEditor.onEditorToolWindowHide(windowName)` | Quand la fenêtre de l'outil est masquée, revient au mode d'édition objectSelect. *(interne)* *(hook)* | 772 |
| `editor_mapJsonEditor.onSerialize()` | Appelé avant un rechargement Lua. *(interne)* *(hook)* | 794 |
| `editor_mapJsonEditor.onWindowGotFocus(windowName)` | Quand la fenêtre de l'outil prend le focus, active le mode d'édition mapJsonEditMode. *(interne)* *(hook)* | 778 |
| `editor_mapJsonEditor.saveFile(fp)` | Écrit les segments dans le fichier (le navgraph se recharge au changement de fichier). Ne fait rien s'il n'y a pas de données ; journalise une erreur si l'écriture échoue. | 200 |
| `editor_mapJsonEditor.show()` | Affiche la fenêtre, active le mode d'édition mapJsonEditMode, charge map.json du niveau s'il n'est pas déjà ouvert, puis rescanne les waypoints. | 745 |

### Détail des paramètres

#### `editor_mapJsonEditor.loadFile(fp)`

Lit un fichier map.json, remet la sélection à zéro et rescanne les waypoints de la scène.

- `fp` (*string|nil*) : Chemin du fichier ; map.json du niveau courant si nil.
- **renvoie** : boolean true si le fichier a été lu, false sinon (pas de niveau ou lecture impossible).

#### `editor_mapJsonEditor.onDeserialized(d)`

Restaure l'état après un rechargement Lua.

- `d` (*table|nil*) : Table renvoyée par onSerialize.

#### `editor_mapJsonEditor.onEditorToolWindowHide(windowName)`

Quand la fenêtre de l'outil est masquée, revient au mode d'édition objectSelect.

- `windowName` (*string*) : Nom de la fenêtre masquée.

#### `editor_mapJsonEditor.onSerialize()`

Appelé avant un rechargement Lua.

- **renvoie** : table {data, filePath, dirty}.

#### `editor_mapJsonEditor.onWindowGotFocus(windowName)`

Quand la fenêtre de l'outil prend le focus, active le mode d'édition mapJsonEditMode.

- `windowName` (*string*) : Nom de la fenêtre.

#### `editor_mapJsonEditor.saveFile(fp)`

Écrit les segments dans le fichier (le navgraph se recharge au changement de fichier). Ne fait rien s'il n'y a pas de données ; journalise une erreur si l'écriture échoue.

- `fp` (*string|nil*) : Chemin cible ; chemin courant ou map.json du niveau par défaut.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLineInstance`, `drawSphere`, `drawTextAdvanced`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/mapJsonEditor.lua`.*
