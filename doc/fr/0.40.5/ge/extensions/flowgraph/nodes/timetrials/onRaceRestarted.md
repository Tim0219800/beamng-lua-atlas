# `flowgraph_nodes_timetrials_onRaceRestarted`

*Fichier : `lua/ge/extensions/flowgraph/nodes/timetrials/onRaceRestarted.lua` · VM : Game Engine (GE) · 41 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/timetrials/onRaceRestarted")` (fichier sous extensions/ mais pas une extension classique)

Noeud « Race Restarted » (logic, tag input). Doit lever une impulsion de sortie 'restart' quand la course est relancée (hook onScenarioRestarted).

## Remarques

- Bug : work écrit pinOut.restart.value = self.started, champ jamais défini dans ce noeud (nil), au lieu de self.restart : le pin restart ne s'active jamais.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | restart = false. | 27 |
| `C:init(mgr, ...)` | restart = false. | 23 |
| `C:onScenarioRestarted()` | Hook de redémarrage du scénario : restart = true. | 36 |
| `C:work()` | Écrit pinOut.restart avec self.started, puis restart = false. | 31 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/timetrials/onRaceRestarted.lua`.*
