# `flowgraph_nodes_gameplay_race_raceSuspend`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceSuspend.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/race/raceSuspend")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Race Suspend » (tag scenario, pas de catégorie définie). Suspend ou reprend une course : un flux sur la pin suspend appelle raceData:doSuspend(true), un flux sur resume appelle doSuspend(false) (suspend est prioritaire). La sortie flow vaut toujours true.

## Remarques

- Les trois pins d'entrée flow, suspend et resume ont la même description « Inflow for this node. ».

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Vide. | 23 |
| `C:work()` | Suspend ou reprend la course selon les pins suspend/resume. | 26 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceSuspend.lua`.*
