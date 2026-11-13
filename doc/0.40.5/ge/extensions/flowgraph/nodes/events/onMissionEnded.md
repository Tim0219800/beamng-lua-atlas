# `flowgraph_nodes_events_onMissionEnded`

*Fichier : `lua/ge/extensions/flowgraph/nodes/events/onMissionEnded.lua` · VM : Game Engine (GE) · 31 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/events/onMissionEnded")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « on Level End » (catégorie logic, événement). Émet une impulsion de flux une fois quand le niveau courant est déchargé (hook onClientEndMission). Pin de sortie : flow.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr, ...)` | Vide. | 19 |
| `C:onClientEndMission()` | Hook appelé au déchargement du niveau : met flow à vrai et déclenche le nœud. | 22 |
| `C:work(args)` | Vide. | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/events/onMissionEnded.lua`.*
