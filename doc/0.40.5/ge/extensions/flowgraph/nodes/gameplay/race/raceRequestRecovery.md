# `flowgraph_nodes_gameplay_race_raceRequestRecovery`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceRequestRecovery.lua` · VM : Game Engine (GE) · 36 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/race/raceRequestRecovery")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Race Request Recovery » (catégorie repeat_instant, tag scenario). Tente de replacer le véhicule sur le dernier point de recovery via race:requestRecover(vehId). Sorties (cachées) : success si la récupération a été possible, fail sinon.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work(args)` | Chaque frame : appelle requestRecover et renseigne success/fail. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceRequestRecovery.lua`.*
