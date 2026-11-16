# `flowgraph_nodes_util_fileExists`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/fileExists.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/fileExists")` (fichier sous extensions/ mais pas une extension classique)

Nœud « File Exists » (catégorie once_p_duration). Vérifie qu'un fichier existe. Entrées : file (chemin ou nom), extension (caché, ajoutée au nom). Sorties : exists et missing (flow), existsBool (bool), path (chemin absolu). Utilise mgr:getRelativeAbsolutePath, qui résout le chemin par rapport au projet.

## Remarques

- La description du pin missing dit « If the file exists » (copier-coller) alors qu'il signale l'absence du fichier.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Construit le nom, résout le chemin absolu via mgr:getRelativeAbsolutePath et écrit exists, missing, existsBool et path. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/fileExists.lua`.*
