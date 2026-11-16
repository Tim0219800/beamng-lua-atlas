# `flowgraph_nodes_logic_xor`

*Fichier : `lua/ge/extensions/flowgraph/nodes/logic/xor.lua` · VM : Game Engine (GE) · 27 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/logic/xor")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Xor' (categorie logic). Le flux sort si exactement une des deux entrees a et b a du flux.

## Remarques

- Compare les valeurs par ~= : si une entree vaut nil et l'autre false, le resultat est true (nil ~= false).

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | pinOut.flow = (a ~= b). | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/logic/xor.lua`.*
