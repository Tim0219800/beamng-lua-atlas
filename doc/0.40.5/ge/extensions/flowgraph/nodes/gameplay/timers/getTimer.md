# `flowgraph_nodes_gameplay_timers_getTimer`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/timers/getTimer.lua` · VM : Game Engine (GE) · 67 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/timers/getTimer")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Timer ». Lit l'état d'un timer (timerId). Sorties : flow, complete, completed (impulsion unique), incomplete, elapsed, remaining, duration, elapsedPercent (0 à 1). Si capTime est vrai, elapsed/remaining/elapsedPercent sont bornés quand le timer est terminé. Entrée reset : remet à zéro la détection de fin.

## Remarques

- elapsedPercent divise par la durée : durée 0 donne inf/NaN.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelé au démarrage de l'exécution du projet flowgraph ; réinitialise l'état interne du nœud. | 26 |
| `C:work()` | Si le timer existe, remplit les sorties et déclenche completed une seule fois à la fin ; sinon flow reste false. | 30 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/timers/getTimer.lua`.*
