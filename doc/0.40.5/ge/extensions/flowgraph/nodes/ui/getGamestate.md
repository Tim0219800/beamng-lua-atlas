# `flowgraph_nodes_ui_getGamestate`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/getGamestate.lua` · VM : Game Engine (GE) · 29 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/getGamestate")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Gamestate » (catégorie repeat_instant) : lit l'état courant de l'UI (core_gamestate.state.state). Sortie « state » (string).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Vide. | 21 |
| `C:work()` | Écrit core_gamestate.state.state sur « state ». | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/getGamestate.lua`.*
