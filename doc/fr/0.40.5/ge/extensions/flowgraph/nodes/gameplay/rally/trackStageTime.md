# `flowgraph_nodes_gameplay_rally_trackStageTime`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackStageTime.lua` · VM : Game Engine (GE) · 43 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/trackStageTime")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Track Stage Time » (catégorie repeat, icône timer, tag rally). À chaque frame, émet le hook onRallyDataUpdated avec {activeState = stageActive} pour signaler au système rally que la spéciale est active. Recopie flow en sortie.

## Remarques

- Malgré son nom, le nœud ne mesure aucun temps : stageTime = os.clockhp() est calculé mais jamais utilisé.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr, ...)` | Vide. | 23 |
| `C:work(args)` | Émet onRallyDataUpdated (stageActive) et recopie le flux. | 30 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyDataUpdated` — écouté par 2 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackStageTime.lua`.*
