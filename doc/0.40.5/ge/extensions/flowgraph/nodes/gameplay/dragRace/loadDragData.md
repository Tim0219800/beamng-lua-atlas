# `flowgraph_nodes_gameplay_dragRace_loadDragData`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/loadDragData.lua` · VM : Game Engine (GE) · 47 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/dragRace/loadDragData")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Load Drag Race Data » (catégorie once_instant). Charge et initialise les données de course de dragster depuis un fichier (pin filepath), normalement une fois au début de la mission, via gameplay_drag_dragBridge.loadDragDataForMission. Sorties : flow (impulsion) et success.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Charge les données, vérifie getData() et pose une erreur de nœud en cas d'échec ; active toujours flow. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/loadDragData.lua`.*
