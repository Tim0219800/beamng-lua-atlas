# `flowgraph_nodes_util_tonumber`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/tonumber.lua` · VM : Game Engine (GE) · 26 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/tonumber")` (fichier sous extensions/ mais pas une extension classique)

Nœud « To Number » (catégorie simple). Convertit l'entrée en nombre avec tonumber. Entrée : value (any). Sortie : value (number). Le champ todo avertit que le résultat peut être nil.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Écrit tonumber(entrée) dans la sortie. | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/tonumber.lua`.*
