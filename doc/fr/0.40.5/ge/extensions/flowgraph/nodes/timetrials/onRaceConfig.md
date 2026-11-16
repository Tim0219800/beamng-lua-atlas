# `flowgraph_nodes_timetrials_onRaceConfig`

*Fichier : `lua/ge/extensions/flowgraph/nodes/timetrials/onRaceConfig.lua` · VM : Game Engine (GE) · 51 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/timetrials/onRaceConfig")` (fichier sous extensions/ mais pas une extension classique)

Noeud « Race Config » (provider, tag input). Donne la configuration choisie par le joueur pour la course, lue une seule fois dans scenario_scenarios.getScenario() : laps (scenario.lapCount), reverse (scenario.isReverse), rollingStart (scenario.rollingStart).

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | done = false. | 29 |
| `C:init(mgr, ...)` | done = false, clearOutPinsOnStart = false. | 24 |
| `C:onScenarioRestarted()` | Hook de redémarrage : relit la configuration. | 46 |
| `C:work()` | Tant que non fait et qu'un scénario existe, copie ses réglages sur les pins. | 33 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/timetrials/onRaceConfig.lua`.*
