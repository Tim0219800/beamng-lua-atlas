# `flowgraph_nodes_gameplay_rally_stageRuntimeState`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/stageRuntimeState.lua` · VM : Game Engine (GE) · 78 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/stageRuntimeState")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Stage Runtime State » (catégorie repeat_instant, tag rally). Lit l'état d'exécution de la spéciale tenu par le RallyManager : met le manager en mode d'autorité 'tracker', active la spéciale (setStageRuntimeActive(true)) et envoie onRallyDataUpdated avec l'état stageActive tant que flow est actif. Sorties : flow, active (spéciale active), complete (suivi terminé, via getStageObserverState().stageComplete) et time (temps de spéciale en s : currentSSTime ou getStageRuntimeTime, dernière valeur conservée).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet lastTime à 0. | 28 |
| `C:init()` | Initialise lastTime à 0. | 24 |
| `C:work()` | Chaque frame : remet les sorties à zéro puis les remplit depuis le rally manager. | 39 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyDataUpdated` — écouté par 2 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/stageRuntimeState.lua`.*
