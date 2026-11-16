# `flowgraph_nodes_gameplay_rally_stageComplete`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/stageComplete.lua` · VM : Game Engine (GE) · 24 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/stageComplete")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Mode Stage Complete » (catégorie once_instant, tag rally, sans pin). Signale la fin de la spéciale (véhicule arrêté) en déclenchant extensions.hook('onRallyStageComplete').

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Émet le hook onRallyStageComplete. | 19 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyStageComplete`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/stageComplete.lua`.*
