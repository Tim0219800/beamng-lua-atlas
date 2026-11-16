# `flowgraph_nodes_util_popActionMap`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/popActionMap.lua` · VM : Game Engine (GE) · 30 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/popActionMap")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Pop Action Map » (once_instant). Retire une action map de la pile d'entrées (popActionMap). Entrée : name. Le champ todo signale un comportement étrange si plusieurs projets utilisent la même action map.

## Remarques

- Bug : workOnce utilise self.mapName, jamais défini dans ce nœud (il n'est défini que par Push Action Map) ; le pin name n'est pas lu, donc popActionMap reçoit nil.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr, ...)` | Appelle _executionStopped. | 21 |
| `C:workOnce()` | Appelle popActionMap(self.mapName). | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/popActionMap.lua`.*
