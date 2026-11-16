# `flowgraph_nodes_gameplay_dragRace_dragRaceState`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/dragRaceState.lua` · VM : Game Engine (GE) · 130 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/dragRace/dragRaceState")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Drag Race State » (catégorie repeat_instant). Nœud de surveillance pure de l'état de la course de dragster (données de gameplay_drag_dragBridge.getData). Sorties : flow, started, completed, staged, countdownOver (impulsions), isStarted, isCompleted, isStaged (bool), dragType (drag, bracketRace, headsUpRace), context (freeroam, activity…), localPhase (stage, countdown, race, stop).

## Remarques

- Sans données de course, toutes les sorties sont remises à faux ou chaîne vide.
- Écrase self.data (la table de données du nœud) par {} au démarrage.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Réinitialise les derniers états. | 34 |
| `C:work()` | Lit dragBridge.getData(), détecte les transitions started/completed et les changements de phase du pilote jouable. | 53 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/dragRaceState.lua`.*
