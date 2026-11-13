# `bananabench`

*Fichier : `lua/console/bananabench.lua` · VM : Console · 239 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("bananabench")`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `bananabench.beam()` | Exposed so callers can drive the engine directly, e.g. setThreadingLayout() for a<br> worker-count sweep (see bananabench-threads.lua). It is a BeamNG::System, so every<br> method in beamng.h is reachable from here. | 234 |
| `bananabench.getAllVehicles()` |  | 84 |
| `bananabench.physics(vehicles, vehicleMin, vehicleMax)` |  | 94 |

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `benchLog(level, origin, msg, newline)` |  | 71 |
| `benchPhysics(vehicles, vehicleMin, vehicleMax)` |  | 94 |
| `myBenchStep(testVehicle, vehLPackData, n, steps)` |  | 33 |

## Appels vers le moteur (C++)

- `BeamEngine:` `deleteAllObjects`, `instabilityDetected`, `setDynamicCollisionEnabled`, `spawnObject2`
- `FS:` `findFiles`
- `obj:` `getBeamCount`, `getNodeCount`, `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/console/bananabench.lua`.*
