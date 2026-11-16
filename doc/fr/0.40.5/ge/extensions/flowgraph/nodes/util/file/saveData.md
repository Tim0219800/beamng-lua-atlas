# `flowgraph_nodes_util_file_saveData`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/file/saveData.lua` · VM : Game Engine (GE) · 49 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/file/saveData")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Save Data » (once_instant, couleur file). Sauvegarde des données simples dans un fichier réutilisable entre sessions. Entrée : file (nom sans extension) ; les pins d'entrée personnalisés (types string, number, bool, any, table, vec3, quat, color) sont écrits comme clés du fichier via modules.file:write.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr)` | Active la sauvegarde des pins et les pins d'entrée personnalisés. | 33 |
| `C:workOnce()` | Écrit dans le fichier la valeur de chaque pin d'entrée sauf flow, reset et file. | 38 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/file/saveData.lua`.*
