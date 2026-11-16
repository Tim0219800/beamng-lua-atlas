# `flowgraph_nodes_util_getLevelData`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/getLevelData.lua` · VM : Game Engine (GE) · 33 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/getLevelData")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Get Level Data » (once_instant). Donne des informations sur le niveau courant d'après getMissionFilename() : nom de dossier du niveau (devName), dossier (directory, caché) et chemin complet (path, caché). Pas d'entrée.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Découpe le chemin du fichier de mission (path.split) et écrit devName, directory et path sous forme de chaînes. | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/getLevelData.lua`.*
