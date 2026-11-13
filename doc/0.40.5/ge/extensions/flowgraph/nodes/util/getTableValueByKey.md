# `flowgraph_nodes_util_getTableValueByKey`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/getTableValueByKey.lua` · VM : Game Engine (GE) · 33 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/getTableValueByKey")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Get Table Value By Key » (repeat_instant). Lit une valeur dans une table à partir d'une clé (string ou number). Entrées : value (table), key. Sortie : value (any).

## Remarques

- Si la clé est absente ou vaut false, la sortie garde sa valeur précédente au lieu d'être vidée.
- Les pins d'entrée et de sortie s'appellent tous deux « value ».

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Si la table est connectée, écrit table[key] dans la sortie value seulement si le résultat est non nil/false ; sinon met la sortie à nil. | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/getTableValueByKey.lua`.*
