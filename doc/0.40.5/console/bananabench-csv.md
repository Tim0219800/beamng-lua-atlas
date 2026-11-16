# `bananabench_csv`

*File: `lua/console/bananabench-csv.lua` · VM: Console · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("bananabench-csv")`

Console VM script: runs the bananabench benchmark (bench.physics()) then writes the results in CSV format (columns Vehicle, Count, MBeams, RealTime, SpawnTime, ExecTime) to the screen and to a file. The file name is the second command-line argument (`args[2]`), otherwise `bananabench.csv`.

## Notes

- Bug: the headers are `SpawnTime,ExecTime` but the values written are, in order, r.time (simulation time) then r.spawntime (spawn time): the two columns are swapped relative to their titles.
- The script runs on load (no exported function) and uses the global `args` provided by the console launcher.
- The file is opened with io.open (disk path).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/console/bananabench-csv.lua`.*
