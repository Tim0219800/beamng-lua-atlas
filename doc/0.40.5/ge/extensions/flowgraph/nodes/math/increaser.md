# `flowgraph_nodes_math_increaser`

*Fichier : `lua/ge/extensions/flowgraph/nodes/math/increaser.lua` · VM : Game Engine (GE) · 66 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/math/increaser")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Increaser' (categorie repeat_instant). Garde en memoire le maximum de la valeur d'entree : si 'value' depasse la valeur interne, celle-ci est remplacee. 'clear' remet a data.resetValue (0). Sorties : flow, impulsion 'changed', 'result'.

## Remarques

- pinOut.changed n'est remis a false que si 'value' n'est pas nil.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Remet currentValue a resetValue. | 36 |
| `C:drawMiddle(builder, style)` | Affiche la valeur courante. | 60 |
| `C:init()` | currentValue=0, resetValue=0. | 31 |
| `C:work()` | Applique clear, met a jour le maximum, ecrit result ; flow suit l'entree flow. | 40 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/math/increaser.lua`.*
