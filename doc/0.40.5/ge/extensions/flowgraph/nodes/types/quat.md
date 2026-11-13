# `flowgraph_nodes_types_quat`

*Fichier : `lua/ge/extensions/flowgraph/nodes/types/quat.lua` · VM : Game Engine (GE) · 45 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/types/quat")` (fichier sous extensions/ mais pas une extension classique)

Noeud « Quat » (repeat_instant). Construit un quaternion à partir des pins x, y, z, w (0 par défaut) et l'écrit en table {x,y,z,w} sur le pin value (quat).

## Remarques

- Le quaternion n'est pas normalisé ; avec tous les pins à 0 on obtient (0,0,0,0), non valide.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Ne restaure rien. | 41 |
| `C:_onSerialize(res)` | Ne sauvegarde rien. | 38 |
| `C:drawMiddle(builder, style)` | Dessine le contenu central du noeud dans l'éditeur. | 30 |
| `C:drawProperties()` | Vide. | 35 |
| `C:work()` | Compose le quaternion et écrit la table. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/types/quat.lua`.*
