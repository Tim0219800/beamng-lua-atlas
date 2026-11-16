# `editor_raceEditor_pathnodes`

*Fichier : `lua/ge/extensions/editor/raceEditor/pathnodes.lua` · VM : Game Engine (GE) · 793 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/raceEditor/pathnodes")` (fichier sous extensions/ mais pas une extension classique)

Sous-fenêtre « Pathnodes » de l'éditeur de course (raceEditor) : édite les nœuds de chemin (path.pathnodes) du chemin courant. On peut créer un nœud manuel (Shift + glisser : position, rayon et direction), ajouter un nœud depuis le navgraph (Alt + clic), sélectionner, déplacer (gizmo ou « simple drag » si la préférence raceEditor.general.useSimpleDrag est active), supprimer, réordonner, basculer le mode manuel/navgraph, et régler position, rayon, normale, visibilité du marqueur, « Use as Split », positions de récupération avant/arrière et champs personnalisés. Toutes les modifications passent par editor.history (annuler/rétablir). Le module renvoie un constructeur : require('/lua/ge/extensions/editor/raceEditor/pathnodes')(raceEditor).

## Remarques

- Création manuelle : si un nœud précédent existe, un segment est créé automatiquement entre le dernier nœud trié et le nouveau ; la route IA est recalculée (editor_raceEditor.calculateAiRoute).
- La normale n'est créée à la création que si la préférence raceEditor.general.directionalNodes est vraie.
- En mode navgraph, le gizmo ne déplace pas le nœud (message « Set node to manual to move via Gizmo. ») ; l'échelle agit sur navRadiusScale au lieu de radius.
- Dans autoRecoverPos, la fonction « redo » utilise la variable locale node capturée à la création de l'action (pas data) pour le nom de la position.
- C:onEditModeActivate teste self.node, champ jamais défini dans ce fichier : la resélection ne se produit donc jamais.
- Raccourcis : Shift = ajouter un nœud manuel, Alt = ajouter un nœud du navgraph.

## Classe `C`

Fenêtre Pathnodes (windowDescription = 'Pathnodes'). Instanciée par le constructeur du module avec init(raceEditor). raceEditor.lua appelle setPath, selected, unselect, draw et onEditModeActivate.

Le module renvoie un constructeur : `local obj = require("editor_raceEditor_pathnodes")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:autoRecoverPos(reverse)` | Crée automatiquement une position de départ de groupe « recovery » à l'emplacement du nœud (direction inversée si reverse) et l'affecte au champ recovery ou reverseRecovery du nœud. | 725 |
| `C:beginDrag()` | Début de manipulation au gizmo : mémorise l'état sérialisé, la rotation et le rayon du nœud. | 80 |
| `C:createManualPathnode()` | Affiche l'aide et l'aperçu (sphère, prismes de direction) pendant le glisser, puis au relâchement crée un nœud manuel (et un segment depuis le dernier nœud) via l'historique. | 271 |
| `C:dragging()` | Pendant la manipulation : applique translation (mode manuel seulement), rotation de la normale (si le nœud en a une) ou échelle du rayon. | 94 |
| `C:draw(mouseInfo)` | Appelé à chaque frame : mémorise mouseInfo, gère gizmo et entrées si autorisé, puis dessine la liste et le panneau du nœud. | 262 |
| `C:drawCustomFields(fields)` | Dessine l'éditeur de champs personnalisés et les boutons Copy Fields / Paste Fields (copie dans self.cfData). | 705 |
| `C:drawPathnodeList()` | Dessine la liste des nœuds (préfixe « * » si useAsSplit, parenthèses si non visible) et le panneau du nœud courant : suppression, déplacement dans la liste, nom, mode, position/rayon, normale, visibilité, split, positions de récupération. | 461 |
| `C:endDragging()` | Fin de manipulation : valide l'action d'historique avec l'état avant/après du nœud. | 147 |
| `C:handleMouseDown(hovered)` | Mode simple drag : au clic, autorise le glissement si on clique le nœud déjà sélectionné, sinon sélectionne le nœud survolé ou désélectionne. | 173 |
| `C:handleMouseHold()` | Mode simple drag : pendant le maintien, calcule la position projetée au sol par lancer de rayon statique (forêt désactivée en collision) et dessine une sphère et le nom du nœud. | 224 |
| `C:handleMouseUp()` | Mode simple drag : au relâchement, valide l'action « Manipulated Node via Simple Drag » avec la nouvelle position. | 234 |
| `C:init(raceEditor)` | Mémorise raceEditor, index de sélection nil, mouseInfo vide et crée un utilitaire de champs personnalisés (customFieldsUtil). | 18 |
| `C:input()` | Gère la souris : Alt = nœud navgraph, Shift = création manuelle, sinon sélection (clic simple, ou simple drag selon la préférence). | 416 |
| `C:mouseOverPathnodes()` | Renvoie le nœud dont la sphère (rayon radius) est traversée par le rayon souris, le plus proche de la caméra. | 399 |
| `C:onEditModeActivate()` | Appelé à l'activation du mode d'édition (voir notes : inopérant). | 256 |
| `C:selectNavgraphNode()` | Mode Alt : survole les waypoints manuels du navgraph (map.getManualWaypoints) et permet d'en ajouter un comme pathnode. | 331 |
| `C:selectPathnode(id)` | Sélectionne le nœud d'ID id (nil pour aucun) : met en surbrillance ce nœud, place le gizmo, charge le nom et les champs personnalisés. | 47 |
| `C:selected()` | Appelé quand l'onglet devient actif : désélectionne, met tous les nœuds en dessin « normal », ajoute le raccourci Shift « Add New » et récupère la carte (map.getMap()). | 29 |
| `C:selectedPathnode()` | Renvoie le nœud sélectionné s'il existe et n'est pas manquant. | 166 |
| `C:selector(name, fieldName, clrI, tt)` | Liste déroulante pour choisir une position de départ (ou « None » = -1) dans un champ du nœud, avec aperçu du nom dans le monde et bouton « Auto-Place » si le champ est vide et le nœud a une normale. | 747 |
| `C:setPath(path)` | Définit le chemin de course édité. | 25 |
| `C:unselect()` | Appelé quand l'onglet est quitté : les nœuds passent en dessin « faded » et le raccourci Shift est retiré. | 39 |
| `C:updateTransform(index)` | Place le gizmo d'axes sur le nœud (orienté selon sa normale en alignement local si le nœud en a une). Sans effet si le gizmo n'est pas autorisé. | 60 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawLine`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `scenetree.` `findClassObjects`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/raceEditor/pathnodes.lua`.*
