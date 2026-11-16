# `flowgraph_nodes_gameplay_race_racePacenoteReached`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/race/racePacenoteReached.lua` · VM : Game Engine (GE) · 51 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/race/racePacenoteReached")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Race Pacenote Reached » (catégorie logic, tag scenario). Laisse passer une impulsion quand un véhicule atteint une pacenote de la course (events.pacenoteReached). Sorties : flow (impulsion) et note (texte de la pacenote, race.path.pacenotes.objects[id].note).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Vide. | 29 |
| `C:init(mgr, ...)` | Initialise data.detailed = false (non utilisé). | 25 |
| `C:work(args)` | Met flow et note selon les events du véhicule. | 33 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/race/racePacenoteReached.lua`.*
