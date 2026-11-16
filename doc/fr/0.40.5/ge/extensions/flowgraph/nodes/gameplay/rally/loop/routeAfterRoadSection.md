# `flowgraph_nodes_gameplay_rally_loop_routeAfterRoadSection`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/routeAfterRoadSection.lua` · VM : Game Engine (GE) · 58 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/loop/routeAfterRoadSection")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Route After Road Section » (catégorie once_instant, tag rally). Aiguille le flux après une section de route selon la mission courante du planning de la boucle rally : toServiceIn si rm:getCurrentMissionId() vaut 'serviceIn', sinon toSpecialStage. Si aucune mission courante n'existe, un avertissement est loggé et aucune sortie n'est activée.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Active toServiceIn ou toSpecialStage selon l'id de la mission courante. | 29 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/routeAfterRoadSection.lua`.*
