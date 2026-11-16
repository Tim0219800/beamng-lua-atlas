# `flowgraph_nodes_gameplay_rally_loop_getRallyLoopTrafficEnabled`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopTrafficEnabled.lua` · VM : Game Engine (GE) · 48 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopTrafficEnabled")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Get Traffic Enabled » (catégorie once_instant, tags rally et traffic). Indique dans trafficEnabled (bool) si le trafic doit être activé pour la boucle rally : rm:getTrafficEnabled() si disponible, sinon true sauf pour une mission de dev (devMission) dont missionTypeData.devDisableTraffic est vrai.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Écrit trafficEnabled depuis le gestionnaire de boucle, ou la valeur de repli. | 35 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopTrafficEnabled.lua`.*
