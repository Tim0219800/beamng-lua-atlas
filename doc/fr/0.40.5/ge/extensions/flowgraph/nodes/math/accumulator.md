# `flowgraph_nodes_math_accumulator`

*Fichier : `lua/ge/extensions/flowgraph/nodes/math/accumulator.lua` · VM : Game Engine (GE) · 66 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/math/accumulator")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Accumulator' (categorie repeat_instant). Additionne la valeur du pin 'value' (1 par defaut) a une somme interne a chaque frame ou le pin 'add' a du flux ; 'reset' remet la somme a data.resetValue (0). Sorties : 'result' (somme) et impulsion 'changed'.

## Remarques

- La description du pin reset dit qu'il 'a priorite sur add', mais si les deux sont actifs la valeur est d'abord remise a zero puis incrementee.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet la somme a resetValue et met a jour result. | 29 |
| `C:_executionStopped()` | Remet la somme a resetValue et met a jour result. | 34 |
| `C:_onDeserialized()` | Remet la somme a resetValue. | 56 |
| `C:drawMiddle(builder, style)` | Affiche la somme courante. | 60 |
| `C:init()` | currentSum=0, resetValue=0. | 24 |
| `C:work()` | Applique reset, puis ajoute value si add est actif (changed=true), ecrit result. | 39 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/math/accumulator.lua`.*
