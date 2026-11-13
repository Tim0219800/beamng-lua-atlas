# `flowgraph_nodes_gameplay_dragRace_resetDragRace`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/resetDragRace.lua` · VM : Game Engine (GE) · 41 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/dragRace/resetDragRace")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Reset Drag Race » (catégorie once_instant). Réinitialise la course de dragster (dragBridge.reset) et peut aussi vider les pilotes (pin clearRacers) pour un nouvel essai avec d'autres adversaires. Sorties : flow (impulsion) et success.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle dragBridge.reset() si des données existent, puis clearRacers() si demandé. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/resetDragRace.lua`.*
