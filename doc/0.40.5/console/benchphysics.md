# `benchphysics`

*File: `lua/console/benchphysics.lua` · VM: Console · 29 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("benchphysics")`

Very old small physics scaling benchmark: for 0 to 8 vehicles, measures the average time per update over 1000 frames and writes the result to `phys-scale.csv` (columns "vehicle count;delay"). Defines the globals `testStep` and `benchPhysics`.

## Notes

- Obsolete code: it calls `spawnObjects(i)` and `updateLoop(frames)`, which are defined nowhere in this file or in the console VM; it does not work as is.
- Uses globals without `local` (frames, hp, file, d) and the engine class HighPerfTimer.

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `benchPhysics()` | Loop from 0 to 8 vehicles, calls testStep and writes phys-scale.csv; prints "Benchmark running: ... done!". | 15 |
| `testStep(i)` | Spawns i vehicles, plays 1000 frames and returns the average time per frame in ms (t / frames). | 5 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/console/benchphysics.lua`.*
