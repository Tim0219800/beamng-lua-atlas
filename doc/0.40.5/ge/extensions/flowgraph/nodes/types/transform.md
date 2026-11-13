# `flowgraph_nodes_types_transform`

*Fichier : `lua/ge/extensions/flowgraph/nodes/types/transform.lua` · VM : Game Engine (GE) · 483 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/types/transform")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Transform » (catégorie provider, icône d_rotation) : fournit une position, une rotation et une échelle 3D éditables dans l'éditeur. Pins de sortie : « pos » (vec3), « rot » (quat) et « scl » (vec3), sous forme de tables {x,y,z} / {x,y,z,w}. Deux modes : « gizmo » (on édite avec le gizmo du World Editor, des DragFloat ou les boutons caméra/terrain) et « fromID » (un pin d'entrée « objID » est ajouté ; le nœud copie position/rotation/échelle de l'objet de la scène correspondant). Dans l'éditeur il dessine un volume de prévisualisation (modes d'affichage default, sphereX/Y/Z, halfBox, fullBox, aproxVehicle) avec debugDrawer.

## Remarques

- Les sorties ne sont recalculées que si 'changed' est vrai (ou en mode fromID à chaque frame) ; _executionStarted/_executionStopped remettent 'changed' à true.
- La position initiale est placée à 15 m devant la caméra de l'éditeur.
- Les valeurs sont sérialisées dans position, rotation, scale, markerClr, mode, useQuatForRotation et displayMode ; le mode fromID recrée le pin objID au chargement.
- Le mode d'affichage 'aproxVehicle' dessine une boîte approximant un véhicule (2 x 4.2 x 1.8 fois l'échelle) autour de la position.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Force la réécriture des sorties au démarrage (changed = true). | 317 |
| `C:_executionStopped()` | Force la réécriture des sorties au prochain démarrage (changed = true). | 341 |
| `C:_onDeserialized(nodeData)` | Restaure l'état du nœud depuis les données sauvegardées. | 459 |
| `C:_onSerialize(res)` | Écrit l'état du nœud dans la table de sauvegarde. | 448 |
| `C:drawAxisBox(corner, x, y, z, clr)` | Dessine une boîte pleine (triangles) et ses arêtes noires à partir d'un coin et de trois vecteurs d'arête. | 392 |
| `C:drawCustom()` | Dessine les contrôles du mode gizmo : mode d'affichage, position, rotation (euler en degrés ou quaternion), échelle, couleur, boutons « Copier depuis la sélection », « Position devant la caméra / à la caméra », « Rotation à la caméra », « Descendre sur le terrain ». | 166 |
| `C:drawCustomProperties()` | Combo du mode (gizmo/fromID) — ajoute ou retire le pin objID — puis drawCustom en mode gizmo. | 123 |
| `C:drawMiddle(builder, style)` | Dessine les axes X/Y/Z colorés (sphères et lignes) et le volume de prévisualisation selon displayMode. | 346 |
| `C:gizmoBeginDrag()` | Début d'un glisser du gizmo : mémorise rotation, échelle et position d'origine. | 42 |
| `C:gizmoDragging()` | Pendant le glisser du gizmo : met à jour position (translation), rotation (rotation, en repère local ou relative au départ) ou échelle (composante par composante) selon le mode du gizmo, et dessine les axes. | 48 |
| `C:gizmoEndDrag()` | Fin d'un glisser du gizmo (appelée par editor.updateAxisGizmo) ; met à jour l'état du nœud. | 79 |
| `C:hideProperties()` | Appelée quand le nœud est désélectionné : retire le gizmo et revient au mode d'édition objectSelect. | 113 |
| `C:init()` | Place la position à 15 m devant la caméra, rotation identité, échelle (1,1,1), couleur de marqueur rouge semi-transparente, mode 'gizmo' et displayMode 'halfBox'. | 24 |
| `C:showProperties()` | Appelée quand le nœud est sélectionné dans l'éditeur : branche le mode d'édition 'flowgraphTransform' avec le gizmo d'axes du World Editor. | 85 |
| `C:updateTransform()` | Synchronise la matrice du gizmo avec position et rotation du nœud (rotation ignorée si le gizmo est en alignement monde). | 153 |
| `C:work()` | En mode fromID, copie position/rotation/échelle de l'objet objID ; si 'changed', écrit les trois pins de sortie. | 321 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTriSolid`
- `obj:` `getPosition`, `getRotation`, `getScale`
- `scenetree.` `findClassObjects`, `findObjectById`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/types/transform.lua`.*
