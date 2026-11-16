# `flowgraph_nodes_timetrials_onRaceStart`

*Fichier : `lua/ge/extensions/flowgraph/nodes/timetrials/onRaceStart.lua` · VM : Game Engine (GE) · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/timetrials/onRaceStart")` (fichier sous extensions/ mais pas une extension classique)

Noeud « Race Started » (logic, tag input). Pins de sortie : started (flow quand la course a démarré) et stopped (flow avant le départ). Passe à démarré sur le hook onRaceStart.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | started = false. | 28 |
| `C:init(mgr, ...)` | started = false. | 24 |
| `C:onRaceStart()` | Hook de départ de course : started = true. | 37 |
| `C:onScenarioRestarted()` | Hook de redémarrage : réinitialise. | 41 |
| `C:work()` | Écrit started et stopped. | 32 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/timetrials/onRaceStart.lua`.*
