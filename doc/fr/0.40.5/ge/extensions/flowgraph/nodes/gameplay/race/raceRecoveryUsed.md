# `flowgraph_nodes_gameplay_race_raceRecoveryUsed`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceRecoveryUsed.lua` · VM : Game Engine (GE) · 47 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/race/raceRecoveryUsed")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Race Recovery Used » (catégorie logic, tag scenario). Signale quand un véhicule a utilisé un recovery dans la course (events.recovered). Sorties : flow, impulse (impulsion), recoveriesUsed (nombre total de recoveries du véhicule) et recoveredTo (point de recovery utilisé, nil sinon).

## Remarques

- La pin flow n'est jamais remise à false par ce nœud une fois passée à true (seule impulse est remise à false chaque frame).
- work() indexe race.states[vehId] sans test d'existence.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work(args)` | Lit les events du véhicule et remplit flow, impulse, recoveredTo et recoveriesUsed. | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceRecoveryUsed.lua`.*
