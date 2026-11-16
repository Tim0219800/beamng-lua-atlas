# `simtest`

*File: `lua/console/simtest.lua` · VM: Console · 22 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("simtest")`

Console benchmark script: it creates a pickup vehicle with newVehicle():spawn at (0, 0, 0.1), enables BeamEngine.enabled then measures, with HighPerfTimer, the time of 101 simulation steps. Runs on load (test(100)).

## Notes

- Defines the globals v (the vehicle) and hp (the timer, global because there is no local).

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `test(n)` | Runs BeamEngine:update(1/2000, 1/2000) n+1 times (0.5 ms step) and prints the duration of each step in ms. | 11 |

**Globals assigned:** `v`

## Calls into the engine (C++)

- `BeamEngine:` `update`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/console/simtest.lua`.*
