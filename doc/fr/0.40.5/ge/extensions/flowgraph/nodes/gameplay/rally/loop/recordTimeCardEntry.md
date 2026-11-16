# `flowgraph_nodes_gameplay_rally_loop_recordTimeCardEntry`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/recordTimeCardEntry.lua` · VM : Game Engine (GE) · 39 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/loop/recordTimeCardEntry")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Loop Record Time Card Entry » (catégorie once_instant, tag rally). Enregistre une entrée de carte de pointage (time card) dans la boucle rally : rm:recordTimeCardEntry(name, time). Entrées : name (string) et time (number).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle rm:recordTimeCardEntry avec les pins name et time. | 29 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/recordTimeCardEntry.lua`.*
