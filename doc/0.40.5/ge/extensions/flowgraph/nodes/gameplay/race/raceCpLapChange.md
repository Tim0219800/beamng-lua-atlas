# `flowgraph_nodes_gameplay_race_raceCpLapChange`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceCpLapChange.lua` · VM : Game Engine (GE) · 68 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/race/raceCpLapChange")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Race CP/Lap Change » (catégorie repeat_instant). Laisse passer un flux (impulsion changed) quand le checkpoint ou le tour d'un véhicule change, d'après les events de l'état de course (rollingStarted, pathnodeReached, raceStarted, lapComplete, raceComplete). Sorties : flow, changed, curCP (index linéaire du checkpoint courant), maxCP (nombre de pathnodes), curLap (tour courant, base 1), maxLap (race.lapCount), recoveryReached et usedRecovery.

## Remarques

- Un bloc de code est désactivé par « if false and … » (réinitialisation des race markers) : il est mort.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Chaque frame : recopie flow, et si un évènement de checkpoint/tour a eu lieu pour vehId, met à jour curCP, maxCP, curLap, maxLap, changed, recoveryReached et usedRecovery. | 29 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceCpLapChange.lua`.*
