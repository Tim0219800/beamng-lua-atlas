# `editor_crawlEditor_boundaries`

*Fichier : `lua/ge/extensions/editor/crawlEditor/boundaries.lua` · VM : Game Engine (GE) · 751 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/crawlEditor/boundaries")` (fichier sous extensions/ mais pas une extension classique)

Sous-outil « Boundaries » de l'éditeur de crawl : édite les zones-frontières (objets gameplay/sites/zone) d'un niveau ou d'une mission. Le module renvoie un constructeur : require('editor_crawlEditor_boundaries')(crawlEditor) crée une instance C. L'outil liste les frontières, affiche le détail (nom, nom de fichier, sommets, aire, limites de hauteur haut/bas, champs personnalisés), permet d'ajouter/insérer/déplacer/supprimer des sommets au gizmo ou à la souris, de générer des plans (autoPlanes) et une clôture haute résolution, et de créer un DecalRoad suivant le contour. Les modifications de sommets et de plans passent par editor.history (annulables) et marquent la frontière comme modifiée (_dirty).

## Exemple

```lua
local boundaries = require('editor_crawlEditor_boundaries')(crawlEditorInstance)
boundaries:setBoundary(maZone)
-- à chaque frame, avec la table mouseInfo de crawlEditor/input :
boundaries:draw(mouseInfo)
```

## Remarques

- Commandes souris dans la vue : Shift + clic = ajoute un sommet à la fin (à la position du clic) ; Alt + clic sur le milieu d'une arête = insère un sommet ; clic = sélectionne le sommet ; Ctrl + clic = ajoute à la sélection. Les sommets sont affichés par des sphères de rayon distance_caméra/40.
- Le déplacement des sommets au gizmo est accroché au terrain par défaut (snapToTerrain = true) ; endDragging réapplique le snap et enregistre « Manipulate Boundary Vertices ».
- Dans dragging(), le décalage de translation du gizmo est divisé par 2 (posOffset = delta / 2) : comportement du code, probablement une compensation voulue mais non commentée.
- dropToTerrain renvoie (pos, true) si core_terrain existe, même si getTerrainHeight renvoie nil (alors la hauteur d'origine est gardée) ; sinon (pos, false).
- drawBoundaryDetail affiche deux fois le nombre de sommets et l'aire (bloc « Live boundary stats » puis « Vertex Count / Area »).
- Le bouton Rename du nom de fichier appelle editor_crawlEditor.renameObjectFile(ancienChemin, nouveauChemin, 'boundary') si cette fonction existe.
- « Create Decal Road » exige au moins 3 sommets : crée un DecalRoad (matériau a_asphalt_01_a, looped, largeur de nœud 0,1) dans MissionGroup.

## Classe `C`

Instance de l'outil frontières, créée par le constructeur renvoyé par le module. Champs principaux : crawlEditor, boundary (zone en cours d'édition), currentVertices (sommets sélectionnés), currentPlane (plan de hauteur sélectionné), snapToTerrain, fields (tampons imgui des champs personnalisés).

Le module renvoie un constructeur : `local obj = require("editor_crawlEditor_boundaries")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:beginDrag()` | Début de manipulation du gizmo : mémorise la position du gizmo, celles des sommets sélectionnés et la rotation du plan. | 506 |
| `C:clearSelection()` | Vide la sélection de sommets et de plan. | 113 |
| `C:dragging()` | Pendant la manipulation : translate (avec snap terrain) ou fait tourner autour du centroïde les sommets sélectionnés, ou déplace/oriente le plan sélectionné, puis recalcule la zone (processVertices). | 519 |
| `C:draw(mouseInfo)` | Appelée à chaque frame : met à jour le gizmo d'axes (begin/end/dragging), le dessine, traite l'entrée souris et met à jour sa transformation. | 625 |
| `C:drawBoundariesList(allBoundaries, selection)` | Dessine la liste des frontières avec le bouton « Add Boundary » et un menu contextuel (clic droit) « Delete ». Remplit selection.index et selection.clicked. | 118 |
| `C:drawBoundaryDetail(boundary)` | Dessine le panneau de détail d'une frontière : Goto, statistiques, nom, nom de fichier, sommets, Auto Planes, High Res Fence, Create Decal Road, limites haute/basse, position de souris, champs personnalisés. | 158 |
| `C:drawBoundaryEditor()` | Dessine le détail de la frontière courante, ou « No boundary selected ». | 640 |
| `C:drawCustomFields(fields)` | Dessine l'éditeur de champs personnalisés (string, number, vec3 avec repère 3D) avec boutons X, New String, New Number, Copy Fields et Paste Fields. | 649 |
| `C:dropToTerrain(pos)` | Pose un point sur la hauteur du terrain. | 586 |
| `C:endDragging()` | Fin de manipulation : re-snap au terrain, enregistre l'action « Manipulate Boundary Vertices » dans l'historique, marque la frontière modifiée. | 595 |
| `C:findVert(mouseInfo, objects)` | Dessine des sphères sur les points donnés (orange si sélectionnés) et renvoie le plus proche de la caméra dont le rayon de souris passe dans la sphère. | 378 |
| `C:getNewBoundary()` | Crée une nouvelle zone vide nommée « New Boundary » via gameplay/sites/zone. | 374 |
| `C:init(crawlEditorParam)` | Initialise l'instance (appelé par le constructeur). | 88 |
| `C:input(mouseInfo)` | Traite l'entrée souris : Shift = ajout de sommet, Alt = insertion, sinon sélection (Ctrl = multiple) des sommets. | 436 |
| `C:setBoundary(boundaryParam)` | Définit la frontière éditée. | 109 |
| `C:setFields(boundary)` | Recopie le nom et le nom de fichier de la frontière dans les tampons de saisie imgui. | 102 |
| `C:tryInsert(mouseInfo)` | Cherche un clic sur le milieu d'une arête (Alt maintenu) et, si trouvé, insère un sommet via l'historique (« Insert Boundary Vertex »). | 413 |
| `C:updateTransform()` | Place le gizmo d'axes au centroïde des sommets sélectionnés, ou sur le plan de hauteur sélectionné (orienté selon l'alignement local/global). | 478 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/crawlEditor/boundaries.lua`.*
