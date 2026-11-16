# `editor_raceEditor_segments`

*Fichier : `lua/ge/extensions/editor/raceEditor/segments.lua` · VM : Game Engine (GE) · 443 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/raceEditor/segments")` (fichier sous extensions/ mais pas une extension classique)

Sous-fenêtre « Segments » de l'éditeur de course (raceEditor). Un segment relie deux pathnodes (From/To) et a un mode : waypoint, capsules ou navpath (si getBeNavpath()). En mode capsules, on édite une liste de points-capsules (position, rayon) au gizmo ou au clavier. Alt + clic sur un nœud définit la source, Shift + clic la cible, Ctrl affiche des sphères au milieu des capsules pour en insérer une. Les modifications passent par editor.history. Le module renvoie un constructeur : require('/lua/ge/extensions/editor/raceEditor/segments')(raceEditor).

## Remarques

- Bug : C:endDragging référence serializedUndo et serializedRedo, mais ces fonctions locales sont déclarées après lui dans le fichier ; elles sont donc nil (globales) au moment de la compilation et l'action d'historique du gizmo est passée sans undo/redo valides. Les autres actions (addHistory) fonctionnent car elles sont définies après les locales.
- Le bouton « Remove » d'une capsule nomme son action d'historique « Added Capsule » (copier-coller).
- Les pacenotes du segment sélectionné sont affichées, les autres masquées.

## Classe `C`

Fenêtre Segments (windowDescription = 'Segments'). Instanciée avec init(raceEditor).

Le module renvoie un constructeur : `local obj = require("editor_raceEditor_segments")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addHistory(name, old)` | Valide une action d'historique pour le segment courant à partir de l'état sérialisé précédent et de l'état actuel ; undo/redo restaurent le segment et la capsule sélectionnés. | 135 |
| `C:beginDrag()` | Début de manipulation au gizmo : mémorise le rayon de la capsule et l'état sérialisé du segment. | 81 |
| `C:dragging()` | Pendant la manipulation : applique translation (pos) ou échelle (radius, jamais négatif) à la capsule. | 88 |
| `C:draw(mouseInfo)` | Appelé à chaque frame : mémorise mouseInfo, gère gizmo et entrées si autorisé, puis dessine la liste des segments et le panneau. | 142 |
| `C:drawSegmentList()` | Dessine la liste des segments (« (!) » si un nœud est manquant), le bouton Create et le panneau du segment : suppression, déplacement, nom, From/To, mode, et les capsules (liste, position, rayon, Add Before/After, Remove). | 239 |
| `C:endDragging()` | Fin de manipulation : tente de valider l'action d'historique « Manipulated Capsule Node via Gizmo » (voir notes : fonctions undo/redo nil). | 112 |
| `C:init(raceEditor)` | Mémorise raceEditor ; index de segment et de capsule à nil. | 12 |
| `C:input()` | Gère la souris pour le segment sélectionné : Alt/Shift + clic sur un nœud pour changer source/cible ; en mode capsules, clic pour sélectionner une capsule et Ctrl + clic au milieu de deux capsules pour en ajouter une. | 151 |
| `C:mouseDistanceTo(point, mouseInfo)` | Distance caméra-point si le rayon souris traverse la sphère du point, sinon -1. | 222 |
| `C:selectCapsule(index)` | Sélectionne un point-capsule du segment courant et place le gizmo dessus. | 63 |
| `C:selectSegment(index)` | Sélectionne le segment d'ID index (nil pour aucun) : met en surbrillance, charge le nom, définit les raccourcis Shift « Set Target » / Alt « Set Source » et n'affiche que les pacenotes de ce segment. | 39 |
| `C:selected()` | Appelé quand l'onglet devient actif : désélectionne et dessine les segments en « normal ». | 22 |
| `C:setPath(path)` | Définit le chemin de course édité. | 18 |
| `C:unselect()` | Appelé quand l'onglet est quitté : segments en « faded », retire les raccourcis Shift et Alt. | 30 |
| `C:updateTransform()` | Place le gizmo sur la capsule sélectionnée (sans effet si le gizmo est interdit ou si aucune capsule n'est choisie). | 68 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawTextAdvanced`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/raceEditor/segments.lua`.*
