# `flowgraph_nodes_gameplay_rally_loop_advanceLoopSchedule`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/advanceLoopSchedule.lua` · VM : Game Engine (GE) · 42 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/loop/advanceLoopSchedule")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Advance Loop Schedule » (catégorie once_instant, tag rally, sans pin). Demande au gestionnaire de la boucle rally (gameplay_rallyLoop.getManager()) de passer à la mission suivante du planning via rm:getNextMissionId(), et logge le résultat (D si une mission suivante existe, W sinon, E si le gestionnaire est introuvable ou l'extension non chargée).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle rm:getNextMissionId() (qui avance le planning) et logge l'id obtenu. | 26 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/advanceLoopSchedule.lua`.*
