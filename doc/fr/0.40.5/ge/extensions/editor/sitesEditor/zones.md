# `editor_sitesEditor_zones`

*Fichier : `lua/ge/extensions/editor/sitesEditor/zones.lua` · VM : Game Engine (GE) · 412 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/sitesEditor/zones")` (fichier sous extensions/ mais pas une extension classique)

Sous-éditeur 'Zones' de l'éditeur de sites. Le module renvoie un constructeur de classe C. Une zone est un polygone de sommets (vertices) avec éventuellement des plans haut et bas (top, bot). L'éditeur permet d'ajouter un sommet (Shift+clic), d'insérer un sommet au milieu d'une arête (Alt+clic), de sélectionner des sommets (clic, Ctrl pour en ajouter), de les déplacer avec le gizmo (avec aimantation au terrain, activée par défaut), de supprimer des sommets, de générer les plans automatiquement et de subdiviser la clôture. Il affiche aussi sommets, aire et si le joueur est dans la zone.

## Remarques

- L'aimantation au terrain utilise core_terrain.getTerrainHeight ; sans core_terrain, dropToTerrain renvoie false.
- Dans dragging, le déplacement du gizmo est divisé par 2 puis ajouté plusieurs fois (vertex.pos + posOffset, puis dropToTerrain(vertex.pos + posOffset)) : comportement tel que dans le code.
- findZone choisit la zone dont rayIntersectsZone donne la plus petite distance.
- Les actions de création, suppression et déplacement de sommets passent par editor.history.

## Classe `C`

Objet renvoyé par le constructeur. Champs : sitesEditor, key, current (zone), currentVertices (sommets sélectionnés), currentPlane (plan top ou bot en édition).

Le module renvoie un constructeur : `local obj = require("editor_sitesEditor_zones")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:beginDrag()` | Début de glissement : mémorise la position du gizmo, celle des sommets et la rotation du plan. | 154 |
| `C:create()` | Crée une zone (action annulable 'Create Zone') et la renvoie. | 294 |
| `C:dragging()` | Pendant le glissement : translation ou rotation des sommets (autour de leur centroïde), du plan, avec aimantation au terrain. | 167 |
| `C:drawElement(zone)` | Dessine l'éditeur de zone : gizmo, boutons (Select All Vertices, Delete Current Vertices, Auto Planes, Divide), cases Snap To Terrain, Top Plane, Bottom Plane, et infos (nombre de sommets, aire, temps de calcul, joueur dedans). | 307 |
| `C:dropToTerrain(pos)` | Projette une position sur la hauteur du terrain. | 234 |
| `C:endDragging()` | Fin de glissement : aimante au terrain, recalcule les sommets (processVertices) et enregistre l'action annulable 'Dragged Vertices'. | 257 |
| `C:findVert(mouseInfo, objects)` | Dessine une sphère par sommet (orange si sélectionné) et renvoie le sommet le plus proche de la caméra touché par le rayon souris (rayon de sphère = distance caméra / 40). | 33 |
| `C:findZone(mouseInfo, objects)` | Renvoie la zone traversée par le rayon souris à la plus petite distance (obj:rayIntersectsZone). | 389 |
| `C:init(sitesEditor, key)` | Constructeur : mémorise sitesEditor, la clé et une sélection de sommets vide. | 11 |
| `C:input(mouseInfo)` | Gère la souris : sélection d'une zone par clic (Ctrl pour basculer), ajout de sommet avec Shift, insertion avec Alt, sinon sélection de sommets. | 88 |
| `C:remove(zone)` | Supprime une zone (action annulable 'Remove Zone'). | 301 |
| `C:select(zone)` | Sélectionne une zone, replace le gizmo et vide la sélection de sommets et de plan. | 24 |
| `C:setSites(sites)` | Définit les sites édités et désélectionne. | 18 |
| `C:tryInsert(mouseInfo)` | Avec Alt : teste les milieux d'arêtes et, sur clic, insère un sommet à cet endroit. | 67 |
| `C:updateTransform()` | Place le gizmo au centroïde des sommets sélectionnés, ou sur le plan en édition (orientation locale ou monde). | 128 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`
- `obj:` `rayIntersectsZone`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/sitesEditor/zones.lua`.*
