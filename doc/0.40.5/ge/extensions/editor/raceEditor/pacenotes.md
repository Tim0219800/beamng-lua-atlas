# `editor_raceEditor_pacenotes`

*Fichier : `lua/ge/extensions/editor/raceEditor/pacenotes.lua` · VM : Game Engine (GE) · 433 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/raceEditor/pacenotes")` (fichier sous extensions/ mais pas une extension classique)

Sous-fenêtre « Pacenotes » de l'éditeur de course (raceEditor). Elle permet de lister, sélectionner, créer (Shift + glisser dans le monde pour définir position, rayon et direction), déplacer au gizmo, et supprimer des pacenotes du chemin courant (path.pacenotes). Les actions passent par editor.history (annuler/rétablir). Le module renvoie un constructeur : require('/lua/ge/extensions/editor/raceEditor/pacenotes')(raceEditor).

## Remarques

- Cette fenêtre est commentée dans raceEditor.lua (table.insert ... pacenotes) : elle n'est pas chargée dans le jeu 0.40.5.
- C:selectPacenote teste self.note, champ qui n'est jamais défini dans ce fichier ; s'il était renseigné, la fonction se rappellerait elle-même indéfiniment. C:onEditModeActivate teste aussi self.note.
- C:selector indexe segments.objects[node[fieldName]] : avec la valeur -1 (« None ») l'entrée n'existe pas dans la table, ce qui provoquerait une erreur sur .name.

## Classe `C`

Fenêtre Pacenotes. Créée par le constructeur renvoyé par le module, avec init(raceEditor). windowDescription = 'Pacenotes'. Les méthodes sont appelées par raceEditor.lua (setPath, selected, unselect, draw, onEditModeActivate).

Le module renvoie un constructeur : `local obj = require("editor_raceEditor_pacenotes")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:beginDrag()` | Début de manipulation au gizmo : mémorise l'état sérialisé, la rotation et le rayon de la pacenote (navRadiusScale si mode navgraph). | 87 |
| `C:createManualPacenote()` | Affiche l'aide de création et l'aperçu (sphère, prismes) pendant le glisser, puis au relâchement crée une pacenote manuelle (rayon 5 si le glisser est ≤ 1 m) via l'historique ; la direction est donnée par le glisser. | 174 |
| `C:dragging()` | Pendant la manipulation : applique translation (pos), rotation (normal) ou mise à l'échelle (radius, jamais négatif) du gizmo à la pacenote. | 101 |
| `C:draw(mouseInfo)` | Appelé à chaque frame : mémorise mouseInfo, gère gizmo et entrées si autorisé, puis dessine la liste et le panneau de détail. | 165 |
| `C:drawPacenoteList()` | Dessine la liste des pacenotes triées (+ entrée « New... ») et le panneau de la pacenote courante (suppression, déplacement, champs). | 273 |
| `C:endDragging()` | Fin de manipulation : valide l'action d'historique « Manipulated Note via Gizmo » (avant/après via onSerialize/onDeserialized). | 140 |
| `C:init(raceEditor)` | Initialise la fenêtre : mémorise raceEditor, index de sélection nil et mouseInfo vide. | 17 |
| `C:input()` | Gère la souris : avec Shift, création manuelle ; sinon clic sur une pacenote pour la sélectionner (ou aucune). | 247 |
| `C:mouseOverPacenotes()` | Renvoie la pacenote dont la sphère est traversée par le rayon souris, la plus proche de la caméra. | 230 |
| `C:onEditModeActivate()` | Appelé à l'activation du mode d'édition de course (voir notes). | 159 |
| `C:selectPacenote(id)` | Sélectionne la pacenote d'ID id (nil pour aucune). Voir notes sur le rappel récursif conditionnel à self.note. | 49 |
| `C:selected()` | Appelé quand l'onglet devient actif : désélectionne, dessine les pacenotes en mode « normal », les segments en « faded », ajoute le raccourci Shift « Add New » et récupère la carte de navigation (map.getMap()). | 27 |
| `C:selector(name, fieldName, tt)` | Liste déroulante pour choisir un segment (ou « None » = -1) dans un champ de la pacenote courante, avec action d'historique. | 401 |
| `C:setPath(path)` | Définit le chemin de course (gameplay/race/path) édité. | 23 |
| `C:unselect()` | Appelé quand l'onglet est quitté : cache les pacenotes (_drawMode = 'none') et retire le raccourci Shift. | 41 |
| `C:updateTransform(index)` | Place le gizmo d'axes sur la pacenote d'index donné, orienté selon sa normale en alignement local. Sans effet si le gizmo n'est pas autorisé. | 67 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `scenetree.` `findClassObjects`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/raceEditor/pacenotes.lua`.*
