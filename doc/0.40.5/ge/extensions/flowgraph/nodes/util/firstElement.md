# `flowgraph_nodes_util_firstElement`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/firstElement.lua` · VM : Game Engine (GE) · 39 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/firstElement")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Get First Element of Table » (repeat_instant). Renvoie le premier élément (index 1) d'une table. Entrée : table. Sortie : firstElement (any).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Met oldPos à nil (champ inutilisé ensuite). | 23 |
| `C:getFirstElement(table)` | Renvoie table[1] du pin d'entrée table (l'argument n'est pas utilisé). | 27 |
| `C:init(mgr)` | Ne fait rien. | 20 |
| `C:work()` | Écrit le premier élément dans firstElement si la table est connectée. | 33 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/firstElement.lua`.*
