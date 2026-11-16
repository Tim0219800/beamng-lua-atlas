# `flowgraph_nodes_gameplay_timers_simpleTimer`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/timers/simpleTimer.lua` · VM : Game Engine (GE) · 70 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/timers/simpleTimer")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Simple Timer » (catégorie once_f_duration). Timer tout-en-un : crée un timer (duration, ref dtSim/dtReal/dtRaw) au déclenchement puis publie chaque frame elapsed, remaining, duration, elapsedPercent (0 à 1) ; capTime borne ces valeurs une fois terminé. Passe en état de durée 'started' puis 'finished' quand le timer est complet. Les valeurs ne peuvent pas être modifiées après création.

## Remarques

- onNodeReset contient des print de débogage (message « setting timer back »).
- elapsedPercent divise par la durée : durée 0 donne inf/NaN.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Met l'état de durée à 'inactive'. | 25 |
| `C:onNodeReset()` | Remet le temps écoulé du timer à 0 et l'état de durée à 'inactive'. | 33 |
| `C:postInit()` | Définit les valeurs prédéfinies du pin ref (dtSim, dtReal, dtRaw). | 29 |
| `C:work()` | Met à jour elapsed/remaining/duration/elapsedPercent, passe à 'finished' quand le timer est complet. | 47 |
| `C:workOnce()` | Crée le timer via self.mgr.modules.timer:addTimer, publie timerId et passe l'état de durée à 'started'. | 42 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/timers/simpleTimer.lua`.*
