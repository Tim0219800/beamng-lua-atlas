# `flowgraph_nodes_timetrials_onRaceComplete`

*Fichier : `lua/ge/extensions/flowgraph/nodes/timetrials/onRaceComplete.lua` · VM : Game Engine (GE) · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/timetrials/onRaceComplete")` (fichier sous extensions/ mais pas une extension classique)

Noeud « Race Complete » (repeat_instant, tag input). Pins de sortie : complete (flow quand la course est terminée) et ongoing (flow tant qu'elle ne l'est pas). Passe à terminé sur le hook onScenarioFinished.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | complete = false. | 27 |
| `C:init(mgr, ...)` | complete = false. | 23 |
| `C:onScenarioFinished()` | Hook de fin de scénario : marque la course comme terminée. | 37 |
| `C:onScenarioRestarted()` | Hook de redémarrage : réinitialise. | 41 |
| `C:work()` | Écrit complete et ongoing. | 32 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/timetrials/onRaceComplete.lua`.*
