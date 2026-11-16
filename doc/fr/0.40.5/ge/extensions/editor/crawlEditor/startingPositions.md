# `editor_crawlEditor_startingPositions`

*Fichier : `lua/ge/extensions/editor/crawlEditor/startingPositions.lua` · VM : Game Engine (GE) · 581 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/crawlEditor/startingPositions")` (fichier sous extensions/ mais pas une extension classique)

Sous-outil de l'éditeur Crawl pour éditer les positions de départ (starting positions). Le module renvoie un constructeur de classe C. Une position de départ est une table {name, description, transform = {position, rotation, radius}, iconPosition, metadata}. L'outil affiche la liste et le détail dans ImGui, dessine la zone (sphère), la flèche d'orientation et l'icône avec debugDrawer, et permet de déplacer/pivoter via le gizmo d'axes avec annulation/rétablissement (editor.history).

## Remarques

- Placement : Maj+clic place l'icône (iconPosition) ; Ctrl+clic puis glisser place la zone et oriente la rotation selon la direction du glissement.
- L'avant d'une position est l'axe Y (rotation * vec3(0,1,0)).
- snapToTerrain vaut true par défaut : dropToTerrain utilise core_terrain.getTerrainHeight ; sans core_terrain la position n'est pas modifiée et le second retour est false.
- Les modifications marquent la position avec _dirty = true pour la sauvegarde.

## Classe `C`

Instance de l'outil. Champs principaux : startingPosition (élément édité), currentTransform ("area" ou "icon" ou nil), snapToTerrain, buffers ImGui name/fileName/description.

Le module renvoie un constructeur : `local obj = require("editor_crawlEditor_startingPositions")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:beginDrag()` | Début de manipulation du gizmo : mémorise les positions/rotation de départ. | 381 |
| `C:clearSelection()` | Désélectionne la transformation (currentTransform = nil), ce qui masque le gizmo. | 253 |
| `C:dragging()` | Pendant la manipulation : applique translation ou rotation du gizmo et recolle au terrain si snapToTerrain. | 394 |
| `C:draw(mouseInfo)` | Appelé à chaque frame : traite l'entrée, affiche l'aperçu de placement avec rotation et le gizmo d'axes. | 460 |
| `C:drawStartingPositionDetail(startingPosition)` | Dessine le panneau de détail (bouton Goto qui place la caméra 15 m au-dessus, nom, description, rayon, etc.) avec enregistrement des changements dans l'historique d'annulation. | 108 |
| `C:drawStartingPositionIndicators(mouseInfo)` | Dessine dans la vue 3D la sphère de rayon réel (vert translucide), des points de sélection à taille liée à la distance caméra, la flèche d'orientation (3 m) et les étiquettes « Area: » et « Icon: ». | 520 |
| `C:drawStartingPositionsList(allStartingPositions, selection)` | Dessine le bouton « Add Starting Position » et la liste sélectionnable ; le clic droit propose Delete. Met à jour selection.index et selection.clicked. | 72 |
| `C:dropToTerrain(pos)` | Place la position à la hauteur du terrain. | 429 |
| `C:endDragging()` | Fin de manipulation : recolle au terrain et enregistre l'action (zone ou icône) dans editor.history. | 438 |
| `C:getNewStartingPosition()` | Crée une position par défaut : nom « New Starting Position », position (0,0,0), rotation identité, rayon 4.0, version de métadonnées "1.0". | 232 |
| `C:init()` | Initialise l'état (aucune sélection, snapToTerrain = true, positions précédentes du gizmo à zéro). | 55 |
| `C:input(mouseInfo)` | Gère la souris : Maj+clic place l'icône ; Ctrl+clic/glisser place la zone avec rotation. | 257 |
| `C:setFields(startingPosition)` | Remplit les buffers ImGui (nom 256, nom de fichier 256, description 1024 caractères) depuis la position de départ. | 65 |
| `C:setStartingPosition(startingPositionParam)` | Définit la position de départ en cours d'édition. | 249 |
| `C:updateTransform()` | Place le gizmo d'axes sur la zone (avec sa rotation) ou sur l'icône selon currentTransform. | 365 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/crawlEditor/startingPositions.lua`.*
