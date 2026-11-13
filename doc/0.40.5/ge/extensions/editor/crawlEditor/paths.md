# `editor_crawlEditor_paths`

*Fichier : `lua/ge/extensions/editor/crawlEditor/paths.lua` · VM : Game Engine (GE) · 833 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/crawlEditor/paths")` (fichier sous extensions/ mais pas une extension classique)

Sous-outil « Paths » de l'éditeur de crawl : édite les chemins (table {name, description, nodes}) formés de nœuds (pathnodes) {name, pos, rotation, radius, flags}. Le module renvoie un constructeur : require('editor_crawlEditor_paths')(crawlEditor) crée une instance C. L'outil liste les chemins, affiche le détail (nom, nom de fichier, description, nombre de nœuds, longueur, dénivelé cumulé), permet d'ajouter, insérer, déplacer (gizmo) ou supprimer des nœuds, de les orienter, renuméroter, caler au terrain, d'inverser le chemin, de fixer un rayon commun et de valider le chemin. Dessine aussi les nœuds dans le monde (sphères, flèches de direction, étiquettes, distances cumulées).

## Exemple

```lua
local paths = require('editor_crawlEditor_paths')(crawlEditorInstance)
paths:setPath(monChemin)
-- à chaque frame :
paths:draw(mouseInfo)
paths:drawPathnodeSelectionIndicators(mouseInfo)
```

## Remarques

- Commandes souris : Shift + clic = ajoute un nœud à l'endroit cliqué (calé au terrain si snapToTerrain) ; Alt + clic sur le milieu d'un segment = insère un nœud entre ses deux extrémités (le dernier segment relie le dernier nœud au premier dans la détection) ; clic = sélectionne un nœud ; clic dans le vide = désélectionne.
- Nouveau nœud (getNewPathnode) : nom « Node N », pos (0,0,0), rotation identité, rayon 4.0, flags vide.
- Flags de nœud utilisés par l'outil : isRecoveryCheckpoint (sphère verte) et isBonusCheckpoint (sphère dorée) ; les autres flags sont éditables en JSON.
- Dans dragging(), le décalage de translation du gizmo est divisé par 2 (posOffset = delta / 2), comportement du code ; en mode rotation, la rotation du nœud est celle du gizmo.
- dropToTerrain renvoie (pos, true) dès que core_terrain existe, même si la hauteur est nil (z conservé) ; sinon (pos, false).
- validatePath signale : moins de 2 nœuds, rayon nul ou négatif, nœud en (0,0,0), absence de rotation, segment de moins de 0,5 m.
- Tout changement marque le chemin comme modifié (path._dirty = true). Les déplacements au gizmo passent par editor.history (« Manipulate Pathnode ») ; les autres opérations (ajout, renumérotation, inversion…) ne sont pas annulables.
- Dans drawPathsList, la mise à zéro de selection.index quand on reclique le même chemin est immédiatement écrasée (selection.index = i ensuite).

## Classe `C`

Instance de l'outil chemins. Champs principaux : crawlEditor, path (chemin édité), selectedPathnodeIndex (-1 = aucun), currentPathnode, snapToTerrain (true par défaut), _isDragging.

Le module renvoie un constructeur : `local obj = require("editor_crawlEditor_paths")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addNodeAtCamera()` | Ajoute un nœud 15 m devant la caméra, posé sur le terrain (si snapToTerrain), et le sélectionne. | 588 |
| `C:autoOrientNodes()` | Oriente chaque nœud (quatFromDir, haut +Z) vers le suivant ; le dernier garde la direction entrante. Ignore les segments de longueur <= 0,001. Sans effet avec moins de 2 nœuds. | 614 |
| `C:beginDrag()` | Début de manipulation du gizmo : mémorise position et rotation du nœud. | 545 |
| `C:dragging()` | Pendant la manipulation : translate (avec snap terrain) ou fait tourner le nœud selon le gizmo. | 554 |
| `C:draw(mouseInfo)` | Appelée à chaque frame : gère le gizmo d'axes si un nœud est sélectionné, traite l'entrée souris et met à jour le gizmo hors manipulation. | 720 |
| `C:drawPathDetail(path)` | Dessine le détail d'un chemin : Goto, nom, nom de fichier (Rename), description, statistiques (nœuds, longueur, dénivelé), boutons d'outils (Add Node, Add Node At Camera, Reverse Order, Auto-Orient Nodes, Renumber, Snap All To Terrain, Set All Radii, Validate Path), liste des nœuds avec Delete et éditeur du nœud sélectionné (nom, position, rotation, rayon, drapeaux de récupération/bonus, flags JSON). | 140 |
| `C:drawPathnodeSelectionIndicators(mouseInfo)` | Dessine dans le monde les nœuds (sphère de leur rayon : orange sélectionné, vert recovery, doré bonus, blanc sinon), flèches de direction, étiquettes « nom (indice) [RECOVERY/BONUS] », prismes entre nœuds et distance cumulée. | 740 |
| `C:drawPathsList(allPaths, selection)` | Dessine la liste des chemins avec « Add Path » et un menu contextuel « Delete ». Remplit selection.index et selection.clicked. | 101 |
| `C:dropToTerrain(pos)` | Pose un point sur la hauteur du terrain. | 578 |
| `C:endDragging()` | Fin de manipulation : re-snap au terrain en translation, enregistre « Manipulate Pathnode » dans l'historique, marque le chemin modifié. | 698 |
| `C:findPathnode(mouseInfo, objects)` | Dessine des sphères sur les éléments (orange si sélectionné) et renvoie le plus proche de la caméra dont le rayon de souris traverse la sphère. | 427 |
| `C:getNewPath()` | Crée une table de chemin vide : name « New Path », description « A new path », nodes vide. | 401 |
| `C:getNewPathnode()` | Crée un nœud par défaut et l'ajoute à la fin du chemin courant (crée un chemin si aucun). | 410 |
| `C:getSelectedPathnodeIndex()` | Renvoie l'indice du nœud sélectionné. | 93 |
| `C:init(crawlEditorParam)` | Initialise l'instance (appelé par le constructeur). | 60 |
| `C:input(mouseInfo)` | Traite l'entrée souris : Shift = ajout, Alt = insertion, sinon sélection de nœud. | 492 |
| `C:renumberNodes()` | Renomme tous les nœuds « Node N » dans l'ordre. | 645 |
| `C:reversePathOrder()` | Inverse l'ordre des nœuds et désélectionne. | 603 |
| `C:selectPathnode(index)` | Sélectionne le nœud d'indice donné (à partir de 1) ; un indice invalide, nil ou <= 0 désélectionne. | 84 |
| `C:setAllRadii(radius)` | Applique le même rayon à tous les nœuds. | 636 |
| `C:setFields(path)` | Recopie nom, nom de fichier et description du chemin dans les tampons de saisie imgui. | 73 |
| `C:setPath(pathParam)` | Définit le chemin édité. | 80 |
| `C:setSelectedPathnodeIndex(index)` | Alias de selectPathnode. | 97 |
| `C:snapAllToTerrain()` | Pose tous les nœuds sur le terrain. | 654 |
| `C:tryInsert(mouseInfo)` | Détecte un clic sur le milieu d'un segment et y insère un nouveau nœud, qu'il sélectionne. | 459 |
| `C:updateTransform()` | Place le gizmo d'axes sur la position et la rotation du nœud sélectionné. | 535 |
| `C:validatePath()` | Analyse le chemin et renvoie la liste des problèmes trouvés (voir notes). | 665 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/crawlEditor/paths.lua`.*
