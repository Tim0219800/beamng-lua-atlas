# `flowgraph_nodes_events_onUpdate`

*Fichier : `lua/ge/extensions/flowgraph/nodes/events/onUpdate.lua` · VM : Game Engine (GE) · 76 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/events/onUpdate")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « on Update » (catégorie logic, événement). Émet du flux à chaque frame. Pins de sortie : enterState (impulsion à l'entrée dans l'état du projet), flow (chaque frame), exitState (impulsion à la sortie de l'état), dtReal, dtSim, dtRaw (delta times, cachés). Met aussi à jour mgr.dtReal/dtSim/dtRaw.

## Remarques

- Aux événements d'état (début et fin) les trois delta times sont remis à 0.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr, ...)` | Vide. | 28 |
| `C:onStateStartedTrigger()` | Appelé quand le projet entre dans l'état : enterState vrai, delta times à 0. | 44 |
| `C:onStateStoppedTrigger()` | Appelé quand le projet quitte l'état : exitState vrai, delta times à 0. | 58 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque frame : met flow à vrai, copie les delta times dans mgr et les pins, déclenche le nœud. | 31 |
| `C:work(args)` | Vide. | 72 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/events/onUpdate.lua`.*
