# `bananabench_async`

*File: `lua/console/bananabench-async.lua` · VM: Console · 220 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("bananabench-async")`

Old version (0.4) of the bananabench test bench, asynchronous: `benchPhysics` runs in a coroutine driven frame by frame (`coroutine.yield()` during gfxSteps = 20 frames), measuring by comparing dynamic collision enabled then disabled. Historical version, replaced by console/bananabench.lua.

## Notes

- Code probably non-functional in 0.40.5: it does `require("lua/console/test")` (a file that does not exist in console/), uses `BeamEngine` as a global never defined here, and the old `BeamEngine:spawnObject` API (the new code uses spawnObject2).
- The table `M = {}` is created globally (no `local`) and is not returned.
- How it works: `benchmark_start()` creates the coroutine, `benchmark_update()` resumes it once (to be called on every engine update).
- The per-vehicle results contain, for each vehicle count, two res entries (dynamic collision enabled/disabled) with beamspersec, percentRealtime, time and spawntime (in seconds).
- For each measurement, a warm-up round is played then two measurements are accumulated (totalSteps = physicsSteps * 2 * gfxSteps).

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `benchLog(level, origin, msg, newline)` | Log collector: stores the entries (except levels A, D, S) in a local list and remembers the maximum severity (warn/error). | 41 |
| `benchPhysics(vehicles, vehicleMin, vehicleMax)` | Runs the benchmark (dynamic collision enabled then disabled) for each vehicle and returns the results table; must run in a coroutine. | 72 |
| `benchmark_start()` | Creates the coroutine that will run benchPhysics. | 210 |
| `benchmark_update()` | Resumes the coroutine by one step; to be called on every update by the host program. | 215 |
| `myBenchStep(testVehicle, n)` | Spawns vehicles up to n (positions 300*i), then lets gfxSteps frames pass (coroutine.yield) while measuring the time. Reports an instability. | 16 |

**Globals assigned:** `M`

## Calls into the engine (C++)

- `BeamEngine:` `deleteAllObjects`, `getSlot`, `instabilityDetected`, `setDynamicCollisionEnabled`, `spawnObject`
- `FS:` `closeDirectory`, `openDirectory`
- `obj:` `getBeamCount`, `getNodeCount`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/console/bananabench-async.lua`.*
