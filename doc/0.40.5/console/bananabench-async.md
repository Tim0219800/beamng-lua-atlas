# `bananabench_async`

*Fichier : `lua/console/bananabench-async.lua` · VM : Console · 220 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("bananabench-async")`

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `benchLog(level, origin, msg, newline)` |  | 41 |
| `benchPhysics(vehicles, vehicleMin, vehicleMax)` |  | 72 |
| `benchmark_start()` |  | 210 |
| `benchmark_update()` |  | 215 |
| `myBenchStep(testVehicle, n)` |  | 16 |

**Globales affectées :** `M`

## Appels vers le moteur (C++)

- `BeamEngine:` `deleteAllObjects`, `getSlot`, `instabilityDetected`, `setDynamicCollisionEnabled`, `spawnObject`
- `FS:` `closeDirectory`, `openDirectory`
- `obj:` `getBeamCount`, `getNodeCount`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/console/bananabench-async.lua`.*
