# `flowgraph_nodes_math_quaternion_lookAt`

*Fichier : `lua/ge/extensions/flowgraph/nodes/math/quaternion/lookAt.lua` · VM : Game Engine (GE) · 47 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/math/quaternion/lookAt")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Look At' (categorie simple). Calcule le quaternion qui oriente une direction allant du point 'from' vers 'to', avec le vecteur 'up' (cache, defaut (0,0,1)). Utilise quat:setFromDir.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Vide. | 26 |
| `C:work()` | Si from et to existent : direction = to - from, up = pin up ou (0,0,1), ecrit la table du quaternion sur 'value'. Sinon ne fait rien. | 29 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/math/quaternion/lookAt.lua`.*
