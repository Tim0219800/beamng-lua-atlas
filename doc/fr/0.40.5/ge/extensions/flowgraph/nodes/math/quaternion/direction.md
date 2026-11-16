# `flowgraph_nodes_math_quaternion_direction`

*Fichier : `lua/ge/extensions/flowgraph/nodes/math/quaternion/direction.lua` · VM : Game Engine (GE) · 36 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/math/quaternion/direction")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Direction' (categorie simple). Convertit un angle 'deg' en degres en quaternion de rotation autour de l'axe Z (setFromEuler(0,0,angle)). Le resultat est recalcule seulement quand l'angle change.

## Remarques

- Le quaternion 'rot' est une variable locale au module, partagee par toutes les instances du noeud, alors que le cache oldIn est par instance : deux noeuds avec des angles differents peuvent s'ecraser.
- Si l'angle d'entree est nil, work provoque une erreur d'arithmetique sur nil.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | oldIn = nil. | 23 |
| `C:work()` | Recalcule le quaternion (variable locale du module) si l'angle a change, ecrit la table du quaternion sur 'value'. | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/math/quaternion/direction.lua`.*
