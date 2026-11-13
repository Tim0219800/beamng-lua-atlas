# `flowgraph_nodes_gameplay_race_pathEndTransform`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/race/pathEndTransform.lua` · VM : Game Engine (GE) · 66 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/race/pathEndTransform")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Race End Transform » (catégorie repeat_instant, tag scenario). Donne la transformation du pathnode de fin d'un pathData, utile pour des triggers personnalisés. Le nœud de fin est path.endNode ; pour un chemin fermé sans endNode valide, c'est startNode. Sorties : endExists / endDoesNotExist (flow), existing (bool), pos (vec3), dirVec (normale du pathnode ou {0,0,1}) et radius. Calculé une seule fois (tant que self.path est nil).

## Remarques

- Si endNode vaut -1, un avertissement est loggé : la fin doit être marquée explicitement dans le Race Editor.
- endExists/endDoesNotExist sont remis à false à chaque frame ; seul endExists passe à true, et uniquement lors du calcul initial : endDoesNotExist ne devient jamais vrai dans ce code.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Oublie le chemin mémorisé. | 32 |
| `C:init(mgr, ...)` | Initialise self.path et désactive clearOutPinsOnStart. | 27 |
| `C:work(args)` | Trouve le pathnode de fin et écrit existing, pos, dirVec, radius et les flows endExists/endDoesNotExist. | 36 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/race/pathEndTransform.lua`.*
