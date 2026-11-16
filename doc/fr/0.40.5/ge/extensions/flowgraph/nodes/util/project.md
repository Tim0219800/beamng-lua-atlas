# `flowgraph_nodes_util_project`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/project.lua` · VM : Game Engine (GE) · 57 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/project")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Get Project Info » (once_instant, icône event_note). Donne des informations sur le projet flowgraph courant. Sorties : name, description, flow, et pins cachés id, hasFilename, filename (sans .flow.json), filepath, hasLevel, level (niveau dont le dossier contient le projet), graph, graphId.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr)` | Désactive clearOutPinsOnStart. | 30 |
| `C:workOnce()` | Lit mgr.id/name/description, savedFilename/savedDir (via path.splitWithoutExt, path.levelFromPath) et le graphe courant, puis écrit les pins et active flow. | 34 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/project.lua`.*
