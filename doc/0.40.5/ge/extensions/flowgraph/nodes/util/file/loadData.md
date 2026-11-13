# `flowgraph_nodes_util_file_loadData`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/file/loadData.lua` · VM : Game Engine (GE) · 53 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/file/loadData")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Load Data » (catégorie once_instant, couleur file). Charge des données simples depuis un fichier, réutilisables entre sessions. Entrée : file (nom sans extension). Les pins de sortie personnalisés (types string, number, bool, any, table, vec3, quat, color) portent le nom des clés lues ; chaque sortie reçoit la valeur de la clé du même nom via modules.file:read.

## Remarques

- La description du pin file dit « save into » mais il s'agit ici du fichier à lire.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr)` | Active la sauvegarde des pins et les pins de sortie personnalisés. | 33 |
| `C:onNodeReset()` | Force le rechargement du fichier (modules.file:forceReload). | 48 |
| `C:workOnce()` | Pour chaque pin de sortie (hors flow), lit la valeur correspondante dans le fichier. | 38 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/file/loadData.lua`.*
