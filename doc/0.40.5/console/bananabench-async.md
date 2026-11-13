# `bananabench_async`

*Fichier : `lua/console/bananabench-async.lua` · VM : Console · 220 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("bananabench-async")`

Ancienne version (0.4) du banc d'essai bananabench, asynchrone : `benchPhysics` tourne dans une coroutine pilotée image par image (`coroutine.yield()` pendant gfxSteps = 20 images), avec mesure en comparant dynamic collision activée puis désactivée. Version historique, remplacée par console/bananabench.lua.

## Remarques

- Code probablement non fonctionnel dans 0.40.5 : il fait `require("lua/console/test")` (fichier qui n'existe pas dans console/), utilise `BeamEngine` comme global jamais défini ici, et l'ancienne API `BeamEngine:spawnObject` (le nouveau code utilise spawnObject2).
- La table `M = {}` est créée globalement (pas de `local`) et n'est pas renvoyée.
- Fonctionnement : `benchmark_start()` crée la coroutine, `benchmark_update()` la reprend une fois (à appeler à chaque mise à jour du moteur).
- Les résultats par véhicule contiennent pour chaque nombre de véhicules deux entrées res (collision dynamique activée/désactivée) avec beamspersec, percentRealtime, time et spawntime (en secondes).
- Pour chaque mesure, un tour d'échauffement est joué puis deux mesures sont cumulées (totalSteps = physicsSteps * 2 * gfxSteps).

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `benchLog(level, origin, msg, newline)` | Collecteur de logs : stocke les entrées (sauf niveaux A, D, S) dans une liste locale et mémorise la gravité maximale (warn/error). | 41 |
| `benchPhysics(vehicles, vehicleMin, vehicleMax)` | Exécute le benchmark (collision dynamique activée puis désactivée) pour chaque véhicule et renvoie le tableau de résultats ; doit tourner dans une coroutine. | 72 |
| `benchmark_start()` | Crée la coroutine qui exécutera benchPhysics. | 210 |
| `benchmark_update()` | Reprend la coroutine d'une étape ; à appeler à chaque mise à jour par le programme hôte. | 215 |
| `myBenchStep(testVehicle, n)` | Fait apparaître des véhicules jusqu'à n (positions 300*i), puis laisse passer gfxSteps images (coroutine.yield) en mesurant le temps. Signale une instabilité. | 16 |

**Globales affectées :** `M`

## Appels vers le moteur (C++)

- `BeamEngine:` `deleteAllObjects`, `getSlot`, `instabilityDetected`, `setDynamicCollisionEnabled`, `spawnObject`
- `FS:` `closeDirectory`, `openDirectory`
- `obj:` `getBeamCount`, `getNodeCount`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/console/bananabench-async.lua`.*
