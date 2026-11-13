# `editor_raceEditor_startPositions`

*Fichier : `lua/ge/extensions/editor/raceEditor/startPositions.lua` · VM : Game Engine (GE) · 354 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/raceEditor/startPositions")` (fichier sous extensions/ mais pas une extension classique)

Sous-fenêtre « Start Positions » de l'éditeur de course (raceEditor). Elle liste, crée (Shift + glisser : position et orientation), sélectionne, déplace au gizmo (translation et rotation), renomme, supprime et réordonne les positions de départ (path.startPositions). On peut aussi poser la position au sol (Down to Terrain), l'aligner sur le terrain, téléporter le véhicule joueur dessus (Move Vehicle Here) ou copier la position du véhicule (Set to Current Vehicle), et choisir un groupe (start, rollingStart, recovery, other, ou texte libre). Actions via editor.history. Le module renvoie un constructeur : require('/lua/ge/extensions/editor/raceEditor/startPositions')(raceEditor).

## Remarques

- Les positions du groupe « recovery » servent de positions de récupération pour les pathnodes (champs recovery/reverseRecovery).
- Le survol d'une position utilise une sphère fixe de rayon 3 m.
- « Down to Terrain » et « Align with Terrain » n'apparaissent que si la scène contient un TerrainBlock ; ils utilisent core_terrain.getTerrainHeight.

## Classe `C`

Fenêtre Start Positions (windowDescription = 'Start Positions'). Instanciée avec init(raceEditor).

Le module renvoie un constructeur : `local obj = require("editor_raceEditor_startPositions")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addHistory(name, old)` | Valide une action d'historique pour la position courante à partir de l'état sérialisé précédent et de l'état actuel. | 144 |
| `C:beginDrag()` | Début de manipulation au gizmo : mémorise la rotation et l'état sérialisé. | 102 |
| `C:createStartPosition()` | Affiche l'aide et l'aperçu (prismes) pendant le glisser, puis au relâchement crée une position (position = point d'appui, orientation = direction du glisser) via l'historique. | 151 |
| `C:dragging()` | Pendant la manipulation : applique translation (pos) ou rotation (rot). | 109 |
| `C:draw(mouseInfo)` | Appelé à chaque frame : mémorise mouseInfo, gère gizmo et entrées si autorisé, puis dessine la liste et le panneau. | 211 |
| `C:drawStartPositions()` | Dessine la liste des positions et le panneau de la position courante : suppression, déplacement dans la liste, nom, position, terrain, véhicule, groupe. | 223 |
| `C:endDragging()` | Fin de manipulation : valide l'action « Moved Start Position by Gizmo ». | 126 |
| `C:hoveringStartPosition()` | Renvoie la position de départ survolée par le rayon souris (sphère de 3 m), la plus proche de la caméra. | 69 |
| `C:init(raceEditor)` | Mémorise raceEditor et met l'index de sélection à nil. | 13 |
| `C:input()` | Gère la souris : avec Shift, création ; sinon clic pour sélectionner ou désélectionner. | 86 |
| `C:onEditModeActivate()` | Appelé à l'activation du mode d'édition : resélectionne la position courante si elle existe. | 205 |
| `C:selectStartPosition(id)` | Sélectionne la position d'ID id (nil pour aucune) : surbrillance, charge nom et groupe, place le gizmo. | 39 |
| `C:selected()` | Appelé quand l'onglet devient actif : désélectionne, dessine les positions en « normal » et ajoute le raccourci Shift « Add New ». | 22 |
| `C:setPath(path)` | Définit le chemin de course édité. | 18 |
| `C:unselect()` | Appelé quand l'onglet est quitté : positions en « faded », retire le raccourci Shift. | 31 |
| `C:updateTransform(index)` | Place le gizmo sur la position (orienté selon sp.rot en alignement local). Sans effet si le gizmo est interdit. | 52 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawSquarePrism`, `drawTextAdvanced`
- `scenetree.` `findClassObjects`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/raceEditor/startPositions.lua`.*
